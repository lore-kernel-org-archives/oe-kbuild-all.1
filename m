Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD27E0E8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 02:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764903415; cv=none; b=QvlENPOrUZYbias/qOCSDbOWyD27XOhhfPgI0lMnv9o+NI6vvJES3s+/8bRT3ZyLL/7s05TATZ3m+rrrfpkbhqBi0+v6NGW0hv0Ypv9neBpj1sB5Q/dKqSp3JgtjlC1HLW/3ntQlgucmOqPXTbjUnUPwEpPuxD6UHBgHP0oA0Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764903415; c=relaxed/simple;
	bh=snBYhu4BwvI+H/3z4Qzu3dXgJfcltV9f4kZVOyAqzDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPL79GDcQFR4bEQcTMe5Mzbn2c6bTAMy5SNg457tz7nflnNt4SRbbEFn1hOeaw2JkWaZ/RxqpJ1vLp4rk3Dd3EyJZfPmQsKzxVU3DxwYbC5ojrGdqLepXWoOEVUC6cHoiIvh1+NnnUBj6NSdMhZSMYcpvmgXX6UZkljEjWposak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuG/Gikf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuG/Gikf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764903413; x=1796439413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snBYhu4BwvI+H/3z4Qzu3dXgJfcltV9f4kZVOyAqzDw=;
  b=kuG/GikfIP0fZg8cT6LgICRotGk12fdtfmim7R2XX4JbMT/gFvk4dSuM
   /+aCIhXwHppWl6cd+RHegR/Pz1SzKyKPmbMyWiMT56mUUKQZLWzV1Or6B
   zpI8jPcw5WWOr6U5RQPeKR7EogQkTSSi471vrALYPzSnB2YsN/vpaKNOV
   0DESdaBdtY1twNOfq/z+9s+B6YRTXDMWiJlx/2obexHVZ6M/mAQ1jNXqc
   uyoUtUPEqWkH+12H+Fzh4f/6233ATTf3/GWClUk4MxH4x/vNACtybfcOS
   ++XqcWaoYMClS811k09ER94zhzDPlxJiRQHQSgjm57jBsP4PPYEo3txCZ
   w==;
X-CSE-ConnectionGUID: Avsfn3h9QVqFi5ARjGHn8g==
X-CSE-MsgGUID: SWz6vR15Rn+icIAOeEo2GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="67097043"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="67097043"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:56:52 -0800
X-CSE-ConnectionGUID: d7f+/2YPTouBGxwrKiTxKA==
X-CSE-MsgGUID: BglyPM6dRYuur/YoywdQew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="195054735"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Dec 2025 18:56:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRM01-00000000EVd-0cZr;
	Fri, 05 Dec 2025 02:56:49 +0000
Date: Fri, 5 Dec 2025 10:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202512051004.ZlP0OIq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [1/1] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: arm64-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20251205/202512051004.ZlP0OIq1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051004.ZlP0OIq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051004.ZlP0OIq1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:251:6: sparse: sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
   init/main.c:327:5: sparse: sparse: symbol 'boot_config_checksum' was not declared. Should it be static?

vim +/xbc_namebuf +251 init/main.c

   250	
 > 251	char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
