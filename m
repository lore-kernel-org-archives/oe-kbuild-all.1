Content-Type: multipart/mixed; boundary="===============9056888496428287039=="
MIME-Version: 1.0
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: sound/pci/hda/patch_hdmi.c:1086: undefined reference to `snd_hda_get_num_devices'
Date: Thu, 06 Feb 2020 15:40:17 +0200
Message-ID: <alpine.DEB.2.21.2002061531350.2957@eliteleevi.tm.intel.com>
In-Reply-To: <202002061809.r3UYBZGx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9056888496428287039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, 6 Feb 2020, kbuild test robot wrote:

>    ld: sound/pci/hda/patch_hdmi.o: in function `intel_not_share_assigned_=
cvt':
> >> sound/pci/hda/patch_hdmi.c:1086: undefined reference to `snd_hda_get_n=
um_devices'
> >> ld: sound/pci/hda/patch_hdmi.c:1098: undefined reference to `snd_hda_g=
et_dev_select'
> >> ld: sound/pci/hda/patch_hdmi.c:1099: undefined reference to `snd_hda_s=
et_dev_select'

hmm, this seems similar case as the previous one today w.r.t =

hda_dsp_common.c:76. Patch_hdmi.c is built-in while snd-hda is a module. =

Maybe we need to just drop the dependency from the ASoC board files to =

SND_HDA_CODEC_HDMI. We don't have one for SND_HDA_CODEC either.

Br, Kai
--===============9056888496428287039==--

