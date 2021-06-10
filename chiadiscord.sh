webhook=   ##your api link here

main(){
        ./discord.sh/discord.sh --webhook-url "$webhook" --text="\`\n\n-------------------------------------------------------------$(date)------------------------------------------------------------\`\n\n"
        python3 manager.py status | while read -r line; do
                ./discord.sh/discord.sh --webhook-url "$webhook" --text="$(echo \`"$line"\` | jq -Rs . | cut -c 2- | rev | cut -c 2- | rev)"
                sleep 3
        done
}

while true; do main; sleep 500; done