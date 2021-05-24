Content-Type: multipart/mixed; boundary="===============4798483211639476852=="
MIME-Version: 1.0
From: Dmitry Osipenko <digetx@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 2/4] ASoC: tegra: Unify ASoC machine drivers
Date: Mon, 24 May 2021 17:21:55 +0300
Message-ID: <97f88bb4-2dcf-4905-ac07-f08adf2f6582@gmail.com>
In-Reply-To: <202105241048.gypbTx2I-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4798483211639476852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

24.05.2021 05:34, kernel test robot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>     66	=

>     67	static int tegra_machine_event(struct snd_soc_dapm_widget *w,
>     68				       struct snd_kcontrol *k, int event)
>     69	{
>     70		struct snd_soc_dapm_context *dapm =3D w->dapm;
>     71		struct tegra_machine *machine =3D snd_soc_card_get_drvdata(dapm->=
card);
>     72	=

>   > 73		if (machine->asoc->dapm_event) {
>     74			int ret =3D machine->asoc->dapm_event(w, k, event);
>     75			if (ret <=3D 0)
>     76				return ret;
>     77		}

That dapm_event hook indeed shouldn't belong to this patch. I changed my
build scripts to compile-test sound drivers. This will be fixed in v4.
--===============4798483211639476852==--

