Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70E196
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 00:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280384; cv=none; b=bIJ1ti4J6y3m9G39tQYcVHCi4VYdKzVZKIU77Oyfi9Ywvx4Y4is5yQ2tQIg7hsy60MqcfeaGiui9aLlPlMAN9ceAgRj+6w7pJpR2OjDlrrw3SK/See/oCBeRBPUaj6fe5vbA7CT+szlbGwXMR11+RQY1/ss8WmxNWtuKE3GXeWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280384; c=relaxed/simple;
	bh=gy5XywZ+TJA9ATGPWwPhOEXMryD2ystiSTW8bZTY0rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUC4NvZX4Hm78WjyYDjcMNGulBe65FHlX59B5ynT2faGlkktmExaVsiFea2slUrpi9j6GA4gXzxJvKwtYXYDJ6I9vt+xsYluUkrFELQSHuqBvag7L9WkDea+vdgOqRHziF4K8wCxjcQoGCFV8pyt3gK1ntJI+EgkOcT3XOojmS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ka45YDQH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ka45YDQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745280382; x=1776816382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gy5XywZ+TJA9ATGPWwPhOEXMryD2ystiSTW8bZTY0rc=;
  b=Ka45YDQHbvQqldcX3Jv3IqqkXyVA2EerCwBFOkRfxyZREt6v5hiE8PnL
   ntt66y6RqkS40vLJlXWOIBp05VwRRN+f65+SV117DMvIx1b2MR/pO5lVG
   m3mVnRNamh2tN4OFZM3VKDIf69fRBz/PvGFO5oaUY1ac6TxogZGmXW7YC
   HPHMOcSjK2HAbLpRcCRG6XICUzC5LIU3AJiIHuQ6t1nBHzM5Ey7ui8054
   ooVqEy3CLggS5POw0DUf7IJ5K65JlMaOI9TjdEFCPG9PPRBulokxjKJ7Z
   PWqjmsWfKsd0oyaFhM7mPQuEqkGQ84GWUUkiGUZA+2oa0eYn64PPBT0VU
   w==;
X-CSE-ConnectionGUID: CKMntIuYR/eHwysJfJtYoA==
X-CSE-MsgGUID: L5/su1WbRuGfUal2rFh2MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="47005722"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="47005722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 17:06:21 -0700
X-CSE-ConnectionGUID: M4eksECiRn+EsOnfwa/3JA==
X-CSE-MsgGUID: Dl3LD6LVQKm7UHuhj/ybvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="131848108"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Apr 2025 17:06:21 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u719W-0000TP-1I;
	Tue, 22 Apr 2025 00:06:18 +0000
Date: Tue, 22 Apr 2025 08:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:atomic-writes-6.15 21/21] xfs_mount.c:undefined
 reference to `__aeabi_uldivmod'
Message-ID: <202504220758.hb3GL19P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git atomic-writes-6.15
head:   3e0eba388360eebaf124e2abab90a054698f08af
commit: 3e0eba388360eebaf124e2abab90a054698f08af [21/21] xfs: allow sysadmins to specify a maximum atomic write limit at mount time
config: arm-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220758.hb3GL19P-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220758.hb3GL19P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220758.hb3GL19P-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arm-linux-gnueabi-ld: DWARF error: could not find abbrev number 129556088
   fs/xfs/xfs_mount.o: in function `xfs_set_max_atomic_write_opt':
>> xfs_mount.c:(.text+0xb7c): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
