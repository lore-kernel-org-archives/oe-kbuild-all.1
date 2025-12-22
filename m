Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC42221546
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416958; cv=none; b=lxPJI4hV7WsokjxAvcq72tQjvcrgMH3rowLBtVSeIk80Qm/T2HuVWk6qSDaSHLOcrKkpVanyUk/lp4Jph31WJOguB/THiuDMF8pmyo1o0quekP3NfSvA1GNw7lazWr64uSKwKAPOtbmyPtrsHh7XnWSwAIcvpLdAxLklTjXShdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416958; c=relaxed/simple;
	bh=HsxbZQZnwuZeAr2+96HH4k3lDaA9jbSRP99qn2OdBdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sx9KEPcMxpJfnMD2WSbD7JjnABNQ7mT11aEuzaMSIsKd+U0PY1kemf8tC2Bf/m+PSamXKSDfEaJzQ4coeUHdxLWxXTMHZrhv6OCT/8+z1mqQGKAyhlhJxhQ7XAXGsn67wAf1VfZAyohJpbDZOjZBhcJqBVTtIxWSW5BKV+Ma/9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQvTdbQh; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQvTdbQh"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37d96f97206so30390071fa.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766416954; x=1767021754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQt+6XdLPVlPnhWsvM9AhV5Lpr9kGJNclP63CUU09SE=;
        b=DQvTdbQhaitqDl9t3xV1LnfxA/XJyBo5/H/qmsbLzyNF1jwiGt9oUbpEWWbbH4lxq4
         RTogNMMQhotCSajYgtO7hhozdnICbIZGzg6kYYwC6hep4QW15nGvlpB/w0watBN6I6IA
         GX4D4vhx9vcMgWGXiNgcnE26pbDFOhqsHJFoSQIFN14SQ5n9eebfK61lgunruptHA9vm
         IGxZK0uO0USVxGBc9Y9qbPGuVezsVd+1GZe8cFnwCgu3IUXolwhvK7P8snaBDlsmd7GB
         hMkXpoJnRQPui1NsDv+X87j7e9gNSfVWnmiH5XftSruUflBbZxKmqepawtNDJMEpaOZW
         Jy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416954; x=1767021754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KQt+6XdLPVlPnhWsvM9AhV5Lpr9kGJNclP63CUU09SE=;
        b=qhcbgM+iWfkVVvqb45gknoP6YojjCUOOXq0Gi5jEwRsrp6M+jXk4JIKod2KfEtxOl9
         S7WfgL5kRTl+fz/x+lQlWomcOoqcfmDUoBsSemH9l0MuVF9EFfGoEyoZFH8MBERcDURg
         GowF4g0iPt3TYUfhHZq7rIExErd0H0+7VKNfNLSyqa2NWBcOYKAnJQlns4iekkmtzvE/
         9DP6FiI1qJyAGTKij225OuyVKUEL3kbXy37Ug7keLqAgNTU48KpIw4yiS+KQsLAwjRQz
         Khd0k8e20nZm8AYN0UC8nkN3TbdmONWRrtnJeutmK8rRJBoEqHACMM/CY+mCcdiX/Arj
         lGzw==
X-Forwarded-Encrypted: i=1; AJvYcCXtAJNtpVBK10jl4CS/2zNwp46N+n7OUyMPolUgnDdPSw/n3XBsKlS2U766sZgk652ermPYtCUr/AoQX5Dt@lists.linux.dev
X-Gm-Message-State: AOJu0YzD0sNAY5W+rZUDBt52A/e8EVX/L+qoY+zA+0n5PrjL9BtV0Aq8
	+HZwsvzo8/miq4XTFP+wzZ2ViEsKRv0VlKKc1Dq3eWVCNmRkXTkkFidu
X-Gm-Gg: AY/fxX5mcG6pFmwdIMp5BsWo/fl2bk5ndsYi2VPqTsQHrVy2s4Utk03LvGn2PjWY+zV
	H6elnnsEkVqvDOjSR+eKoppqMoOXijwPzzUwoO8z1XzblEgs9D1wskKiS4DrRb2d+WgOgRDiufh
	yaIYI/ReKIw7RltrvOktyC2mvuNsrjjieWUqhzXj+8j9itlC0097Tfua8bJ1wOuxeVMBmxdJQng
	Jd3ZAG11vzZ1IwNg3wWdx0vdX47jd9twjHrUOV1E71ZB8ifJ1IdhbXm4ZPNfNdEg031o1Cs0ExR
	ELA68enhVKWs2RaCq/qgn+Tki/vB2vNrkdvuhXu3kJ/DJAabAwAK+gm6zYyLW8HaOoUkUXO++tB
	VueMaGIDTzH/RCPZ0Sjm4AUxg7z1CvmD/gHNNvwyf4J4+Xb0wyW9zu5a84qnFVGUwmFvhD63+95
	c7YnqJQhgoNn+3mplscAE=
X-Google-Smtp-Source: AGHT+IFCfae8Df8rr10mLfEIH+wdRXMrMLfXAtP/C5aW5l2QtNejpWMshnYc6zCzHy07vmfFYzpEBw==
X-Received: by 2002:a05:651c:542:b0:378:ea85:7f06 with SMTP id 38308e7fff4ca-3812169d974mr33165871fa.36.1766416954158;
        Mon, 22 Dec 2025 07:22:34 -0800 (PST)
Received: from localhost ([212.74.230.163])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-38122369d35sm26188351fa.0.2025.12.22.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:22:33 -0800 (PST)
From: Roman Shlyakhov <roman.shlyakhov.rs@gmail.com>
To: helgaas@kernel.org
Cc: linux-pci@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] pci: pci-stub fix kernel-doc warnings and early_param
Date: Mon, 22 Dec 2025 18:21:06 +0300
Message-ID: <20251222152106.116971-1-roman.shlyakhov.rs@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219131038.21052-1-roman.shlyakhov.rs@gmail.com>
References: <20251219131038.21052-1-roman.shlyakhov.rs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixed build error by moving early_param() to end of file.

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
Closes: https://lore.kernel.org/oe-kbuild-all/202512210236.u7vwB62h-lkp@intel.com/

Note: A separate "fix kernel-doc" patch was accidentally sent as a new thread.
	Please ignore it — all fixes are included here.

Signed-off-by: Roman Shlyakhov <roman.shlyakhov.rs@gmail.com>
---
 drivers/pci/pci-stub.c | 96 +++++++++++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 29 deletions(-)

diff --git a/drivers/pci/pci-stub.c b/drivers/pci/pci-stub.c
index 3ca5e11c3939..d1f5abd29f62 100644
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
@@ -204,29 +232,18 @@ static void __init pci_stub_parse_busid_param(void)
 	}
 }
 
-/**
- * early_param "pci_stub_busid" handler for the built-in module.
- */
-static int __init pci_stub_early_param(char *str)
-{
-	if (!str)
-		return 0;
-
-	pr_info("pci-stub: parsing early busid param: %s\n", str);
-	strscpy(busid_param, str, sizeof(busid_param));
-	return 0;
-}
-
-early_param("pci_stub_busid", pci_stub_early_param);
-
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
 	struct pci_dev *pdev = NULL;
 	int bound = 0;
 	int skipped = 0;
+	int rc;
 
 	if (!num_stub_busids)
 		return;
@@ -253,7 +270,7 @@ static void __init pci_stub_bind_free_devices(void)
 		}
 
 		/* Adding a dynamic ID for this specific device */
-		int rc = pci_add_dynid(&stub_driver, pdev->vendor, pdev->device,
+		rc = pci_add_dynid(&stub_driver, pdev->vendor, pdev->device,
 				       PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0);
 		if (rc) {
 			pr_warn("pci-stub: failed to add dynamic ID for %s: %d\n",
@@ -272,21 +289,24 @@ static void __init pci_stub_bind_free_devices(void)
 		}
 
 		/* Force bind if not yet bound */
-		int ret = device_driver_attach(&stub_driver.driver, &pdev->dev);
+		rc = device_driver_attach(&stub_driver.driver, &pdev->dev);
 
-		if (ret < 0) {
-			pr_warn("pci-stub: error binding %s: %d\n", pci_name(pdev), ret);
+		if (rc < 0) {
+			pr_warn("pci-stub: error binding %s: %d\n", pci_name(pdev), rc);
 		} else {
 			pr_info("pci-stub: successfully bound %s\n", pci_name(pdev));
 			bound++;
 		}
 	}
 
-	pr_info("pci-stub: bound %d device(s), skipped %d\n", bound, skipped);
+	pr_debug("pci-stub: bound %d device(s), skipped %d\n", bound, skipped);
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
@@ -391,6 +411,24 @@ static void __exit pci_stub_exit(void)
 	pci_unregister_driver(&stub_driver);
 }
 
+/**
+ * pci_stub_early_param - early_param handler for "pci_stub_busid"
+ * @str: BUSID list parameter value
+ *
+ * This function is called during early boot to parse BUSID list.
+ * Return: 0 on success
+ */
+static int __init pci_stub_early_param(char *str)
+{
+	if (!str)
+		return 0;
+
+	pr_info("pci-stub: parsing early busid param: %s\n", str);
+	strscpy(busid_param, str, sizeof(busid_param));
+	return 0;
+}
+early_param("pci_stub_busid", pci_stub_early_param);
+
 module_init(pci_stub_init);
 module_exit(pci_stub_exit);
 
-- 
2.51.2

