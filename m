Content-Type: multipart/mixed; boundary="===============0519243075255268973=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.10.y 3189/5262] drivers/usb/dwc2/hcd.c:3835:6: warning: stack frame size of 1032 bytes in function 'dwc2_hcd_dump_state'
Date: Thu, 20 May 2021 17:56:35 +0800
Message-ID: <9df0d465-d671-d970-4b45-61af014749c9@intel.com>
In-Reply-To: <CAK8P3a3hc67Ks_j8cXokOQBQBEJfMbrDLHfDTXcPFYQfxga=ag@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0519243075255268973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/20/21 5:27 PM, Arnd Bergmann wrote:
> On Thu, May 20, 2021 at 11:22 AM Rong Chen <rong.a.chen@intel.com> wrot=
e:
>> On 5/20/21 4:28 AM, Arnd Bergmann wrote:
>>> On Wed, May 19, 2021 at 9:48 PM kernel test robot <lkp@intel.com> wro=
te:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-s=
table-rc.git linux-5.10.y
>>>> head:   689e89aee55c565fe90fcdf8a7e53f2f976c5946
>>>> commit: 5f2f616343b1d62d26f24316fbfc107ecf0983a9 [3189/5262] linux/com=
piler-clang.h: define HAVE_BUILTIN_BSWAP*
>>>> config: mips-randconfig-r015-20210519 (attached as .config)
>>>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8=
e93d10633d751a3e9169bf9fa68326925ffa097)
>>>> reproduce (this is a W=3D1 build):
>>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/maste=
r/sbin/make.cross -O ~/bin/make.cross
>>>>           chmod +x ~/bin/make.cross
>>>>           # install mips cross compiling tool for clang build
>>>>           # apt-get install binutils-mips-linux-gnu
>>>>           # https://git.kernel.org/pub/scm/linux/kernel/git/stable/lin=
ux-stable-rc.git/commit/?id=3D5f2f616343b1d62d26f24316fbfc107ecf0983a9
>>>>           git remote add linux-stable-rc https://git.kernel.org/pub/sc=
m/linux/kernel/git/stable/linux-stable-rc.git
>>>>           git fetch --no-tags linux-stable-rc linux-5.10.y
>>>>           git checkout 5f2f616343b1d62d26f24316fbfc107ecf0983a9
>>>>           # save the attached .config to linux build tree
>>>>           COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cro=
ss ARCH=3Dmips
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All warnings (new ones prefixed by >>):
>>>>
>>> I analyzed another bug like this today, and I think this is again just
>>> CONFIG_UBSAN_ALIGNMENT=3Dy
>>> on mips/clang causing tons of these warnings.
>>>
>>> I don't think this should be considered a regression, but we may want
>>> to change either the
>>> kernel or the 0day bot from test building this combination of options.
>>>
>>>          Arnd
>>>
>> Hi Arnd,
>>
>> We have disabled CONFIG_UBSAN_ALIGNMENT for mips/clang in our kconfigs
>> to avoid reporting such warnings again.
> Thanks a lot, that helps.
>
> Have you considered always enforcing CONFIG_COMPILE_TEST=3Dy for any
> randconfig build? That would address this issue along with a number of si=
milar
> ones. I have sent a number of patches to add COMPILE_TEST dependencies
> for things that otherwise break in randconfig builds but could still be u=
seful
> in more specific cases when users know better.
>
>         Arnd

Hi Arnd,

Thanks for the advice, we'll consider it in the near future
after assessing the existing configures.

Best Regards,
Rong Chen
--===============0519243075255268973==--

