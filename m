Content-Type: multipart/mixed; boundary="===============1371707335318109363=="
MIME-Version: 1.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: sound/soc/sof/sof-audio.c:375 sof_machine_check() warn: inconsistent indenting
Date: Mon, 19 Oct 2020 09:36:11 -0500
Message-ID: <d4eb5888-1a9e-60c3-d01f-5601b559741f@linux.intel.com>
In-Reply-To: <202010190917.V19qtBGc-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1371707335318109363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/18/20 8:41 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   7cf726a59435301046250c42131554d9ccc566b8
> commit: 285880a23d105e5d34b311b0c44061dffb07e405 ASoC: SOF: Make creation=
 of machine device from SOF core optional
> date:   10 months ago
> config: i386-randconfig-m021-20201019 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> smatch warnings:
> sound/soc/sof/sof-audio.c:375 sof_machine_check() warn: inconsistent inde=
nting
> sound/soc/sof/sof-audio.c:380 sof_machine_check() warn: ignoring unreacha=
ble code.

we provided a fix for this:

[PATCH 3/4] ASoC: SOF: sof-audio: remove goto used for force-nocodec support

but I don't see it in Mark's tree. That was part of the series
"[PATCH 0/4] ASoC: SOF: cleanups for 5.10" shared by Kai Vehmanen on =

September 30.

I don't recall what happened with this series?
--===============1371707335318109363==--

