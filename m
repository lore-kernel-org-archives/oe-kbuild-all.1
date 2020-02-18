Content-Type: multipart/mixed; boundary="===============4615666097282764873=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: "imply" and modular target dependencies (was: Re: [asoc:for-5.7 21/76] wcd9335.c:undefined reference to `slim_stream_prepare')
Date: Tue, 18 Feb 2020 15:13:33 +0100
Message-ID: <CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com>
In-Reply-To: <202002180512.4RU8Rxge%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4615666097282764873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 10:55 PM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git=
 for-5.7
> head:   3cd23f021e2e5f3350125abcb39f12430df87d06
> commit: ea00d95200d02ece71f5814d41b14f2eb16d598b [21/76] ASoC: Use imply =
for SND_SOC_ALL_CODECS
> config: x86_64-randconfig-s2-20200217 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> reproduce:
>         git checkout ea00d95200d02ece71f5814d41b14f2eb16d598b
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>

Thanks for your report!

> All errors (new ones prefixed by >>):
>
>    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_read_re=
g':
>    ab8500-codec.c:(.text+0x479): undefined reference to `abx500_get_regis=
ter_interruptible'
>    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_probe':
>    ab8500-codec.c:(.text+0xdf1): undefined reference to `abx500_get_regis=
ter_interruptible'
>    ld: ab8500-codec.c:(.text+0xe18): undefined reference to `abx500_set_r=
egister_interruptible'
>    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_write_r=
eg':
>    ab8500-codec.c:(.text+0x4b1): undefined reference to `abx500_set_regis=
ter_interruptible'

The above are fixed in next-20200218.

>    ld: sound/soc/codecs/mc13783.o: in function `mc13783_probe':
>    mc13783.c:(.text+0x24c): undefined reference to `mc13xxx_reg_write'
>    ld: mc13783.c:(.text+0x25e): undefined reference to `mc13xxx_reg_write'
>    ld: mc13783.c:(.text+0x270): undefined reference to `mc13xxx_reg_write'
>    ld: mc13783.c:(.text+0x282): undefined reference to `mc13xxx_reg_write'
>    ld: mc13783.c:(.text+0x294): undefined reference to `mc13xxx_reg_write'
>    ld: sound/soc/codecs/mc13783.o:mc13783.c:(.text+0x2a6): more undefined=
 references to `mc13xxx_reg_write' follow
>    ld: sound/soc/codecs/mc13783.o: in function `mc13783_probe':
>    mc13783.c:(.text+0x2c5): undefined reference to `mc13xxx_reg_rmw'
>    ld: mc13783.c:(.text+0x2e4): undefined reference to `mc13xxx_reg_rmw'
>    ld: sound/soc/codecs/mc13783.o: in function `mc13783_remove':
>    mc13783.c:(.text+0x212): undefined reference to `mc13xxx_reg_rmw'

CONFIG_SND_SOC_MC13783=3Dy
CONFIG_MFD_MC13XXX=3Dm

>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_trigger':
> >> wcd9335.c:(.text+0x323): undefined reference to `slim_stream_prepare'
> >> ld: wcd9335.c:(.text+0x32f): undefined reference to `slim_stream_enabl=
e'
> >> ld: wcd9335.c:(.text+0x345): undefined reference to `slim_stream_unpre=
pare'
> >> ld: wcd9335.c:(.text+0x351): undefined reference to `slim_stream_disab=
le'
>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_status':
> >> wcd9335.c:(.text+0x1970): undefined reference to `of_slim_get_device'
> >> ld: wcd9335.c:(.text+0x1995): undefined reference to `slim_get_logical=
_addr'
> >> ld: wcd9335.c:(.text+0x19b2): undefined reference to `__regmap_init_sl=
imbus'
>    ld: wcd9335.c:(.text+0x19f3): undefined reference to `__regmap_init_sl=
imbus'
>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_hw_params':
> >> wcd9335.c:(.text+0x348f): undefined reference to `slim_stream_allocate'
>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_init':
> >> wcd9335.c:(.init.text+0x3c): undefined reference to `__slim_driver_reg=
ister'
>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_exit':
> >> wcd9335.c:(.exit.text+0x8): undefined reference to `slim_driver_unregi=
ster'

CONFIG_SND_SOC_WCD9335=3Dy
CONFIG_SLIMBUS=3Dm

>    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_trigger':
> >> wcd934x.c:(.text+0x30d): undefined reference to `slim_stream_prepare'
> >> ld: wcd934x.c:(.text+0x319): undefined reference to `slim_stream_enabl=
e'
> >> ld: wcd934x.c:(.text+0x32f): undefined reference to `slim_stream_unpre=
pare'
> >> ld: wcd934x.c:(.text+0x33b): undefined reference to `slim_stream_disab=
le'
>    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_hw_params':
> >> wcd934x.c:(.text+0x2620): undefined reference to `slim_stream_allocate'
>    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_codec_probe':
> >> wcd934x.c:(.text+0x27ee): undefined reference to `of_slim_get_device'
> >> ld: wcd934x.c:(.text+0x2818): undefined reference to `slim_get_logical=
_addr'
> >> ld: wcd934x.c:(.text+0x2836): undefined reference to `__regmap_init_sl=
imbus'

CONFIG_SND_SOC_WCD934X=3Dy
CONFIG_SLIMBUS=3Dm

All CONFIG_SND_SOC_* symbols above are tristate and have dependencies
on the modular symbols.

However, the "imply" statements in SND_SOC_ALL_CODECS force all of them
builtin, despite their dependencies being modular.

So while "imply" is meant to be a softer form of "select", obeying target
dependencies, it does not seem to obey modular tristate dependencies?

Or am I missing something?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- =

Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============4615666097282764873==--

