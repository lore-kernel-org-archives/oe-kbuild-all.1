Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9C73478
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661511; cv=none; b=J9rWyJX7ilU8uyyG1IFa/SPbZzFQYl9AcrYjTPW1u84xgoENvNO/irFouT5hI3wdQgwZet8j8F49uPGYKlIKrw9SjE7U0J+WPuEfrlGlxuISK2pW5UQ9xIcqcQ7GTVAjgXi310LYPjYzuygDVVPzoK6qh5YkXjvPeYhrSVgeVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661511; c=relaxed/simple;
	bh=rZpXvGWUXTyOTyAFQsb2v5XOp9ux0J5EHi51JKfnKkQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CtcIF6XyfyKoDZv7wS8pbsyJi/hCEzoFIemIArgSrSJyc+nashurnbEuWcPpsrOmZ87Y/QirLJU1ZS419agfO8oFpDpCW/30yYg0VKxxblP9jAsf6Y5qifGEyICg/mA/LL9KCCwFbqg8gq68Tw57ACgDgaiVXlkWsHrPxHsC3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hZy95HMu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e3uBkDc8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hZy95HMu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e3uBkDc8"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724661508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEmj5PbJdK9d42cG8HmV+A5nhUn/gve2pcMX40E25cQ=;
	b=hZy95HMu5Yw1QjmMrM1hVa0HB/Twbnl0gRZqOjUEtXgNjSJaS45luP+LzPKY1e7o2c3Hvj
	6MOEyZF0dD3ADWn9mBDKwncdAdM69UkFmESaQsBemrg2FUF1VXur0cdKdk0+fsGrWbBO3E
	S9Y38spwCktNafideiuLYM13gz6PG+Ooc+Q6b65a0jurYIwdrtXTr3zx42fQIG8h1ubXyX
	lt7Vo1y8UhxNcwRup8fn9OiJWPP2X+L67XPtgH23En1V2KqwAyP+r81GT4LV0VBVU99cQB
	5oaacI3DeYz/3z372jMA61/eE1m9Dpt0O7GJh6MXYTKIlJ6QgGDXtiKIEzSSBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724661508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEmj5PbJdK9d42cG8HmV+A5nhUn/gve2pcMX40E25cQ=;
	b=e3uBkDc8Nv2pu4wieJiKDtUMf7zaLdDAlmqSd/74MEuYEhHjD2W49/TjjOn10NIWyueI02
	6JicRsSGxQMSY0AQ==
To: kernel test robot <lkp@intel.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [PATCH] x86/EISA: Remedy address space conflict
In-Reply-To: <202408261244.v2gfgSON-lkp@intel.com>
References: <202408261244.v2gfgSON-lkp@intel.com>
Date: Mon, 26 Aug 2024 10:38:27 +0200
Message-ID: <87zfozd6gs.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

0-day reported a new sparse warning:
 
  arch/x86/kernel/eisa.c:20:24: sparse:
	incorrect type in argument 1 (different address spaces)
        expected void const volatile [noderef] __iomem *addr
	got void *[assigned] p

Cure it by removing the readl() and dereferencing the pointer directly,
which is correct as it's a memory access.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 80a4da05642c ("x86/EISA: Use memremap() to probe for the EISA BIOS signature")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
Closes: https://lore.kernel.org/oe-kbuild-all/202408261244.v2gfgSON-lkp@intel.com/
---
 arch/x86/kernel/eisa.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/x86/kernel/eisa.c
+++ b/arch/x86/kernel/eisa.c
@@ -11,13 +11,13 @@
 
 static __init int eisa_bus_probe(void)
 {
-	void *p;
+	u32 *p;
 
 	if ((xen_pv_domain() && !xen_initial_domain()) || cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
 		return 0;
 
 	p = memremap(0x0FFFD9, 4, MEMREMAP_WB);
-	if (p && readl(p) == 'E' + ('I' << 8) + ('S' << 16) + ('A' << 24))
+	if (p && *p == 'E' + ('I' << 8) + ('S' << 16) + ('A' << 24))
 		EISA_bus = 1;
 	memunmap(p);
 	return 0;
