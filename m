Content-Type: multipart/mixed; boundary="===============7044370004700582238=="
MIME-Version: 1.0
From: Jerome Brunet <jbrunet@baylibre.com>
To: kbuild-all@lists.01.org
Subject: Re: [usb:usb-testing 8/8] drivers/usb/gadget/function/u_audio.c:248:9: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 4294967296 to 0
Date: Mon, 04 Jan 2021 15:04:24 +0100
Message-ID: <1jturwx0gn.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <X+sHKyfBnrT/8dIG@kroah.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7044370004700582238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On Tue 29 Dec 2020 at 11:38, Greg Kroah-Hartman <gregkh@linuxfoundation.o=
rg> wrote:

> On Tue, Dec 29, 2020 at 04:38:44PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git u=
sb-testing
>> head:   32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
>> commit: 32510cf5e554e8f2cecafea8b8cc11daa4afb9e6 [8/8] usb: gadget: u_au=
dio: factorize ssize to alsa fmt conversion
>> config: arm-randconfig-r003-20201229 (attached as .config)
>> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project cee=
1e7d14f4628d6174b33640d502bff3b54ae45)
>> reproduce (this is a W=3D1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install arm cross compiling tool for clang build
>>         # apt-get install binutils-arm-linux-gnueabi
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git=
/commit/?id=3D32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
>>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/g=
it/gregkh/usb.git
>>         git fetch --no-tags usb usb-testing
>>         git checkout 32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Darm =

>> =

>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>> =

>> All warnings (new ones prefixed by >>):
>> =

>> >> drivers/usb/gadget/function/u_audio.c:248:9: warning: implicit conver=
sion from 'unsigned long long' to 'unsigned long' changes value from 429496=
7296 to 0 [-Wconstant-conversion]
>>                    ret =3D SNDRV_PCM_FMTBIT_S24_3LE;
>>                        ~ ^~~~~~~~~~~~~~~~~~~~~~~~
>>    include/sound/pcm.h:170:34: note: expanded from macro 'SNDRV_PCM_FMTB=
IT_S24_3LE'
>>    #define SNDRV_PCM_FMTBIT_S24_3LE        _SNDRV_PCM_FMTBIT(S24_3LE)
>>                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>    include/sound/pcm.h:139:39: note: expanded from macro '_SNDRV_PCM_FMT=
BIT'
>>    #define _SNDRV_PCM_FMTBIT(fmt)          (1ULL << (__force int)SNDRV_P=
CM_FORMAT_##fmt)
>>                                             ~~~~~^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
>>    1 warning generated.
>
> I'm dropping this patch from my tree now, thanks.
>

Tested on 64bits platform only, sorry about that.
I'll respin with u64 which is the actual type of "hw.formats" .

> greg k-h

--===============7044370004700582238==--

