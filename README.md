
<p align="center">

  <h3 align="center">StealedDomainNameWatcher</h3>

  <p align="center">
    StealedDomainNameWatcher is a batch tool that automatically watch if a domain name you own is stealed and send the result to a Telegram Bot
    <br/>
    <br/>
    <a href="https://github.com/Iyotee/StealedDomainNameWatcher"><strong>Explore the docs »</strong></a>
    <br/>
    <br/>
    <a href="https://github.com/Iyotee/StealedDomainNameWatcher">View Demo</a>
    .
    <a href="https://github.com/Iyotee/StealedDomainNameWatcher/issues">Report Bug</a>
    .
    <a href="https://github.com/Iyotee/StealedDomainNameWatcher/issues">Request Feature</a>
  </p>
</p>

![Downloads](https://img.shields.io/github/downloads/Iyotee/StealedDomainNameWatcher/total) ![Contributors](https://img.shields.io/github/contributors/Iyotee/StealedDomainNameWatcher?color=dark-green) ![Issues](https://img.shields.io/github/issues/Iyotee/StealedDomainNameWatcher) ![License](https://img.shields.io/github/license/Iyotee/up)


## Table Of Contents

* [About the Project](#about-the-project)
* [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Authors](#authors)


## About The Project


StealedDomainNameWatcher is a batch tool that automatically watch if a domain name you own is stealed


Here's why:

* Because i need it
* Because i love to share my work with you


## Built With

Shell

Coffee and Love

## Getting Started

Clone this repo

### Prerequisites

No Prerequisities !


### Installation


1. Clone the repo

```sh
git clone https://github.com/iyotee/StealedDomainNameWatcher.git && cd StealedDomainNameWatcher
```

2.
Create telegram bot
To send a message to Telegram group or channel, you should first create your own bot. Just open Telegram, find @BotFather and type /start. Then follow instructions to create bot and get token to access the HTTP API.

3.Create Channel
Create a new Channel in Telegram and add your bot as a member. So your bot could send messages to the Channel.

In order to get Channel Id, first, post any message to the Channel ( like "test" ). Then use this link template to get Channel Id:

https://api.telegram.org/bot<YourBOTToken>/getUpdates

4. edit your telegram-send.sh with you channel id

```sh
nano telegram-send.sh
```

Change GROUP_ID and BOT_TOKEN with your own credentials and exit with ctrl+xy and enter. 

## Usage
bash ./stealwatcher.sh DOMAIN

ex:

```sh
bash ./stealwatcher.sh w44
```

By default, it takes the current year of the machine. But you can specifiy a year as a second argument. 

Ex:

```sh
bash ./stealwatcher.sh google 1997
```

That's it ! 🎊


## Roadmap

See the [open issues](https://github.com/Iyotee/StealedDomainNameWatcher/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.
* If you have suggestions for adding or removing projects, feel free to [open an issue](https://github.com/Iyotee/StealedDomainNameWatcher/issues/new) to discuss it, or directly create a pull request after you edit the *README.md* file with necessary changes.
* Please make sure you check your spelling and grammar.
* Create individual PR for each suggestion.
* Please also read through the [Code Of Conduct](https://github.com/Iyotee/StealedDomainNameWatcher/blob/main/CODE_OF_CONDUCT.md) before posting your first idea as well.

### Creating A Pull Request

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See [LICENSE](https://github.com/Iyotee/StealedDomainNameWatcher/blob/main/LICENSE.md) for more information.

## Authors

* **Jérémy Noverraz** - *Comp Sci enthousiast* - [Iyotee](https://github.com/iyotee/) - *Made with a lot of coffee*
