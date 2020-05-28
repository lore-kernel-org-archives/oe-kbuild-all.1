Content-Type: multipart/mixed; boundary="===============8606337048820954537=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [vireshk-pm:opp/linux-next 11/11] drivers/opp/core.c:875:32: warning: variable 'opp' is uninitialized when used here
Date: Thu, 28 May 2020 08:52:26 +0530
Message-ID: <20200528032226.3wk3pwiljdkqliai@vireshk-i7>
In-Reply-To: <202005281149.hTxDcKho%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8606337048820954537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 28-05-20, 11:18, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git op=
p/linux-next
> head:   c57afacc9270629a03ecb21f956a54886eb81342
> commit: c57afacc9270629a03ecb21f956a54886eb81342 [11/11] opp: Remove band=
width votes when target_freq is zero
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3393=
cc4cebf9969db94dc424b7a2b6195589c33b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout c57afacc9270629a03ecb21f956a54886eb81342
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> drivers/opp/core.c:875:32: warning: variable 'opp' is uninitialized wh=
en used here [-Wuninitialized]
> ret =3D _set_opp_bw(opp_table, opp, dev, true);
> ^~~
> drivers/opp/core.c:849:34: note: initialize the variable 'opp' to silence=
 this warning
> struct dev_pm_opp *old_opp, *opp;
> ^
> =3D NULL
> 1 warning generated.

Fixed, thanks.

-- =

viresh
--===============8606337048820954537==--

