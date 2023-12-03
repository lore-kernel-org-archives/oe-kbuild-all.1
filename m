Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6733CD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDg2XdOi"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54b8276361cso4207745a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Dec 2023 01:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701594330; x=1702199130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX+3yDbq4orl3F1IwroT1JgXwfqK8BBsS1e+lWobZFk=;
        b=kDg2XdOiKmy5h9z01Nv95/Qc08lrNtf4n316ayzaUPC8FZNCElFvtamsPTS5YnEF6i
         xx1AF3iYfr8d2QNsqHaGcs0gfeift4IUBGIIadTLev1BNcHuDHQD4PLZ13QrsPVmL7kY
         jGaG7MXl8WRbl2W/oiU8R7J3NoYAl2MXhrVs9xn3BJtwD9vqyISuLfHzFH0/AkD5eQRC
         9qYxogwTJFdPgQg1lPQrl4xt9gVwyD6fdZnqc/iJ6odx1FrI6G/ZzNPmz5uCzlTo1V3G
         PjHSKFLFrSA9Lo/Z1zoSsRiMvjxCDrho199nf8ROgcJcVm48kfan1Pbq1E9xqR3pQFsg
         fVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701594330; x=1702199130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX+3yDbq4orl3F1IwroT1JgXwfqK8BBsS1e+lWobZFk=;
        b=RfymaEqAjWH2751IEPFY6RwY53/ZOj3uE6T3rlKJBT+Yl3yDECADwvGSMGS0yQAcfd
         AOFWHGE/7DfMDbvQZSlNYmykkr/KRbWoz0qUeA0p29W7VYR4wW6hvAov/gCnnKOYCbdf
         TycgnZQ80N0WZJmn2xU9jGMCMWrQCuRekKdQF/zihw9vyUJclL5bL8EvAO5xBqQr5cs6
         pCR0Yz6iYUkbJS8uLCaXEN6XRYemlvnMYKxHGWwxYrEWBNJlz6ZHRk8qnF6/Vh4daCTg
         H0a/tU7sUDC/wE8OYGZ99rzfUBXyA3iCcjU8ttfhqQneeVsVyLHNt3m2ybkjsCM3aSNm
         QHFQ==
X-Gm-Message-State: AOJu0Yw1Gjjk13n/n+zrRIy074jhJ1zlLgyez24TqV/rJTXIa+6Tb2e7
	898EqbhKyEAJGxNBeRqa0Ng5zkpfEVg=
X-Google-Smtp-Source: AGHT+IFelLFC9Wmf5qutqU6BLAdo89LLEfLZ/g5BD1L7jnm3uHJOdp/XMSIfuCU4C7Ys/gtNcIqg5Q==
X-Received: by 2002:a50:a444:0:b0:54c:67c0:831f with SMTP id v4-20020a50a444000000b0054c67c0831fmr1682569edb.13.1701594329818;
        Sun, 03 Dec 2023 01:05:29 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id r23-20020a056402019700b0054b2040ea46sm3468888edv.61.2023.12.03.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 01:05:29 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	zboszormenyi@sicom.com,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] egalax_ts_serial: Fix potential buffer overflow
Date: Sun,  3 Dec 2023 10:05:20 +0100
Message-ID: <20231203090520.85855-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202311171716.uIQY5rT4-lkp@intel.com>
References: <202311171716.uIQY5rT4-lkp@intel.com>
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

