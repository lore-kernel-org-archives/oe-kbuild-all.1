Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB19454F81
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 05:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759037663; cv=none; b=TmmCAp49MohG9nGWbsCTe04VTd22J4ns2cBpjRn3iVP22e/CYX3N1WPUTK5Ltsa+5ryvUBzklqenk8y1vUYBNQ73jleolg/ZVRnTaBq47veSASuE929tHiyUZw6v7bIJTIy4QXv9FIFC6NcnTxPH9AT3L6HqjRZjIToaqh8pGG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759037663; c=relaxed/simple;
	bh=zmdtZG2XR+NgbqD9cl3+MFhdCozZp67trUa+T0RRMZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8kDTDUCjXGBcE4gE8GPyeniJ4WsiLJ46pYjj8RBrmYkOKAW3Di+Bt1GadW25ZdgVi7pRBoXAO87kXfa2pRAZs5qHsHNrjcd8M08wKcMPl7lI550mjKsed2L/k960icpwxc8exi/pgEMaymUnaZj12WWmUf8DsgEOBOu541Apg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkTyzBK8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkTyzBK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759037662; x=1790573662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmdtZG2XR+NgbqD9cl3+MFhdCozZp67trUa+T0RRMZo=;
  b=GkTyzBK8rxLdOygiA/pq3YYqVcKEebX1mIOhE0U8Af5LhvsamjwJmOJN
   zhlv6NrdDuzLHt4jMD2bSZR0VJX3W7CUYrDrZjWODR0qj55XfaBSt5Mmn
   R5bN6/d1HOLYBlZVSrhvVc0ZzQMxm+CUjzMLDmAakGi3L80Sjq4PSKRv5
   TC+3n3vV3e71NrOWFQLgrzLcGcLKfbrpj1mKfP1konMBuOe3ofHPUE33f
   Jycei0g6Fpb1A9oX7/5ROHRfxPuqmJqqTLboPKnNntH5VLPRzlp1FRckn
   lSsmsUq3NnBiLEhWs2xIxt9Wg7uAMK846M4TAT8HCe6e8X7UbzBDcrE5F
   A==;
X-CSE-ConnectionGUID: u5VkDut/Rn6FPDBreGWrNg==
X-CSE-MsgGUID: D4DOz+gMRACQPNnbnq+Tow==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="72748796"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="72748796"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 22:34:22 -0700
X-CSE-ConnectionGUID: u1C0f7tCQPinyBlqSGGQTw==
X-CSE-MsgGUID: iLr5CBj9SmCxjrd8uB5dwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="182354684"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2025 22:34:19 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2k37-0007a9-1R;
	Sun, 28 Sep 2025 05:34:17 +0000
Date: Sun, 28 Sep 2025 13:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jianping Shen <Jianping.Shen@de.bosch.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 119/122] smi330_core.c:undefined reference to
 `ffs'
Message-ID: <202509281356.DPuDyQzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   b9700f87939f0f477e5c00db817f54ab8a97702b
commit: a588bcbe1eaac45d0425107a708c220d09e2fd55 [119/122] iio: imu: smi330: Add driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250928/202509281356.DPuDyQzc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509281356.DPuDyQzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509281356.DPuDyQzc-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/iio/imu/smi330/smi330_core.o: in function `smi330_set_sensor_config':
>> smi330_core.c:(.text+0x28fa): undefined reference to `ffs'
>> s390-linux-ld: smi330_core.c:(.text+0x297c): undefined reference to `ffs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
