Content-Type: multipart/mixed; boundary="===============0795019031969660282=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: sound/soc/intel/boards/hda_dsp_common.c:76: undefined reference to `snd_hda_codec_build_controls'
Date: Thu, 06 Feb 2020 08:54:38 +0100
Message-ID: <s5hwo909mm9.wl-tiwai@suse.de>
In-Reply-To: <202002061349.zDVX3Qdu%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0795019031969660282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 06 Feb 2020 06:29:52 +0100,
kbuild test robot wrote:
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   4c7d00ccf40db99bfb7bd1857bcbf007275704d8
> commit: 7de9a47c8971bdec07cc9a62e948382003c5908f ASoC: Intel: skl-hda-dsp=
-generic: use snd-hda-codec-hdmi
> date:   3 months ago
> config: i386-randconfig-e003-20200206 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
> reproduce:
>         git checkout 7de9a47c8971bdec07cc9a62e948382003c5908f
>         # save the attached .config to linux build tree
>         make ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    ld: sound/soc/intel/boards/hda_dsp_common.o: in function `hda_dsp_hdmi=
_build_controls':
> >> sound/soc/intel/boards/hda_dsp_common.c:76: undefined reference to `sn=
d_hda_codec_build_controls'

Looks like the revert select enforcing the built-in of SOF while the
legacy HDA is a module.  It doesn't look so trivial to fix...


Takashi
--===============0795019031969660282==--

