Content-Type: multipart/mixed; boundary="===============8987166209671701803=="
MIME-Version: 1.0
From: Andrew Lunn <andrew@lunn.ch>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 2/2] net: tipc: Add __printf() markup to fix -Wsuggest-attribute=format
Date: Thu, 29 Oct 2020 13:40:17 +0100
Message-ID: <20201029124017.GI933237@lunn.ch>
In-Reply-To: <202010291009.4MeXI3UF-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8987166209671701803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 10:49:34AM +0800, kernel test robot wrote:
> Hi Andrew,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on net-next/master]
> =

> url:    https://github.com/0day-ci/linux/commits/Andrew-Lunn/net-dccp-Add=
-__printf-markup-to-fix-Wsuggest-attribute-format/20201029-081346
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t cd29296fdfca919590e4004a7e4905544f4c4a32
> config: arc-allyesconfig (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/0be08855cea6e7b987406c1=
beee6ca1b508f5066
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Andrew-Lunn/net-dccp-Add-__print=
f-markup-to-fix-Wsuggest-attribute-format/20201029-081346
>         git checkout 0be08855cea6e7b987406c1beee6ca1b508f5066
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    net/tipc/netlink_compat.c: In function 'tipc_nl_compat_link_stat_dump':
> >> net/tipc/netlink_compat.c:591:39: warning: format '%s' expects argumen=
t of type 'char *', but argument 3 has type 'void *' [-Wformat=3D]
>      591 |  tipc_tlv_sprintf(msg->rep, "\nLink <%s>\n",
>          |                                      ~^
>          |                                       |
>          |                                       char *
>          |                                      %p
>      592 |     nla_data(link[TIPC_NLA_LINK_NAME]));
>          |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ =

>          |     |
>          |     void *

Yep, which is the point of adding this markup, and why there is a
follow up patch fixing this.

Please don't let this 0-day report stop the commit being merged.

       Andrew
--===============8987166209671701803==--

