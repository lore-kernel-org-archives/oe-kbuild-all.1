Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11292874FB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176289; cv=none; b=NKOggkmZqagdSUmumaWnZGh1nmBVM/X7XMqz2IqJYctWJM3zfVHegQtiy3MVLPTvd0BdGStetG/EFHp/XENu9OAlL9JXL4o6lFZHUTOXA8mp6TAZuUXN2cfhQIIsbzraBOV2ylQCPQwLu/eJuQ+Iv/kgxYsnMioiFRhGiB91hPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176289; c=relaxed/simple;
	bh=fcSxunUeVV/DX469BbUiYZNeQ2SdVyitRCaimJ/u9LU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OXHQdp1BsTRAJs/0putIxzv9YB1Vz0UParpqlP0RGAZAuNfW+laXazy1yiE2+xofa6FEkZUpiXWq1bWIPwn2CcxFWClUyqPCdB1NPJdo+baykVPRN00XkzfdtM5n2rIKaX4EalmxYYoGIuwKTF7o12trWmb0V916S64Aj/SCbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/TPBriV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/TPBriV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779176288; x=1810712288;
  h=date:from:to:cc:subject:message-id;
  bh=fcSxunUeVV/DX469BbUiYZNeQ2SdVyitRCaimJ/u9LU=;
  b=Z/TPBriVn9/6qy0zSaJvCSD3r0TK6EX7Khz8I3N0F0PsFmrvK1wrLifa
   x4D3EUdszZJpIwfFeD2esMJsfwLBzECcDNI27heK0aYnsd5u+z7lVTkEB
   hYRfjSf5M534n0DU8ZNOiJlDAmvbvudkjZPbGbyYsOqKORMZo2/jXIwmP
   eF6rdxMQ6KR/dbI/0MZwX+0YCotiyCr6WZWW8Vxxlv2u75t5rnkIEgkBn
   rPSvdrkWe56/Sa8SQUTqzAO4C2hzW+de5lUUD//sa3DsX+VzOiIowFWqv
   Hbnd1mn2SFFeSfYtZ5AuF4HoRC7VUp6FJcMT+43odd8Cd7d/YKxYUK5jf
   w==;
X-CSE-ConnectionGUID: I0xJMbNsSkmOuVCG1IyJZQ==
X-CSE-MsgGUID: Tkb9Gn38QCmDz334e0ETyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97479955"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97479955"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 00:38:07 -0700
X-CSE-ConnectionGUID: XCRktqEETS+RNE0FMtaSkQ==
X-CSE-MsgGUID: /lwBigchTGaCQA3UV8Srgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237064826"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 May 2026 00:38:06 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPF1L-000000000ex-34sX;
	Tue, 19 May 2026 07:37:51 +0000
Date: Tue, 19 May 2026 15:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 204/238]
 arch/sparc/kernel/irq_64.c:1105:18-35: WARNING: casting value returned by
 memory allocation function to (struct ino_bucket *) is useless.
Message-ID: <202605191533.aUxx7BYU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: b90e1fb9b371173d99fff60627e54973535325a0 [204/238] sparc/irq: replace __get_free_pages() with kzalloc()
config: sparc64-randconfig-r052-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191533.aUxx7BYU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191533.aUxx7BYU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/sparc/kernel/irq_64.c:1105:18-35: WARNING: casting value returned by memory allocation function to (struct ino_bucket *) is useless.

vim +1105 arch/sparc/kernel/irq_64.c

  1090	
  1091	static void __init irq_ivector_init(void)
  1092	{
  1093		unsigned long size, order;
  1094		unsigned int ivecs;
  1095	
  1096		/* If we are doing cookie only VIRQs then we do not need the ivector
  1097		 * table to process interrupts.
  1098		 */
  1099		if (sun4v_cookie_only_virqs())
  1100			return;
  1101	
  1102		ivecs = size_nr_ivec();
  1103		size = sizeof(struct ino_bucket) * ivecs;
  1104		order = get_order(size);
> 1105		ivector_table = (struct ino_bucket *)kzalloc(PAGE_SIZE << (order), GFP_KERNEL);
  1106		if (!ivector_table) {
  1107			prom_printf("Fatal error, cannot allocate ivector_table\n");
  1108			prom_halt();
  1109		}
  1110		__flush_dcache_range((unsigned long) ivector_table,
  1111				     ((unsigned long) ivector_table) + size);
  1112	
  1113		ivector_table_pa = __pa(ivector_table);
  1114	}
  1115	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
