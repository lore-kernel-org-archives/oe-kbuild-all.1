Content-Type: multipart/mixed; boundary="===============0462078123695330324=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH sound] ALSA: usb-audio: scarlett2: snd_scarlett_gen2_controls_create() can be static
Date: Sun, 23 May 2021 10:32:28 +0200
Message-ID: <s5hzgwletpf.wl-tiwai@suse.de>
In-Reply-To: <20210522180900.GA83915@f59a3af2f1d9>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0462078123695330324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 22 May 2021 20:09:00 +0200,
kernel test robot wrote:
> =

> sound/usb/mixer_scarlett_gen2.c:2000:5: warning: symbol 'snd_scarlett_gen=
2_controls_create' was not declared. Should it be static?
> =

> Fixes: 265d1a90e4fb ("ALSA: usb-audio: scarlett2: Improve driver startup =
messages")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>

Applied now.  Thanks.


Takashi
--===============0462078123695330324==--

