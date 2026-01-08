Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F023ACA5A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868351; cv=none; b=mBgrUuD+VRFbyRfGAELl907o1JDiJIvs64Xjs08qsL/qHKofdFWs+HjxQEqybCcGXrzfFYVU3XjVSfvrvcHhmB2NoX3t+nOPhu6jnOk2TAfVGR3X8hF6ozaezSH4VW5bmm/WlTK0o4jF/5Dj8H64I6wcYk3OMwVJ/w0buMvI2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868351; c=relaxed/simple;
	bh=FgvNRjyVuB56J6pgRUwXe+fBJ4b8dq+SZ91KABRDXxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dd1GKdDP4KCnDdEL06qB3JfMz6PwWDn329Qhdl+H02sheCmihEGICSGzqBtW/vVGbToRzHY+y0eAZf7CWiV4mZr95bfK4oOrdMtN3OptRkNK4+T8Q70O5f4XijFFlZVktPmwhqTE6ALNVQNKE4roQ6h9VGeIkHeBVwXtRRXS9tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhRQIQ7b; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhRQIQ7b"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso14199805e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 Jan 2026 02:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767868342; x=1768473142; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rP1SzOzXmRlDn6/Q1ZH2RIeUyWZyRi5yjsuMgj/3+UE=;
        b=FhRQIQ7bevrgfUCovNaPOM5esVoIIrnnhotk8xiKl3dJtSiLTXmugRmX0E/KVd8XSe
         RHcUufyIwUbhwvlvvPtKQeTAdnFvL+KlduACfFCnj053Hgmy74WHABLdHFhK6JaPeWFT
         YvfelMS/SNJTlc0WEf1UI+SZlOYaBTQZ3qknfGpso/IV9I0XAM3Wfv8347zJQCIwdymB
         hMYeGiswyqICJwaq7zV4mO2tu7msQBZGnmslxNjQZDrH+SgkKQpqIqSumEOKwInv6eGH
         9XkDUY8mfcS/5wEX5lTpW2NtBX3saqihGJX3wcZ/QUgs8GPUduTZOhxOHA8K5spU0SFJ
         xvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868342; x=1768473142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP1SzOzXmRlDn6/Q1ZH2RIeUyWZyRi5yjsuMgj/3+UE=;
        b=s6AFJvLYjDCFXA/bgWARPXF2bVTkDX3Ho7M5GPvdQCZIrPnmHZevEuEVfA2agf2BuM
         1a0mUQ07w5Y+G6T4GVazUU8EIvyRy5PiDR5+Gu16Amv2OdeKyNLC9vhM5uHcjP0m7GSA
         szTnY4jCD7RYT8xvTQgjId3vTpuHnrbfX4THlo3D1KhdS35e1UOfl+b272oeIrVUqMuS
         gxMWef39wIWX7OZzLFdOoVgMGnGn1PUxxFQnhh/DWAqdKyzSOOuzhQ1/VoQbTdAAg+jp
         rO3QzGQYR36yZeXIvT1EOBl6bkOcMplTtaDX00LehwHlalz4h4O6X1zqrH1xCuhJ2RE/
         J3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVFertwKK+4sD9oIc4JBOIzMxWMGJmnRAhgwDeqPjYeUKem1pWbFAgKdtJw4l8cdtJCS70cPu+bN1c6G/8b@lists.linux.dev
X-Gm-Message-State: AOJu0YyrTgn4MqM8tWxfiDaA5AwLMAS9UYnzix2TKKzvz7vlrPgWVCs9
	T7Q5AA9mrf1QT3tedpBZEWBTvy3VcfbZROfbwRWFIidsUI9j9eD+XmLg
X-Gm-Gg: AY/fxX7AnfAUY7jcLXLGV1Vb55RSCi2PaRrGgMWs1EtO9SGP6M/x6fOahaJn4FEXMTN
	703RpsO1vvsZcgK5Fjs6fWBDYZKQyCXNN+AKgVEBhlu9RgNReS6mGPTEsrXEFSAsORyQtoyR+hA
	bKhDNMnRKQE58ooHC0DZ6spUFD8Wd4lJVXmZZPklt9LSn8y4jrkjJcMIi2tVgmmOuEeIG014wNq
	Cz3TFl6Hwus7yHKkxXOG5MIKl7kiMNqQK+Apxl13EmUpAmIB7+ZkiCNOSmWmr4vp1uN4qoCP9+P
	M6IW9sFtV+lKtJLJH3+FEi1h7pYCQ6aDftE/SSLXoxHNzRTn3E8uGQf0zW58x6HITI2pIN2HjBK
	Gjq0EpHLIOn0kTopCuCtYocgUUJIC/fbw3HxB5n6bapJ2ouEiK/4x1ak7Fgpk1F+yIg9u519Hxj
	agE5BgwuUa6hU0UtUa6JAVNMwFo3HIhnNyF9LME5gG6+GlCp+wuzjLbDRChjB+
X-Google-Smtp-Source: AGHT+IGzA3CZT+tOLIoX8w5+N8ACAzd7YGSsrDlE3t4nrLQ0z46KjkqDJEh1BxP7XbkoRcgOnO08pg==
X-Received: by 2002:a05:600c:3114:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47d84b32f3fmr72073135e9.21.1767868342290;
        Thu, 08 Jan 2026 02:32:22 -0800 (PST)
Received: from navid-Latitude-E6430.homestation.setup ([2.190.126.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f620ac8sm140832615e9.0.2026.01.08.02.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:32:22 -0800 (PST)
From: Navid-Derakhshandeh <navid.derakhshandeh1@gmail.com>
To: mporter@kernel.crashing.org
Cc: alex.bou9@gmail.com,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Navid-Derakhshandeh <navid.derakhshandeh1@gmail.com>
Subject: [PATCH] mailbox: rio : implement discovery for all
Date: Thu,  8 Jan 2026 14:02:12 +0330
Message-ID: <20260108103213.15584-1-navid.derakhshandeh1@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Navid-Derakhshandeh <navid.derakhshandeh1@gmail.com>

Implement rio discovery for all
---
 drivers/rapidio/rio.c | 58 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 333d783af6d4..0b11e8ba3126 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -23,6 +23,8 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
+
 
 #include "rio.h"
 
@@ -1062,6 +1064,62 @@ rio_get_input_status(struct rio_dev *rdev, int pnum, u32 *lnkresp)
 
 	return -EIO;
 }
+/**
+ * rio_restart_discovery_all - Restart discovery on all RapidIO networks
+ *
+ * Iterates through all registered RapidIO networks and restarts topology
+ * discovery process from each network's host port. Intended to be used
+ * after a system-wide error or configuration change.
+ */
+void rio_restart_discovery_all(void)
+{
+	struct rio_net *net;
+
+	spin_lock(&rio_global_list_lock);
+	list_for_each_entry(net, &rio_nets, node) {
+		if (net->hport)
+			rio_scan_mport(net->hport);
+	}
+	spin_unlock(&rio_global_list_lock);
+}
+EXPORT_SYMBOL_GPL(rio_restart_discovery_all);
+/**
+ * rio_maybe_restart_discovery - Restart discovery if device requires rediscovery
+ * @rdev: Pointer to RIO device control structure
+ *
+ * If the given device is associated with a RapidIO network,
+ * attempts to restart topology discovery from the network's host port.
+ * Intended to be called if an error condition is detected that may
+ * require rediscovery to restore normal operation.
+ */
+static void rio_maybe_restart_discovery(struct rio_dev *rdev)
+{
+	struct rio_net *net;
+
+	if (!rdev || !rdev->net)
+		return;
+
+	net = rdev->net;
+
+	/* Only restart if there is a valid host port */
+	if (net->hport) {
+		msleep(100); /* Brief delay for safety */
+		pr_info("RIO: Discovery restart triggered for device %s (net '%s')\n",
+			dev_name(&rdev->dev), dev_name(&net->dev));
+		rio_scan_mport(net->hport);
+	}
+}
+
+static void rio_restart_discovery(struct rio_net *net)
+{
+	if (net && net->hport) {
+		/* Delay briefly to avoid hammering after repeated errors */
+		msleep(100);
+		pr_info("RIO: Restarting discovery process on network '%s'\n", dev_name(&net->dev));
+		rio_scan_mport(net->hport);
+	}
+}
+
 
 /**
  * rio_clr_err_stopped - Clears port Error-stopped states.
-- 
2.51.0

