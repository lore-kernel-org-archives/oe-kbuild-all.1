Content-Type: multipart/mixed; boundary="===============0684669716501248124=="
MIME-Version: 1.0
From: Cpp Code <cpp.code.lv@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] net-next: openvswitch: IPv6: Add IPv6 extension header support
Date: Thu, 06 May 2021 08:53:06 -0700
Message-ID: <CAASuNyXeRdD-KzQiXZGsFdj4y38v1mXC8K+gJ3B3wOqfoeBvBQ@mail.gmail.com>
In-Reply-To: <202105060934.AXpcx9gB-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0684669716501248124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

sorry, wrong git tree.


On Wed, May 5, 2021 at 7:03 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Toms,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on net/master]
> [also build test WARNING on ipsec/master ipvs/master net-next/master linu=
s/master v5.12 next-20210505]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Toms-Atteka/net-next-ope=
nvswitch-IPv6-Add-IPv6-extension-header-support/20210506-021045
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 4c7=
a94286ef7ac7301d633f17519fb1bb89d7550
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> cocci warnings: (new ones prefixed by >>)
> >> net/openvswitch/flow.c:378:2-3: Unneeded semicolon
>
> Please review and possibly fold the followup patch.
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0684669716501248124==--

