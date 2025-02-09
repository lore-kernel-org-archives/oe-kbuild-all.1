Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B53FD4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739098176; cv=none; b=oE+pPnUBnVB9ULN6J8vchSctXYAoc69DLs8B5JZQ84XemHM2An7y/gFt5XHmhOGJXxA5wQJiqeUCPp4s3nIZH+9PjXDxcg+McBzSjyo94wJQZ5w5vWh9pB6k+FslgXFzlolW+9q6vGYGPS4KnlSba8bofQcoXLPVR1mAz8YgPOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739098176; c=relaxed/simple;
	bh=De5m1YVev61eXvqtDQPWdVCsIdsugNEqs6KURoedcK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=txLZmphE70+PyBZco5+EJJwcKlDHEd6H9VMRuEHbeOzxmIqdvlG6hTONR69QRGzrRtybBkWctieAkclqGyEwgFb8X7ilFwkyzTiJ3DGPSK3leuKLeFaLsEW3ZSES6yHaBBK7maXwpvpDhYQBtpgZIQMmc9pJ5zIg3WQQENrEa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWu9xc03; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWu9xc03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739098174; x=1770634174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=De5m1YVev61eXvqtDQPWdVCsIdsugNEqs6KURoedcK8=;
  b=YWu9xc03qwBloHnjUtuKCqpg/qYeQcGtkhZsIh9iSwvLGuOAGuOh44aW
   pX7afdxcP5YeNwZhrzZf97YYLIdxPM+NXYBMV7MBOv+GjInHLUe3Xe3rv
   /u0TcK3L9zzrFhAHSOh9+em2nKqm1iE/vdCCEdc3dtjRxXzOWEwP6PMI3
   DFF7zOEZv5mYWYkDuoAtH4viEWbIUYxvSDQL6ImyXQMm1OUcyDhUbnchP
   B6GXftLe4TOG83A5LwhfFJN8TQ5ajraMvZjadXhewew2EZ8mbsjVG7OIK
   BzW2BI2qJLd+XC5t13Wlo8BFY7u03+so3tZqdMvYUWwRWZhXqXxVd7346
   g==;
X-CSE-ConnectionGUID: MUNpZZVsRHOihSc/w+B8dg==
X-CSE-MsgGUID: kmmm0FA2TkudhHfQPpB2lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39558479"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39558479"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 02:49:34 -0800
X-CSE-ConnectionGUID: 4dGj+rGmSUKAFJRLU96Gjw==
X-CSE-MsgGUID: oU0UjIANRMGWIlIej4F4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116866047"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2025 02:49:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th4sU-0011Mi-0J;
	Sun, 09 Feb 2025 10:49:30 +0000
Date: Sun, 9 Feb 2025 18:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1420/1420] mm/shmem.c:1601:19: sparse:
 sparse: invalid assignment: |=
Message-ID: <202502091809.4Ney4Px5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 3a3a1f75d885bc1d1a25bb753dd2cf9111c457f7 [1420/1420] shmem: Introduce shmem reliable
config: arm64-randconfig-r131-20250208 (https://download.01.org/0day-ci/archive/20250209/202502091809.4Ney4Px5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502091809.4Ney4Px5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091809.4Ney4Px5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/shmem.c:688:9: sparse: sparse: self-comparison always evaluates to false
>> mm/shmem.c:1601:19: sparse: sparse: invalid assignment: |=
   mm/shmem.c:1601:19: sparse:    left side has type restricted gfp_t
   mm/shmem.c:1601:19: sparse:    right side has type unsigned int
   mm/shmem.c: note: in included file (through include/linux/percpu_counter.h, include/linux/quota.h, include/linux/fs.h):
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer

vim +1601 mm/shmem.c

  1595	
  1596	static inline void shmem_prepare_alloc(gfp_t *gfp_mask)
  1597	{
  1598		if (!shmem_reliable_is_enabled())
  1599			return;
  1600	
> 1601		*gfp_mask |= ___GFP_RELIABILITY;
  1602	}
  1603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
