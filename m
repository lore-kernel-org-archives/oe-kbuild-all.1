Content-Type: multipart/mixed; boundary="===============7852789815540001916=="
MIME-Version: 1.0
From: Dan Murphy <dmurphy@ti.com>
To: kbuild-all@lists.01.org
Subject: Re: sound/soc/codecs/tlv320adcx140.c:776:34: warning: unused variable 'tlv320adcx140_of_match'
Date: Tue, 26 May 2020 09:41:00 -0500
Message-ID: <a9949577-92ce-75dc-f8d7-96d758f3f1c0@ti.com>
In-Reply-To: <202005230320.TWdmRD2n%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7852789815540001916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello

On 5/22/20 2:16 PM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   4286d192c803571e8ca43b0f1f8ea04d663a278a
> commit: 689c7655b50c5de2b6f0f42fecfb37bde5acf040 ASoC: tlv320adcx140: Add=
 the tlv320adcx140 codec driver family
> date:   3 months ago
> config: mips-randconfig-r014-20200522 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3393=
cc4cebf9969db94dc424b7a2b6195589c33b)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install mips cross compiling tool for clang build
>          # apt-get install binutils-mips-linux-gnu
>          git checkout 689c7655b50c5de2b6f0f42fecfb37bde5acf040
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Dmips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> sound/soc/codecs/tlv320adcx140.c:776:34: warning: unused variable 'tlv3=
20adcx140_of_match' [-Wunused-const-variable]
> static const struct of_device_id tlv320adcx140_of_match[] =3D {
> ^
> 1 warning generated.
>
> vim +/tlv320adcx140_of_match +776 sound/soc/codecs/tlv320adcx140.c
>
>     775	=

>   > 776	static const struct of_device_id tlv320adcx140_of_match[] =3D {
>     777		{ .compatible =3D "ti,tlv320adc3140" },
>     778		{ .compatible =3D "ti,tlv320adc5140" },
>     779		{ .compatible =3D "ti,tlv320adc6140" },
>     780		{},
>     781	};
>     782	MODULE_DEVICE_TABLE(of, tlv320adcx140_of_match);
>     783	=


I am not sure about this issue the same code appears in many drivers ie =

the TAS2562 and that did not create a warning within this build AFAIK

Dan

--===============7852789815540001916==--

