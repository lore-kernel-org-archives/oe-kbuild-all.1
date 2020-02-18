Content-Type: multipart/mixed; boundary="===============7707498540794150654=="
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: "imply" and modular target dependencies (was: Re: [asoc:for-5.7 21/76] wcd9335.c:undefined reference to `slim_stream_prepare')
Date: Wed, 19 Feb 2020 02:31:41 +0900
Message-ID: <CAK7LNARh198oeSfM-u9c=s_tZ+V+Yhq58q6rMSU+iX0-q2GGLA@mail.gmail.com>
In-Reply-To: <CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7707498540794150654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Geert,


On Tue, Feb 18, 2020 at 11:13 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Mon, Feb 17, 2020 at 10:55 PM kbuild test robot <lkp@intel.com> wrot=
e:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.g=
it for-5.7
> > head:   3cd23f021e2e5f3350125abcb39f12430df87d06
> > commit: ea00d95200d02ece71f5814d41b14f2eb16d598b [21/76] ASoC: Use impl=
y for SND_SOC_ALL_CODECS
> > config: x86_64-randconfig-s2-20200217 (attached as .config)
> > compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> > reproduce:
> >         git checkout ea00d95200d02ece71f5814d41b14f2eb16d598b
> >         # save the attached .config to linux build tree
> >         make ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
>
> Thanks for your report!
>
> > All errors (new ones prefixed by >>):
> >
> >    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_read_=
reg':
> >    ab8500-codec.c:(.text+0x479): undefined reference to `abx500_get_reg=
ister_interruptible'
> >    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_probe=
':
> >    ab8500-codec.c:(.text+0xdf1): undefined reference to `abx500_get_reg=
ister_interruptible'
> >    ld: ab8500-codec.c:(.text+0xe18): undefined reference to `abx500_set=
_register_interruptible'
> >    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_write=
_reg':
> >    ab8500-codec.c:(.text+0x4b1): undefined reference to `abx500_set_reg=
ister_interruptible'
>
> The above are fixed in next-20200218.
>
> >    ld: sound/soc/codecs/mc13783.o: in function `mc13783_probe':
> >    mc13783.c:(.text+0x24c): undefined reference to `mc13xxx_reg_write'
> >    ld: mc13783.c:(.text+0x25e): undefined reference to `mc13xxx_reg_wri=
te'
> >    ld: mc13783.c:(.text+0x270): undefined reference to `mc13xxx_reg_wri=
te'
> >    ld: mc13783.c:(.text+0x282): undefined reference to `mc13xxx_reg_wri=
te'
> >    ld: mc13783.c:(.text+0x294): undefined reference to `mc13xxx_reg_wri=
te'
> >    ld: sound/soc/codecs/mc13783.o:mc13783.c:(.text+0x2a6): more undefin=
ed references to `mc13xxx_reg_write' follow
> >    ld: sound/soc/codecs/mc13783.o: in function `mc13783_probe':
> >    mc13783.c:(.text+0x2c5): undefined reference to `mc13xxx_reg_rmw'
> >    ld: mc13783.c:(.text+0x2e4): undefined reference to `mc13xxx_reg_rmw'
> >    ld: sound/soc/codecs/mc13783.o: in function `mc13783_remove':
> >    mc13783.c:(.text+0x212): undefined reference to `mc13xxx_reg_rmw'
>
> CONFIG_SND_SOC_MC13783=3Dy
> CONFIG_MFD_MC13XXX=3Dm
>
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_trigger':
> > >> wcd9335.c:(.text+0x323): undefined reference to `slim_stream_prepare'
> > >> ld: wcd9335.c:(.text+0x32f): undefined reference to `slim_stream_ena=
ble'
> > >> ld: wcd9335.c:(.text+0x345): undefined reference to `slim_stream_unp=
repare'
> > >> ld: wcd9335.c:(.text+0x351): undefined reference to `slim_stream_dis=
able'
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_status':
> > >> wcd9335.c:(.text+0x1970): undefined reference to `of_slim_get_device'
> > >> ld: wcd9335.c:(.text+0x1995): undefined reference to `slim_get_logic=
al_addr'
> > >> ld: wcd9335.c:(.text+0x19b2): undefined reference to `__regmap_init_=
slimbus'
> >    ld: wcd9335.c:(.text+0x19f3): undefined reference to `__regmap_init_=
slimbus'
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_hw_params':
> > >> wcd9335.c:(.text+0x348f): undefined reference to `slim_stream_alloca=
te'
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_ini=
t':
> > >> wcd9335.c:(.init.text+0x3c): undefined reference to `__slim_driver_r=
egister'
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_exi=
t':
> > >> wcd9335.c:(.exit.text+0x8): undefined reference to `slim_driver_unre=
gister'
>
> CONFIG_SND_SOC_WCD9335=3Dy
> CONFIG_SLIMBUS=3Dm
>
> >    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_trigger':
> > >> wcd934x.c:(.text+0x30d): undefined reference to `slim_stream_prepare'
> > >> ld: wcd934x.c:(.text+0x319): undefined reference to `slim_stream_ena=
ble'
> > >> ld: wcd934x.c:(.text+0x32f): undefined reference to `slim_stream_unp=
repare'
> > >> ld: wcd934x.c:(.text+0x33b): undefined reference to `slim_stream_dis=
able'
> >    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_hw_params':
> > >> wcd934x.c:(.text+0x2620): undefined reference to `slim_stream_alloca=
te'
> >    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_codec_probe':
> > >> wcd934x.c:(.text+0x27ee): undefined reference to `of_slim_get_device'
> > >> ld: wcd934x.c:(.text+0x2818): undefined reference to `slim_get_logic=
al_addr'
> > >> ld: wcd934x.c:(.text+0x2836): undefined reference to `__regmap_init_=
slimbus'
>
> CONFIG_SND_SOC_WCD934X=3Dy
> CONFIG_SLIMBUS=3Dm
>
> All CONFIG_SND_SOC_* symbols above are tristate and have dependencies
> on the modular symbols.
>
> However, the "imply" statements in SND_SOC_ALL_CODECS force all of them
> builtin, despite their dependencies being modular.
>
> So while "imply" is meant to be a softer form of "select", obeying target
> dependencies, it does not seem to obey modular tristate dependencies?


I quickly checked the Kconfig code.

Surprisingly or not, 'imply' does not
obey 'depends on'.

I do not know if it is a bug, or intended behavior
but at least the current code works so.
(I am guessing this is a bug...)

I checked Documentation/kbuild/kconfig-language.rst
Unfortunately, this case is not documented.


        =3D=3D=3D             =3D=3D=3D             =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
        FOO             BAR             BAZ's default   choice for BAZ
        =3D=3D=3D             =3D=3D=3D             =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
        n               y               n               N/m/y
        m               y               m               M/y/n
        y               y               y               Y/n
        y               n               *               N
        y               m               <undocumented>  <undocumented>
        =3D=3D=3D             =3D=3D=3D             =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



I attached a patch, which changes the 'imply' to
follow the restriction of 'depends on',
but I need to take a closer look at this.





> Or am I missing something?
> Thanks!



-- =

Best Regards
Masahiro Yamada

--===============7707498540794150654==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kconfig-change-imply-to-respect-depends-on.patch"

RnJvbSA0ZWM1NDJlMjAxOTAwYzBkZDFlMDZhNDljYTMwN2YwZmU5ZDJjNGNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBXZWQsIDE5IEZlYiAyMDIwIDAyOjE0OjQ4ICswOTAwClN1YmplY3Q6IFtQQVRDSF0g
a2NvbmZpZzogY2hhbmdlICdpbXBseScgdG8gcmVzcGVjdCAnZGVwZW5kcyBvbicKClNpZ25lZC1v
ZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Ci0tLQogc2NyaXB0
cy9rY29uZmlnL3N5bWJvbC5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMva2NvbmZpZy9zeW1i
b2wuYyBiL3NjcmlwdHMva2NvbmZpZy9zeW1ib2wuYwppbmRleCA4ZDM4YjcwMGIzMTQuLjQ1MDAz
ZDdkZmIwYSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9rY29uZmlnL3N5bWJvbC5jCisrKyBiL3Njcmlw
dHMva2NvbmZpZy9zeW1ib2wuYwpAQCAtMzkzLDcgKzM5Myw5IEBAIHZvaWQgc3ltX2NhbGNfdmFs
dWUoc3RydWN0IHN5bWJvbCAqc3ltKQogCQkJCX0KIAkJCQlpZiAoc3ltLT5pbXBsaWVkLnRyaSAh
PSBubykgewogCQkJCQlzeW0tPmZsYWdzIHw9IFNZTUJPTF9XUklURTsKLQkJCQkJbmV3dmFsLnRy
aSA9IEVYUFJfT1IobmV3dmFsLnRyaSwgc3ltLT5pbXBsaWVkLnRyaSk7CisJCQkJCW5ld3ZhbC50
cmkgPSBFWFBSX09SKG5ld3ZhbC50cmksCisJCQkJCQkJICAgICBFWFBSX0FORChzeW0tPmRpcl9k
ZXAudHJpLAorCQkJCQkJCQkgICAgICBzeW0tPmltcGxpZWQudHJpKSk7CiAJCQkJfQogCQkJfQog
CQljYWxjX25ld3ZhbDoKQEAgLTQwMSw4ICs0MDMsNyBAQCB2b2lkIHN5bV9jYWxjX3ZhbHVlKHN0
cnVjdCBzeW1ib2wgKnN5bSkKIAkJCQlzeW1fd2Fybl91bm1ldF9kZXAoc3ltKTsKIAkJCW5ld3Zh
bC50cmkgPSBFWFBSX09SKG5ld3ZhbC50cmksIHN5bS0+cmV2X2RlcC50cmkpOwogCQl9Ci0JCWlm
IChuZXd2YWwudHJpID09IG1vZCAmJgotCQkgICAgKHN5bV9nZXRfdHlwZShzeW0pID09IFNfQk9P
TEVBTiB8fCBzeW0tPmltcGxpZWQudHJpID09IHllcykpCisJCWlmIChuZXd2YWwudHJpID09IG1v
ZCAmJiBzeW1fZ2V0X3R5cGUoc3ltKSA9PSBTX0JPT0xFQU4pCiAJCQluZXd2YWwudHJpID0geWVz
OwogCQlicmVhazsKIAljYXNlIFNfU1RSSU5HOgotLSAKMi4xNy4xCgo=

--===============7707498540794150654==--

