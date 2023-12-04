Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF53A21
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDDdODb2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54cdef4c913so503016a12.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Dec 2023 22:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701672050; x=1702276850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDfeXHBgAfFsS3kz+9ALH+0KcxsECsx+6opLECVdRcU=;
        b=GDDdODb2i/KrX2iF54n0gtwOzn8AQW9S2nk5llNQ+/TurBWtpMhyxq/tvaPn3zo6kT
         rNlwPIS5WxTSg1PU83C6cf3ocqqQ9QermakewOb4gjZQNv9nepwK284hiQjOS+tydUzW
         1b2lU8JBOwSuXwG0pntgTUv2v9UmpFegAKUUzz5KtCFmWr/Px7+PS//icNtFqokdYokR
         J0ntK7WmkyHzd9ZtyOJQdLiazxINk/yMjCpS7nmhA4uLT1sO8c67VR8DwXkhpe2q+xQ5
         h6lR5YhTQFrXIy7P316IvHFzQ0V5pr/O+6J/7Tizr2GPPKYiy1lqOvc4hP/W3b0yaPro
         p+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701672050; x=1702276850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDfeXHBgAfFsS3kz+9ALH+0KcxsECsx+6opLECVdRcU=;
        b=uUW3yYeCowKdHfWfKddm5p5FXXhVxISliurTpm7dCnd51zn+kVLrstnTKMpIUeGaQF
         zZM/GRqHRwi08nzUuSFh/fBPgbRrYh72W9KwxLAXdQ4Lxk6qvUGgvS74YD62jWS86fEm
         2zlB2pEIwbEwU7xQokI7ly0xo9fJ1ejZ0j4CkjKlI2pLwIGufIyLDO63+TnbAdzDq1ng
         LxbJ1nk5Y3jkYvq69SoYr/FIt5AtP6DSVJ9hbWjugiMnE5IKaZer4aTvcO6cibjyaEWz
         4Ta/cyVve1KyESkHVFWrEmhz5ztqOAPIFGE0zJFxr+A7+3CEU26xUX3ttJJMHTrxH7Lp
         6I+Q==
X-Gm-Message-State: AOJu0Yzu+pJ1ZTTdWulwbcROOLbtdxAoQp5mr+k3HhFK6rD6q2SYEnFN
	Cnj3dkYZ9wO5+/Pl1ZgsnHQoFi7Vtgo=
X-Google-Smtp-Source: AGHT+IF4bB47Cu4bUc1C6sMsav97IbM6BVHB259v+ojEgBHNZx+1daFPbEu6TS3ZAfWM6UFJiyw/dQ==
X-Received: by 2002:aa7:da04:0:b0:54b:38f:7263 with SMTP id r4-20020aa7da04000000b0054b038f7263mr5237868eds.8.1701672050227;
        Sun, 03 Dec 2023 22:40:50 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id eh4-20020a0564020f8400b0054c9b0bd576sm1998754edb.26.2023.12.03.22.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 22:40:50 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	zboszormenyi@sicom.com,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] egalax_ts_serial: Fix potential buffer overflow
Date: Mon,  4 Dec 2023 07:40:47 +0100
Message-ID: <20231204064047.158514-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c825b030-1520-426e-a6ad-7df0c276b3ea@gmail.com>
References: <c825b030-1520-426e-a6ad-7df0c276b3ea@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Increase phys[] array size to 40 bytes to avoid
this warning:

  CC [M]  drivers/input/touchscreen/egalax_ts_serial.o
drivers/input/touchscreen/egalax_ts_serial.c: In function ‘egalax_connect’:
drivers/input/touchscreen/egalax_ts_serial.c:112:21: warning: ‘/input0’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
  112 |                  "%s/input0", serio->phys);
      |                     ^~~~~~~
drivers/input/touchscreen/egalax_ts_serial.c:111:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
  111 |         snprintf(egalax->phys, sizeof(egalax->phys),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  112 |                  "%s/input0", serio->phys);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~

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
index 375922d3a6d1..390b3a670bfa 100644
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
+	char phys[40];
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
2.43.0

