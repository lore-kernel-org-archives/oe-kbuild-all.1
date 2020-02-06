Content-Type: multipart/mixed; boundary="===============2322990709741511010=="
MIME-Version: 1.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: sound/pci/hda/patch_hdmi.c:1086: undefined reference to `snd_hda_get_num_devices'
Date: Thu, 06 Feb 2020 11:05:28 -0600
Message-ID: <02d655fe-dd21-3fcb-6f5d-4ecde51f3240@linux.intel.com>
In-Reply-To: <s5hr1z7q12m.wl-tiwai@suse.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2322990709741511010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/6/20 7:48 AM, Takashi Iwai wrote:
> On Thu, 06 Feb 2020 14:40:17 +0100,
> Kai Vehmanen wrote:
>>
>> Hey,
>>
>> On Thu, 6 Feb 2020, kbuild test robot wrote:
>>
>>>     ld: sound/pci/hda/patch_hdmi.o: in function `intel_not_share_assign=
ed_cvt':
>>>>> sound/pci/hda/patch_hdmi.c:1086: undefined reference to `snd_hda_get_=
num_devices'
>>>>> ld: sound/pci/hda/patch_hdmi.c:1098: undefined reference to `snd_hda_=
get_dev_select'
>>>>> ld: sound/pci/hda/patch_hdmi.c:1099: undefined reference to `snd_hda_=
set_dev_select'
>>
>> hmm, this seems similar case as the previous one today w.r.t
>> hda_dsp_common.c:76. Patch_hdmi.c is built-in while snd-hda is a module.
>> Maybe we need to just drop the dependency from the ASoC board files to
>> SND_HDA_CODEC_HDMI. We don't have one for SND_HDA_CODEC either.
> =

> The problem is that SOF tries to do reverse-select the legacy HD-audio
> codec, but it doesn't work in general.  Or it must be done very
> carefully.
> =

> If something gets selected, all dependencies have to be
> reverse-selected, too.  But the legacy HDA is built up in a way of
> standard top-down selection (i.e. SND_HDA_CODEC_* depends on SND_HDA,
> not other way round).

It's the same issue as the other one reported earlier, and adding the =

dependency on SOF_HDA makes the unmet dependency go away.
--===============2322990709741511010==--

