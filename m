Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343065EC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDslVfrN"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28b14d02ab9so522513a91.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702574784; x=1703179584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+Ka8wxIsA35NAcpj2VpTkHi729lxrpm9tFastxUpXM=;
        b=CDslVfrNhsq90wqAv/pgD79Vsf3+x9Dp7q/wic8jaWkWCdFcPWmoYbz9l19WYC7iVJ
         7arqAOAvgL4NIt0yMv9h86lXoqSlzfyIpd2r3FJCCUqGKI3Fhob3Pz/RaQ5H8Rrs4a1l
         sbFPUnBLZGagq3Wye2CXrhciU+S1QfoZzWhDEtVHzMzXiHTFy/FjGT4hXwrofsLv5vwe
         QCxPqTuPrCJpEeHGFcMZ5yfNmb/zspMsWJtippFwIW9E6t5zjMjbg1uD/aBxtXQycJco
         NYVxGAbFXIhFJmDkZa3meohgPufCPjwxvD+ZMVb0wX2y6ejHAtpjR4sWcIN8R9SpjhG/
         S/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574784; x=1703179584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+Ka8wxIsA35NAcpj2VpTkHi729lxrpm9tFastxUpXM=;
        b=py4wTcK/NwA8YNsvMYxAefPGsVmQu7mFvVtqHFXixE8vEcME63yJqNnBStVf5MDsfZ
         X3IOPI9phujB3wCI0d5z1XETCWCoRekg9o44PlK/dOXKwpvQSol4SZnpZN9upFHm33tv
         p+gWWpnhgtRbhtjUtgO93m6YqNKrqHUypDdzpvqljOm9o/UN2KVvbhloeTLGsBiunsW9
         HCI+jktoh/Ukvukeu+oGr3uO5qxufJa1aQT0ocR6cN5YLZvYZmeHgZzpc+MUOtnmmbXF
         AuS+EGcNhRRLVpM7CqYuEbdLWS9PeNkyMaU8mKhod+jQEDn+1gHPLnZlaNZSFXsmJ3RG
         mutQ==
X-Gm-Message-State: AOJu0YzV6iLPl+iBtPiejXb/iIjXTPgwqKA7RgvrDLlpVXmGVBbxdq8p
	ihBDF3JEXuUSVGZm1eb8XhM=
X-Google-Smtp-Source: AGHT+IHph1vaHVKrOP37Hvn4W8QinnzVQ9xW4IJ0io8VW9WP+ukmvN0XRG+NZNUtxhpdWi9wmOYmog==
X-Received: by 2002:a17:90a:f0ce:b0:286:9cc1:a10 with SMTP id fa14-20020a17090af0ce00b002869cc10a10mr8036911pjb.8.1702574783701;
        Thu, 14 Dec 2023 09:26:23 -0800 (PST)
Received: from localhost.localdomain ([50.47.187.252])
        by smtp.gmail.com with ESMTPSA id p17-20020a170903249100b001cfbe348ca5sm12688645plw.187.2023.12.14.09.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:26:22 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: lkp@intel.com,
	linux-input@vger.kernel.org
Cc: jkosina@suse.com,
	linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev,
	djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH] HID: nintendo: fix initializer element is not constant error
Date: Thu, 14 Dec 2023 09:25:41 -0800
Message-Id: <20231214172541.48370-1-rymcclel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202312141227.C2h1IzfI-lkp@intel.com>
References: <202312141227.C2h1IzfI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With gcc-7 builds, an error happens with the controller button values being
defined as const. Change to a define.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312141227.C2h1IzfI-lkp@intel.com/

Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
---
 drivers/hid/hid-nintendo.c | 44 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 47af111ef3a2..2987083785f9 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -336,28 +336,28 @@ struct joycon_imu_cal {
  * All the controller's button values are stored in a u32.
  * They can be accessed with bitwise ANDs.
  */
-static const u32 JC_BTN_Y	= BIT(0);
-static const u32 JC_BTN_X	= BIT(1);
-static const u32 JC_BTN_B	= BIT(2);
-static const u32 JC_BTN_A	= BIT(3);
-static const u32 JC_BTN_SR_R	= BIT(4);
-static const u32 JC_BTN_SL_R	= BIT(5);
-static const u32 JC_BTN_R	= BIT(6);
-static const u32 JC_BTN_ZR	= BIT(7);
-static const u32 JC_BTN_MINUS	= BIT(8);
-static const u32 JC_BTN_PLUS	= BIT(9);
-static const u32 JC_BTN_RSTICK	= BIT(10);
-static const u32 JC_BTN_LSTICK	= BIT(11);
-static const u32 JC_BTN_HOME	= BIT(12);
-static const u32 JC_BTN_CAP	= BIT(13); /* capture button */
-static const u32 JC_BTN_DOWN	= BIT(16);
-static const u32 JC_BTN_UP	= BIT(17);
-static const u32 JC_BTN_RIGHT	= BIT(18);
-static const u32 JC_BTN_LEFT	= BIT(19);
-static const u32 JC_BTN_SR_L	= BIT(20);
-static const u32 JC_BTN_SL_L	= BIT(21);
-static const u32 JC_BTN_L	= BIT(22);
-static const u32 JC_BTN_ZL	= BIT(23);
+#define JC_BTN_Y	 BIT(0)
+#define JC_BTN_X	 BIT(1)
+#define JC_BTN_B	 BIT(2)
+#define JC_BTN_A	 BIT(3)
+#define JC_BTN_SR_R	 BIT(4)
+#define JC_BTN_SL_R	 BIT(5)
+#define JC_BTN_R	 BIT(6)
+#define JC_BTN_ZR	 BIT(7)
+#define JC_BTN_MINUS	 BIT(8)
+#define JC_BTN_PLUS	 BIT(9)
+#define JC_BTN_RSTICK	 BIT(10)
+#define JC_BTN_LSTICK	 BIT(11)
+#define JC_BTN_HOME	 BIT(12)
+#define JC_BTN_CAP	 BIT(13) /* capture button */
+#define JC_BTN_DOWN	 BIT(16)
+#define JC_BTN_UP	 BIT(17)
+#define JC_BTN_RIGHT	 BIT(18)
+#define JC_BTN_LEFT	 BIT(19)
+#define JC_BTN_SR_L	 BIT(20)
+#define JC_BTN_SL_L	 BIT(21)
+#define JC_BTN_L	 BIT(22)
+#define JC_BTN_ZL	 BIT(23)
 
 struct joycon_ctlr_button_mapping {
 	u32 code;
-- 
2.25.1

