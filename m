Content-Type: multipart/mixed; boundary="===============7825804802882661429=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 1/2] udp: call udp_encap_enable for v6 sockets when enabling encap
Date: Tue, 12 Jan 2021 15:53:07 +0800
Message-ID: <CADvbK_fK1tiPcD6XNZ0Aq29K8_e6DS9OpvbskHB-WqDeajN9dQ@mail.gmail.com>
In-Reply-To: <202101120129.zxrZgmC0-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7825804802882661429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 2:02 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Xin,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on net-next/master]
>
> url:    https://github.com/0day-ci/linux/commits/Xin-Long/net-enable-udp-=
v6-sockets-receiving-v4-packets-with-UDP-GRO/20210111-205115
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t 73b7a6047971aa6ce4a70fc4901964d14f077171
> config: m68k-defconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/62229592b4c3e929eeafea8=
2e758dacb2953fbde
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Xin-Long/net-enable-udp-v6-socke=
ts-receiving-v4-packets-with-UDP-GRO/20210111-205115
>         git checkout 62229592b4c3e929eeafea82e758dacb2953fbde
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "udp_encap_needed_key" [net/ipv6/ipv6.ko] undefined!
I will add udp_encap_disable() and export, thanks.
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7825804802882661429==--

