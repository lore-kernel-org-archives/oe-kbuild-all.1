Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59C1CD1E4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 02:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753670243; cv=none; b=ScKzEH1ipsOH8lJrmyvMJo8+sRKMViAz2iB95DYidjzzSv/bDZegTv/p0NYOOpKfF1k33KJFOBcw804UrGf7kRVu5CqD0OWYx77wg5a5DDgd3fGm7hP0Q+UmWag7mvDPe4h8SS7DxGmxUvys5CMstsbe27mXXB1G+MDJiz4IqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753670243; c=relaxed/simple;
	bh=iJEcfFsiWJ1V9+dLXeuoWVpKyPfbNwN8bvVTcoioenc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z4KUKIbnMFEqleIf+Ssy4HSv72UmHSZhYi7LjGNWlejH8uG33k5BFpS3Os5cJS5jsyJWYmx2puKHpEzoOGrGfuj7taPdv/R80JvYar8Op5Z7nqOn/neAHZXLZqu3ySlxYnsmVAHjlFxzB76FO3XyHMTT+vuQDc6cQKFr1u8LIGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=huaqian.li@siemens.com header.b=mfLvxMod; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=huaqian.li@siemens.com header.b="mfLvxMod"
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250728023719180582285f67f3a28c
        for <oe-kbuild-all@lists.linux.dev>;
        Mon, 28 Jul 2025 04:37:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oH4biYNRIXbUPcZJxbqF385p1W7crfHf3KjlM5z89+Q=;
 b=mfLvxModtgTFIsLNP9LcoUPyL42/cGGPk+RlJYIhGFbUWlFuiaJeifpgVakhZ/xip2r9yM
 +yVuY5xX7+JN9Q+yEJVMRV6RdWYCsfPCgg5EVNVf8SS66I9jNtrwEaBb2SF4BxSWz0IvJ7a4
 ZuyAkjNPpM3RwGt0K5xhMYzAkNMjkbCmjjd1BBQJ4Sr5sI6P4p2rnAwMQCMRp3HCsYcGSbEh
 Lo9Ju/gHQlYgjKq+UYfGyE2/KFkLPXzVnWPVrZrYD6dIu5MRESy/N7PQNlxOROlyxMsExkj7
 T1XKa638GXSPutWHwUYoA1FYevoZSeM3EnYiznskxqS+9tZYqz1ZZGwg==;
From: huaqian.li@siemens.com
To: lkp@intel.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	helgaas@kernel.org,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v12 1/7] dt-bindings: soc: ti: Add AM65 peripheral virtualization unit
Date: Mon, 28 Jul 2025 10:36:55 +0800
Message-Id: <20250728023701.116963-2-huaqian.li@siemens.com>
In-Reply-To: <20250728023701.116963-1-huaqian.li@siemens.com>
References: <20250728023701.116963-1-huaqian.li@siemens.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer

From: Jan Kiszka <jan.kiszka@siemens.com>

The PVU allows to define a limited set of mappings for incoming DMA
requests to the system memory. It is not a real IOMMU, thus hooked up
under the TI SoC bindings.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 .../bindings/soc/ti/ti,am654-pvu.yaml         | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml b/Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml
new file mode 100644
index 000000000000..e4a5fc47d674
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Siemens AG, 2024
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,am654-pvu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM654 Peripheral Virtualization Unit
+
+maintainers:
+  - Jan Kiszka <jan.kiszka@siemens.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,am654-pvu
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: tlbif
+
+  interrupts:
+    items:
+      - description: fault interrupt
+
+  interrupt-names:
+    items:
+      - const: pvu
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    iommu@30f80000 {
+        compatible = "ti,am654-pvu";
+        reg = <0x30f80000 0x1000>,
+              <0x36000000 0x100000>;
+        reg-names = "cfg", "tlbif";
+        interrupts-extended = <&intr_main_navss 390>;
+        interrupt-names = "pvu";
+    };
-- 
2.34.1

