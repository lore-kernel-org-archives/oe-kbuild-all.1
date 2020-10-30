Content-Type: multipart/mixed; boundary="===============7399642392994305345=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/video/backlight/ltv350qv.c:192:12: warning: stack frame size of 13472 bytes in function 'ltv350qv_power'
Date: Fri, 30 Oct 2020 21:28:43 +0800
Message-ID: <650988cc-2f70-d03a-b456-bf1915b64836@intel.com>
In-Reply-To: <CAAeHK+wdv=X-iD208M2m3Xte9F+g2kYRDqQr4A+GP7Z1tY85BA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7399642392994305345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/29/2020 11:28 PM, Andrey Konovalov wrote:
> On Sun, Oct 25, 2020 at 8:17 PM Andrew Morton <akpm@linux-foundation.or=
g> wrote:
>>
>> On Mon, 26 Oct 2020 02:15:37 +0800 kernel test robot <lkp@intel.com> w=
rote:
>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
>>> head:   d76913908102044f14381df865bb74df17a538cb
>>> commit: cae9dc35ed9ff82a99754e51d57ff6c332e1f7e4 kasan: allow enabling =
stack tagging for tag-based mode
>>> date:   3 months ago
>>> config: arm64-randconfig-r005-20201026 (attached as .config)
>>> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 1c=
8371692dfe8245bc6690ff1262dcced4649d21)
>>> reproduce (this is a W=3D1 build):
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # install arm64 cross compiling tool for clang build
>>>          # apt-get install binutils-aarch64-linux-gnu
>>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3Dcae9dc35ed9ff82a99754e51d57ff6c332e1f7e4
>>>          git remote add linus https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git
>>>          git fetch --no-tags linus master
>>>          git checkout cae9dc35ed9ff82a99754e51d57ff6c332e1f7e4
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 ARCH=3Darm64
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> drivers/video/backlight/ltv350qv.c:192:12: warning: stack frame size =
of 13472 bytes in function 'ltv350qv_power' [-Wframe-larger-than=3D]
>>
>> That's a lot of stack.
>>
>>>     static int ltv350qv_power(struct ltv350qv *lcd, int power)
>>>                ^
>>>     1 warning generated.
>>>
>>> vim +/ltv350qv_power +192 drivers/video/backlight/ltv350qv.c
>>
>> Odd - the code looks pretty normal.  It is possible that your compiler
>> is (crazily) inlining ltv350qv_write_reg()?
> =

> This is the same issue in LLVM that was reported by Arnd for generic
> KASAN (also see KASAN_STACK_ENABLE option description). By default
> KASAN shouldn't have stack instrumentation enabled unless
> KASAN_STACK_ENABLE is specified. Perhaps it makes sense to disable it
> for KASAN_SW_TAGS config on the kernel test robot.

Hi Andrey,

Thanks for your advice, we'll take a look.

Best Regards,
Rong Chen

> =

> [1] https://bugs.llvm.org/show_bug.cgi?id=3D38809
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
>=20
--===============7399642392994305345==--

