Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857438;
	b=oZjnQXGEmDXouwFmeffdKDHFLjMapZIByS7IJSk7m5Ay3OiVt9WSTvxJjTYnD4U5p1Ui
	 xOW1TyAdfUII1eOVjG1XeDhjCBMCn+h1ibLB3+JEteEIP8yM0R8c/Q9GFRMlw7Eki4Yd3
	 sBmpMwDoaiS9cc284PQtVOX/vHWWxs8c/pXM8e0CuqcgvJpx22eTduUG46FDW4rGHHRP2
	 y5uM/bIiKzWXx0WnSPN51xmsy6wDHUPi5h2mgXEO6I+9N6Cgpqw8kdORkrIOynQWHuz5S
	 nYnGpwG94DrtEBzvlKokC6oREXOj5PrPWudYq3Ck9TibLjBSSlIkyJuAKquMGAds9hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P1/U+LLYSBnHZE2/Wj5+ORpEBBjUBZy/2jqoHB0Th0A=;
	b=zryxkYSjuBOMUdbmeWWfMDXMWwtI0fWSOuj4nFLTF4waTZfMwt6cPPz/AbM9hU0dayaJ
	 5bsaiitZveL/xVSHTsAzYK6KIAaJC4RnTAmBYWcMtH2GQjzGeTx94+v28qB872TiR4ZMD
	 KxcjSIqIbs0DdT2kaSFMlXgkSfFZ9u7o1oS1Ek5sXgAobtpuViWkZnGahhHsZcghmmlUw
	 IyVSsr5ShjOQPjk8DHe9y0tqlAJXwff41EFoiqiwjcviy8b7LxRnZkAGcg5GNunld5Mdx
	 8oErjqwPp2HpZBLG06POCG3pXyX0scxfHY3hZPewiTP+LHYPcDwUiRHnGB9j7DKoD4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iizJR3DN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0576B606A330
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 19:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0576B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iizJR3DN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so23380355e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 11:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794857436; x=1795462236; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1/U+LLYSBnHZE2/Wj5+ORpEBBjUBZy/2jqoHB0Th0A=;
        b=iizJR3DNeYXZrKvv/qyMAPKVeNCYfGgL0AVYZADAyQA1anvnfgJOCq07VMdq47DMTQ
         bt82Me9HieVLGnatEr7p/+svGbE0f9rytgLK0kHX2U/KA9AKE93YIIRRwDA1frwWV8Bd
         z44u0AsXyQMkI+vP5lUZ77kZRTg2j++PPgLw6okCEcsXhEW7Aogp+333p5VqzJfphPdK
         utP4B4qk813DV3IqGqpxB7gKmZOj6AEGoiw8h1ZBmSLxuNPcVOAbGKvKPN+62455w96r
         BsLUZXzBF7fw9slFy2cq2BeuCHD8+ydXHVqJbthUO0pxaUaBe/CQLu1E6t9LvM7C+2v/
         aCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857436; x=1795462236;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1/U+LLYSBnHZE2/Wj5+ORpEBBjUBZy/2jqoHB0Th0A=;
        b=HuEf5sklntQUtHizTzMgTvhCYsvmPAQ3aev6gDMuK6UXJ/SLEBmwJSnTORqBbky5J5
         /y9usjkxinpBUOOfb9pOP+BqI9Yt2hXTNzW6VaTif1UQxLLT9aMz5nSGstwYJBzH1/jV
         tRLgAXdyLfDICSqmM1USpZ7EQHdRurOZuY+MA3OJrsazQ4SXhX3mWuZkyYB7RKxWom7C
         vh/VRfiJ3yfBp2ZfcyYvxH1x3CmjOEsxLybsP/WgDNhv3S4rDP/rNNEuGGDq2m/8bMzx
         oa77cY3DrvURuFKwj4lh2+IPu7Nyk9gw9YpAEOCfhc/fUsdnKQ5SxnuajhGmDxSHRcbx
         4pxQ==
X-Gm-Message-State: APuU4Z/qGDbv/Nqby1AijeFSG/+NqsTttJ+q9dlw5QJLlj7IxjQi2Jni
	0ZUAojtxKHW56nLoJn2PnUroDyx1zPaQ1sP4b7O9A7GhZWd8KAkDc4Vh
X-Gm-Gg: AYBFou1+kh3iwVHuj4fXkwZt/skCN6ACl8C5WEDoaHjykirx0fwB8BsMHqRsZQsboED
	kV+IV+n0rAgoHWqVyRtWXIFITKl1a4+Vi7E21sCL7aapi8XIlTnJznS9fX406NYTeQfHB7EElWf
	9vri3VCyGibtz3GwXXHh+j0cD8JvPHQO58qHU1EiDW7H1P+yV0a989NwO3IJw+GK3i+HiMRYb2u
	/P7MSBJplbSOr7cqt9uOV7vHeAtnfsoNWGU/+KNy+tY2WJ4ih3VAPHNE7rCOEOtIW2vGS/jHiTH
	KpYse5cjLMUJaiO8GPAHXBcSxFE5m8UKtRmhhTytBYyAdFCeRbt2fyjNSVe/FS7wiK8fY4WaIIO
	ehqWgnTibmPHaviKpLUKiVriHt/w8nDIaj9xcR9S0OMP5U49DITNEW2z1K1ZHyAIrXXY6vgN2kA
	rZixr4D/CUbCoB6nGHCh7XblUAlywamcbVEiTDLtQO6KcBA/nIq6faX2x2dN1TF5RfHqxpVzHEZ
	NCFI0E6CIxy6/7igZRk4K7ho3rQY9EtLcI/I6FcGJu5EdyeD29cQcGo/Su9m4SJZgmLcOun8Iyi
	pcOWEutCjnpKb5LzEWbrAZ08du/Ckz2U4+ti0otF8BdONc2RXxE9RikpwbxgKk9CfHc4mgld05y
	j
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr261818815e9.30.1794857436281;
        Mon, 16 Nov 2026 11:30:36 -0800 (PST)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784e9073sm8667475e9.6.2026.11.16.11.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:35 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sander Speetjens <sander.speetjens@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 6/6] firmware: raspberrypi: Fix inconsistent indenting
Date: Mon, 16 Nov 2026 20:30:21 +0100
Message-ID: <20261116-fix-raspberrypi-firmware-v4-6-33c0797d20fa@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The three lines that store the newly registered platform devices
had an extra leading space compared to the surrounding code.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611160006.Lgyh7ZuO-lkp@intel.com/
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 7d8b89aeaf02..4fc7d9309135 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -218,7 +218,7 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 	if (IS_ERR(pdev))
 		return;
 
-	 fw->hwmon_dev = pdev;
+	fw->hwmon_dev = pdev;
 }
 
 static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
@@ -244,7 +244,7 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 	if (IS_ERR(pdev))
 		return;
 
-	 fw->clk_dev = pdev;
+	fw->clk_dev = pdev;
 }
 
 static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
@@ -264,7 +264,7 @@ static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 	if (IS_ERR(pdev))
 		return;
 
-	 fw->rtc_dev = pdev;
+	fw->rtc_dev = pdev;
 }
 
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)

-- 
2.56.1
