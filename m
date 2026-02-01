Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC01F3BA4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769960327; cv=none; b=JoasbunaDO2VPy3cPnb+1mGcEpXwm7c4dlA3ff3H8gY+LXuiSDpnUFZgvIyZ26FyCTq9mzDmzq4X2sNXBPPSHYjJgtWGtNA2HsDnrfrMSGGdZfrOMMiI10Q0OGTqlY7zRU+1I84LrXlRlyh82p4qx1J0agOQMImAc0JFFVO/Adk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769960327; c=relaxed/simple;
	bh=4LPQ6UbtWN2NumGj2TL6Y+Romf7f8qzoEY8MhkzvIWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ln93zmiqucBkmX+pmHgByfec8UUo1fM3Usz2kncJmvTcD0IepuGN9xvlRNZBCmhtm5K8jvJwmiMqRKJgcrkWb+KbDH++sOq9PoHCXS+R33jFoDQqdoEIk5d8hNGWtkLyPe2OPCq18ogywp4EQMNtPlw/JuBp/QkruxawTnKiT84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QG5/tPOZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=28oY1hzt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QG5/tPOZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="28oY1hzt"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769960317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsApQgzexeUXD8g/SVWKsr/huUcjaz8VGC9Ojmach7U=;
	b=QG5/tPOZt/VAuFchuklnwHJRkMJ4Ea18C6YNuwZYZ4r5wHv+ycLDOghIhTNI2XQEdzt3yX
	1k46cj2FpHqKv2uamroNOHTBF5J5bJADKM+w7lKigNsuqqwSyjIrBBiEvVcJCrxlKjpxdW
	NQJbY4lGzNRV0fcFhuTMNsOCLWbYBgeA69GoUT592V6vq9KgXEkQ+gyY7PwL5+QvGrtmwn
	m3iAX9RWN4WSw1gEs/qrRLDZeRC8PNIN5u207hF/AP32xhmHcg0Jrek/Fwupr/8EUMLBUw
	HMCmwrK11rrJ/47vWByTT8Zo5RP8sVijXmEfuI9f8giUaxaYsFMO6LQ1+W5iVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769960317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsApQgzexeUXD8g/SVWKsr/huUcjaz8VGC9Ojmach7U=;
	b=28oY1hztFxuFkU+qLD4erLoIijkYPmKJILTUdHD62j9QSVb+JAFQ311CHQ5dC0ds37hJo7
	LnmuadNETN74viCQ==
To: kernel test robot <lkp@intel.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/aspeed-scu-ic: Remove unused variable mask
In-Reply-To: <202602010957.9uuKqUkG-lkp@intel.com>
References: <202602010957.9uuKqUkG-lkp@intel.com>
Date: Sun, 01 Feb 2026 16:38:36 +0100
Message-ID: <874io0h3sz.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


The kernel test robot reports:

  drivers/irqchip/irq-aspeed-scu-ic.c:107:27: warning: variable 'mask' set but not used
     107 |         unsigned int sts, mask;

Remove the leftover.

Fixes: b2a0c13f8b4f ("irqchip/aspeed-scu-ic: Add support for AST2700 SCU interrupt controllers")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Closes: https://lore.kernel.org/oe-kbuild-all/202602010957.9uuKqUkG-lkp@intel.com/
---
Seems the aspeed people are too busy to care about their own code....
---
 drivers/irqchip/irq-aspeed-scu-ic.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -104,11 +104,10 @@ static void aspeed_scu_ic_irq_handler_sp
 	struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long bit, enabled, max, status;
-	unsigned int sts, mask;
+	unsigned int sts;
 
 	chained_irq_enter(chip, desc);
 
-	mask = scu_ic->irq_enable;
 	sts = readl(scu_ic->base + scu_ic->isr);
 	enabled = sts & scu_ic->irq_enable;
 	sts = readl(scu_ic->base + scu_ic->isr);

