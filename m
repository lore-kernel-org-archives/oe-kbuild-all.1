Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C21860
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 02:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714098537; cv=none; b=CsDnosktJsGYKLez0Oy2hLW916zf3fqYY7GeQWyHf3pUCVPSRqm4t3wOex5RmZ2FapilUu/YkaHRmhtsqKOgv9yT4YR2SwRzj2Xe4ZuexwwxyQIbfTDcz7fcUG1blvrh+aougxCMNnvzFqTw25CL/oT+0ZSOMWBlOyrzhI5RJ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714098537; c=relaxed/simple;
	bh=LZl27n06NKRILSusKBlQy3VJGqe2IeAoo9nGPcS7h3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bc8wHbJ7uxE5yh+gAcC0XdptImrI6jJm0fuQKap3SmKgK8hK+jTtkRyErDITvt/aGDQ/VKVkYp6YKo6Jtjnmb3wdsfaTdsFI0Mr1+jxO4VjW93CWeQO28n1lJ2fos6gpikiHc9jqgZsWfPEjqwTJg7GqK14TRAAh7GKpUyBS1pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcPHeSRG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcPHeSRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714098536; x=1745634536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZl27n06NKRILSusKBlQy3VJGqe2IeAoo9nGPcS7h3w=;
  b=dcPHeSRG6OZKYUBtfuaxALVYmaG+uCeUVDAsua4PygAIt7iUDbFux0s5
   eXBwGRvdoglkeOc0mcX1hsfVrK3nqVUN5JDzxKKKF+EOv1uAYtZ2HYuRH
   eUo1Kl46bjnWDxIoDJ+9d4tfvuwj4l9XkJ8BYzSN/dNH5BIpGTH27331S
   PcTwPpVJge/Q/+npEcsk1He8Pc7OTcYKD6/IQ8/cH0oMsF885JwOkzRGZ
   jyimfGs1tZy7Z86U4doCVRPkTo1baTlCWW5El/2SEs5jvW7BA+MVZ0t3t
   g7lFISydP4DP7DMLKx1ZQI242KdDSbQ2Ag11P7K8igzSppTw6kL0Turaw
   Q==;
X-CSE-ConnectionGUID: ss6AHJ3jRDa5dwHy0ZgvYQ==
X-CSE-MsgGUID: 24/tP04rR2+z4yvMhFFxQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9658972"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9658972"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 19:28:28 -0700
X-CSE-ConnectionGUID: L5yUacLnS66Kn47v9K+1Hw==
X-CSE-MsgGUID: Buks9uPERr2/JSzrKbFVKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="25276470"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Apr 2024 19:28:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0BK4-0003Ag-25;
	Fri, 26 Apr 2024 02:28:24 +0000
Date: Fri, 26 Apr 2024 10:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-next:master 7646/8170] arch/powerpc/kexec/crash.c:488:2-8:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202404261048.skfV5DDB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
commit: 849599b702ef8977fcd5b2f27c61ef773c42bb88 [7646/8170] powerpc/crash: add crash memory hotplug support
config: powerpc-randconfig-r061-20240426 (https://download.01.org/0day-ci/archive/20240426/202404261048.skfV5DDB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261048.skfV5DDB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/kexec/crash.c:488:2-8: WARNING: NULL check before some freeing functions is not needed.

vim +488 arch/powerpc/kexec/crash.c

   418	
   419	/**
   420	 * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
   421	 *			       elfcorehdr in the kexec segment array.
   422	 * @image: the active struct kimage
   423	 * @mn: struct memory_notify data handler
   424	 */
   425	static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
   426	{
   427		int ret;
   428		struct crash_mem *cmem = NULL;
   429		struct kexec_segment *ksegment;
   430		void *ptr, *mem, *elfbuf = NULL;
   431		unsigned long elfsz, memsz, base_addr, size;
   432	
   433		ksegment = &image->segment[image->elfcorehdr_index];
   434		mem = (void *) ksegment->mem;
   435		memsz = ksegment->memsz;
   436	
   437		ret = get_crash_memory_ranges(&cmem);
   438		if (ret) {
   439			pr_err("Failed to get crash mem range\n");
   440			return;
   441		}
   442	
   443		/*
   444		 * The hot unplugged memory is part of crash memory ranges,
   445		 * remove it here.
   446		 */
   447		if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
   448			base_addr = PFN_PHYS(mn->start_pfn);
   449			size = mn->nr_pages * PAGE_SIZE;
   450			ret = remove_mem_range(&cmem, base_addr, size);
   451			if (ret) {
   452				pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
   453				goto out;
   454			}
   455		}
   456	
   457		ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
   458		if (ret) {
   459			pr_err("Failed to prepare elf header\n");
   460			goto out;
   461		}
   462	
   463		/*
   464		 * It is unlikely that kernel hit this because elfcorehdr kexec
   465		 * segment (memsz) is built with addition space to accommodate growing
   466		 * number of crash memory ranges while loading the kdump kernel. It is
   467		 * Just to avoid any unforeseen case.
   468		 */
   469		if (elfsz > memsz) {
   470			pr_err("Updated crash elfcorehdr elfsz %lu > memsz %lu", elfsz, memsz);
   471			goto out;
   472		}
   473	
   474		ptr = __va(mem);
   475		if (ptr) {
   476			/* Temporarily invalidate the crash image while it is replaced */
   477			xchg(&kexec_crash_image, NULL);
   478	
   479			/* Replace the old elfcorehdr with newly prepared elfcorehdr */
   480			memcpy((void *)ptr, elfbuf, elfsz);
   481	
   482			/* The crash image is now valid once again */
   483			xchg(&kexec_crash_image, image);
   484		}
   485	out:
   486		kvfree(cmem);
   487		if (elfbuf)
 > 488			kvfree(elfbuf);
   489	}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
