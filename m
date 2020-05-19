Content-Type: multipart/mixed; boundary="===============4263293357291304094=="
MIME-Version: 1.0
From: Doug Anderson <dianders@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [danielt-linux:kgdb/for-next 9/14] drivers/tty/serial/kgdboc.c:410:13: error: expected parameter declarator
Date: Tue, 19 May 2020 09:39:03 -0700
Message-ID: <CAD=FV=WHr6=jMStO8bgTzO0z15CSc=wpFmjqA7jr-hQZ_qCm2Q@mail.gmail.com>
In-Reply-To: <202005200021.2bVBUTxG%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4263293357291304094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 19, 2020 at 9:07 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git=
 kgdb/for-next
> head:   3dc6a1ac3f70f1e4530132bd231599e0a91d5b5d
> commit: eae3e19ca930a56c726fbf4dc3adc198b8f5d61d [9/14] kgdboc: Remove us=
eless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc
> config: x86_64-allmodconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 135b=
877874fae96b4372c8a3fbfaa8ff44ff86e3)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout eae3e19ca930a56c726fbf4dc3adc198b8f5d61d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All error/warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/tty/serial/kgdboc.c:410:13: error: expected parameter declarat=
or
> early_param("ekgdboc", kgdboc_early_init);
> ^
> >> drivers/tty/serial/kgdboc.c:410:13: error: expected ')'
> drivers/tty/serial/kgdboc.c:410:12: note: to match this '('
> early_param("ekgdboc", kgdboc_early_init);
> ^
> >> drivers/tty/serial/kgdboc.c:410:1: warning: declaration specifier miss=
ing, defaulting to 'int'
> early_param("ekgdboc", kgdboc_early_init);
> ^
> int
> >> drivers/tty/serial/kgdboc.c:410:12: error: this function declaration i=
s not a prototype [-Werror,-Wstrict-prototypes]
> early_param("ekgdboc", kgdboc_early_init);
> ^
> void
> 1 warning and 3 errors generated.
>
> vim +410 drivers/tty/serial/kgdboc.c
>
> 9731191f75a54c4 drivers/serial/kgdboc.c Jason Wessel 2010-05-20  409
> 9731191f75a54c4 drivers/serial/kgdboc.c Jason Wessel 2010-05-20 @410  ear=
ly_param("ekgdboc", kgdboc_early_init);
> 9731191f75a54c4 drivers/serial/kgdboc.c Jason Wessel 2010-05-20  411
>
> :::::: The code at line 410 was first introduced by commit
> :::::: 9731191f75a54c4fa17e9b9b88f3144cf4b47836 kgdboc: Add ekgdboc for e=
arly use of the kernel debugger
>
> :::::: TO: Jason Wessel <jason.wessel@windriver.com>
> :::::: CC: Jason Wessel <jason.wessel@windriver.com>

I already got yelled at and posted a fix.  See the thread at:

https://lore.kernel.org/r/20200520000524.69af8a86(a)canb.auug.org.au

-Doug
--===============4263293357291304094==--

