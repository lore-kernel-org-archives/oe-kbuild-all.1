Content-Type: multipart/mixed; boundary="===============5197416719545666552=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-rt-devel:linux-5.4.y-rt 45/303] kernel//printk/printk.o: warning: objtool: keep_bootcon_setup()+0x1a: can't find call dest symbol at .text+0x3ed1
Date: Mon, 24 Feb 2020 08:59:08 -0800
Message-ID: <CAKwvOdmCYdR+rTwdeQ8dVQGWxfD0V2hKKEjwhio3_SgRr=augA@mail.gmail.com>
In-Reply-To: <202002222325.hmmCHeQw%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5197416719545666552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi John,
It looks like this tree may have some patches from tip; we've fixed up
that issue, you may ignore this report. Sorry for the noise.

On Sat, Feb 22, 2020 at 7:08 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi John,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git linux-5.4.y-rt
> head:   3205ab6b87084709279e2ffd4654caa2adbca73a
> commit: 35a550e0af7946f894d89a6e6f2d0991f71547e6 [45/303] printk: remove =
unused code
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (git://gitmirror/llvm_project d7c403e64043=
281b9c5883e3e034da5ebaf4985a)
> reproduce:
>         # FIXME the reproduce steps for clang is not ready yet
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> kernel//printk/printk.o: warning: objtool: keep_bootcon_setup()+0x1a: =
can't find call dest symbol at .text+0x3ed1
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202002222325.hmmCHeQw%25lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============5197416719545666552==--

