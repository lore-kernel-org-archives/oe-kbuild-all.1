Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D516FC5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410169; cv=none; b=Ddb+nAKB8M6tGsntBxbAsgQhtDVcco1zR4c/DdbEOoPUHQSSg9KhNdWUR7k/NdqOwne9kaYkAnXAQ683S8ustDkQXieAygPJ3O+L+qV0zDhYjue14LetBsmWkYBN0zjJTmMM4M2HTBPABHEGGsonnOUarV6+/nCckL/Tdfz0BeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410169; c=relaxed/simple;
	bh=H0+geXmxWC0pdqoFC0O11lIndm4fk+WN8y7JXX9OLvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mkikmHCF3+99h9Soo5ZofaIZ1v8mV22ts+zOKmQxs3bJC7lrhY/T1uF6846vYutByPzxU+SheTQinSVFH4bqeBkClD6sFEnG+w0me5sT54iZW1bUZWAmxh0THCRYb1oJ41CNRRinC6bCy1/nD8YWj/Jg7U8PF2w3I4LRr6GMOJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbGBA42R; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbGBA42R"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-597de27b241so4157221e87.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 05:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766410166; x=1767014966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bu+q7q+c7ZMv4WCo6U9gSylXco4r4YFmmYOVsykIHI=;
        b=QbGBA42RTRlsxUmLMlvlZwloh06AZCmzfsGPoEbXkdYwcBb0nHKhi5BzGsEhBPT2rJ
         J8zrdp9bYgRP87DWdZIbDMUmZyIsTRtej5OIcNWSSNkrKYKSSmt18rGi9Z3pzTtaP44R
         XsR3aD3Tyv8Xq4/DOekiJsP3y2GzmUVjc/5Vy4a5MkOGr932dumBTtOFALvpHFpRUjdn
         42HnvD77xLXQXYNpz5eNHbGmgXYlXz/e0lutuDHfTbiPZQLAC8dI8dYvkFHEJtPZphi2
         szrhzKjrjGYtLMDk2sGEbScnbgTxbh0+n177Oa9KQVI+i0pF94KLsKaSXiKmaR/CL3Jy
         JMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410166; x=1767014966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bu+q7q+c7ZMv4WCo6U9gSylXco4r4YFmmYOVsykIHI=;
        b=VAL4gNk68QnR9vRQyrNOYIpGRmVEochrk+we31aIXWAQJCTSumsOc3km55DG6tEP1Z
         zG+Vzax+XOoldHFFEV6Ea3FS8QLuPwRbsVQICJwCdoUf1Q1KJDgJAM83D92EZtltPzHS
         eO3d+TTbzSQQgkY+FQFqfTNQWj2u+8Ql+BzdouBSRNt2ZfcWKJEfbPKqeHWaDwhY4huB
         SBzNUmnja9qKQ2kG3Ot9vxNE8effv72icvzoguIAIO1bFG0zlSz7/bhp+8/7o3R6L1IC
         1PG93/tONzP7g/yAq66uvIgMnAd66RgprZBF88Ft51uPZSsPcO1+3t0p39bWlLhGjjTF
         cKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3HAc3jmM9UbrX9xVKG7pWvgGlJwn0/ct90OtJPt7ARkB2q6cvqnkQUAGQZ5iVkWR2PhD0ForQjkGp+7cz@lists.linux.dev
X-Gm-Message-State: AOJu0YwnZhyNfQKVAfuLeh4KPXZ/sHUMNSUbtTt6NZuG7jf2CxVEHL1v
	D4GJEBfQGJwhyxhIIK97/NopPu2EV64xDkRFLx9RJ37oktQzsoGjyt+p
X-Gm-Gg: AY/fxX6P7UUejcpd3D6xk7pBzlmGC+JIkorXD5wmvvAe5/lvj9ub9dP4Ix7xu99Sqyy
	YaHbK0l1sgAzRyh0GGRoaKhkaZw5tz9e08ZWQZ5OVsOUDkuGQOqE4UWryslhAU8LiIllrdCpVp4
	Kr9hfXtaK60DY3E0b1U/PtEt6rwW6efOUD8/qowQyO97exRwSF4bQydcM03R5KAFMOPJBD7B5Fn
	TjskmzpG00WEuxcM31ypZlftfQIiigRrbWfjoljHUiTC8F3VvFs44JOCo85gZrFi4mqOLfqCevZ
	sYqsAr9OUM+Av7fPsZAR/bhmoI0DIgyCRwIzF+vuJN9wD2VYf1LSNk26OxcIrwb1R2gV0uWZER6
	N1gRekuuR/8HLHpcRpGgofrAK1PdXVG5rTgO1+FBmbEgmBmbEeh5qoLPtBjkIHsoWFFtP4qQ4Ht
	E54p4WiPwgxozUYJvIClg=
X-Google-Smtp-Source: AGHT+IH63RpdYYwoMjKCYAxkTQ9fQ3MQI35TnXh4BzsSjju2bA83f1Sz9Kpp4sNdNES4sshdy0U86w==
X-Received: by 2002:a05:6512:2241:b0:59a:1087:f0e8 with SMTP id 2adb3069b0e04-59a17d22532mr4127732e87.21.1766410166081;
        Mon, 22 Dec 2025 05:29:26 -0800 (PST)
Received: from localhost ([212.74.230.163])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-59a18628388sm3197270e87.99.2025.12.22.05.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:29:25 -0800 (PST)
From: Roman Shlyakhov <roman.shlyakhov.rs@gmail.com>
To: helgaas@kernel.org
Cc: linux-pci@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pci: pci-stub fix kernel-doc warnings
Date: Mon, 22 Dec 2025 16:28:54 +0300
Message-ID: <20251222132854.112890-1-roman.shlyakhov.rs@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc warnings reported by kernel test robot:

Warning: drivers/pci/pci-stub.c:55 This comment starts with '/**',
	but isn't a kernel-doc comment.
Warning: drivers/pci/pci-stub.c:122 This comment starts with '/**',
	but isn't a kernel-doc comment.
Warning: drivers/pci/pci-stub.c:148 This comment starts with '/**',
	but isn't a kernel-doc comment.
Warning: drivers/pci/pci-stub.c:207 This comment starts with '/**',
	but isn't a kernel-doc comment.
Warning: drivers/pci/pci-stub.c:222 This comment starts with '/**',
	but isn't a kernel-doc comment.

Convert incorrect /** comments to proper kernel-doc format or
regular /* comments as required by Documentation/doc-guide/kernel-doc.rst.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512202126.F1IQYL9V-lkp@intel.com/
Signed-off-by: Roman Shlyakhov <roman.shlyakhov.rs@gmail.com>
---
 drivers/pci/pci-stub.c | 58 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pci-stub.c b/drivers/pci/pci-stub.c
index 3ca5e11c3939..fdeed328080e 100644
--- a/drivers/pci/pci-stub.c
+++ b/drivers/pci/pci-stub.c
@@ -27,6 +27,14 @@
 
 static char ids[1024] __initdata;
 
+/**
+ * struct pci_stub_busid - represents a PCI BUSID for stub driver binding
+ * @domain: PCI domain (if domain_specified is true)
+ * @bus: PCI bus number
+ * @device: PCI device/slot number
+ * @function: PCI function number
+ * @domain_specified: true if domain was explicitly specified in BUSID
+ */
 struct pci_stub_busid {
 	unsigned int domain;
 	unsigned int bus;
@@ -52,8 +60,11 @@ MODULE_PARM_DESC(ids, "Initial PCI IDs to add to the stub driver, format is "
 		"\"vendor:device[:subvendor[:subdevice[:class[:class_mask]]]]\""
 		" and multiple comma separated entries can be specified");
 
-/**
- * Checking if the PCI device matches the BUSID list.
+/*
+ * pci_stub_find_busid - Check if the PCI device matches the BUSID list
+ * @dev: PCI device to check
+ *
+ * Return: pointer to matching pci_stub_busid if found, NULL otherwise
  */
 static struct pci_stub_busid *pci_stub_find_busid(struct pci_dev *dev)
 {
@@ -81,6 +92,13 @@ static struct pci_stub_busid *pci_stub_find_busid(struct pci_dev *dev)
 	return NULL;
 }
 
+/**
+ * pci_stub_probe - Probe function for pci-stub driver
+ * @dev: PCI device being probed
+ * @id: matching PCI device ID if any
+ *
+ * Return: 0 on successful claim, -ENODEV otherwise
+ */
 static int pci_stub_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	struct pci_stub_busid *busid = pci_stub_find_busid(dev);
@@ -120,7 +138,15 @@ static struct pci_driver stub_driver = {
 };
 
 /**
- * Parsing a single BUSID.
+ * pci_stub_parse_one_busid - Parse a single BUSID string
+ * @str: BUSID string to parse
+ * @busid: pointer to pci_stub_busid structure to fill
+ *
+ * Formats accepted:
+ * - with domain: "DDDD:BB:DD.F"
+ * - without domain: "BB:DD.F"
+ *
+ * Return: 0 on success, -EINVAL on parse error
  */
 static int pci_stub_parse_one_busid(const char *str, struct pci_stub_busid *busid)
 {
@@ -145,8 +171,10 @@ static int pci_stub_parse_one_busid(const char *str, struct pci_stub_busid *busi
 	return 0;
 }
 
-/**
- * Parsing the "busid" kernel parameter.
+/*
+ * pci_stub_parse_busid_param - Parse the "busid" kernel parameter
+ *
+ * Parses comma-separated list of BUSIDs and registers them for binding.
  */
 static void __init pci_stub_parse_busid_param(void)
 {
@@ -205,7 +233,11 @@ static void __init pci_stub_parse_busid_param(void)
 }
 
 /**
- * early_param "pci_stub_busid" handler for the built-in module.
+ * pci_stub_early_param - early_param handler for "pci_stub_busid"
+ * @str: BUSID list parameter value
+ *
+ * This function is called during early boot to parse BUSID list.
+ * Return: 0 on success
  */
 static int __init pci_stub_early_param(char *str)
 {
@@ -219,8 +251,11 @@ static int __init pci_stub_early_param(char *str)
 
 early_param("pci_stub_busid", pci_stub_early_param);
 
-/**
- * Binding devices by BUSID via dynamic IDs.
+/*
+ * pci_stub_bind_free_devices - Bind devices by BUSID via dynamic IDs
+ *
+ * Attempts to bind all PCI devices matching registered BUSIDs to pci-stub
+ * driver using dynamic IDs.
  */
 static void __init pci_stub_bind_free_devices(void)
 {
@@ -285,8 +320,11 @@ static void __init pci_stub_bind_free_devices(void)
 	pr_info("pci-stub: bound %d device(s), skipped %d\n", bound, skipped);
 }
 
-/**
- * Checking the final binding state.
+/*
+ * pci_stub_verify_bindings - Check the final binding state
+ *
+ * Verifies which devices from BUSID list are bound to pci-stub,
+ * bound to other drivers, or not bound at all.
  */
 static void __init pci_stub_verify_bindings(void)
 {
-- 
2.51.2

