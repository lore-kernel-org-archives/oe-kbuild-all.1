Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76E4C70
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740665807; cv=none; b=aa8nBXeLmOLNrnOGRTKjPLnxPdfZi6oupcMRVnwncqF8Vciz3ESPli/MBuTWFyf0oc2Mu2cvJ1ULcrQPe4hqdUYtxKNJfLziB9kYG9DSmW2JHtT1tlukjwMp113KE/wRlNECntSOEbVTT21y1N4FUFPm4aN/fpiYv8F/ZoM7isA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740665807; c=relaxed/simple;
	bh=Y4TXnoIGS8yFqncwkpipXWUrITtCZayyuJQdN7DlnqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFFkJm8p4+bajgbJj8GyCu6cO+rDauBLQPIaYKGImoxJwayZVFppnh1dCQdbvJhINMdo9UEU38tuZda1RieAT0MnKgMOkn7fp5TLMPS91ODshKQ0UOtUYAwU6nFWS92ln/upmApsxJYU3eHA0FXZkwiayCVXDsiOZuxA+Q1KMtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMLrYG31; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMLrYG31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740665806; x=1772201806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4TXnoIGS8yFqncwkpipXWUrITtCZayyuJQdN7DlnqQ=;
  b=NMLrYG31Qc54Rd369btWgjzn6ARoSIP/+FF0hIG1W4t9cDc4qpjmmQEj
   4anDPbWHN0tlZkcQW1uH8eVCrk/2rXGRNSB8/XEkvSyZNa6pQyUS0CBro
   CAnuoKjTA3GNK1DVGa6LtrxOXl8l59TF8x0S1HfebK5Rd+j8rVqYByxiO
   /QXlfIKLoVAD2AnrpmKAdzk5C+bSakMzy+H1OhFTZNwg0FE+3zoSpIjBA
   H7hNIW+oSwxgtav+lnvFek+oXQHf/xzpV4VxVSb1Sucvaj4YAUMbLm2tj
   Cn43v7YI4G/DfIkP8OC93++q55J4XOXcmBrtSbXcBRRvStH8XZkJoBH/2
   w==;
X-CSE-ConnectionGUID: skg+JVdSTrSdMKtmBbzr4Q==
X-CSE-MsgGUID: 1OtJbJPCTself+OIm/LUYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40794892"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="40794892"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:16:45 -0800
X-CSE-ConnectionGUID: W6XFixuFSCKPZZ3s+LVFrw==
X-CSE-MsgGUID: am/cH37GR/mJlszmSlcB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121980720"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 06:16:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnegq-000DTC-32;
	Thu, 27 Feb 2025 14:16:40 +0000
Date: Thu, 27 Feb 2025 22:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [linux-next:master 6673/6931]
 drivers/gpu/drm/xe/xe_eu_stall.c:123:11: sparse: sparse: symbol
 'eu_stall_sampling_rates' was not declared. Should it be static?
Message-ID: <202502272238.LEzUwYpE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
commit: cd5bbb2532f276626d1416b237676772bb61f11e [6673/6931] drm/xe/uapi: Add a device query to get EU stall sampling information
config: loongarch-randconfig-r123-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272238.LEzUwYpE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250227/202502272238.LEzUwYpE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272238.LEzUwYpE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_eu_stall.c:123:11: sparse: sparse: symbol 'eu_stall_sampling_rates' was not declared. Should it be static?

vim +/eu_stall_sampling_rates +123 drivers/gpu/drm/xe/xe_eu_stall.c

   122	
 > 123	const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
