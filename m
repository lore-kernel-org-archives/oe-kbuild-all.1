Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CB2D5927
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759056696; cv=none; b=Ib9SPbIrKmj2ixHDMlKM5VeHiLJYOndwWfWX861OSVZm5iU1jxa+nB3M6hTZfma90GX41McDJk5Y/kNkCjuRI6uheCZXMMavhSzp6dQsvQV4TyZCwH6cBha6V5V/KJzLYvbnjXii7ttBz1RzPX67/zgXZ9xtgSD7FwYKn+4+nfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759056696; c=relaxed/simple;
	bh=5Q6/ToLJTDMRT6g1j/7OUPi2hDp2kJaKgYO71uPbQN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRvpOfNipID2PQVS/Dbnng5YtDn9PYt3TKOnmq9fAopeXAZOUmcHlD2piRq8WgwAl+yaDCZWxZFP3tglAjt37C8VK/dAQPOMjZ8dgj4UrnmAx9QjlYVn/kqSjuLWVr1FgcGSStTDARm7LibsyBAtF5EEw0/83izDWc83ic0SsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUOftNBF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUOftNBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759056694; x=1790592694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Q6/ToLJTDMRT6g1j/7OUPi2hDp2kJaKgYO71uPbQN8=;
  b=bUOftNBFgxEnCSJBwFmLiyFfC7iy7wO51qcr6WGoXw3BP2QuFccPpUmP
   z2CpyjTh+OdnFmyB492rfMmJvj95BbcvBM8UGU/DlQSdBFEMsP75+43C1
   pwsVbmm+qFHqvoUfMlPBh7E1QgMzRUGIi7DbI04yhQ5AaeRwWFI9E+bT3
   BGkC8BuGZBvUa4T/VFjeJ80/ksXU/oxk+8LVQwn7vMWM7zANAz3Y/s/Aw
   QEJo2VLJ5yxUQu217iCeywF8PeAL2Ad0IprBwt3eVxEqMeKVW6uvdUzxu
   2orGtSI0Wzb+CuBBJPAyk+BJDpd9hzdyMt2oNf6svVDPimdPzKURVmfMU
   g==;
X-CSE-ConnectionGUID: JeZiE3t3SlG6SEdRj8vxgA==
X-CSE-MsgGUID: a/mHu4rJT6u8ZFYy0+p5JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="83936429"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="83936429"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 03:51:34 -0700
X-CSE-ConnectionGUID: mpLhUsFVRLOFjQzMKUqWJw==
X-CSE-MsgGUID: FDuLti9CR9Gm2wRfAHjvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="177566984"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2025 03:51:32 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2p05-0007jz-2K;
	Sun, 28 Sep 2025 10:51:29 +0000
Date: Sun, 28 Sep 2025 18:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -next RFC 12/16] cpuset: unify local partition disable
 and invalidate
Message-ID: <202509281853.Vep3zztD-lkp@intel.com>
References: <20250928071306.3797436-13-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928071306.3797436-13-chenridong@huaweicloud.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250926]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/cpuset-use-update_partition_sd_lb-in-update_cpumasks_hier/20250928-154546
base:   next-20250926
patch link:    https://lore.kernel.org/r/20250928071306.3797436-13-chenridong%40huaweicloud.com
patch subject: [PATCH -next RFC 12/16] cpuset: unify local partition disable and invalidate
config: x86_64-buildonly-randconfig-002-20250928 (https://download.01.org/0day-ci/archive/20250928/202509281853.Vep3zztD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509281853.Vep3zztD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509281853.Vep3zztD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/cgroup/cpuset.c:1936 function parameter 'part_error' not described in 'local_partition_disable'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
