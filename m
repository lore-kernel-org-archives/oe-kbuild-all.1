Content-Type: multipart/mixed; boundary="===============2998413968301316273=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: kernel/sched/fair.c:9551:12: warning: stack frame size of 1376 bytes in function 'load_balance'
Date: Thu, 20 May 2021 17:23:34 +0800
Message-ID: <cae151a3-7d88-a1fd-4d34-d599238f6a4e@intel.com>
In-Reply-To: <CAK8P3a0YVh=hoBthjH7N=mSXOi0fEdwvyuHUJ36qricqVUZ9jA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2998413968301316273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/19/21 8:32 PM, Arnd Bergmann wrote:
> On Mon, May 17, 2021 at 3:45 PM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
>> On Tue, 11 May 2021 at 18:01, kernel test robot <lkp@intel.com> wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
>>> head:   1140ab592e2ebf8153d2b322604031a8868ce7a5
>>> commit: 0826530de3cbdc89e60a89e86def94a5f0fc81ca sched/fair: Remove upd=
ate of blocked load from newidle_balance
>>> date:   9 weeks ago
>>> config: mips-randconfig-r022-20210511 (attached as .config)
>>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0=
fed635fe1701470062495a6ffee1c608f3f1bc)
>>> reproduce (this is a W=3D1 build):
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # install mips cross compiling tool for clang build
>>>          # apt-get install binutils-mips-linux-gnu
>>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3D0826530de3cbdc89e60a89e86def94a5f0fc81ca
>>>          git remote add linus https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git
>>>          git fetch --no-tags linus master
>>>          git checkout 0826530de3cbdc89e60a89e86def94a5f0fc81ca
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 W=3D1 ARCH=3Dmips
>> It was a bit difficult to find the warning among the thousand
> I opened an issue against clang about it:
>
> See https://github.com/ClangBuiltLinux/linux/issues/1379

Hi Arnd,

We have disabled CONFIG_UBSAN_ALIGNMENT for mips/clang in our kconfigs
according to the comments in the above link.

Best Regards,
Rong Chen

>
> but then found that this is already known. I think it would be best to
> make the kernel test robot
> set CONFIG_COMPILE_TEST to avoid issues like this. I have annotated a
> number of symbols
> that are known to cause unnecessary false positives in a similar way
> to get a clean build.
>
>          Arnd
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============2998413968301316273==--

