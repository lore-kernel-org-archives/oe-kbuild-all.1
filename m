Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62973128D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786588837; cv=none; b=j3y/SFd+RX/oR2Rr2fRFsD+KVWqyBXj5Ef6d5AiLBdI3q/FyJHRndXpJZNfI+V6oi9Ry5+bsOvaTilEv7QfIF2Z+eJR2e+XXdptkNRNwYbNOXjTEZtw5X0W48a0HRzYk3T0aljd2/aKdaRgfdmtIAeKjelcnjVmUz0b/pdDEF80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786588837; c=relaxed/simple;
	bh=Rm8yJnlT3fsCQLbfHSwTkl17wnWlfVroX3yT09INhmI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fNX+iwYrBNCr4VhPtN6bgpqw01C12jU0wWm5QG4skXp6CFJHkdcWttsA0wFOV78WcnZZqjkBIyqx+GoMhdwd897ikfsJLgSoRh4zaOKEiAaNzYez7o/5WE8yo7/ZCoofsQRrFrOkkmBYQUtmGdyGESWh4XJW2aDGYOA76r8caGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rP8wZa8z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rP8wZa8z"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7854678cso1074658f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 19:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786588833; x=1787193633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBG7b5ISCcqvogeJMToUIR5kJKEpeXF6DhAFVm+3bAY=;
        b=rP8wZa8z+Hv/LjxZdlFm1ukF6zD3RSifC/RWcGQldpEgYcmH5ZSBs1ls9375Z6JDI2
         PMFqZ9cqISuh2Kd9WUIlFWZvuSoFr0EU3TqHMTEwEn6IiULf7PBZjtm8/nVtA1nH+37L
         +xMujjYJrH/snNlYLkMS0w3IEsmwKtzMUkfRloOQ6W1DJTMVY1hzaJ6PErgvfLoswe3k
         cvBcm5v7hAzlYFERM1pvw3qD7AtZDUvuubqoFz+PQ6R4HWfnXd7GuT+EMwwwyc8w2gEy
         RbXWjfuNNYInmISIhrSdtZV+ra+vhf8QMfVduWDVKc7TkKLTSLCGvreffTrd0IXfcAhk
         nq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786588833; x=1787193633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBG7b5ISCcqvogeJMToUIR5kJKEpeXF6DhAFVm+3bAY=;
        b=LhXaNQQ9AcTOlPeIlZ4W+9UXg+Va/bVilxRe/QcsU5vlU/4k9DvjhzZBSuTn8yEa2o
         Fv/fAex7lLybBqgtPOBXOnjOAF8TrcWHTIfoo7GpRzzF/GypZRu89Q4cjA/KSuUwvpUC
         VfdnJQRLrPklhrZTynh22choytkyNRiWkwXnvd1+LkzBMcdrK4PddGGWjgDmw+25hT1d
         Tu2GBMBlzTxz3cmnVrqeCpke6bZr0vgNCDyVw8lLKpARHHlBq7Ec3cuYHYqkrbHkW2eK
         qYL+Z4kFzF/iFBRPPvgtCA0c+SoprlVoOB6HfUHMg9sxUwHBOXoA8feQ7EiHIhoT+5tk
         nl7A==
X-Forwarded-Encrypted: i=1; AHgh+RrkOT9EpCWPzE0UEja82pXWvPZdUG+ihMtOfwnDqt4yhYTXbY33OK6Wfj/kTSOq1RoWYn7sv/dgkPia23ZX@lists.linux.dev
X-Gm-Message-State: AOJu0YxQmydo2KNaNe8qDfRawSn1mAFQvFAkXSrSfUHBPin3rllV/64b
	B7UDRss1s93gPGH0MQSEqrhCxkljZdhpxWNHFP7gxYVDiw2+jVrSDMzw
X-Gm-Gg: AR+sD10toi2XUrSpVCj6L12kWZHYVqESJIP8sM49O1fa+PTIbuKmwHsgR/aSAWK1uXJ
	DaJ30SJ8NyyGCJt6nSvcpJfijEkpDHcxWiobPh/gcG3iFXkACIcuQViAbhWE0q7VFH2h97EXbCS
	kvODN4OiTJCMeZlhiJKCzwdYj/j1kMZkqhBelggQEZEUgqUQc156BFHNZIMUGNTlaWWwf3hsmBE
	wtVgWFzCD08n4HYjZFIIYhKEgquWyTRd2C3cITpvFXnuRFSoA5BhupTJHrebdor/lghlL8rb3Nw
	uGYYuAgcRi8SBIsMTdikUyaxuXvAAThgHzt+3kH8kcl5jlQ/66diB9vHN0Mh8MPUr4yk2l2vOwt
	k7YOjIteqzh7KUBPA+KIVvzrqld6tc/NOdXDqHJXxpTMcWae2S1QutEJ3c61D5Dl1MZJRlIpfes
	TYIhfqp/rw0gp/i6/f8leqbO4uF7b/BLdjoly+Rn+VWEPBVwz8YUFxA0Ykio7iNNEtEVKEWITgt
	jAUdKWQhOeW8xEAyTEoxdrp2cbKGVq2NS+SY40PbIukDhu9Uyg9iddUbnm3EO2yPZQfkWphgndv
	yfk9wJl1zh7WSPkZW7sx6IngkvFgWnsPvxwm7QPjdJJYdOMC5HT/MLOCcw6/RsPLOgH+
X-Received: by 2002:a05:6000:388:b0:47f:e770:13e0 with SMTP id ffacd0b85a97d-48159ccc59fmr3151747f8f.7.1786588832762;
        Wed, 12 Aug 2026 19:40:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c79-1f01-1565-573d-10dc-99f9.310.pool.telefonica.de. [2a02:3100:9c79:1f01:1565:573d:10dc:99f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5c2308sm2306362f8f.33.2026.08.12.19.40.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 19:40:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] microblaze: Fix MB_MANAGER build with older binutils
Date: Thu, 13 Aug 2026 04:40:26 +0200
Message-Id: <20260813024026.5402-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 88707ebe77e2 ("microblaze: Add custom break vector handler for mb
manager") added the suspend mnemonic to the MB Manager break handler.

GNU as only learned this mnemonic in binutils 2.42. Linux supports
binutils 2.30, where enabling CONFIG_MB_MANAGER fails:

  arch/microblaze/kernel/entry.S:946: Error: unknown opcode "suspend"

The suspend mnemonic is an alias for mbar 24, and both encode as
0xbb020004. Use the underlying instruction, which GNU as 2.30 already
supports.

Fixes: 88707ebe77e2 ("microblaze: Add custom break vector handler for mb manager")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310310151.UhB396Qs-lkp@intel.com/
Suggested-by: Michal Simek <monstr@monstr.eu>
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/microblaze/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/kernel/entry.S b/arch/microblaze/kernel/entry.S
index 582d7256d8154..ad44341a5dbc7 100644
--- a/arch/microblaze/kernel/entry.S
+++ b/arch/microblaze/kernel/entry.S
@@ -943,7 +943,7 @@ ret_from_break:
 	mbar	1
 	mbar	2
 	bri	4
-	suspend
+	mbar	24 /* suspend */
 	nop
 #endif
 
-- 
2.53.0
