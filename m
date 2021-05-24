Content-Type: multipart/mixed; boundary="===============9078228905138808545=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 1880/4499] ld.lld: error: undefined symbol: arm64_bpf_fixup_exception
Date: Mon, 24 May 2021 13:56:43 +0200
Message-ID: <f2d7c87d-5762-ac2a-3ba6-532920369cd3@iogearbox.net>
In-Reply-To: <202105240924.0g1MHKBO-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9078228905138808545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/24/21 3:25 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8dca2cd055ffb78b37f52f0bf0bd20c249619c4d
> commit: b24abcff918a5cbf44b0c982bd3477a93e8e4911 [1880/4499] bpf, kconfig=
: Add consolidated menu entry for bpf with core options
> config: arm64-randconfig-r026-20210524 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project b4fd=
512c36ca344a3ff69350219e8b0a67e9472a)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm64 cross compiling tool for clang build
>          # apt-get install binutils-aarch64-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/commit/?id=3Db24abcff918a5cbf44b0c982bd3477a93e8e4911
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout b24abcff918a5cbf44b0c982bd3477a93e8e4911
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Darm64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> Note: the linux-next/master HEAD 8dca2cd055ffb78b37f52f0bf0bd20c249619c4d=
 builds fine.
>        It may have been fixed somewhere.

Yes, fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=3D6b=
dacdb48e94ff26c03c6eeeef48c03c5e2f7dd4
--===============9078228905138808545==--

