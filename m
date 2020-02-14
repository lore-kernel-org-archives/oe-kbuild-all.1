Content-Type: multipart/mixed; boundary="===============8476063486483089703=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [superna9999:amlogic/v5.7/gx-audio 6/13] sound/soc/meson/meson-codec-glue.c:77:50: sparse: sparse: restricted snd_pcm_format_t degrades to integer
Date: Fri, 14 Feb 2020 10:49:40 +0800
Message-ID: <202002141018.VQmqHFy4%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8476063486483089703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/superna9999/linux amlogic/v5.7/gx-audio
head:   a97409fdeb770c6a0f7ba1ee39144b53c062a510
commit: c0d0bba1b758bce058f94f834e8ed7f122889a87 [6/13] ASoC: meson: g12a: =
extract codec-to-codec utils
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout c0d0bba1b758bce058f94f834e8ed7f122889a87
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/soc/meson/meson-codec-glue.c:77:50: sparse: sparse: restricted snd=
_pcm_format_t degrades to integer

vim +77 sound/soc/meson/meson-codec-glue.c

    66	=

    67	int meson_codec_glue_input_hw_params(struct snd_pcm_substream *subst=
ream,
    68					     struct snd_pcm_hw_params *params,
    69					     struct snd_soc_dai *dai)
    70	{
    71		struct meson_codec_glue_input *data =3D
    72			meson_codec_glue_input_get_data(dai);
    73	=

    74		data->params.rates =3D snd_pcm_rate_to_rate_bit(params_rate(params)=
);
    75		data->params.rate_min =3D params_rate(params);
    76		data->params.rate_max =3D params_rate(params);
  > 77		data->params.formats =3D 1 << params_format(params);
    78		data->params.channels_min =3D params_channels(params);
    79		data->params.channels_max =3D params_channels(params);
    80		data->params.sig_bits =3D dai->driver->playback.sig_bits;
    81	=

    82		return 0;
    83	}
    84	EXPORT_SYMBOL_GPL(meson_codec_glue_input_hw_params);
    85	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8476063486483089703==--

