Received: from resdmta-h2p-564583.sys.comcast.net (resdmta-h2p-564583.sys.comcast.net [96.102.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05631B0F33
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.102.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739986326; cv=none; b=af4rPUMbHf2gaH8C8v94kYpM28TJUPO7ssIUnDfQMCTYCUoqqnE079DOVZCZ+axx+t1eqMBHFgrLg/FKQF0OGWazYaOdbtdORJ+lcCUZdfkyUWb+4Twyc5jmzvJm9shXdm/Ra11BjaDiniyoZPG1KUIAzEZz0h/Geu4GEA/g0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739986326; c=relaxed/simple;
	bh=QPcSlc0LiyhqRnBHUiR6DpyUQpaxrjck9VKaibmMjOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ExRwPtGy8o2MpExaXdBFenur6naY3UkNMkCXZe7jXJWob8uvb7fCxpt4DCG7RXf4tF4lkxjdZIpL8711tw1Dx84z+2Igbx2EEdN5Mqqwx3vujIMT2qay5NVoiRYY4nbtiiTbL1FQ6EbT9NohORXCbzVN46cnhQD+lrnzmL4PsRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=comcast.net; spf=pass smtp.mailfrom=comcast.net; dkim=pass (2048-bit key) header.d=comcast.net header.i=@comcast.net header.b=5BZmodV3; arc=none smtp.client-ip=96.102.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=comcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=comcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=comcast.net header.i=@comcast.net header.b="5BZmodV3"
Received: from resomta-h2p-555357.sys.comcast.net ([96.102.179.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by resdmta-h2p-564583.sys.comcast.net with ESMTPS
	id kjEbt3Ors7axqknt1t6N8E; Wed, 19 Feb 2025 17:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=20190202a; t=1739986167;
	bh=NblRiKsXcO5CBT4PJbFI990yoHCBghohSU4zRzM3oU0=;
	h=Received:Received:From:To:Subject:Date:Message-ID:MIME-Version:
	 Xfinity-Spam-Result;
	b=5BZmodV3q5qT9K1pT2S5hkhrI1aItPiYZfxvnhgXlYDvF8MITyT6rEKKgC5KMbBIh
	 rggRjjlMbmGHjSk5Voq1Idtt3Or2PLUT1eIrFBqpR6t6I1RK9wP+ROW0rxfpK2ERmI
	 OSgoq9OTi70KdL74LAhW3zaUg7NHCW9Z07OiX6jRifWxzBBVEUBIfKdIhYSk8z3OrT
	 aPFpu8OqtKRRMMdHmkozITfEM8MH1n7a6gz0jdnrNFfG1mW4it/FVxXDIEInsh90Em
	 TjngJ/YDZSRw4IWc/irOYtdccTF4z6A3vq853gZv2VfDxNx6t3WVQ4zZ3F/1ixhhTN
	 5x7FlvZFicR6w==
Received: from jack-livingood.hsd1.ca.comcast.net
 ([IPv6:2601:647:4d81:b870::5d17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by resomta-h2p-555357.sys.comcast.net with ESMTPSA
	id knsltKeG1gUTFknsstPzl2; Wed, 19 Feb 2025 17:29:21 +0000
From: jack Livingood <jacklivingood@comcast.net>
To: llvm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev,
	yung-chuan.liao@linux.intel.com,
	o-takashi@sakamocchi.jp,
	tiwai@suse.de,
	jack Livingood <jacklivingood@comcast.net>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] sound:firewire:fixed spelling error
Date: Wed, 19 Feb 2025 09:28:17 -0800
Message-ID: <20250219172817.50172-1-jacklivingood@comcast.net>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMiccxxfr+qZXBpeZzpJH6M47BiP0/FFde6KME1jItbSlnTZy76XKGbLgbUBWscfcGOwCP8e/+5LfhXkhCQNHOHBbh7fmdhhEEhKAQuNRgfnTEKIWOv4
 QajGS81ZhE9sPLw7fiHPHvXpctXQEN/dcWLJUuNCGI3ObawDY/WPv8HnzrgRTr182ry5Q4R2ULW3WcofR5c0rNTJYLj/jrvHjXzUa1KklPqdYW45trxfAboD
 JsTZyUBbnx8zchsAi9bu0AJ0m8KkZynzU5rxBv27uc+ACdXjAmVyHMeFcLGvjUQURGH6foJJy3gRhRQEz8NAVoQrSzkkO46HLPuy7N1c4psncsYsIdkz1pgc
 zihqLQ3770znn1kRFVhcojLk6uXNxsiBEtr7lRwPeFsZ4Yf/tMB6BpEKHVY7l20UuKs7SCzTwYMkwhwHKSrHJjRylf2v1jcywrzxh0MFS6X4C+V7hpY=

fixed a spelling error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502191455.cX0HILg0-lkp@intel.com/
Signed-off-by: Jack Livingood <jacklivingood@comcast.net>
---
 sound/firewire/isight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index e9617fc0a532..bf1e3f293c75 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -643,7 +643,7 @@ static int isight_probe(struct fw_unit *unit,
 		 "Apple iSight (GUID %08x%08x) at %s, S%d",
 		 fw_dev->config_rom[3], fw_dev->config_rom[4],
 		 dev_name(&unit->device), 100 << fw_dev->max_speed);
-	strspy(card->mixername, "iSight");
+	strscpy(card->mixername, "iSight");
 
 	err = isight_create_pcm(isight);
 	if (err < 0)
-- 
2.48.1

