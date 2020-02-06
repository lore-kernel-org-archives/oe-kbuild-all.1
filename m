Content-Type: multipart/mixed; boundary="===============0756696054065426455=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: sound/pci/hda/patch_hdmi.c:1086: undefined reference to `snd_hda_get_num_devices'
Date: Thu, 06 Feb 2020 14:48:01 +0100
Message-ID: <s5hr1z7q12m.wl-tiwai@suse.de>
In-Reply-To: <alpine.DEB.2.21.2002061531350.2957@eliteleevi.tm.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0756696054065426455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 06 Feb 2020 14:40:17 +0100,
Kai Vehmanen wrote:
> =

> Hey,
> =

> On Thu, 6 Feb 2020, kbuild test robot wrote:
> =

> >    ld: sound/pci/hda/patch_hdmi.o: in function `intel_not_share_assigne=
d_cvt':
> > >> sound/pci/hda/patch_hdmi.c:1086: undefined reference to `snd_hda_get=
_num_devices'
> > >> ld: sound/pci/hda/patch_hdmi.c:1098: undefined reference to `snd_hda=
_get_dev_select'
> > >> ld: sound/pci/hda/patch_hdmi.c:1099: undefined reference to `snd_hda=
_set_dev_select'
> =

> hmm, this seems similar case as the previous one today w.r.t =

> hda_dsp_common.c:76. Patch_hdmi.c is built-in while snd-hda is a module. =

> Maybe we need to just drop the dependency from the ASoC board files to =

> SND_HDA_CODEC_HDMI. We don't have one for SND_HDA_CODEC either.

The problem is that SOF tries to do reverse-select the legacy HD-audio =

codec, but it doesn't work in general.  Or it must be done very
carefully.

If something gets selected, all dependencies have to be
reverse-selected, too.  But the legacy HDA is built up in a way of
standard top-down selection (i.e. SND_HDA_CODEC_* depends on SND_HDA,
not other way round).


Takashi
--===============0756696054065426455==--

