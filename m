Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00862210FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 19:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734724277; cv=none; b=gJIFauJP/7NrtrjvEaH3P2m+VmNeFvYM1uN6gI+WZjfYp9HTq8wU8W6rU40dcAMGMKZgvqyPDrKDkwpsQ/0dMqhKmaFrPwiqu/lcEaUypO2V2O5sz3PAwb9xCvpFAPso4hPSYltfbe+yVz7cSBM8aqI2YPGWciKArWR+S5at/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734724277; c=relaxed/simple;
	bh=FDIeu/NO2Kh5OTc2+LdatULUYR2XTdCkbmdOqmgPY1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1mRNbitE3qUX8gauQvfijL9Bo87IUb4VfA2LJWUkISHy2oDcdk3WlbBZ4+woAGw+A+h4KzJBv6iOR4CiRAKztlANv/d5Su194ydyaOnAeYReNKJkOgGq40ERPuOrohj+SZb33QY/GqfXXuFzAErdaKiNfB7aAu4+V3s1eTYxsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UU5639Ib; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UU5639Ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734724275; x=1766260275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FDIeu/NO2Kh5OTc2+LdatULUYR2XTdCkbmdOqmgPY1o=;
  b=UU5639IbUPrwvvBwdcWmLbJu68o5DcowJFFb7hQKK/2f5dkYjuH6MDsQ
   clS3L+AIZuHakTkZ4ANY7BMa95vNVfWLD41QoKz7lfAZ+oZa0jXcJw4RP
   rm02zXQ2AyNaIsqO37cUiqS9+IosasfquQHiOkFmEFOdm8jkmNrCROJvY
   tGCERLv3RIhz/HPo5FA9VRjYpUY8y37cl7FDgbfIKOMY3LT5kKFUFVQWq
   vQy2EP3NVEl1LCHbLGe37EjquaOIuxgJPGtLJkC5/8y0ZLa+HU4F+6Ob4
   roGF6CueEbYcjEZcCZrREpKP5F1ykGtgumwkXsu3AAG6UkZvMwVr2hOxs
   Q==;
X-CSE-ConnectionGUID: xMBtTKlzSTSWJuJeZi9dqQ==
X-CSE-MsgGUID: im2zSKCdRgGNl7hjpBlU1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57755518"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="57755518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 11:51:12 -0800
X-CSE-ConnectionGUID: 9Nbh7IoVSMiSa0TVUvLgYQ==
X-CSE-MsgGUID: CvGnwmlGSfG4WtAx8zKrfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135945506"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2024 11:51:10 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOj1f-0001dt-0H;
	Fri, 20 Dec 2024 19:51:07 +0000
Date: Sat, 21 Dec 2024 03:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will.deacon@arm.com>
Subject: arch/arm64/kernel/machine_kexec.c:148: warning: Function parameter
 or struct member 'kimage' not described in 'machine_kexec'
Message-ID: <202412210309.3gp7wpXb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 3ddd9992a590c7462ff22f7cb17d386b83ed0a07 arm64: enable KEXEC_FILE config
date:   6 years ago
config: arm64-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241221/202412210309.3gp7wpXb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210309.3gp7wpXb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210309.3gp7wpXb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/machine_kexec.c:256:6: warning: no previous prototype for 'machine_crash_shutdown' [-Wmissing-prototypes]
     256 | void machine_crash_shutdown(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/machine_kexec.c:36: warning: Function parameter or struct member '_i' not described in 'kexec_image_info'
>> arch/arm64/kernel/machine_kexec.c:72: warning: Function parameter or struct member 'kimage' not described in 'machine_kexec_prepare'
   arch/arm64/kernel/machine_kexec.c:87: warning: Function parameter or struct member 'kimage' not described in 'kexec_list_flush'
>> arch/arm64/kernel/machine_kexec.c:124: warning: Function parameter or struct member 'kimage' not described in 'kexec_segment_flush'
>> arch/arm64/kernel/machine_kexec.c:148: warning: Function parameter or struct member 'kimage' not described in 'machine_kexec'
>> arch/arm64/kernel/machine_kexec.c:257: warning: Function parameter or struct member 'regs' not described in 'machine_crash_shutdown'


vim +148 arch/arm64/kernel/machine_kexec.c

d28f6df1305a86 Geoff Levand    2016-06-23   32  
221f2c770e10d3 Geoff Levand    2016-06-23   33  /**
221f2c770e10d3 Geoff Levand    2016-06-23   34   * kexec_image_info - For debugging output.
221f2c770e10d3 Geoff Levand    2016-06-23   35   */
221f2c770e10d3 Geoff Levand    2016-06-23  @36  #define kexec_image_info(_i) _kexec_image_info(__func__, __LINE__, _i)
221f2c770e10d3 Geoff Levand    2016-06-23   37  static void _kexec_image_info(const char *func, int line,
221f2c770e10d3 Geoff Levand    2016-06-23   38  	const struct kimage *kimage)
221f2c770e10d3 Geoff Levand    2016-06-23   39  {
221f2c770e10d3 Geoff Levand    2016-06-23   40  	unsigned long i;
221f2c770e10d3 Geoff Levand    2016-06-23   41  
221f2c770e10d3 Geoff Levand    2016-06-23   42  	pr_debug("%s:%d:\n", func, line);
221f2c770e10d3 Geoff Levand    2016-06-23   43  	pr_debug("  kexec kimage info:\n");
221f2c770e10d3 Geoff Levand    2016-06-23   44  	pr_debug("    type:        %d\n", kimage->type);
221f2c770e10d3 Geoff Levand    2016-06-23   45  	pr_debug("    start:       %lx\n", kimage->start);
221f2c770e10d3 Geoff Levand    2016-06-23   46  	pr_debug("    head:        %lx\n", kimage->head);
221f2c770e10d3 Geoff Levand    2016-06-23   47  	pr_debug("    nr_segments: %lu\n", kimage->nr_segments);
221f2c770e10d3 Geoff Levand    2016-06-23   48  
221f2c770e10d3 Geoff Levand    2016-06-23   49  	for (i = 0; i < kimage->nr_segments; i++) {
221f2c770e10d3 Geoff Levand    2016-06-23   50  		pr_debug("      segment[%lu]: %016lx - %016lx, 0x%lx bytes, %lu pages\n",
221f2c770e10d3 Geoff Levand    2016-06-23   51  			i,
221f2c770e10d3 Geoff Levand    2016-06-23   52  			kimage->segment[i].mem,
221f2c770e10d3 Geoff Levand    2016-06-23   53  			kimage->segment[i].mem + kimage->segment[i].memsz,
221f2c770e10d3 Geoff Levand    2016-06-23   54  			kimage->segment[i].memsz,
221f2c770e10d3 Geoff Levand    2016-06-23   55  			kimage->segment[i].memsz /  PAGE_SIZE);
221f2c770e10d3 Geoff Levand    2016-06-23   56  	}
221f2c770e10d3 Geoff Levand    2016-06-23   57  }
221f2c770e10d3 Geoff Levand    2016-06-23   58  
d28f6df1305a86 Geoff Levand    2016-06-23   59  void machine_kexec_cleanup(struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23   60  {
d28f6df1305a86 Geoff Levand    2016-06-23   61  	/* Empty routine needed to avoid build errors. */
d28f6df1305a86 Geoff Levand    2016-06-23   62  }
d28f6df1305a86 Geoff Levand    2016-06-23   63  
d28f6df1305a86 Geoff Levand    2016-06-23   64  /**
d28f6df1305a86 Geoff Levand    2016-06-23   65   * machine_kexec_prepare - Prepare for a kexec reboot.
d28f6df1305a86 Geoff Levand    2016-06-23   66   *
d28f6df1305a86 Geoff Levand    2016-06-23   67   * Called from the core kexec code when a kernel image is loaded.
d28f6df1305a86 Geoff Levand    2016-06-23   68   * Forbid loading a kexec kernel if we have no way of hotplugging cpus or cpus
d28f6df1305a86 Geoff Levand    2016-06-23   69   * are stuck in the kernel. This avoids a panic once we hit machine_kexec().
d28f6df1305a86 Geoff Levand    2016-06-23   70   */
d28f6df1305a86 Geoff Levand    2016-06-23   71  int machine_kexec_prepare(struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23  @72  {
221f2c770e10d3 Geoff Levand    2016-06-23   73  	kexec_image_info(kimage);
221f2c770e10d3 Geoff Levand    2016-06-23   74  
d28f6df1305a86 Geoff Levand    2016-06-23   75  	if (kimage->type != KEXEC_TYPE_CRASH && cpus_are_stuck_in_kernel()) {
d28f6df1305a86 Geoff Levand    2016-06-23   76  		pr_err("Can't kexec: CPUs are stuck in the kernel.\n");
d28f6df1305a86 Geoff Levand    2016-06-23   77  		return -EBUSY;
d28f6df1305a86 Geoff Levand    2016-06-23   78  	}
d28f6df1305a86 Geoff Levand    2016-06-23   79  
d28f6df1305a86 Geoff Levand    2016-06-23   80  	return 0;
d28f6df1305a86 Geoff Levand    2016-06-23   81  }
d28f6df1305a86 Geoff Levand    2016-06-23   82  
d28f6df1305a86 Geoff Levand    2016-06-23   83  /**
d28f6df1305a86 Geoff Levand    2016-06-23   84   * kexec_list_flush - Helper to flush the kimage list and source pages to PoC.
d28f6df1305a86 Geoff Levand    2016-06-23   85   */
d28f6df1305a86 Geoff Levand    2016-06-23   86  static void kexec_list_flush(struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23   87  {
d28f6df1305a86 Geoff Levand    2016-06-23   88  	kimage_entry_t *entry;
d28f6df1305a86 Geoff Levand    2016-06-23   89  
d28f6df1305a86 Geoff Levand    2016-06-23   90  	for (entry = &kimage->head; ; entry++) {
d28f6df1305a86 Geoff Levand    2016-06-23   91  		unsigned int flag;
d28f6df1305a86 Geoff Levand    2016-06-23   92  		void *addr;
d28f6df1305a86 Geoff Levand    2016-06-23   93  
d28f6df1305a86 Geoff Levand    2016-06-23   94  		/* flush the list entries. */
d28f6df1305a86 Geoff Levand    2016-06-23   95  		__flush_dcache_area(entry, sizeof(kimage_entry_t));
d28f6df1305a86 Geoff Levand    2016-06-23   96  
d28f6df1305a86 Geoff Levand    2016-06-23   97  		flag = *entry & IND_FLAGS;
d28f6df1305a86 Geoff Levand    2016-06-23   98  		if (flag == IND_DONE)
d28f6df1305a86 Geoff Levand    2016-06-23   99  			break;
d28f6df1305a86 Geoff Levand    2016-06-23  100  
d28f6df1305a86 Geoff Levand    2016-06-23  101  		addr = phys_to_virt(*entry & PAGE_MASK);
d28f6df1305a86 Geoff Levand    2016-06-23  102  
d28f6df1305a86 Geoff Levand    2016-06-23  103  		switch (flag) {
d28f6df1305a86 Geoff Levand    2016-06-23  104  		case IND_INDIRECTION:
d28f6df1305a86 Geoff Levand    2016-06-23  105  			/* Set entry point just before the new list page. */
d28f6df1305a86 Geoff Levand    2016-06-23  106  			entry = (kimage_entry_t *)addr - 1;
d28f6df1305a86 Geoff Levand    2016-06-23  107  			break;
d28f6df1305a86 Geoff Levand    2016-06-23  108  		case IND_SOURCE:
d28f6df1305a86 Geoff Levand    2016-06-23  109  			/* flush the source pages. */
d28f6df1305a86 Geoff Levand    2016-06-23  110  			__flush_dcache_area(addr, PAGE_SIZE);
d28f6df1305a86 Geoff Levand    2016-06-23  111  			break;
d28f6df1305a86 Geoff Levand    2016-06-23  112  		case IND_DESTINATION:
d28f6df1305a86 Geoff Levand    2016-06-23  113  			break;
d28f6df1305a86 Geoff Levand    2016-06-23  114  		default:
d28f6df1305a86 Geoff Levand    2016-06-23  115  			BUG();
d28f6df1305a86 Geoff Levand    2016-06-23  116  		}
d28f6df1305a86 Geoff Levand    2016-06-23  117  	}
d28f6df1305a86 Geoff Levand    2016-06-23  118  }
d28f6df1305a86 Geoff Levand    2016-06-23  119  
d28f6df1305a86 Geoff Levand    2016-06-23  120  /**
d28f6df1305a86 Geoff Levand    2016-06-23  121   * kexec_segment_flush - Helper to flush the kimage segments to PoC.
d28f6df1305a86 Geoff Levand    2016-06-23  122   */
d28f6df1305a86 Geoff Levand    2016-06-23  123  static void kexec_segment_flush(const struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23 @124  {
d28f6df1305a86 Geoff Levand    2016-06-23  125  	unsigned long i;
d28f6df1305a86 Geoff Levand    2016-06-23  126  
d28f6df1305a86 Geoff Levand    2016-06-23  127  	pr_debug("%s:\n", __func__);
d28f6df1305a86 Geoff Levand    2016-06-23  128  
d28f6df1305a86 Geoff Levand    2016-06-23  129  	for (i = 0; i < kimage->nr_segments; i++) {
d28f6df1305a86 Geoff Levand    2016-06-23  130  		pr_debug("  segment[%lu]: %016lx - %016lx, 0x%lx bytes, %lu pages\n",
d28f6df1305a86 Geoff Levand    2016-06-23  131  			i,
d28f6df1305a86 Geoff Levand    2016-06-23  132  			kimage->segment[i].mem,
d28f6df1305a86 Geoff Levand    2016-06-23  133  			kimage->segment[i].mem + kimage->segment[i].memsz,
d28f6df1305a86 Geoff Levand    2016-06-23  134  			kimage->segment[i].memsz,
d28f6df1305a86 Geoff Levand    2016-06-23  135  			kimage->segment[i].memsz /  PAGE_SIZE);
d28f6df1305a86 Geoff Levand    2016-06-23  136  
d28f6df1305a86 Geoff Levand    2016-06-23  137  		__flush_dcache_area(phys_to_virt(kimage->segment[i].mem),
d28f6df1305a86 Geoff Levand    2016-06-23  138  			kimage->segment[i].memsz);
d28f6df1305a86 Geoff Levand    2016-06-23  139  	}
d28f6df1305a86 Geoff Levand    2016-06-23  140  }
d28f6df1305a86 Geoff Levand    2016-06-23  141  
d28f6df1305a86 Geoff Levand    2016-06-23  142  /**
d28f6df1305a86 Geoff Levand    2016-06-23  143   * machine_kexec - Do the kexec reboot.
d28f6df1305a86 Geoff Levand    2016-06-23  144   *
d28f6df1305a86 Geoff Levand    2016-06-23  145   * Called from the core kexec code for a sys_reboot with LINUX_REBOOT_CMD_KEXEC.
d28f6df1305a86 Geoff Levand    2016-06-23  146   */
d28f6df1305a86 Geoff Levand    2016-06-23  147  void machine_kexec(struct kimage *kimage)
d28f6df1305a86 Geoff Levand    2016-06-23 @148  {
d28f6df1305a86 Geoff Levand    2016-06-23  149  	phys_addr_t reboot_code_buffer_phys;
d28f6df1305a86 Geoff Levand    2016-06-23  150  	void *reboot_code_buffer;
78fd584cdec051 AKASHI Takahiro 2017-04-03  151  	bool in_kexec_crash = (kimage == kexec_crash_image);
78fd584cdec051 AKASHI Takahiro 2017-04-03  152  	bool stuck_cpus = cpus_are_stuck_in_kernel();
d28f6df1305a86 Geoff Levand    2016-06-23  153  
d28f6df1305a86 Geoff Levand    2016-06-23  154  	/*
d28f6df1305a86 Geoff Levand    2016-06-23  155  	 * New cpus may have become stuck_in_kernel after we loaded the image.
d28f6df1305a86 Geoff Levand    2016-06-23  156  	 */
78fd584cdec051 AKASHI Takahiro 2017-04-03  157  	BUG_ON(!in_kexec_crash && (stuck_cpus || (num_online_cpus() > 1)));
78fd584cdec051 AKASHI Takahiro 2017-04-03  158  	WARN(in_kexec_crash && (stuck_cpus || smp_crash_stop_failed()),
78fd584cdec051 AKASHI Takahiro 2017-04-03  159  		"Some CPUs may be stale, kdump will be unreliable.\n");
d28f6df1305a86 Geoff Levand    2016-06-23  160  
d28f6df1305a86 Geoff Levand    2016-06-23  161  	reboot_code_buffer_phys = page_to_phys(kimage->control_code_page);
d28f6df1305a86 Geoff Levand    2016-06-23  162  	reboot_code_buffer = phys_to_virt(reboot_code_buffer_phys);
d28f6df1305a86 Geoff Levand    2016-06-23  163  
221f2c770e10d3 Geoff Levand    2016-06-23  164  	kexec_image_info(kimage);
221f2c770e10d3 Geoff Levand    2016-06-23  165  
221f2c770e10d3 Geoff Levand    2016-06-23  166  	pr_debug("%s:%d: control_code_page:        %p\n", __func__, __LINE__,
221f2c770e10d3 Geoff Levand    2016-06-23  167  		kimage->control_code_page);
221f2c770e10d3 Geoff Levand    2016-06-23  168  	pr_debug("%s:%d: reboot_code_buffer_phys:  %pa\n", __func__, __LINE__,
221f2c770e10d3 Geoff Levand    2016-06-23  169  		&reboot_code_buffer_phys);
221f2c770e10d3 Geoff Levand    2016-06-23  170  	pr_debug("%s:%d: reboot_code_buffer:       %p\n", __func__, __LINE__,
221f2c770e10d3 Geoff Levand    2016-06-23  171  		reboot_code_buffer);
221f2c770e10d3 Geoff Levand    2016-06-23  172  	pr_debug("%s:%d: relocate_new_kernel:      %p\n", __func__, __LINE__,
221f2c770e10d3 Geoff Levand    2016-06-23  173  		arm64_relocate_new_kernel);
221f2c770e10d3 Geoff Levand    2016-06-23  174  	pr_debug("%s:%d: relocate_new_kernel_size: 0x%lx(%lu) bytes\n",
221f2c770e10d3 Geoff Levand    2016-06-23  175  		__func__, __LINE__, arm64_relocate_new_kernel_size,
221f2c770e10d3 Geoff Levand    2016-06-23  176  		arm64_relocate_new_kernel_size);
221f2c770e10d3 Geoff Levand    2016-06-23  177  
d28f6df1305a86 Geoff Levand    2016-06-23  178  	/*
d28f6df1305a86 Geoff Levand    2016-06-23  179  	 * Copy arm64_relocate_new_kernel to the reboot_code_buffer for use
d28f6df1305a86 Geoff Levand    2016-06-23  180  	 * after the kernel is shut down.
d28f6df1305a86 Geoff Levand    2016-06-23  181  	 */
d28f6df1305a86 Geoff Levand    2016-06-23  182  	memcpy(reboot_code_buffer, arm64_relocate_new_kernel,
d28f6df1305a86 Geoff Levand    2016-06-23  183  		arm64_relocate_new_kernel_size);
d28f6df1305a86 Geoff Levand    2016-06-23  184  
d28f6df1305a86 Geoff Levand    2016-06-23  185  	/* Flush the reboot_code_buffer in preparation for its execution. */
d28f6df1305a86 Geoff Levand    2016-06-23  186  	__flush_dcache_area(reboot_code_buffer, arm64_relocate_new_kernel_size);
dcab90d90935f9 Will Deacon     2018-07-31  187  
dcab90d90935f9 Will Deacon     2018-07-31  188  	/*
dcab90d90935f9 Will Deacon     2018-07-31  189  	 * Although we've killed off the secondary CPUs, we don't update
dcab90d90935f9 Will Deacon     2018-07-31  190  	 * the online mask if we're handling a crash kernel and consequently
dcab90d90935f9 Will Deacon     2018-07-31  191  	 * need to avoid flush_icache_range(), which will attempt to IPI
dcab90d90935f9 Will Deacon     2018-07-31  192  	 * the offline CPUs. Therefore, we must use the __* variant here.
dcab90d90935f9 Will Deacon     2018-07-31  193  	 */
140aada48b5f1a Dave Kleikamp   2018-07-30  194  	__flush_icache_range((uintptr_t)reboot_code_buffer,
d28f6df1305a86 Geoff Levand    2016-06-23  195  			     arm64_relocate_new_kernel_size);
d28f6df1305a86 Geoff Levand    2016-06-23  196  
d28f6df1305a86 Geoff Levand    2016-06-23  197  	/* Flush the kimage list and its buffers. */
d28f6df1305a86 Geoff Levand    2016-06-23  198  	kexec_list_flush(kimage);
d28f6df1305a86 Geoff Levand    2016-06-23  199  
d28f6df1305a86 Geoff Levand    2016-06-23  200  	/* Flush the new image if already in place. */
98d2e1539b84ab Takahiro Akashi 2017-04-03  201  	if ((kimage != kexec_crash_image) && (kimage->head & IND_DONE))
d28f6df1305a86 Geoff Levand    2016-06-23  202  		kexec_segment_flush(kimage);
d28f6df1305a86 Geoff Levand    2016-06-23  203  
d28f6df1305a86 Geoff Levand    2016-06-23  204  	pr_info("Bye!\n");
d28f6df1305a86 Geoff Levand    2016-06-23  205  
0fbeb318754860 James Morse     2017-11-02  206  	local_daif_mask();
d28f6df1305a86 Geoff Levand    2016-06-23  207  
d28f6df1305a86 Geoff Levand    2016-06-23  208  	/*
d28f6df1305a86 Geoff Levand    2016-06-23  209  	 * cpu_soft_restart will shutdown the MMU, disable data caches, then
d28f6df1305a86 Geoff Levand    2016-06-23  210  	 * transfer control to the reboot_code_buffer which contains a copy of
d28f6df1305a86 Geoff Levand    2016-06-23  211  	 * the arm64_relocate_new_kernel routine.  arm64_relocate_new_kernel
d28f6df1305a86 Geoff Levand    2016-06-23  212  	 * uses physical addressing to relocate the new image to its final
d28f6df1305a86 Geoff Levand    2016-06-23  213  	 * position and transfers control to the image entry point when the
d28f6df1305a86 Geoff Levand    2016-06-23  214  	 * relocation is complete.
d28f6df1305a86 Geoff Levand    2016-06-23  215  	 */
d28f6df1305a86 Geoff Levand    2016-06-23  216  
76f4e2da45b44b Mark Rutland    2018-07-02  217  	cpu_soft_restart(reboot_code_buffer_phys, kimage->head, kimage->start, 0);
d28f6df1305a86 Geoff Levand    2016-06-23  218  
d28f6df1305a86 Geoff Levand    2016-06-23  219  	BUG(); /* Should never get here. */
d28f6df1305a86 Geoff Levand    2016-06-23  220  }
d28f6df1305a86 Geoff Levand    2016-06-23  221  
78fd584cdec051 AKASHI Takahiro 2017-04-03  222  static void machine_kexec_mask_interrupts(void)
78fd584cdec051 AKASHI Takahiro 2017-04-03  223  {
78fd584cdec051 AKASHI Takahiro 2017-04-03  224  	unsigned int i;
78fd584cdec051 AKASHI Takahiro 2017-04-03  225  	struct irq_desc *desc;
78fd584cdec051 AKASHI Takahiro 2017-04-03  226  
78fd584cdec051 AKASHI Takahiro 2017-04-03  227  	for_each_irq_desc(i, desc) {
78fd584cdec051 AKASHI Takahiro 2017-04-03  228  		struct irq_chip *chip;
78fd584cdec051 AKASHI Takahiro 2017-04-03  229  		int ret;
78fd584cdec051 AKASHI Takahiro 2017-04-03  230  
78fd584cdec051 AKASHI Takahiro 2017-04-03  231  		chip = irq_desc_get_chip(desc);
78fd584cdec051 AKASHI Takahiro 2017-04-03  232  		if (!chip)
78fd584cdec051 AKASHI Takahiro 2017-04-03  233  			continue;
78fd584cdec051 AKASHI Takahiro 2017-04-03  234  
78fd584cdec051 AKASHI Takahiro 2017-04-03  235  		/*
78fd584cdec051 AKASHI Takahiro 2017-04-03  236  		 * First try to remove the active state. If this
78fd584cdec051 AKASHI Takahiro 2017-04-03  237  		 * fails, try to EOI the interrupt.
78fd584cdec051 AKASHI Takahiro 2017-04-03  238  		 */
78fd584cdec051 AKASHI Takahiro 2017-04-03  239  		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
78fd584cdec051 AKASHI Takahiro 2017-04-03  240  
78fd584cdec051 AKASHI Takahiro 2017-04-03  241  		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
78fd584cdec051 AKASHI Takahiro 2017-04-03  242  		    chip->irq_eoi)
78fd584cdec051 AKASHI Takahiro 2017-04-03  243  			chip->irq_eoi(&desc->irq_data);
78fd584cdec051 AKASHI Takahiro 2017-04-03  244  
78fd584cdec051 AKASHI Takahiro 2017-04-03  245  		if (chip->irq_mask)
78fd584cdec051 AKASHI Takahiro 2017-04-03  246  			chip->irq_mask(&desc->irq_data);
78fd584cdec051 AKASHI Takahiro 2017-04-03  247  
78fd584cdec051 AKASHI Takahiro 2017-04-03  248  		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
78fd584cdec051 AKASHI Takahiro 2017-04-03  249  			chip->irq_disable(&desc->irq_data);
78fd584cdec051 AKASHI Takahiro 2017-04-03  250  	}
78fd584cdec051 AKASHI Takahiro 2017-04-03  251  }
78fd584cdec051 AKASHI Takahiro 2017-04-03  252  
78fd584cdec051 AKASHI Takahiro 2017-04-03  253  /**
78fd584cdec051 AKASHI Takahiro 2017-04-03  254   * machine_crash_shutdown - shutdown non-crashing cpus and save registers
78fd584cdec051 AKASHI Takahiro 2017-04-03  255   */
d28f6df1305a86 Geoff Levand    2016-06-23 @256  void machine_crash_shutdown(struct pt_regs *regs)
d28f6df1305a86 Geoff Levand    2016-06-23 @257  {
78fd584cdec051 AKASHI Takahiro 2017-04-03  258  	local_irq_disable();
78fd584cdec051 AKASHI Takahiro 2017-04-03  259  
78fd584cdec051 AKASHI Takahiro 2017-04-03  260  	/* shutdown non-crashing cpus */
a88ce63b642cf8 Hoeun Ryu       2017-08-17  261  	crash_smp_send_stop();
78fd584cdec051 AKASHI Takahiro 2017-04-03  262  
78fd584cdec051 AKASHI Takahiro 2017-04-03  263  	/* for crashing cpu */
78fd584cdec051 AKASHI Takahiro 2017-04-03  264  	crash_save_cpu(regs, smp_processor_id());
78fd584cdec051 AKASHI Takahiro 2017-04-03  265  	machine_kexec_mask_interrupts();
78fd584cdec051 AKASHI Takahiro 2017-04-03  266  
78fd584cdec051 AKASHI Takahiro 2017-04-03  267  	pr_info("Starting crashdump kernel...\n");
d28f6df1305a86 Geoff Levand    2016-06-23  268  }
98d2e1539b84ab Takahiro Akashi 2017-04-03  269  

:::::: The code at line 148 was first introduced by commit
:::::: d28f6df1305a86715e4e7ea0f043ba01c0a0e8d9 arm64/kexec: Add core kexec support

:::::: TO: Geoff Levand <geoff@infradead.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
