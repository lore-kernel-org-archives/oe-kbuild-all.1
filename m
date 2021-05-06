Content-Type: multipart/mixed; boundary="===============2438419554910116388=="
MIME-Version: 1.0
From: Matthieu Baerts <matthieu.baerts@tessares.net>
To: kbuild-all@lists.01.org
Subject: Re: [mptcp:export 25/36] protocol.c:undefined reference to `mptcp_is_checksum_enabled'
Date: Thu, 06 May 2021 14:29:33 +0200
Message-ID: <9746feb4-178f-f663-b452-f7c66b29bf25@tessares.net>
In-Reply-To: <202105061823.5b2YbffT-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2438419554910116388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On 06/05/2021 12:42, kernel test robot wrote:
> tree:   https://github.com/multipath-tcp/mptcp_net-next.git export
> head:   a80b9458a82c6568e3859b1e16cc45b48a24dc46
> commit: eb3ca35b48814a29b9942f5109f4c0183aa6f776 [25/36] mptcp: add a new=
 sysctl checksum_enabled
> config: nds32-randconfig-c003-20210506 (attached as .config)
> compiler: nds32le-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/multipath-tcp/mptcp_net-next/commit/eb3ca35b=
48814a29b9942f5109f4c0183aa6f776
>         git remote add mptcp https://github.com/multipath-tcp/mptcp_net-n=
ext.git
>         git fetch --no-tags mptcp export
>         git checkout eb3ca35b48814a29b9942f5109f4c0183aa6f776
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dnds32 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    nds32le-linux-ld: net/mptcp/protocol.o: in function `__mptcp_init_sock=
':
>>> protocol.c:(.text+0xb2c): undefined reference to `mptcp_is_checksum_ena=
bled'
>>> nds32le-linux-ld: protocol.c:(.text+0xb30): undefined reference to `mpt=
cp_is_checksum_enabled'
>    nds32le-linux-ld: net/mptcp/subflow.o: in function `subflow_v4_route_r=
eq':
>>> subflow.c:(.text+0x1934): undefined reference to `mptcp_is_checksum_ena=
bled'
>>> nds32le-linux-ld: subflow.c:(.text+0x1938): undefined reference to `mpt=
cp_is_checksum_enabled'
>    nds32le-linux-ld: net/mptcp/subflow.o: in function `mptcp_subflow_init=
_cookie_req':
>    subflow.c:(.text+0x19e0): undefined reference to `mptcp_is_checksum_en=
abled'
>    nds32le-linux-ld: net/mptcp/subflow.o:subflow.c:(.text+0x19e4): more u=
ndefined references to `mptcp_is_checksum_enabled' follow

Thank you guys for testing our tree!

FYI, it has been fixed a few minutes before your report:

https://patchwork.ozlabs.org/project/mptcp/patch/20210506103734.3845725-1-m=
atthieu.baerts(a)tessares.net/

Cheers,
Matt
-- =

Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
--===============2438419554910116388==--

