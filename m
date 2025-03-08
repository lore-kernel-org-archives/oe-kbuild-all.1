Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80571DEFEB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741451113; cv=none; b=OLCWAzE3rwVbAAk/YIuRc6k59PTC0WwqLov557zrn17ZrEzaUAcVxZkvEwZWXi6ts4+ySHtm8kmKycVWTSDlp7n74nY7SMVV4HSPh+cCYHNjoH0coQh04KuGd4uARCKhtvDr/TV96DVpqoxDaC9G9OFB4SPPNlFJj/TdPwQ5788=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741451113; c=relaxed/simple;
	bh=seC2L9jgpdF/avmEWr5vz03wc+CW0MlrgER0srTM2Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsKIqxGETJ8zWiZ1QmXSGEfnFHTvizq+dzKoS+ZJdey3tWHmS3zYUlXi+H4Zrc7+E5sjNTogCXEofit8vM9od3um2WJ+QWDo/MJm75dkxsQ6tm97gIKfb7TE+BkQ7CuglWrHuVASO2A9s8cISJPcSH/ay1ZGoIy6Iej0SSxrsfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqijuM9f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqijuM9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741451112; x=1772987112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seC2L9jgpdF/avmEWr5vz03wc+CW0MlrgER0srTM2Lo=;
  b=mqijuM9fRkweMArHkShKNp7QwwlzuT/rjMWkT1cPksKkHr0m9cvKMS3A
   PHRQRQxFfZC50d8Rt5JcOLxrKw1t+9DJSJck3gB++B3sFbAdTkD3GIdIf
   ib6HJiODbe1ShVSeYYFJmv77cV+m0qVjZNU8WsQLJPf9CKJLA3CCghdZF
   EGZOZ33sA28Pn0K50UYzCbjOPPUM3OBNqniYg36kC868I0rUGWE9qytF2
   26gB0iJZmEeSNLUqxpbB5uJ/qCne5T0xrU9xPQ2ko6tR76LLj/j7h7Mmp
   0DdUMVJI0cdZB1QNj1439pT30fY+WyZMpiTRKiVlpx1/u9qYMtGicRfF7
   Q==;
X-CSE-ConnectionGUID: JTQfiNh3TNO/EqyIj/TvmQ==
X-CSE-MsgGUID: y2vyxNoWTt2leSNpYZ4WGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="53471828"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="53471828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 08:25:11 -0800
X-CSE-ConnectionGUID: 3nzVYz41RMa+jdknZqrtxA==
X-CSE-MsgGUID: U6NLyia6QPiLHKhUBJYymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="119582196"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2025 08:25:09 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqwz5-00024O-1O;
	Sat, 08 Mar 2025 16:25:07 +0000
Date: Sun, 9 Mar 2025 00:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:ring-buffer/for-next 1/12]
 kernel/trace/ring_buffer.c:7093:59: error: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202503090029.zj0DretW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/for-next
head:   9042bbf702038634a80b24bca6f0a71160c06bab
commit: 10a299da2c2b95a3daf1171ba82b268f940cc9ed [1/12] ring-buffer: Allow persistent ring buffers to be mmapped
config: arm-randconfig-002-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090029.zj0DretW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090029.zj0DretW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090029.zj0DretW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/page.h:185,
                    from arch/arm/include/asm/thread_info.h:14,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from kernel/trace/ring_buffer.c:7:
   kernel/trace/ring_buffer.c: In function '__rb_map_vma':
>> kernel/trace/ring_buffer.c:7093:59: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    7093 |                 if (virt_addr_valid(cpu_buffer->subbuf_ids[s]))
         |                                     ~~~~~~~~~~~~~~~~~~~~~~^~~
         |                                                           |
         |                                                           long unsigned int
   arch/arm/include/asm/memory.h:386:66: note: in definition of macro 'virt_addr_valid'
     386 |                                         && pfn_valid(virt_to_pfn(kaddr)))
         |                                                                  ^~~~~
   arch/arm/include/asm/memory.h:290:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     290 | static inline unsigned long virt_to_pfn(const void *p)
         |                                         ~~~~~~~~~~~~^


vim +/virt_to_pfn +7093 kernel/trace/ring_buffer.c

  7002	
  7003	/*
  7004	 *   +--------------+  pgoff == 0
  7005	 *   |   meta page  |
  7006	 *   +--------------+  pgoff == 1
  7007	 *   | subbuffer 0  |
  7008	 *   |              |
  7009	 *   +--------------+  pgoff == (1 + (1 << subbuf_order))
  7010	 *   | subbuffer 1  |
  7011	 *   |              |
  7012	 *         ...
  7013	 */
  7014	#ifdef CONFIG_MMU
  7015	static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
  7016				struct vm_area_struct *vma)
  7017	{
  7018		unsigned long nr_subbufs, nr_pages, nr_vma_pages, pgoff = vma->vm_pgoff;
  7019		unsigned int subbuf_pages, subbuf_order;
  7020		struct page **pages;
  7021		int p = 0, s = 0;
  7022		int err;
  7023	
  7024		/* Refuse MP_PRIVATE or writable mappings */
  7025		if (vma->vm_flags & VM_WRITE || vma->vm_flags & VM_EXEC ||
  7026		    !(vma->vm_flags & VM_MAYSHARE))
  7027			return -EPERM;
  7028	
  7029		subbuf_order = cpu_buffer->buffer->subbuf_order;
  7030		subbuf_pages = 1 << subbuf_order;
  7031	
  7032		if (subbuf_order && pgoff % subbuf_pages)
  7033			return -EINVAL;
  7034	
  7035		/*
  7036		 * Make sure the mapping cannot become writable later. Also tell the VM
  7037		 * to not touch these pages (VM_DONTCOPY | VM_DONTEXPAND).
  7038		 */
  7039		vm_flags_mod(vma, VM_DONTCOPY | VM_DONTEXPAND | VM_DONTDUMP,
  7040			     VM_MAYWRITE);
  7041	
  7042		lockdep_assert_held(&cpu_buffer->mapping_lock);
  7043	
  7044		nr_subbufs = cpu_buffer->nr_pages + 1; /* + reader-subbuf */
  7045		nr_pages = ((nr_subbufs + 1) << subbuf_order); /* + meta-page */
  7046		if (nr_pages <= pgoff)
  7047			return -EINVAL;
  7048	
  7049		nr_pages -= pgoff;
  7050	
  7051		nr_vma_pages = vma_pages(vma);
  7052		if (!nr_vma_pages || nr_vma_pages > nr_pages)
  7053			return -EINVAL;
  7054	
  7055		nr_pages = nr_vma_pages;
  7056	
  7057		pages = kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
  7058		if (!pages)
  7059			return -ENOMEM;
  7060	
  7061		if (!pgoff) {
  7062			unsigned long meta_page_padding;
  7063	
  7064			pages[p++] = virt_to_page(cpu_buffer->meta_page);
  7065	
  7066			/*
  7067			 * Pad with the zero-page to align the meta-page with the
  7068			 * sub-buffers.
  7069			 */
  7070			meta_page_padding = subbuf_pages - 1;
  7071			while (meta_page_padding-- && p < nr_pages) {
  7072				unsigned long __maybe_unused zero_addr =
  7073					vma->vm_start + (PAGE_SIZE * p);
  7074	
  7075				pages[p++] = ZERO_PAGE(zero_addr);
  7076			}
  7077		} else {
  7078			/* Skip the meta-page */
  7079			pgoff -= subbuf_pages;
  7080	
  7081			s += pgoff / subbuf_pages;
  7082		}
  7083	
  7084		while (p < nr_pages) {
  7085			struct page *page;
  7086			int off = 0;
  7087	
  7088			if (WARN_ON_ONCE(s >= nr_subbufs)) {
  7089				err = -EINVAL;
  7090				goto out;
  7091			}
  7092	
> 7093			if (virt_addr_valid(cpu_buffer->subbuf_ids[s]))
  7094				page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
  7095			else
  7096				page = vmalloc_to_page((void *)cpu_buffer->subbuf_ids[s]);
  7097	
  7098			for (; off < (1 << (subbuf_order)); off++, page++) {
  7099				if (p >= nr_pages)
  7100					break;
  7101	
  7102				pages[p++] = page;
  7103			}
  7104			s++;
  7105		}
  7106	
  7107		err = vm_insert_pages(vma, vma->vm_start, pages, &nr_pages);
  7108	
  7109	out:
  7110		kfree(pages);
  7111	
  7112		return err;
  7113	}
  7114	#else
  7115	static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
  7116				struct vm_area_struct *vma)
  7117	{
  7118		return -EOPNOTSUPP;
  7119	}
  7120	#endif
  7121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
