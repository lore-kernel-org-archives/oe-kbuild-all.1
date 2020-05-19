Content-Type: multipart/mixed; boundary="===============2506138436147138853=="
MIME-Version: 1.0
From: Björn Töpel <bjorn.topel@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next v3 07/15] i40e: separate kernel allocated rx_bi rings from AF_XDP rings
Date: Tue, 19 May 2020 18:20:09 +0200
Message-ID: <c81b36a0-11dd-4b7f-fad8-85f31dced58c@intel.com>
In-Reply-To: <202005192351.j1H08VpV%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2506138436147138853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-05-19 17:18, kbuild test robot wrote:
> Hi "Bj=C3=B6rn,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on bpf-next/master]
> [also build test WARNING on jkirsher-next-queue/dev-queue next-20200518]
> [cannot apply to bpf/master linus/master v5.7-rc6]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Bj-rn-T-pel/Introduce-AF=
_XDP-buffer-allocation-API/20200519-203122
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> config: riscv-allyesconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Driscv
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

>>> drivers/net/ethernet/intel/i40e/i40e_txrx.c:531:6: warning: no previous=
 prototype for 'i40e_fd_handle_status' [-Wmissing-prototypes]
> 531 | void i40e_fd_handle_status(struct i40e_ring *rx_ring, u64 qword0_ra=
w,
> |      ^~~~~~~~~~~~~~~~~~~~~
>

Yes, this could indeed be made static. Hmm, I wonder why I didn't get
that warning on my x86-64 build!? I'll spin a v4 (or do a follow-up?).


Bj=C3=B6rn
--===============2506138436147138853==--

