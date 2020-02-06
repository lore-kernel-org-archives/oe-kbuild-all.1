Content-Type: multipart/mixed; boundary="===============5519260190478336178=="
MIME-Version: 1.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: sound/soc/intel/boards/hda_dsp_common.c:76: undefined reference to `snd_hda_codec_build_controls'
Date: Thu, 06 Feb 2020 10:55:46 -0600
Message-ID: <e82ceb12-2d0e-ccec-8d8d-eef556918c53@linux.intel.com>
In-Reply-To: <s5hwo909mm9.wl-tiwai@suse.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5519260190478336178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/6/20 1:54 AM, Takashi Iwai wrote:
> On Thu, 06 Feb 2020 06:29:52 +0100,
> kbuild test robot wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> head:   4c7d00ccf40db99bfb7bd1857bcbf007275704d8
>> commit: 7de9a47c8971bdec07cc9a62e948382003c5908f ASoC: Intel: skl-hda-ds=
p-generic: use snd-hda-codec-hdmi
>> date:   3 months ago
>> config: i386-randconfig-e003-20200206 (attached as .config)
>> compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
>> reproduce:
>>          git checkout 7de9a47c8971bdec07cc9a62e948382003c5908f
>>          # save the attached .config to linux build tree
>>          make ARCH=3Di386
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     ld: sound/soc/intel/boards/hda_dsp_common.o: in function `hda_dsp_hd=
mi_build_controls':
>>>> sound/soc/intel/boards/hda_dsp_common.c:76: undefined reference to `sn=
d_hda_codec_build_controls'
> =

> Looks like the revert select enforcing the built-in of SOF while the
> legacy HDA is a module.  It doesn't look so trivial to fix...

SOF in this case is build as a module, but the machine driver isn't.

It seems like the SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH option is =

different from others machine drivers. All others can only be either M =

or not selected, but here we have a case where the selection can be M or y.

The following diff seems to make the problem go away by preventing this =

case, it seems we didn't propagate the constraints from the higher level.

More testing needed, this is just a first result.

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 9ca2567d0059..db08b3af07c2 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -426,6 +426,7 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH

  endif ## SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK

+if SND_SOC_SOF_HDA
  if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC

  config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
@@ -441,6 +442,7 @@ config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
           If unsure select "N".

  endif ## SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || =

SND_SOC_SOF_HDA_AUDIO_CODEC
+endif

  if SND_SOC_SOF_HDA_LINK || SND_SOC_SOF_BAYTRAIL
  config SND_SOC_INTEL_SOF_RT5682_MACH
--===============5519260190478336178==--

