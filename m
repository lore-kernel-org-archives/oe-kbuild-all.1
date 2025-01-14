Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9D31D5AA9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876644; cv=none; b=SRGORrD4jV5kngqHUK+rVmRHgF7oCUwJIQAAwpqAOzC20oL3MeHBqdxYHuTTi1/HQAhvWgAvsaE3mYk92LQLZtwm4WNMYyhuOBUf8dpcpyn/8MgWQCE8dVqfJzYq1lZzPupkfQv6FK2AML40dIpeBH48iHCDYRvQvGT7JpSq43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876644; c=relaxed/simple;
	bh=VRsSw5lqm+A9dvd4yXli3w5H6THOXg+8Xzy0GFLalRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIRx3ku9rOsrq0qydqPigw8bn2yRXyf5cKaQgEkF6jZs5mHH9M9vrrEJsSZl9glbUNJ6SWY0hUTerLtTLp0i2zXl5bdH7rsbZeUt4DIymkNME3sXbFfhjPJTvAR+pqOE8DwpMyt22oG5Z32WRktrl7QNBDKLRJha+ID2wklCNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uw+wGAVl; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uw+wGAVl"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85b9f2de38eso1479749241.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736876641; x=1737481441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGJ6OR6E9t/0+QtYxOhIJa/XcOL3XFsmtM8yDFw36Kk=;
        b=Uw+wGAVlwfof0E1AnO6F41fdOyuA2adYKcEs7iBuyMXXJ749yXhEAdrmivtdffVGkI
         whyK5V8C99N0Gw91O1l8GNXulHsHezBi5cYOqCJkQkNr7xxo2YE8VzbBAPAXNVbdBhho
         PP0go96PQXLiGRtleMSMIGC4uIVYy7yFbaDLorhnbxva96qZFL+wPlDKzvmEzWXklmnd
         RPgu4Tg8MKDYVpyZI9mw3z9O5Xm4ZTlYJAqTtMVpurbWvzPS/qB+bhM6+Ep2WYof7lf8
         T2zhf5o5SpOBHOzV1b4+U1y1y3WG568y166mP+xa1prNBwLsiWSXNI3xoCJPGRfWdb/l
         dzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876641; x=1737481441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGJ6OR6E9t/0+QtYxOhIJa/XcOL3XFsmtM8yDFw36Kk=;
        b=wErZ5bziR0Vrmehfg+QZLcTRNlOXCOKC8mRvux3gA9StPDovcHFcENQKzhLnrtsE8c
         JwHOyT9FZzaBCIfEH4vtr7QzE18fjIxyRxmv3DwVtra58W7YjiOys/EP2BWnuNKRe/PT
         hA/LFjjogm1uxOf5AI1BgoGuA8X05yWOwQNV4PsxeFLKLRr402KPU4O8Hz6nhH0L7y64
         nP9TN3W9I4dMASc84T2w7WWRwiKglT22kOtp6Kg1jpGoQgqOoURqPPnRBuuBALpuBmmC
         m5E3EXjEYsTjGadJOywbq7TikOpDRjYYDhmACXYMbIq+ngU4kSrY16GTNw2NW8H4hz+x
         vd6g==
X-Gm-Message-State: AOJu0YwOq1odKj9wcmf9FX4gh6LYuwK0sVnO4l6yuDjC24T6L2uDWXkB
	zHxYmsqWqaNJeN79VdaSIfucHkSWp3A0Z0jPT+ZNIa9/TMvSLSXx
X-Gm-Gg: ASbGncucUKFSSBgGFLM3ekSvIVtKMh1CBUG974Cffb36b5o7xsUPFuGAlEj8+tNpkWc
	TyAHXsxeL+/knkpEk7obJfs3u0ezx/ubEWdXtsnktOGNSpiIimvkZIzKhcL0yTWQeY/bJ2XfLBZ
	U0f9R1qKuQ4vQmKrUVR3+zIZ0TcLnkUJHRGD69eJqd+qyaY+iULYWLV7ui1rgRfGKbpDcsFduMf
	pOYX5U4ZZs2YPEOwYjDc8hoVks3ObblOwfLI62K669/Tu5/jzPzjxms/W12ZwY5
X-Google-Smtp-Source: AGHT+IHx7IKXFnnzxAss/GM8JxjJnt/RKirdD6RZCyVJiKco9rLYCqphQUdGFn4iKhOCISAdi/9uAQ==
X-Received: by 2002:a05:6102:b12:b0:4b2:5ca2:5b5a with SMTP id ada2fe7eead31-4b3d0f05be1mr22867102137.9.1736876641429;
        Tue, 14 Jan 2025 09:44:01 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f04e3esm4797329137.5.2025.01.14.09.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 09:44:00 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: alienware-wmi: Fix zone attribute declaration
Date: Tue, 14 Jan 2025 12:40:05 -0500
Message-ID: <20250114174004.143859-2-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Statically declare `zone*` attributes.

Fixes: 7c605f6460e8 ("platform/x86: alienware-wmi: Improve rgb-zones group creation")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501142200.ezULWY9P-lkp@intel.com/
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index b4b43f3e3fd9..d7f577e0d146 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -518,7 +518,7 @@ static ssize_t zone00_store(struct device *dev, struct device_attribute *attr,
 	return zone_store(dev, attr, buf, count, 0);
 }
 
-DEVICE_ATTR_RW(zone00);
+static DEVICE_ATTR_RW(zone00);
 
 static ssize_t zone01_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -532,7 +532,7 @@ static ssize_t zone01_store(struct device *dev, struct device_attribute *attr,
 	return zone_store(dev, attr, buf, count, 1);
 }
 
-DEVICE_ATTR_RW(zone01);
+static DEVICE_ATTR_RW(zone01);
 
 static ssize_t zone02_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -546,7 +546,7 @@ static ssize_t zone02_store(struct device *dev, struct device_attribute *attr,
 	return zone_store(dev, attr, buf, count, 2);
 }
 
-DEVICE_ATTR_RW(zone02);
+static DEVICE_ATTR_RW(zone02);
 
 static ssize_t zone03_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -560,7 +560,7 @@ static ssize_t zone03_store(struct device *dev, struct device_attribute *attr,
 	return zone_store(dev, attr, buf, count, 3);
 }
 
-DEVICE_ATTR_RW(zone03);
+static DEVICE_ATTR_RW(zone03);
 
 /*
  * Lighting control state device attribute (Global)

base-commit: 58126788aa7726c0e91de6b25e6e332fa06089ab
-- 
2.48.0

