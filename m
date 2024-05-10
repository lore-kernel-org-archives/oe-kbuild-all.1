Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B428F567D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 00:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299956; cv=none; b=sWuVehbZyDhH9R2GUtUNl41INJYJwgAEIF83zy4Fu+PGi0F43vuDd182o72GY0nO+Nj2F6agTGsGC4BJTkh7D26gpqCfRT4n8v2M68Ozf76ydaE+3FZIHiea+mNeqoaZGHYubx9/VV+31FX3plQ5c314ZBsDa6+kJDUsn3tRGkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299956; c=relaxed/simple;
	bh=gEiNR9xH2FUtj0nWqGrfKelwlLQ3L4PTSxMFLs0GzoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pvca0GzUgUpCSWU8/mOMe7/BveXGtO+qq4QNAkZeZETwAWcQFdYIBrArOxunThlfS1P8intQBL9GhbNXD3n2tlABOUb2NMcDSAOUg5IFbkCy0m+L8gXpQpHip97qJaR8pFTloobZRg1IuLVletXJBslvRbGgklpvIH2deAQSElk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdrLAE1e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdrLAE1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715299954; x=1746835954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gEiNR9xH2FUtj0nWqGrfKelwlLQ3L4PTSxMFLs0GzoM=;
  b=PdrLAE1eMEBaYA7nuBJfv9BuFibSgkNjt2X5fCWJrXjCvl9tlUyiba3b
   ey8M+I/7cHaoNdPvlG2GXwzqXfAwfPzyEVoy0c+yxU+bSs2+XFMdash3x
   jB5U7pc4Fhvoakas6B+N1tXf3JKndimhPsLHfDv4nKBRCPy/3hmRj1uFI
   3brXeJE5PpZJDkjr8LcJecxAJ51SNeie0BV7gfqvruF7mWGOiJbWXAXRx
   p+hzeStT/jSZnTcG5oPz3CKCNIB/s78U6IrKCB9fmWa7rp8+kSYN/OTIv
   GDpPitJmYi8ed+SEYHuI7RXdOtdkIe/TGVkHGhDe2aCKNqaYXBGI4Dt7e
   g==;
X-CSE-ConnectionGUID: KXgUKJYvRmqEhDBLgISn5Q==
X-CSE-MsgGUID: kvDsBDXHQsuzxO9tTkbt4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11118337"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="11118337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 17:12:34 -0700
X-CSE-ConnectionGUID: lfnY1CtiR/KaWnKrb5nwtQ==
X-CSE-MsgGUID: d/Z75nJDST2suEqh2PKIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="29984804"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2024 17:12:30 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5DsC-0005Wb-1l;
	Fri, 10 May 2024 00:12:28 +0000
Date: Fri, 10 May 2024 08:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6582/6589] arch/x86/kernel/head64.c:382:12:
 warning: no previous prototype for 'early_clflush_bss_decrypted_section'
Message-ID: <202405100811.hH76OOyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   d0eb7cacd63172450be962cb9d33123dac03b1fa
commit: a232fa20af9767823243e08b945dbd150a280769 [6582/6589] x86/head/64: Flush caches for .bss..decrypted section after CR3 switches to early_top_pgt
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240510/202405100811.hH76OOyk-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100811.hH76OOyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100811.hH76OOyk-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head64.c:382:12: warning: no previous prototype for 'early_clflush_bss_decrypted_section' [-Wmissing-prototypes]
     382 | void __ref early_clflush_bss_decrypted_section(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/early_clflush_bss_decrypted_section +382 arch/x86/kernel/head64.c

   381	
 > 382	void __ref early_clflush_bss_decrypted_section(void)
   383	{
   384		unsigned long vaddr, vaddr_end;
   385		char *cl, *start, *end;
   386	
   387		/* Only allow bsp flush these caches and the bsp must at early boot stage */
   388		if (bsp_flush_bss_decrypted_section_handled)
   389			return;
   390	
   391		if (read_cr3_pa() != __pa_nodebug(early_top_pgt))
   392			return;
   393	
   394		/* Only Hygon CSV guest should do the clflush */
   395		if (!__should_do_clflush())
   396			goto handled;
   397	
   398		/*
   399		 * The memory region of .bss..decrypted section maybe mapped
   400		 * with encryption in earlier stage. If the correspond stale
   401		 * caches lives in earlier stage were not flushed before we
   402		 * access that memory region, then Linux will crash later
   403		 * because the stale caches will pollute the memory. So we
   404		 * need flush the caches with encrypted mapping before we
   405		 * access .bss..decrypted section.
   406		 *
   407		 * The function __startup_64() have already filled the
   408		 * encrypted mapping for .bss..decrypted section, use that
   409		 * mapping here.
   410		 */
   411		vaddr = (unsigned long)__start_bss_decrypted -
   412					__START_KERNEL_map + phys_base;
   413		vaddr_end = (unsigned long)__end_bss_decrypted -
   414					__START_KERNEL_map + phys_base;
   415	
   416		/* Hardcode cl-size to 64 at this stage. */
   417		start = (char *)(vaddr & ~63);
   418		end   = (char *)((vaddr_end + 63) & ~63);
   419	
   420		asm volatile("mfence" : : : "memory");
   421		for (cl = start; cl != end; cl += 64)
   422			clflush(cl);
   423		asm volatile("mfence" : : : "memory");
   424	
   425	handled:
   426		bsp_flush_bss_decrypted_section_handled = true;
   427	}
   428	#endif
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
