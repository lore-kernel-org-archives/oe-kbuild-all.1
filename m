Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAF2C2D8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 20:28:21 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-57688a146ecso14556077b3.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Jul 2023 13:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688675301; x=1691267301;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4yBoBqkuHHLErDtkRA95ZESYPLO0uJaqPBtH9i1rZ8=;
        b=5ymwnM/O8Ja1dLTg3DB062DnzPPpFoyt0ETRRP2xJ7Fv+9QGvqvLsD8oMR3Jv+odcj
         dXylo65QtsPONwBTRY77rZ/45p59Ycft2Hy3vL+EiipUT333yaWi50IzEtuVMcbA7mB+
         B3W6yW9Y5YTZgtMZQSHwc+rg3uWfF1RFPcmcSGXWGCNGyNiV38pIiQMmOcS9j2y1WQJn
         5t7l+9/flq1Towc0bgq1dKQr5R1GN3uy+5g/84Gz+H1xPs3TIxzC6FpmZCLG79WyrmiC
         45ogGOAkSVGyp5YPwbPqbwB8fg2AMUPJKjyufVLUi56aZs1q//oGUiZru9mtYtBc46ej
         e/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688675301; x=1691267301;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4yBoBqkuHHLErDtkRA95ZESYPLO0uJaqPBtH9i1rZ8=;
        b=NXzCALcHQ1LY/etCzVrmyXPgu0L0FUu4jPGLtQB2akAvFdbJTzyKMYaJYU9y/FeMcl
         rJvvo6PSleB8sd8chWlDKV5Ew0BTNazS4YLd04f3HRQz6BEfCC/fxn+cwS7Dqw46y8J6
         fQV16Ds2XT8YV3EWefcS1+j3mTYP5ytQkHOAvvjWOtNhSrt5jlPniZYcTzcsJHLJJejK
         yT1l6g1sW2BaA5qjw0xWYf3eR/NZo8FPiMHSnEt64C1faN3uoQcTMeExKEvIweZbJ12D
         Gh7WckH0mSmw/cFDg5dEsEfGqDD0MWyT0yPW/zowpARNYIAtl3UWEkrHN66mIEvJdsw3
         EdEg==
X-Gm-Message-State: ABy/qLbLz3SP5MWLA5ydQWym32Yt6uwUmHpR/o8JBqszvXOvo69cD9Ex
	oZ7qX+H664ie1KAfIll+SgWzWg==
X-Google-Smtp-Source: APBJJlFYWTPmoomrRYBZTGe6IkWvWfcCi39lnF7K7Ssrn0V1d0QzPO/j1s5dDp99TeiVzb79QC3MTA==
X-Received: by 2002:a0d:e6c6:0:b0:56f:f40f:9414 with SMTP id p189-20020a0de6c6000000b0056ff40f9414mr3238504ywe.38.1688675300749;
        Thu, 06 Jul 2023 13:28:20 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id s4-20020a817704000000b0057a5302e2fesm373645ywc.5.2023.07.06.13.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 13:28:20 -0700 (PDT)
Date: Thu, 6 Jul 2023 13:28:11 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Hugh Dickins <hughd@google.com>, linux-m68k@lists.linux-m68k.org, 
    oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: arch/m68k/include/asm/mmu_context.h:164 load_ksp_mmu() warn:
 unsigned 'mmuar' is never less than zero.
In-Reply-To: <202307061849.rJKwVbXb-lkp@intel.com>
Message-ID: <11ff8d26-8dbb-6d3a-c488-fd357098414@google.com>
References: <202307061849.rJKwVbXb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Geert,

On Thu, 6 Jul 2023, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c17414a273b81fe4e34e11d69fc30cc8b1431614
> commit: e67b37c368b7cc24b8c0fe5ab6c44422312eab37 m68k: allow pte_offset_map[_lock]() to fail
> date:   2 weeks ago
> config: m68k-randconfig-m031-20230706 (https://download.01.org/0day-ci/archive/20230706/202307061849.rJKwVbXb-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061849.rJKwVbXb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307061849.rJKwVbXb-lkp@intel.com/
> 
> New smatch warnings:
> arch/m68k/include/asm/mmu_context.h:164 load_ksp_mmu() warn: unsigned 'mmuar' is never less than zero.
> 
> Old smatch warnings:
> arch/m68k/include/asm/mmu_context.h:114 load_ksp_mmu() warn: always true condition '(mmuar >= (0)) => (0-u32max >= 0)'
> arch/m68k/include/asm/mmu_context.h:140 load_ksp_mmu() warn: always true condition '(mmuar >= (0)) => (0-u32max >= 0)'
> 
> vim +/mmuar +164 arch/m68k/include/asm/mmu_context.h
> 
>     92	
>     93	static inline void load_ksp_mmu(struct task_struct *task)
>     94	{
>     95		unsigned long flags;
>     96		struct mm_struct *mm;
>     97		int asid;
>     98		pgd_t *pgd;
>     99		p4d_t *p4d;
>    100		pud_t *pud;
>    101		pmd_t *pmd;
>    102		pte_t *pte = NULL;
>    103		unsigned long mmuar;
>    104	
>    105		local_irq_save(flags);
>    106		mmuar = task->thread.ksp;
>    107	
>    108		/* Search for a valid TLB entry, if one is found, don't remap */
>    109		mmu_write(MMUAR, mmuar);
>    110		mmu_write(MMUOR, MMUOR_STLB | MMUOR_ADR);
>    111		if (mmu_read(MMUSR) & MMUSR_HIT)
>    112			goto end;
>    113	
>    114		if (mmuar >= PAGE_OFFSET) {
>    115			mm = &init_mm;
>    116		} else {
>    117			pr_info("load_ksp_mmu: non-kernel mm found: 0x%p\n", task->mm);
>    118			mm = task->mm;
>    119		}
>    120	
>    121		if (!mm)
>    122			goto bug;
>    123	
>    124		pgd = pgd_offset(mm, mmuar);
>    125		if (pgd_none(*pgd))
>    126			goto bug;
>    127	
>    128		p4d = p4d_offset(pgd, mmuar);
>    129		if (p4d_none(*p4d))
>    130			goto bug;
>    131	
>    132		pud = pud_offset(p4d, mmuar);
>    133		if (pud_none(*pud))
>    134			goto bug;
>    135	
>    136		pmd = pmd_offset(pud, mmuar);
>    137		if (pmd_none(*pmd))
>    138			goto bug;
>    139	
>    140		pte = (mmuar >= PAGE_OFFSET) ? pte_offset_kernel(pmd, mmuar)
>    141					     : pte_offset_map(pmd, mmuar);
>    142		if (!pte || pte_none(*pte) || !pte_present(*pte))
>    143			goto bug;
>    144	
>    145		set_pte(pte, pte_mkyoung(*pte));
>    146		asid = mm->context & 0xff;
>    147		if (!pte_dirty(*pte) && mmuar <= PAGE_OFFSET)
>    148			set_pte(pte, pte_wrprotect(*pte));
>    149	
>    150		mmu_write(MMUTR, (mmuar & PAGE_MASK) | (asid << MMUTR_IDN) |
>    151			(((int)(pte->pte) & (int)CF_PAGE_MMUTR_MASK)
>    152			>> CF_PAGE_MMUTR_SHIFT) | MMUTR_V);
>    153	
>    154		mmu_write(MMUDR, (pte_val(*pte) & PAGE_MASK) |
>    155			((pte->pte) & CF_PAGE_MMUDR_MASK) | MMUDR_SZ_8KB | MMUDR_X);
>    156	
>    157		mmu_write(MMUOR, MMUOR_ACC | MMUOR_UAA);
>    158	
>    159		goto end;
>    160	
>    161	bug:
>    162		pr_info("ksp load failed: mm=0x%p ksp=0x08%lx\n", mm, mmuar);
>    163	end:
>  > 164		if (pte && mmuar < PAGE_OFFSET)
>    165			pte_unmap(pte);
>    166		local_irq_restore(flags);
>    167	}
>    168	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I'm sorry, it appears that I've increased the number of smatch warnings on
m68k: but since it was already complaining about "mmuar >= PAGE_OFFSET"s
there, I'm not going to feel very guilty about my "mmuar < PAGE_OFFSET";
and I've no idea of the significance of PAGE_OFFSET 0 on m68k.  Over to
you - but I expect ignoring this will continue to be the right answer :)

Thanks,
Hugh
