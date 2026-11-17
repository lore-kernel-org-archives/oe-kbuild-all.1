Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935798;
	b=ZECfGcQuJwTU4j0JBeky7rmh1sUJtFjzH61gaSbK/zDj3OHgZtJ4qpATiGr/IdJ6kd2B
	 OUgbNpxplPcnKgwQeIabZlFp4dm5poyRDmpLRjBrl5UwHJ4PJE0DAq0vqv1AccngxPj0s
	 PJl/d1TRxaKNLFZ7P5WBQqR83XM6fofJ2nAemX22FtfUXxpmoAZ2zBWPDU4qI2pqzeEuZ
	 uuDozxCYnXImvuiH5uMsos8P3sF12pZ/5Y6onxJlng2FbmsuMpjpeHUs7jO00eS+/hM2q
	 OdripDemiEaivNvSBZR20EYzTc2opfwHo/zW375SuKbuWWjuqBBK6a6wkemskYJ3/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
	b=OyjwatFaXK4sJ6QGVTWhwBggrkNfOhhW9RjabAbDcKv11ohO6MduJU+fl2KbBnnZPo/C
	 OAiA0gT6DxtLN7nZIU3vqvaUWuNwF/ti7PWkfeXUwOskjoKxVPhDcaOUgZBfybka0uX96
	 FtH8RraZMbLYB8xW8hKW6Oe6r9UgDJKvVcNcwc0CyFuV5cvcZH0h/M1dwsV/WGy/pCY0l
	 aFDuQ1CEZ6qjWRg+6sPUw9C8We4E1f4JfuzeYCyacA5/8I3+MW4elI37jpYxeoSluU4Zk
	 Hp7mrFc+c9s6Sn+5Nf6wFvrMnmmFNfT5jMx1J3yibQUkdYiUb9XdkmUIQhBDxOjg2kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBj2l2Xq;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0A606A32A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 17:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B0A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBj2l2Xq
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9d0d40a4so29053a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 09:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935798; x=1795540598; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
        b=vBj2l2XqAYfO7wxBHkXYr1CnxoQa0r0tVGyEp3kU8oFex7s1CXXyRIatXfgxXI6O/D
         Q+qSLJR8/1x12VBbMTAFizNXlSOWZZdYhsELdPykvMTCRuOaFcqJti3Q+6bizlpw4nK7
         sUdZ/WSydNgr7yxNlf+g32/988MozIhX7iZkBClotj0uNR/G5gDr17PUUliK6Lmym/Y8
         DjZ3PNW7benJEzrsw86jrpf9PUp4DAeECi4RWZLPtFG9fzb5v9FirNSoLcN/rOrvUq9v
         I/OqzQynFZvKDm6d+HvfEBNyZqEtzCuPVoz67HqeQ4D00qHu56zA1GuvG0OCzJHfm9/b
         oozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935798; x=1795540598;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
        b=bQQh4KOLEh/OBFiH4e+edoLxNEwc0ylnFkPAKBmkUVi7jmEQfAMNb+yPhp4Lk/MXS6
         ImjTDhkdgJ4UGbvhymgHEo5SFCej0U92bqkO+B+m6WIqSRIAHt+al4FFjWdHpf9KMAGP
         NpkQNXXLuWrCsKDAU+2dUSJf3b+M0Lw9CzVPAnch+FJBKT3O+nfxaP/ZZeZw9lI3UrCL
         idjVoKVodWuJ5j1Z/LeVttoh6t2sxN/yO1rt6I/Gr0BwEy0zraNMtky9QhgK+x7xmqQ9
         KA2c3XEqjTgcw7FehM+Euf+kP629ZL1H9Al7IZ6NQw4YMRFBV0e+FAyAZ6foju0T6hpC
         tHUQ==
X-Forwarded-Encrypted: i=1; AL+hErHJZkuLuQeZx4PQRF9UhdWakRvkGkCjCuCJ/Wpq89ghLVciJLMQ4BgM4GPHlVzHgSqqr5eWiFjBXJE7JJin@lists.linux.dev
X-Gm-Message-State: APuU4Z9wrI9ysCA4RSUlBDT5ipgRNAm3tQG8pckbDLuphbYFXNVK2bZ6
	mtKJncNLiQ2+w+E6q8v1T1nEbsYYOERyzyNOifxobehScF1PPsTET37m
X-Gm-Gg: AYBFou3fIOCTalo/kRv+3eKecTxNqNA1wt6jcA9Hjm19IBqWFKXqfvOdHhUoXFYYCzw
	9u61W3ChpCLk2N3t2nYrFFZUp/DXSNX9ncfNFFNZjDCN5hDpCDNEhQiWSnyCJxWiHN7+NiM41H6
	L9SX/J1QthV0aHZU10S1zH607WjGnB9TNQlkB2YDNMBD+PiysR8LPzT1AanWMU4QtOYMGEPqvpv
	qXQcqr1A4/zwIQQ7tm6v0yRFs5vmcSf73nSddtQHdvrofWE3X8D9IZHarDMQGjgqzIBAu55Scdh
	rteXmIt1EI/Wt+77bCX3Ks/QxeMuAzNkHYEY1DjCqdpuy4x6JLeui4CBN2RatoOTbdtGXw7sHje
	HpwM5x+4955w2lhxyvp1QYIVUmA2bHkOwBmNQsJr5j9i9o7f2lIb12JzLMR/BrZKSGume9NjMK4
	PUe/7SF2su4vlWf+PEbaKmWOYRZsGO7kkn1Bci/rlW1eQHi9qr5AB+f3WVHdOeu2riyQedrPM+j
	r0u6AKe1td4BSk0egpJFSth5vVy41zNk0Yrf1gzi+p/3hhIHEgPOvZZj6NtkRFWmSjQX05BoeEV
	EU2Y35Kuv0Y5ewQ7+l+t/+fCfTBngoqmQNBtPs8wV+o8F9kFvG+9IOLtABKWYqai1ZdadSu3Qsz
	RT74fKNTF63Un70VnWm086gaqM+r5zss3qIFuHmMY/ojZGSl6HkSHec2kOJZqLVE4077hm50tZH
	9b+hSQHAk=
X-Received: by 2002:a05:6a00:3008:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-8beb374dd2cmr12162924b3a.4.1794935797654;
        Tue, 17 Nov 2026 09:16:37 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5b38f2c39sm99770b3a.34.2026.11.17.09.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:16:36 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 04:04:33 +1100
Subject: [PATCH] mm/damon/paddr: avoid truncation warning in high-address
 KUnit test
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-damon-paddr-sparse-20261118-v1-1-3a0e943406d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NOw7CMAyGr1J5xiLJ0AaughicxNAgkVZ2QUhV7
 04CAxvj9z9XUJbMCsduBeFn1jyVCnbXQRypXBlzqgzOuN5a6/GSX5joPhWcKSVBnUmU8ecH4w/
 GDb1PA9SVWbhWPg+n85f1EW4clzbbEoFqPwiVODap4f7PA2zbG7eW2xe2AAAA
X-Change-ID: 20261118-fix-damon-paddr-sparse-20261118-fb08902768d7
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
 Justin Stitt <justinstitt@google.com>, lienze@kylinos.cn, 
 linux-kernel@vger.kernel.org, 
 Linux Memory Management List <linux-mm@kvack.org>, 
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
 mm-commits@vger.kernel.org, Bill Wendling <morbo@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, oe-kbuild-all@lists.linux.dev, 
 rdunlap@infradead.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
X-Mailer: b4 0.16.0

Hi SJ, Andrew,

The kernel test robot caught this issue in my earlier addr_unit KUnit
patch. Feel free to fold this fix into that patch.

Thanks,
Aveline Noir

-- >8 --
When phys_addr_t is 32-bit, Sparse warns about truncating the u64 address
passed to damon_pa_core_addr() in damon_test_pa_addr_over_4g().  The
runtime kunit_skip() does not prevent Sparse from checking that
conversion.

Compile the high-address assertions only with CONFIG_PHYS_ADDR_T_64BIT,
and keep the test skipped otherwise.

Fixes: 7a983cc1b573 ("mm/damon/paddr: add KUnit tests for addr_unit conversion")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117170155.fEdeuuhm-lkp@intel.com/
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
The reported warning is gone with the original i386 config, Clang 22.1.8
and Sparse v0.6.5-rc1-21-g84ec0658. All executed DAMON KUnit tests passed
on x86_64 and i386 with and without PAE; the high-address case skips
without PAE.
---
 mm/damon/tests/paddr-kunit.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/damon/tests/paddr-kunit.h b/mm/damon/tests/paddr-kunit.h
index 9839cc233071..2b11f0e67a12 100644
--- a/mm/damon/tests/paddr-kunit.h
+++ b/mm/damon/tests/paddr-kunit.h
@@ -26,15 +26,16 @@ static void damon_test_pa_core_addr(struct kunit *test)
 
 static void damon_test_pa_addr_over_4g(struct kunit *test)
 {
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
 	unsigned long addr = 0xffffffffUL;
 	unsigned long addr_unit = 0x1000;
 	u64 pa = 0xffffffff000ULL;
 
-	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
-		kunit_skip(test, "phys_addr_t is 32-bit");
-
 	KUNIT_EXPECT_EQ(test, damon_pa_phys_addr(addr, addr_unit), pa);
 	KUNIT_EXPECT_EQ(test, damon_pa_core_addr(pa, addr_unit), addr);
+#else
+	kunit_skip(test, "phys_addr_t is 32-bit");
+#endif
 }
 
 static struct kunit_case damon_paddr_test_cases[] = {

---
base-commit: 7a983cc1b57309a875a9e07a934c9944bf3d088d
change-id: 20261118-fix-damon-paddr-sparse-20261118-fb08902768d7

