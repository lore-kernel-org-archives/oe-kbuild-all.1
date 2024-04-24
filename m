Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E4E16F0C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 23:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714001618; cv=none; b=YcdJqJ1/eembUqmWHngc7h+T7MmaWPgDXf1dDpJ87JzqUMIMK6Wt6SjK4wrOl1ayamDJS7nyezLN+lvoUOwMTDtg/yEX8Fce2R8eN4EbGTOJ4V2/xeuuUKfvaLnhSQiNzzReqSdm68DZg87IhC1FDtJx6g8ZE3mpV8ZPZulKtuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714001618; c=relaxed/simple;
	bh=BHpfwlEeOE/dJpflIOXBloyigcMQrSdZK4AM65AANPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQ624mJQUh5ndNLFXQZmwidNgB7Ge/eyUKpy5b3ka9UMa+YJtdQ2qjzEpCh/kBtIAghZ/TkyI8gNEVuW8KvM4f0hB4aOt7s1ZXHONU2PYsMrFWLDw1hCoWe1yhgyQHqksXthUW2X19/1R7aDJKoE1sCW2rOIO7u5i1+YoMxD5PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIHF4liE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIHF4liE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714001617; x=1745537617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BHpfwlEeOE/dJpflIOXBloyigcMQrSdZK4AM65AANPM=;
  b=OIHF4liEoiGs2NqnvsAMWBgUC5bF5e0kIC9fgE7cBktiCfTvVvkHN/5l
   gNs58vJwauEfhfJeNGdNPitQc4Ra+N9PpJXdrJUQVLSVsHt+zuYcwa3V0
   yrP9ixeZRnycuJcCHhJ52KvDHK8YsxSYxrIcpHitgU4nSuFwuC+pZvp8H
   JTWdnIq0RSnToLdYJEQwwgXnsgptKfh59RRHY7H7DWvaUgmsK0CGrnSVd
   G7PgSO3jLri3mvegUNa2PTn95gXEkg9/lgI/gWPiNBrBKfBOQ45G4LAYx
   lCZmBmBby9RByCL6W87MrayDqd3n3Mt5YpvFM0GxcUDDZPKhUBBpKje5t
   Q==;
X-CSE-ConnectionGUID: 5SyBE8ZNSh2OpywdZdS/+w==
X-CSE-MsgGUID: zFaC8xBISDaqMzJxgNeKsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9589665"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="9589665"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 16:33:36 -0700
X-CSE-ConnectionGUID: nJmoW4fzT8m88sFjf5HMqA==
X-CSE-MsgGUID: frbfUTPDQRixZPesQrhtSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="24916323"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2024 16:33:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzm7I-0001m0-0m;
	Wed, 24 Apr 2024 23:33:32 +0000
Date: Thu, 25 Apr 2024 07:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13534/30000] ld: fs/proc/base.o:undefined
 reference to `proc_mm_idle_operations'
Message-ID: <202404250742.DVzPAKge-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fca9656c7bff35049038766e63e93888847b5bff
commit: 4232d9005401d839ceeb1a02da34749b6dab1376 [13534/30000] etmem: add CONFIG_ETMEM macro definition for etmem feature
config: x86_64-randconfig-014-20240425 (https://download.01.org/0day-ci/archive/20240425/202404250742.DVzPAKge-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250742.DVzPAKge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250742.DVzPAKge-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
>> ld: fs/proc/base.o:(.rodata+0x18c0): undefined reference to `proc_mm_idle_operations'
>> ld: fs/proc/base.o:(.rodata+0x18e8): undefined reference to `proc_mm_swap_operations'
   ld: fs/proc/base.o:(.rodata+0x2420): undefined reference to `proc_mm_idle_operations'
   ld: fs/proc/base.o:(.rodata+0x2448): undefined reference to `proc_mm_swap_operations'
   ld: fs/proc/etmem_scan.o: in function `page_scan_entry':
   fs/proc/etmem_scan.c:1339:(.text+0x189): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1339:(.text+0x1b4): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1340:(.text+0x1c5): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1341:(.text+0x1e4): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1340:(.text+0x1f5): undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.o:fs/proc/etmem_scan.c:1342: more undefined references to `proc_page_scan_operations' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
