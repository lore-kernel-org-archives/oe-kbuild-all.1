Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5AF28FE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elHhz4LK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a1b68ae40ffso19865966b.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Dec 2023 01:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701594364; x=1702199164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX+3yDbq4orl3F1IwroT1JgXwfqK8BBsS1e+lWobZFk=;
        b=elHhz4LKaZKNgCaYQxvtyWFHWQ+Q45wNAhmjz+RbXQbRr97NI7pmbwQ/F6C0H98FmD
         zmhZKSGFE7KixyGUXYwpJ0xzSeAsTLb0n8lP7VI818/2BUSaNTDWcGFlUqwdr5V37Ysy
         YkDY8+3Cxs/T/lc2SKhtCqau5JpDoeGTK9+spVGKtHU0ElS2MvVHnJxrYDMHrGkWF5RV
         5ky7DBV7O9DyzJWfnF+H1HkHw4rydPB9Cmk+gbLFHlfBomJow+ycLuxMLgE3f83JdFew
         8afQDcVoKY9x2xqYIcPV4kR0Y8dZSsAnSlkbq73FINJ5qgHguSkGufGEG6gAO7eCimdU
         khnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701594364; x=1702199164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX+3yDbq4orl3F1IwroT1JgXwfqK8BBsS1e+lWobZFk=;
        b=p2OPbcYw7ZAAKCGie2QipEBeUzlv16cmNQEijnNyiFLb8Uck44idHO1YFeMqJBTbT2
         nbljggmu4JpxoRnCwxn4RzKDBSUZeai25cX42y2blH/Ayk93R6CKjC7gf7qIY2Zv6Sxz
         bzSXz4j7kt4eufGIkQK61BQZSMdt9YkDs9r+8cpJIKWPwsnMC9JU4Do+wjHvJ+NlGCjN
         I0VMDZgPntGDgzxOiOVoqn2XEsWxr3KH5CQDmBE5nlgn/lWPaA3mvQb6LaB2iXYtZcAp
         cQGDHuObnT9qu3ER0hB7g3Tosqo57z3Hk3XL2cimOrwK+U0BsMWVw4eF1jVqx7hVIdSY
         LDHw==
X-Gm-Message-State: AOJu0YyP44PRaIItuJNhtOYU/rb8Emi1U18WGubZCqcQJ1+YgjXBYAiN
	XLbG4VThX9BjNPQZUjcoj1A=
X-Google-Smtp-Source: AGHT+IFpTykt5g6ytZ04cyAdHNtbWrSm8cg2twxsPVBHbwUSML/8XczZs9/JKQt/ZLMTG9/KCs1Ipw==
X-Received: by 2002:a17:906:b302:b0:a0f:f117:e2aa with SMTP id n2-20020a170906b30200b00a0ff117e2aamr1292476ejz.42.1701594364281;
        Sun, 03 Dec 2023 01:06:04 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id la26-20020a170906ad9a00b009bd9ac83a9fsm3939717ejb.152.2023.12.03.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 01:06:04 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	zboszormenyi@sicom.com,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] egalax_ts_serial: Fix potential buffer overflow
Date: Sun,  3 Dec 2023 10:06:00 +0100
Message-ID: <20231203090600.85890-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202312021646.cwwvptuB-lkp@intel.com>
References: <202312021646.cwwvptuB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update my old (defunct) email addresses in passing.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311171716.uIQY5rT4-lkp@intel.com/
Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 CREDITS                                      | 3 ++-
 drivers/input/touchscreen/egalax_ts_serial.c | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CREDITS b/CREDITS
index f33a33fd2371..5efccb40d577 100644
--- a/CREDITS
+++ b/CREDITS
@@ -470,8 +470,9 @@ S: Montreal, Quebec
 S: Canada
 
 N: Zoltán Böszörményi
-E: zboszor@mail.externet.hu
+E: zboszor@gmail.com
 D: MTRR emulation with Cyrix style ARR registers, Athlon MTRR support
+D: eGalax serial touchscreen support
 
 N: John Boyd
 E: boyd@cis.ohio-state.edu
diff --git a/drivers/input/touchscreen/egalax_ts_serial.c b/drivers/input/touchscreen/egalax_ts_serial.c
index 375922d3a6d1..f8b56896a42f 100644
--- a/drivers/input/touchscreen/egalax_ts_serial.c
+++ b/drivers/input/touchscreen/egalax_ts_serial.c
@@ -2,7 +2,7 @@
 /*
  * EETI Egalax serial touchscreen driver
  *
- * Copyright (c) 2015 Zoltán Böszörményi <zboszor@pr.hu>
+ * Copyright (c) 2015 Zoltán Böszörményi <zboszor@gmail.com>
  *
  * based on the
  *
@@ -42,7 +42,7 @@ struct egalax {
 	struct serio *serio;
 	int idx;
 	u8 data[EGALAX_FORMAT_MAX_LENGTH];
-	char phys[32];
+	char phys[NAME_MAX];
 };
 
 static void egalax_process_data(struct egalax *egalax)
@@ -185,6 +185,6 @@ static struct serio_driver egalax_drv = {
 };
 module_serio_driver(egalax_drv);
 
-MODULE_AUTHOR("Zoltán Böszörményi <zboszor@pr.hu>");
+MODULE_AUTHOR("Zoltán Böszörményi <zboszor@gmail.com>");
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL v2");
-- 
2.42.0

