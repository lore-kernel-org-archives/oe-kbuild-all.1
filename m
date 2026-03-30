Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4A3CD8BB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876635; cv=none; b=GvC1oIMCkdBMV3MFXPJfzq5/yrOkYBkrOfnBziUi5mvUMZCWF3ed78kvakQ1RAaFTOB0kINGgoF4iPGK9vAEse0eUUHlwhpNUlt3PpV3B8FYDzkkYpwEzeRojQGWgvfer0wta80SIEv4+PB/834+33XasYn9LhSTuKsIUsj70+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876635; c=relaxed/simple;
	bh=/qpAgDpbrBRNeQyUYCyYSI9+cd4tmwoEAeHiPPoEODU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X6gNwXw7H9ZQOYDjnEwtGtqZMjvg9TSaLBWbwlI1M5q15zMRiSLiP448xAU7sQ4bmXstHlVjAR1s3AF2f7+OGQdkO4Ir8ozIZnG5lETbBzsnziw2jK9qQykwExTra83S/jUBCY6XqdnYm7hmYimdslEf0PYq4hC3dZP1kqkCqLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCg8kxjW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCg8kxjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774876634; x=1806412634;
  h=date:from:to:cc:subject:message-id;
  bh=/qpAgDpbrBRNeQyUYCyYSI9+cd4tmwoEAeHiPPoEODU=;
  b=jCg8kxjWWCdxHSfLl83M+5pvvG2/6uMiABmGYb9n6cQcmk+Q8Hk5xML7
   0IZmDxL9mJx+9jIG+HZ7GY/wdVOEeLdREoRFSOKiM1lOx5YPycfKLDEsf
   HHZpX/FQk1+GcMcZhdHZc3UU6Ds4Ck8wgkblSeTKBm6C2MZfMaDx9ze9h
   i5pSOIfR3+85hzzX9ccD9Aqtt5J1QnsRY+yrs9qYcJBxDqmOkOyYY38T0
   kXk94kOpVqypzX8jE/hV6IpFQ8ZY2eObpllc8ynebnVHON7hpCdpE69iq
   +y8hlHReOU+H1Qccd6fcj5M3qa1XbzXX/N9f4fZuyhqq9wkXFZ5psbiu9
   w==;
X-CSE-ConnectionGUID: m9d2jy1UROCxwtcw5aWGFA==
X-CSE-MsgGUID: dx8JLX2tR5absj7uiK2f3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="87338191"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="87338191"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 06:17:13 -0700
X-CSE-ConnectionGUID: CkQd7579Rim4SLqgvArCQA==
X-CSE-MsgGUID: vnicdeGIRGC9tLRqIEDZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="219412498"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 06:17:12 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7CUP-0000000018J-203e;
	Mon, 30 Mar 2026 13:17:09 +0000
Date: Mon, 30 Mar 2026 21:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c:58:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202603302156.DBHVWsFK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   b050398b89b00b305b45dd70b8ab91470c42f155
commit: 95c99c73ca517a95f0b2eae2634bac66640a28eb [1/1] ANDROID: virt: geniezone: Add block-based demand paging support
config: arm64-randconfig-r134-20260330 (https://download.01.org/0day-ci/archive/20260330/202603302156.DBHVWsFK-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302156.DBHVWsFK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302156.DBHVWsFK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c:58:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *s @@     got char const [noderef] __user *buf @@
   arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c:58:25: sparse:     expected char const *s
   arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c:58:25: sparse:     got char const [noderef] __user *buf

vim +58 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_main.c

    37	
    38	static ssize_t demand_paging_batch_pages_store(struct file *file,
    39						       const char __user *buf,
    40						       size_t count,
    41						       loff_t *ppos)
    42	{
    43		int ret;
    44		u32 temp;
    45		char buffer[16];
    46	
    47		if (*ppos != 0)
    48			return 0;
    49	
    50		if (count > sizeof(buffer))
    51			return -EINVAL;
    52	
    53		if (copy_from_user(buffer, buf, count))
    54			return -EFAULT;
    55	
    56		buffer[count] = '\0';
    57	
  > 58		ret = kstrtoint(buf, 10, &temp);
    59		if (ret < 0)
    60			return ret;
    61	
    62		if (temp == 0 || (PMD_SIZE % (PAGE_SIZE * temp)) != 0)
    63			return -EINVAL;
    64	
    65		gzvm_drv.demand_paging_batch_pages = temp;
    66	
    67		return count;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
