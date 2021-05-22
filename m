Content-Type: multipart/mixed; boundary="===============3478886684654523038=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH sound] ALSA: usb-audio: scarlett2: snd_scarlett_gen2_controls_create() can be static
Date: Sun, 23 May 2021 02:09:00 +0800
Message-ID: <20210522180900.GA83915@f59a3af2f1d9>
In-Reply-To: <202105230212.9rlkrDHb-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3478886684654523038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

sound/usb/mixer_scarlett_gen2.c:2000:5: warning: symbol 'snd_scarlett_gen2_=
controls_create' was not declared. Should it be static?

Fixes: 265d1a90e4fb ("ALSA: usb-audio: scarlett2: Improve driver startup me=
ssages")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 mixer_scarlett_gen2.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen=
2.c
index 3ad8f61a2095f..4caf379d5b991 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1997,8 +1997,8 @@ static int scarlett2_mixer_status_create(struct usb_m=
ixer_interface *mixer)
 	return usb_submit_urb(mixer->urb, GFP_KERNEL);
 }
 =

-int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
-				      const struct scarlett2_device_info *info)
+static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *m=
ixer,
+					     const struct scarlett2_device_info *info)
 {
 	int err;
=20
--===============3478886684654523038==--

