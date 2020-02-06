Content-Type: multipart/mixed; boundary="===============7601844739018104230=="
MIME-Version: 1.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: sound/soc/intel/boards/hda_dsp_common.c:76: undefined reference to `snd_hda_codec_build_controls'
Date: Thu, 06 Feb 2020 12:01:24 -0600
Message-ID: <9d8d130f-47d5-03a5-484e-b0865c6de6f8@linux.intel.com>
In-Reply-To: <e82ceb12-2d0e-ccec-8d8d-eef556918c53@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7601844739018104230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>>> =C2=A0=C2=A0=C2=A0 ld: sound/soc/intel/boards/hda_dsp_common.o: in func=
tion =

>>> `hda_dsp_hdmi_build_controls':
>>>>> sound/soc/intel/boards/hda_dsp_common.c:76: undefined reference to =

>>>>> `snd_hda_codec_build_controls'
>>
>> Looks like the revert select enforcing the built-in of SOF while the
>> legacy HDA is a module.=C2=A0 It doesn't look so trivial to fix...
> =

> SOF in this case is build as a module, but the machine driver isn't.
> =

> It seems like the SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH option is =

> different from others machine drivers. All others can only be either M =

> or not selected, but here we have a case where the selection can be M or =
y.

Suggested fix is here, running it through our CI tests for now:

https://github.com/thesofproject/linux/pull/1768

This should be caught by kbuild tests as well.
--===============7601844739018104230==--

