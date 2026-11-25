Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629989;
	b=zNfZ/bmQV7RKRKngF5ZsNVeV0SEopLTOlKS5GJhDWjx4vxvM/rNQjDp5WNDk+NTqhclA
	 puGyQHcOCHrdiuOK8DGjbsg/nxIZbkwxkMbfgJcXGAG0CS9s7GcCcrkuHGKKTQ8SRAHvO
	 cwBBjtPZPAPU3yXbwGOESIr3JNiCZLPSP91GTCJF+3TXD5TAK4zWeByQ/ZBqbjTgvmSE9
	 54rTsfvg0KeIVbTm7U9YFr8uhJ8QUYXqtmVpOU1QM/b9gKZGj0WwdVagfIZmsy+wRU0qH
	 +yUZE/yhgwijwF+gAxJEpvKpiBRYp3607IrVxlHf59reDANaKLLdnUyhjiShP+jH00w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=;
	b=R4jlEKuIfWhI0b6Y4qgFAT2TKoyGn4DgUIbs3pC3xUUllcorUCkxKV9xSf5jjPBPnEwR
	 t/xrMemSHiCu5owq7nwYVH0TcUULXtfGcbkkJjV+Hw5nwsMAkrIgeh2wK6sdDEvWqb+9L
	 Qdq88XsIXfDfIteSckX5v2/hy4QZWfBBxKKolFUmM6yFh5h5WpeEQCkJRv3YRef0GG3v0
	 SMqpHDuGOqH0KrRKONwnspDtLdItpcAitPT+ngFQ2NWUxCyzOhU9TLWnyoE6U83GVLdTm
	 0nZErRINwcrKuJ6xF3CCNz3dJ1zCPye47XQC5AO2ThByFmQnJbszlQILZBxg7ryanxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zyta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XSdEU57w;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5644606A32E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 18:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5644606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zyta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XSdEU57w
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c429d9d05f0so563354466b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 10:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629987; x=1796234787; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=;
        b=XSdEU57wAIWKPTsskYlvkHSbsybVqOnuQ2MX51OTc47QGqU06JocFbLES+E75mCE9d
         iJflSvqWrVyqxMrG50QugdVLw+R1cNIWFjFQHMAxULRvdLhUWGToWDLQXVrWwVAGz5We
         hCjnXXMTbV3QXJpKmpZfUxYeD7GIfDGMuijkOwAP126NNN4L1esGv3rFekSJoSh9QpDy
         c6QemAUXdYcXJpefHw13E5mnyTf0N+1YtHyH6ENRJOxCv2NV8YWcwgXPCPl1EZWaKiUb
         qFJjSSG7K+y5cGEiGP/8wbrP7h9FNCmZHzQG44+MHQFjcR7lLz2RWrtaitMqf3S9NPRC
         ff3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629987; x=1796234787;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=;
        b=ce9OdVv0ezBHEV5JiNVkR7dkQWsvxRWaKnxybKA1cn0vbkdxskkYnyhE8x0bbKvcY6
         m9RfYLGiQmX7KgMIcgw+jvZ7pyu/nGCUeTLaOJgbFoV1+WTb4IATxEYRl4P54/DgEMRw
         LNe+FO49VeHK5Vb4jAlNEKsGHBhWWALARnCswG1SufLUUUOHDPkC1pPPRJiWUikeZMzV
         HdQLo2ozFcUCaU+HU7k5deZdKAbhwkg/HLf5Qe3sY2SRUG9WqjzJNGYwMjuzjrAN6Fsg
         Q2EGS+Akntp5BcJE59i6VXOZMg2Z0XXaXMnry1C53RdkJkQbzZu/M87QsIw4h14kwDea
         kCwQ==
X-Forwarded-Encrypted: i=1; AL+hErFXMkL2UhxZ9RRDGWAMjuTxUY9wA+kS8UixUIgpzGRYKJOOrGOrH6f93L/QYF6o0ljx9Lpx+ZDYPupxChOJ@lists.linux.dev
X-Gm-Message-State: APuU4Z8AxWI/DNejoJ4h1UFYMdzdBqKlbfs3RWRTERPH/ztenD8Js9y6
	6yobI/RqhOilfu4l8xnAIs/lcSrYOvFU9oZr7IUnsV170MZM80MrT0x+eb1/ljhP4QXdw9tjqw=
	=
X-Received: from ejc14-n2.prod.google.com ([2002:a05:6938:a00e:20b0:c50:6127:2777])
 (user=zyta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2da8:b0:c51:9abe:f3b4
 with SMTP id a640c23a62f3a-c519abef596mr491882666b.6.1795629986942; Wed, 25
 Nov 2026 10:06:26 -0800 (PST)
Date: Wed, 25 Nov 2026 18:06:20 +0000
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125180620.578175-1-zyta@google.com>
Subject: [PATCH] irqchip/mediatek: Add OF and HAS_IOMEM dependencies for MTK_IRQ
From: Zyta Szpak <zyta@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	oe-kbuild-all@lists.linux.dev, Zyta Szpak <zyta@google.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Enabling COMPILE_TEST for CONFIG_MTK_IRQ allows building irq-mtk-cirq.c
without CONFIG_OF enabled, which causes of_match_node() to expand to
NULL and triggers a W=1 compiler warning:

  drivers/irqchip/irq-mtk-cirq.c:292:34: warning: unused variable 'mtk_cirq_of_match' [-Wunused-const-variable]

Both irq-mtk-sysirq and irq-mtk-cirq are Device Tree-only MMIO drivers
using IRQCHIP_DECLARE() and of_iomap(), so building them without OF or
HAS_IOMEM serves no purpose and can fail on !HAS_IOMEM configurations.

Add explicit dependencies on OF and HAS_IOMEM to CONFIG_MTK_IRQ.

Fixes: 702ae15488ce ("irqchip/mediatek: Add Kconfig option for MediaTek SYSIRQ and CIRQ")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117144350.wOuBa9ZW-lkp@intel.com/
Signed-off-by: Zyta Szpak <zyta@google.com>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 90daedb7554a..9e6658289ae0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -795,6 +795,7 @@ config MST_IRQ
 
 config MTK_IRQ
 	bool "MediaTek Interrupt Controller"
+	depends on OF && HAS_IOMEM
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	default ARCH_MEDIATEK
 	select IRQ_DOMAIN

base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
-- 
2.56.1.839.g22a8290db9-goog

