Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D615383B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734071994; cv=none; b=NWb5N0R7jbduzM5YfBpJq9YfuUOLCknCH5CW1Wsp1OhExsDjNbxtmT/aKR92LpFYhoopIyzE88oX0JHhsbjt0HpZq1LJufaMov2k/uuk8rEdtOyeMqbyTxwdB+kgoQ3eQ+f8+BzJa9nr8A2aWIy+oH9EKO+8nBPWUVLanPbsw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734071994; c=relaxed/simple;
	bh=f/0euIPUhwetvM5uNIYCncX3k+wIpwQC++MoPqFIqUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQsbdtXHqmfwHt2c9+UchQzeHtUOr9yInhpsGwcwpdKl8cnxhTinuXNR/nfDV/sfyC/01Z0HpklEe4zej+8oV1Mje+P5b3MgRInGmuXxKEw6T1yEkiI5gt94mk/KgPFdjRyGbgXVVll0pTCyVQaUFPAaNuxktJWuOr/LT7U+hLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpLIob1S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpLIob1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734071992; x=1765607992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f/0euIPUhwetvM5uNIYCncX3k+wIpwQC++MoPqFIqUc=;
  b=KpLIob1SjBiG02GJ/Y5QGq+oxj66Rf7MgZb0X734hlmhXE5NTGZwGqbw
   9JwujNbE31LoXayrmjHHGS7M49UEY5TUGhi6TWS+UXOJiu+SOF+xPT002
   sSRl2nzVWuLqakL+qWpXS6ug7wD8lkXVu2c9GZcKvaYg+bg+4C44pkReh
   mtLjuBRQU+4ENm8BUBTa0yhOXY6b90qVBtpvnL7BQXS3fSBOUZ302yHN4
   a+dROqOFNy8IayZC4/HpeMM0DuTkkrrUEEBob/ZqPJ5IYyFWusGfo8cRE
   cYFmtHLf0CZQsyHSmJGUp8T4dZbYkNSZAyuCqIQugbKEL7yr+IvrFtV79
   w==;
X-CSE-ConnectionGUID: srJBJFzTSFa3Lsl58sOkxQ==
X-CSE-MsgGUID: pclUPLroTWu39NbgIkxRDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38452305"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38452305"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 22:39:51 -0800
X-CSE-ConnectionGUID: QgqZWoMgSNKNneQ/L+IIOA==
X-CSE-MsgGUID: YiE6BafwTaSz62Jli2Hhew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="96862597"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2024 22:39:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLzL2-000BlC-1Z;
	Fri, 13 Dec 2024 06:39:48 +0000
Date: Fri, 13 Dec 2024 14:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 19/30] lib/spdm/req-sysfs.c:174:20: error:
 incompatible function pointer types initializing 'umode_t (*)(struct kobject
 *, const struct bin_attribute *, int)' (aka 'unsigned short (*)(struct
 kobject *, const struct bin_attribute *, int)') with an expression of t...
Message-ID: <202412131445.J1BgQsu0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   8ecd52ed0821c4955732e004a6cdb812d78d2b20
commit: 0c3179846b619d25d5754231ffdaf4e531b77f8b [19/30] PCI/CMA: Expose certificates in sysfs
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241213/202412131445.J1BgQsu0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131445.J1BgQsu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131445.J1BgQsu0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/spdm/req-sysfs.c:13:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> lib/spdm/req-sysfs.c:174:20: error: incompatible function pointer types initializing 'umode_t (*)(struct kobject *, const struct bin_attribute *, int)' (aka 'unsigned short (*)(struct kobject *, const struct bin_attribute *, int)') with an expression of type 'umode_t (struct kobject *, struct bin_attribute *, int)' (aka 'unsigned short (struct kobject *, struct bin_attribute *, int)') [-Wincompatible-function-pointer-types]
     174 |         .is_bin_visible = spdm_certificates_are_visible,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +174 lib/spdm/req-sysfs.c

   170	
   171	const struct attribute_group spdm_certificates_group = {
   172		.name = "certificates",
   173		.bin_attrs = spdm_certificates_bin_attrs,
 > 174		.is_bin_visible = spdm_certificates_are_visible,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
