Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BBF182
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 00:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736729719; cv=none; b=TgSlA0x1Id4eEE97STpST9vfbCO3V7N3V0q4Io9hb67l7aR3QFj5GxRNlgwZ30TXD5wTylmuAuX5ETx3+vvhxjCX6ZY+4eljzuyX9tI8Ox0Fw53LREhgYuvCCM4z3AURXQGX3/JncOFn/AQxLCTPw8/w16Tm8GnMC73E0S92drI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736729719; c=relaxed/simple;
	bh=Xb8NYHYcmOFrz8YmAh+ET9selF4u1qLxvF3QVIT9N8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o5lUb9qfmGjqJrrK3YeJ7g8Z+Jo6k7I52bj9hKQDTSVaSLrqTtsPV7uS5b3RlMG7wY3CtYL8X1Pe3U4/9wUmvWe0wftnXE3kA86+02juAjMtfgZtDg3zHqQnMpVVtKzguBRlXD5HztcpDGaZ9R/ULvHqDkbcZN+DtxvGsK4Y000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoV8N/Wj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoV8N/Wj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21619108a6bso62378225ad.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 16:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736729718; x=1737334518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DftPL8326UAsz4FZjKeYPUXF6bE+WvYDND7zuo6rld8=;
        b=RoV8N/Wj+wecx2nXCBt0+bldL2lnB1gHcRgvdAWHDFrmIi/XbxjmndGQkb3vxzc7gb
         plmt9mBnm2RRA3/n3FMqWKxmo9Ze25EjNbk7DyqxgJ4JsCAXxXbPuqpYurhvphwihfDs
         zg4sFkEBb2eTFCrfmBx5HBxBmf0B7pKEU++QzzBD8spiM+FBHH9yzdoru5KdTLARWhK8
         aLh2jVhsSZM6rYBxiaMkx2FCU0PzlABITlv9EBqa+HGpI4j/BNqxgX+WXZR46CkVvsgC
         bajlAwmIs/rt7mIu/KgGzFqz4NmnjQe1GAEliS+csFTinfgdtZDtM2SxBAsxNu4++7K8
         Mprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736729718; x=1737334518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DftPL8326UAsz4FZjKeYPUXF6bE+WvYDND7zuo6rld8=;
        b=K8u3v6b801m13eXSOw97u1yGLfi/px+GqiTV3IrW9LguYY+vUcd7Naghx4DSVhNuGl
         6AoJgVpe/4XLEbDcvvJQb5IbwB+OJ8ge6bj9+6F09lCL3Km0xEzNysXe+2+g9CIb/fN+
         f3fLV/9VPusbAcrsobmeMOxGf4H4frzgKn9YhuVlqZXQCLMai2MAIENGm2TxTgjIeVKd
         sOtQ3pJYk98ecQq5Rv0YGzt7oiE8da1H5GgvTDc8OlfgoRq6rdCVtUp+my5ULC2X3e++
         o1aU6LQVaqVmmQj7aUW0fcmd1Vqifsqf+uN5Kn2q/4G/VrNodK4Zbme0cmFRQnf6YgYm
         IbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1sEMS5GHCbSL2mR+9pf2LuvCMf+XSy3HQQLF0QT1hTVtfEeVKM0MMVw3ZgslAX8kCQk4UZMi48X7/kQ2k@lists.linux.dev
X-Gm-Message-State: AOJu0YwqdzWVbaIJ8Vjni/GZYsXobx4HAh9c9o77/QyzvaKZPyUXo/XS
	5xUlChkZpbbFIUYzgT3yB0X+tZB+xVF5uHsNIaCHy3RFulie7AiA
X-Gm-Gg: ASbGncs2dBEmuihByNPCZ0h2t1axA/pFtQxStRBGWAMHlu+E3dPhgtqNzBR7zrDzHmi
	CIVMrfBiAzOSZVXFL250ttKmfSVZ1X49+jBV7UKHjZDoezcAn6pMXZYP/uo3TsCPG3UtDCOpsTH
	2/2AuWRIM/96hkYgN30kghU0TDD5PsHTV/0B6Lg+2ibAZDX6YfPt1K0s2UhSr2YK+kolz62YU0R
	OqBSaPDbcyDSPR9wOqfZxJgMLPsGjEC6QELEM8bkqHY94tyPmzIfe/7DM66+F/xQV6KI9q3WKhZ
	qfM=
X-Google-Smtp-Source: AGHT+IHJb4rm8dh2mYTH8DrjYzBNHLloKyhUrkK2np0t5gjJsH2XzcUI/ZXVpWr7Siu7WH20wTT76Q==
X-Received: by 2002:a17:90a:da88:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2f548f3fdfbmr21532944a91.33.1736729717704;
        Sun, 12 Jan 2025 16:55:17 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593d08a8sm7315585a91.9.2025.01.12.16.55.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 16:55:17 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	baolin.wang@linux.alibaba.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	chrisl@kernel.org,
	dave.hansen@linux.intel.com,
	david@redhat.com,
	gshan@redhat.com,
	hpa@zytor.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	kirill.shutemov@linux.intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mark.rutland@arm.com,
	mingo@redhat.com,
	oe-kbuild-all@lists.linux.dev,
	ryan.roberts@arm.com,
	shahuang@redhat.com,
	tglx@linutronix.de,
	v-songbaohua@oppo.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org,
	x86@kernel.org,
	ying.huang@intel.com,
	yosryahmed@google.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
Date: Mon, 13 Jan 2025 13:55:04 +1300
Message-Id: <20250113005504.2271-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202501061535.zx9E486H-lkp@intel.com>
References: <202501061535.zx9E486H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Jan 6, 2025 at 9:23 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Barry,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-set-folio-swapbacked-iff-folios-are-dirty-in-try_to_unmap_one/20250106-112638
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250106031711.82855-3-21cnbao%40gmail.com
> patch subject: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
> config: i386-buildonly-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501061535.zx9E486H-lkp@intel.com/

Sorry. My bad, does the below fix the build?

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index cda35f53f544..4b62a6329b8f 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -280,7 +280,7 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 					     struct mm_struct *mm,
 					     unsigned long uaddr,
-					     unsignd long size)
+					     unsigned long size)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));

>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/include/asm/uaccess.h:17,
>                     from include/linux/uaccess.h:12,
>                     from include/linux/sched/task.h:13,
>                     from include/linux/sched/signal.h:9,
>                     from include/linux/rcuwait.h:6,
>                     from include/linux/percpu-rwsem.h:7,
>                     from include/linux/fs.h:33,
>                     from include/linux/cgroup.h:17,
>                     from include/linux/memcontrol.h:13,
>                     from include/linux/swap.h:9,
>                     from include/linux/suspend.h:5,
>                     from arch/x86/kernel/asm-offsets.c:14:
> >> arch/x86/include/asm/tlbflush.h:283:46: error: unknown type name 'unsignd'; did you mean 'unsigned'?
>      283 |                                              unsignd long size)
>          |                                              ^~~~~~~
>          |                                              unsigned
>    make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=998720002
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=998720002
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
>    make: Target 'prepare' not remade because of errors.
>
>
> vim +283 arch/x86/include/asm/tlbflush.h
>
>    279 
>    280  static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>    281                                               struct mm_struct *mm,
>    282                                               unsigned long uaddr,
>  > 283                                               unsignd long size)
>    284  {
>    285          inc_mm_tlb_gen(mm);
>    286          cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
>    287          mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>    288  }
>    289 
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
