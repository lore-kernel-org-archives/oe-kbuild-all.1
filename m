Content-Type: multipart/mixed; boundary="===============3553807663620382849=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.10.y 3189/5262] drivers/usb/dwc2/hcd.c:3835:6: warning: stack frame size of 1032 bytes in function 'dwc2_hcd_dump_state'
Date: Thu, 20 May 2021 17:20:50 +0800
Message-ID: <e65bc9b7-13ef-0e83-1ec5-0287d5875d2c@intel.com>
In-Reply-To: <CAK8P3a2j61ouv8h-rWj7zPzjZ8Ok7GtQpyT5NaiYGxwxWHfwAw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3553807663620382849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/20/21 4:28 AM, Arnd Bergmann wrote:
> On Wed, May 19, 2021 at 9:48 PM kernel test robot <lkp@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-sta=
ble-rc.git linux-5.10.y
>> head:   689e89aee55c565fe90fcdf8a7e53f2f976c5946
>> commit: 5f2f616343b1d62d26f24316fbfc107ecf0983a9 [3189/5262] linux/compi=
ler-clang.h: define HAVE_BUILTIN_BSWAP*
>> config: mips-randconfig-r015-20210519 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8e9=
3d10633d751a3e9169bf9fa68326925ffa097)
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install mips cross compiling tool for clang build
>>          # apt-get install binutils-mips-linux-gnu
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-rc.git/commit/?id=3D5f2f616343b1d62d26f24316fbfc107ecf0983a9
>>          git remote add linux-stable-rc https://git.kernel.org/pub/scm/l=
inux/kernel/git/stable/linux-stable-rc.git
>>          git fetch --no-tags linux-stable-rc linux-5.10.y
>>          git checkout 5f2f616343b1d62d26f24316fbfc107ecf0983a9
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dmips
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
> I analyzed another bug like this today, and I think this is again just
> CONFIG_UBSAN_ALIGNMENT=3Dy
> on mips/clang causing tons of these warnings.
>
> I don't think this should be considered a regression, but we may want
> to change either the
> kernel or the 0day bot from test building this combination of options.
>
>         Arnd
>

Hi Arnd,

We have disabled CONFIG_UBSAN_ALIGNMENT for mips/clang in our kconfigs
to avoid reporting such warnings again.

Best Regards,
Rong Chen
--===============3553807663620382849==--

