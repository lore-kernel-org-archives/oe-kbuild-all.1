Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5176C8F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 00:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736729802; cv=none; b=lKSmgaJqEWFrZcQc2H+fARh1um9Vp39c8a/VXcKNAdoogfwapTghk6kHnVJkERNxRmcqb3bDF4+MjweG4g8FTmMIsA5ChDOOgmYfxEi5bV/fbDhSDxEthkVCFva2FQQvktB4E8Ucx7ydu1pLpSEsvqXZhgxogy/gIYYD6Svd1AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736729802; c=relaxed/simple;
	bh=yFdu13TPr6VNxPPYt5rhOWGeVPl9YcsHduFHWKozF2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mj/uIIZhBsxLCttI6rEgf3X9aQg33SoHQOVB2FXAgB6T/z27p77Kxpa52iqfpQltvtrxCWXa4WeUlP0ZyDDnlBltcbeVGTcvcZ7EzXuUkIu4UE3iWnIcvS2f65jo+S/6e9QeD55k+Rmy9VB3Rrdeg3m1PFjG7qG3fVRXEC8sOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwD17Klq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwD17Klq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2156e078563so54172425ad.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 16:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736729800; x=1737334600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V56Sb7sqNGix6HQ1QvO1EkN6QyGEMwBCv4yPDzPp8o=;
        b=NwD17KlqetQTOoZLb133D4OCCBWHJu4DTTd6DeiV527NQXPw4DEt5T3keQlEbesKaZ
         QqX8vWzqZFHyizmIphzDhqG+GrRKOW5ADnii5/yj3BsmZJo/2goaPZiD9QQxEpDFhSTt
         dfbMW+cWFr4YSTq9AcL44Hb53XD8knuTtP5c5fj0Id5CsjPf/Elp47QED6c0kFfh3Ure
         wVO9k68E9EBb2O/IkwS+XC7mUGIPW+QZBuh6rk3nwNloaBarU2i/mHZts8b4cKh37kya
         hEdqJnMRBrUQQq4L9LHo2inDk4IfkW8IiYplN+lU/KDM5a/1JSv8eYT1Hp0b5VFCyhm9
         6e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736729800; x=1737334600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V56Sb7sqNGix6HQ1QvO1EkN6QyGEMwBCv4yPDzPp8o=;
        b=RTWiXQA5fWBf/wsVovFolhcSc768QkGQJazElCRXcPrI/z+JIsUc89LtBhEkBu4Cpn
         iAEZ165/D23hMNb5HEBPe+MW44V/u99oyZ+M6s6DkZa+Kc8vSz4ICtHRqnkqtBp4qG6T
         rOP4VmGhQ7QyqKuxF9yXqtGQ0WPELUiMDAaGJVZEDnIvgri0LFPA4IXYwsNeQXS3AF4G
         dbxzu3SKgF0ve56ucLXs9tTlPy1vaUAYE3iPlARlusU4dJIzaQXZO8zdnyHSv1DExUqx
         1SBPsG30XUC5K8sDWxZtc255+sCkRgynHrsUPUIdNJJyIKTrdyK3s06keFvNYv7xOXdX
         D/sg==
X-Forwarded-Encrypted: i=1; AJvYcCVscdlko4S2PUwbBsENoAi7vY69+Q0M+sHDBVPk2G/dZnQJZzR1bCx5gm6wbAAgq8Svt/3hy8FMXySk43Pc@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9/MJM/BwyN2kkQ+9w5PvmoSuiJuhLlIPM4OCR1w7XOMgq2HDP
	R1yKCSdZuV6WIaM9w9TLqc41ip9hiGjygX2ClHdaWO7cKu7/U3H8
X-Gm-Gg: ASbGncsnczO9+scUo0HCns98+7fBOo2GFHwrjJesN0Ydlyt7xXzAfrQBjvKrjBSSY3D
	9vt5QAPybxQ1TK/3YwV9pwGvzkxfvZpWDdriKq2WcXe5fTyQTuBm56zQFCRBgyIivem1xmOsfKl
	BY/nnWI3x0qGrpzUabSE0ZN5GPMqZA40aYjUj7aJJWpOCx3EOsFnqoEpDAQeSn/iyq4H3kP+aEO
	+KIwyd9n6sJxxBXCw0r6k6SQadhGK3tznGdmlH0AsAREPtby9mI3j2vDKMzh9MUNVQ=
X-Google-Smtp-Source: AGHT+IGzxYWm0tbkwANQHKte1ZrD6ajm4Ul4JqKrWyhZ4nm01na6Fa/9M40NPrsrME9FDL8oyW0k+A==
X-Received: by 2002:a17:902:cecd:b0:215:6995:1ef3 with SMTP id d9443c01a7336-21a83f3469cmr255885615ad.3.1736729800033;
        Sun, 12 Jan 2025 16:56:40 -0800 (PST)
Received: from Barrys-MBP.hub ([118.92.30.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d134sm43087125ad.187.2025.01.12.16.56.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 16:56:39 -0800 (PST)
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
Date: Mon, 13 Jan 2025 13:56:26 +1300
Message-Id: <20250113005626.2290-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202501061736.FoHcInHJ-lkp@intel.com>
References: <202501061736.FoHcInHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Jan 6, 2025 at 11:08 PM kernel test robot <lkp@intel.com> wrote:
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
> config: riscv-randconfig-001-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501061736.FoHcInHJ-lkp@intel.com/
>

Sorry. My bad, does the below diff fix the build?

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 72e559934952..7f3ea687ce33 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -61,7 +61,8 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 bool arch_tlbbatch_should_defer(struct mm_struct *mm);
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       struct mm_struct *mm,
-			       unsigned long uaddr);
+			       unsigned long uaddr,
+			       unsigned long size);
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..aeda64a36d50 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -187,7 +187,8 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       struct mm_struct *mm,
-			       unsigned long uaddr)
+			       unsigned long uaddr,
+			       unsigned long size)
 {
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
 }

> All errors (new ones prefixed by >>):
>
>    mm/rmap.c: In function 'set_tlb_ubc_flush_pending':
> >> mm/rmap.c:685:9: error: too many arguments to function 'arch_tlbbatch_add_pending'
>      685 |         arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from arch/riscv/include/asm/pgtable.h:113,
>                     from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:30,
>                     from mm/rmap.c:55:
>    arch/riscv/include/asm/tlbflush.h:62:6: note: declared here
>       62 | void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/arch_tlbbatch_add_pending +685 mm/rmap.c
>
>    663 
>    664  /*
>    665   * Bits 0-14 of mm->tlb_flush_batched record pending generations.
>    666   * Bits 16-30 of mm->tlb_flush_batched bit record flushed generations.
>    667   */
>    668  #define TLB_FLUSH_BATCH_FLUSHED_SHIFT   16
>    669  #define TLB_FLUSH_BATCH_PENDING_MASK                    \
>    670          ((1 << (TLB_FLUSH_BATCH_FLUSHED_SHIFT - 1)) - 1)
>    671  #define TLB_FLUSH_BATCH_PENDING_LARGE                   \
>    672          (TLB_FLUSH_BATCH_PENDING_MASK / 2)
>    673 
>    674  static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
>    675                                        unsigned long uaddr,
>    676                                        unsigned long size)
>    677  {
>    678          struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
>    679          int batch;
>    680          bool writable = pte_dirty(pteval);
>    681 
>    682          if (!pte_accessible(mm, pteval))
>    683                  return;
>    684 
>  > 685          arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
>    686          tlb_ubc->flush_required = true;
>    687 
>    688          /*
>    689           * Ensure compiler does not re-order the setting of tlb_flush_batched
>    690           * before the PTE is cleared.
>    691           */
>    692          barrier();
>    693          batch = atomic_read(&mm->tlb_flush_batched);
>    694  retry:
>    695          if ((batch & TLB_FLUSH_BATCH_PENDING_MASK) > TLB_FLUSH_BATCH_PENDING_LARGE) {
>    696                  /*
>    697                   * Prevent `pending' from catching up with `flushed' because of
>    698                   * overflow.  Reset `pending' and `flushed' to be 1 and 0 if
>    699                   * `pending' becomes large.
>    700                   */
>    701                  if (!atomic_try_cmpxchg(&mm->tlb_flush_batched, &batch, 1))
>    702                          goto retry;
>    703          } else {
>    704                  atomic_inc(&mm->tlb_flush_batched);
>    705          }
>    706 
>    707          /*
>    708           * If the PTE was dirty then it's best to assume it's writable. The
>    709           * caller must use try_to_unmap_flush_dirty() or try_to_unmap_flush()
>    710           * before the page is queued for IO.
>    711           */
>    712          if (writable)
>    713                  tlb_ubc->writable = true;
>    714  }
>    715 
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
