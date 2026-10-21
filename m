Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792569472;
	b=SNUSWfYHDhyw9D0wcd8GXvmBHgUPfIN4vTYf2Nj4AQIDd+gB5Vf/29prjofhSuZLgikr
	 VCMHkh5Y2g3H5wxM6M0+rmtrwS78x6nRvFLiTCxBlOT/MGep35CJpD5y52TrEAL5/vYun
	 LSZcfxnUlvV1iGUOYArzh7DL5+lbUOSCguCqDcvAdg9phcBc0oO1GvPOkg9sZNaFUQ7EX
	 ACAnD83AYQqm8xc2FIoTj084gC1Qp1KTbzbcReu4A1s3ynvupWl8FF3yiI4K6Ao15Z21Y
	 ybRcweTBFHHbmcOmuS8WufxHn15fJ/aoFl6tn0q6Sbr8mFjBIKkZH2/9v+Upc/C1V6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
	b=0oeJ09j0yk9rmOxmo9YoXNrJHAyT7RlP7LQbT7ltm7Oht6Dzno99TUnKu2NJW6L8rTLH
	 k8kPhDG7yG0kqOWIRdUGVQ8yo1l9YOjc89W0ZiBhdpTDD9cbzwQCiV08ako8nEu6wjqNh
	 2/RwuivnZRmeybQNqUEtrSQIYJ9J4zVuPhYSd8KyqvGoN8wJLlPaROr/rI16hU0k5aYtF
	 T5xP6u97yiEqPOD+XSm8c6RmOeOFYIorDj5eM4+c4KKZQnM4jlxoK6xwWge7HZaJNc9Ta
	 izqPn3MNXxmrhxWD1hTO4cQ9D2YtZbWIQ4rRjzBHnkaAkSfTDE1bXOmu004cx1XsLuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starlabs.systems;
	spf=pass smtp.mailfrom=starlabs.systems;
	dkim=pass header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=T9W33iiJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B66606A329
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 07:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B66606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=T9W33iiJ
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-676804a3a22so364570d50.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 00:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569470; cv=none;
        d=google.com; s=arc-20260327;
        b=JXm6g0XzX4QNMyqYqYFvFMZ5Ci1Z7KJjWxDO5a/L4nmiCFF17yoQtJc95+OP4aD6Ua
         ZiOvT+e6MY9QF6XHyAGp+I5aflLteAXB19OdtmHPBr0ycqjEnh+z4w1tNEukNcikla+u
         clEHubyMuPIGjQHS9O5N32U+UoPLv5MJ1+V2QKLI/UZZG3PVjePo2P5C1UpvXXwjSqhI
         D8ZsuqJWVo6hnHmoaSDA9KKHbscZTs8gFicxQXWhgTGthkkaI9aZExICIyzdgrzovifT
         NPpMCyY7iccmm3iv44YWSbG8VpHI64Oz01ThcQhAf1olPjAce5z6DgPUbula3Fne5UEf
         v7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        fh=KZbl8Bhno2scRwK/oIOCTHy8IL0qWu/gtAUYkrY4040=;
        b=WjoT4YczTksWaTyuuaosUQEBKGlH2Lvio+04WiHB1peY/de7fAHz5lopovgiYdGRVY
         rlIrPh3EK/EwiqpmZQReE7THpLaGjxgTO+OrCJFe0ih7ZGwLy8baGnr+m0sUbEyOrkoH
         9ZI1/PrYSImEUVQitCJFLyXfGU0oN3ivtXTP0JfTu3Ogq84k62OI8CLEVLzEOt78WCal
         CNzUu0PGfVZrXgiyJ58gXKVUwjqhoRhkEh44wqJ8M32QXqkmA4Kd5dyypiMjL7/l9DiH
         yAIrmnKUdKzMXe5tz9EB4lBjWi0d91CryJeWNGc36IzbRiXVyVPfxUaEIp8Y7oJt0ZQt
         pYaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1792569470; x=1793174270; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        b=T9W33iiJcWUwMhcJjm5HZiBDCm3rCqAJ9fkbFDnJkLPaO0DgJfsI0lUUPFKtE6wtzJ
         Qw7Q2NfuE7kuTLwofQeG6PJ+OQvuo0yfkJMF57sEGuNQqN1gdjTYx2M0YJ3fbvFPVSuE
         wVlcwK/o6h/Z7fKvWBC8LvPwnRRk50X8rEPtr7HQulamcRjZNtZ8C6Q4u7spdePPaHSZ
         MjEi6rxqUDT/6bZGYdlTkSmLRe5s9opN7fzIh0983m1yurd+APGGJxDk+A259/kFRo4c
         ZTxTJGEIiemNyJPofTmbRt0ms51YjnbCN7cHw6BolJlTwaCngS6L6/XPE11yyG37vwt1
         P0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569470; x=1793174270;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        b=chz4zd4g2GKsgKOWdRAZ5y6HRn2D9tOpkpLr/GrScSABwJjjB6m3BRZASeZOrBpQth
         AYFbadWnm4D6bLNJp8SjWXgzChkbmkI+5vM8PCuqCXcxHqi40QYL+0VnE+qQIWscP3Tr
         BFbxWAgzlS3xMdqn6RQkCFfzzYI0lp5+yytjzms1JwP0qtyx6TTENJWMzDd8/2k9y1D5
         SEdM6DLmGDfv9GMgMYpU5eDYX9L3SlBCO1qHq6gbItxllDtza3xrwWXH2yok+HbcyVdy
         t5XtGw1UbHYxT/7qWBEJssAjhOm7rOhWLbr8Gq+ABVihwfM1ieaZpu2FSajDjRaP/uFe
         5naQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbZ3cQVyDAni31kl4IGn2BGFy8IDu2ColxI0aI4nK+C0UtgS6Xe+FcNaaIeqHmFKWMHrqfbD/oaci09fLL@lists.linux.dev
X-Gm-Message-State: AFq9FYL0DtQskluBNDad2+3SPm/H4KqyYHz2sIFKqZbOc1cLYxwUPXPF
	+aoCq93aqs2gTB5vqtPht1bN+L4dABcOJAE/QWTujycYWsNhoj6lETHQfGupgOgIUWMFFOEFGE5
	wUvQdadw8LhSvdsIrNvw7Qk3+AwXBAHVzzqA676yD
X-Gm-Gg: AYBFou3qKt8liG1zDxvxBvpIJ/oqwP75k7JQCjGwUpD/n3wDVyY/1s+C4Jxcjob0o2K
	19U5stfHgTM79Jj+jvY9lC9KI7g+0j20pbnlbAdBXpNYliudyOT5YTPjQ92KW9NRS4OWxvNYX5+
	AeJ9d+JT55nwnejSkd3ZtwrNRxdoNWB61ssRXcdIwTwA/Wnwpz8TFoOkMH9QnAmOsh7l7AElMM3
	nUHjnIa/+cW+gNgXs2fQPzLcI4d3JgFNWXalKpnj4rH/M+l5MytMV8R2y7lc44kipX++MfAvNL+
	Hodf2qyQkDmB+Hxp+NetcGyRB79dH+ZyzqC/Y9E/KW2PtyjXtb4GWEcT32eaS9LhNZif8VS0q9i
	3w6jLCnO24PnMqMiDv+Du03pffL7yFKQhWFGyaEtCXlXJDUl7BIkZTsuSXdOTd7v0nh4=
X-Received: by 2002:a05:690e:e8b:b0:677:c6f6:8cac with SMTP id
 956f58d0204a3-67a0dded6d0mr669334d50.0.1792569469623; Wed, 21 Oct 2026
 00:57:49 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 21 Oct 2026 07:57:49 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 21 Oct 2026 07:57:49 +0000
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: sean@starlabs.systems
Date: Wed, 21 Oct 2026 07:57:49 +0000
X-Gm-Features: AclHuK9CuFn6XAC-EPzrIm8Q5Qt2Oj5aACWiFtIwVz9D5V0ryk4CO-CPJLqqTfU
Message-ID: <CABtds-16eUH6ah3Rr9R=N2605TPdFgDekM5oXVeWqGcmYfWqag@mail.gmail.com>
Subject: [PATCH] firmware: coreboot: Fix CFR error-pointer handling warning
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	kernel test robot <lkp@intel.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From 4e74bf1ccc0f61b4712f688eab66a7750f693243 Mon Sep 17 00:00:00 2001
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 21 Oct 2026 08:55:54 +0100
Subject: [PATCH] firmware: coreboot: Fix CFR error-pointer handling warning

The scoped kfree cleanup already ignores error pointers, so passing the
pointer through no_free_ptr() before PTR_ERR() is unnecessary. It also
makes the IS_ERR/PTR_ERR expressions appear inconsistent to Coccinelle.

Return PTR_ERR() directly. The scoped cleanup still leaves error pointers
untouched while freeing successful allocations on later returns.

Fixes: f2e05ce9763f ("firmware: coreboot: Add CFR firmware attributes driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610210637.LiJ3U0ob-lkp@intel.com/
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/firmware/coreboot/coreboot-cfr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/coreboot/coreboot-cfr.c
b/drivers/firmware/coreboot/coreboot-cfr.c
index 2d9ea5d213d8..61d5191b5447 100644
--- a/drivers/firmware/coreboot/coreboot-cfr.c
+++ b/drivers/firmware/coreboot/coreboot-cfr.c
@@ -341,7 +341,7 @@ static int coreboot_cfr_read_value(const struct
coreboot_cfr_setting *setting,
 	int ret;

 	if (IS_ERR(efi_name))
-		return PTR_ERR(no_free_ptr(efi_name));
+		return PTR_ERR(efi_name);

 	ret = efivar_lock();
 	if (ret)
-- 
2.53.0
