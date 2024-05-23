Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FA6127E02
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716498063; cv=none; b=LXdjRXr+syMZhSjuLnUm30seB9apqUBrwpLwOg1PpovRWm7rdqKC46k69ObOfHOFuXuTwm2LZsOTWv0/cus/9jS/R+qqfpmjXBJFkWleFoneHxnny15wvrIdyDpD1WHLiqAa/pblsrtBOkYuRv+bcVB835QkNoMCr4PEHbdVGnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716498063; c=relaxed/simple;
	bh=P10fqiAxrikOC2Ee4Nfn8mCd7HDQ6xw3rggtlBpeZoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nDIDMQGjt/AnkmCpO9v+RXjTvOKSUHC6vkD1zrLzSLvB+DfxvHIOZId4jcVfbOJEYsA66sSdV+Q90X2hUkuw1B7wzPHwsVgFmN3u5S/0NZMpLGSWnXGnB4yOoQ4/nYru+MbskDfoQIkCLxXEEzWmQnmq8OCt5gSgedNxVAnaPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfQcZAg1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfQcZAg1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f34b5f1964so7303465ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 14:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716498061; x=1717102861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz6C4rTluib+JFtAS5ELTQqLXEuP3SgExV8pay9i7vQ=;
        b=hfQcZAg1j7X3HaND1QcEwCqsfn2ATkm9htqg1W+NsIZgpcSpkn0YvzZ1wrzvQxIhOz
         iCn8f8np90cf1Wk5c7pkDaUL/FRzCIiY9eH+WH/5G/kJ3ZX44vd3kZ1MpadeDJN59/Za
         eEKIS2yXintqTwVBTioLq5o4qCwyv8U6wDscrNuSgFUZGciY/pHJx2qw10/D951zbRl9
         oxuAxhsX423+JE3YkcXUayvzDPIwTTYXvn/tMJmuPivKPRrdti//HDUnwoYL07NETiZ/
         t2rh1t7kCKDQJhzWAmltFIiwkkrbpnbVPGRhvJwHF0kjbBKbMFfZETiJ4LOq6fvYjlOO
         41EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716498061; x=1717102861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz6C4rTluib+JFtAS5ELTQqLXEuP3SgExV8pay9i7vQ=;
        b=r4FzBftvxhT/BhjTEKfKpDwD8B6S5eaePQspSdPomOyONJCMg5VIMwOEEzZGUjr644
         TDSoP5+sgf3B+bOYVVTqbklRuRGQMYNS8qVZRGKlF4BoFoXsCd5y0/L0psqvpez9qQAM
         +J3VL3ECs+fVP/K3Wg3Qr4nhe8xEVBGoreQv0iUQh/G4lGFNVMgva72/MlGDhx0gY4LS
         Uz8pM8lEMs4R8AmipjnNqc+GcgCPnxgwyqzFq+z2IvOD7nCzxit7zN736Jh3sfsBD00A
         q+ADVkW5kidG7HuAVdzcKIPQwZ+F2ERgan+Cc061sV1JrALuDEV9F/ls1v6ZeOjLphjF
         vDXA==
X-Forwarded-Encrypted: i=1; AJvYcCXbtkxSkN1pst87QLLdL5+pzxTYVnBaAox8axm7JELypKdeWW74t7Y/zA0LSGyixJfEA8HsXB7dUZXWuHZlNzEuWJ1NoxTEkPB1P8LaYQ==
X-Gm-Message-State: AOJu0YyNOEDx0nqkj3LPiOi8tpIY5D3B2b0DmVGQ/GSx37A7fWoGFFrc
	rSgl7iWTM2O/V4GX9wQ2UWi8GfDxFKC7vLEgrqlotZF082HGs+OV
X-Google-Smtp-Source: AGHT+IFS23wiPQKouuaen4geZNnXoXPiVbTmYmxSZgo7tQLACdNxUr3Ngi4qQ0W+oJANbqvL4AK0Kg==
X-Received: by 2002:a17:902:ce92:b0:1f3:3d07:d6e3 with SMTP id d9443c01a7336-1f448740bfemr4641085ad.34.1716498060780;
        Thu, 23 May 2024 14:01:00 -0700 (PDT)
Received: from localhost.localdomain ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c797ca5sm261005ad.71.2024.05.23.14.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 14:01:00 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev,
	v-songbaohua@oppo.com
Subject: Re: include/linux/huge_mm.h:285:undefined reference to `mthp_stats'
Date: Fri, 24 May 2024 09:00:45 +1200
Message-Id: <20240523210045.40444-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202405231728.tCAogiSI-lkp@intel.com>
References: <202405231728.tCAogiSI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c760b3725e52403dc1b28644fb09c47a83cacea6
> commit: ec33687c674934dfefd782a8ffd58370b080b503 mm: add per-order mTHP anon_fault_alloc and anon_fault_fallback counters
> date:   2 weeks ago
> config: s390-randconfig-r005-20230226 (https://download.01.org/0day-ci/archive/20240523/202405231728.tCAogiSI-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231728.tCAogiSI-lkp@intel.com/reproduce)

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405231728.tCAogiSI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    s390-linux-ld: mm/memory.o: in function `count_mthp_stat':
>>> include/linux/huge_mm.h:285:(.text+0x191c): undefined reference to `mthp_stats'
>    s390-linux-ld: mm/huge_memory.o:(.rodata+0x10): undefined reference to `mthp_stats'
> 
> 
> vim +285 include/linux/huge_mm.h
> 
>    279	
>    280	static inline void count_mthp_stat(int order, enum mthp_stat_item item)
>    281	{
>    282		if (order <= 0 || order > PMD_ORDER)
>    283			return;
>    284	
>>   285		this_cpu_inc(mthp_stats.stats[order][item]);
>    286	}
>    287	

Thanks, would you please test if the below patch fixes the problem,

From: Barry Song <v-songbaohua@oppo.com>
Date: Fri, 24 May 2024 08:50:48 +1200
Subject: [PATCH] mm: huge_mm: fix undefined reference to `mthp_stats' for
 CONFIG_SYSFS=n

if CONFIG_SYSFS is not enabled in config, we get the below error,

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/memory.o: in function `count_mthp_stat':
>> include/linux/huge_mm.h:285:(.text+0x191c): undefined reference to `mthp_stats'
   s390-linux-ld: mm/huge_memory.o:(.rodata+0x10): undefined reference to `mthp_stats'

vim +285 include/linux/huge_mm.h

   279
   280  static inline void count_mthp_stat(int order, enum mthp_stat_item item)
   281  {
   282          if (order <= 0 || order > PMD_ORDER)
   283                  return;
   284
 > 285          this_cpu_inc(mthp_stats.stats[order][item]);
   286  }
   287

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405231728.tCAogiSI-lkp@intel.com/
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 include/linux/huge_mm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index c8d3ec116e29..09c5744d9124 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -278,6 +278,7 @@ struct mthp_stat {
 	unsigned long stats[ilog2(MAX_PTRS_PER_PTE) + 1][__MTHP_STAT_COUNT];
 };
 
+#ifdef CONFIG_SYSFS
 DECLARE_PER_CPU(struct mthp_stat, mthp_stats);
 
 static inline void count_mthp_stat(int order, enum mthp_stat_item item)
@@ -287,6 +288,11 @@ static inline void count_mthp_stat(int order, enum mthp_stat_item item)
 
 	this_cpu_inc(mthp_stats.stats[order][item]);
 }
+#else
+static inline void count_mthp_stat(int order, enum mthp_stat_item item)
+{
+}
+#endif
 
 #define transparent_hugepage_use_zero_page()				\
 	(transparent_hugepage_flags &					\
-- 
2.34.1


