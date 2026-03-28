Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952C513B5AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774694306; cv=none; b=RoBgxmlQzwtF/lXIXTOVrP2mFC8BRZ3GL5P6LZ4P4v6qBRZGvPQw0ZFgFUY0+Nou84fOxoaXMKmAXrzhjsufoYPNGmkWM7tztirXZmLLz9HzaK5KeG2JXxo8+Rblv1ECym4d1Ln2sRGaZ8jpBHir0HggCe0uADSLG9VpPV77M8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774694306; c=relaxed/simple;
	bh=w5VHaMRSV4lAq8ZaE82ODgDvXzyYfAgzKs58t1rVmXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Acd4+8gF6YpvKLo0DpfmngRTHYJ3SxloQ1Roaf2QQZ78b5vUOwmutMqtbY/PDIyJkQvZdRF4TCWXJL8QDmLGtY+SdPVXjzE4hcmRMWWIcIq45bvA//06B8I2B++8vrV2vG2EHptb66SGbizH9yNtlZxc1rqFqJ7EZgIgRZYBYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXfTM3+F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXfTM3+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774694305; x=1806230305;
  h=date:from:to:cc:subject:message-id;
  bh=w5VHaMRSV4lAq8ZaE82ODgDvXzyYfAgzKs58t1rVmXQ=;
  b=aXfTM3+FFjui9FaS67RjpLW6fgAkf7wfRd84t4ixz6JBhviFVpxaMEJz
   RDMBfG+2M6tKheBjTvBDAJ8U+25bRVFVCGi5ex0vdhMkgxb5sbme5cHGl
   hQfK0sBi007Aa7nummgLWL9pA+/AjWWT37V3yQ2KUnhuPhNkfADttGh/g
   HhSKuOaebV77j8moWANukuwvSSpjcKBqsiqbh+eMhZa5pKks/K7zvXBAc
   YYq4QCtlcEe0XiXdHWuu59GLzZXFN75uVhywdAO98eTe+JraAlA1JdwIb
   E1AIxpleETc0GsAJ0CMPxv4q8eqyWWVPFIHKdkcYhHfLWx2GnJ6a6Bo4A
   A==;
X-CSE-ConnectionGUID: SpAyfHa2RWyJOu/bPPA4jQ==
X-CSE-MsgGUID: g+rdd8WwTSCCDtyY/rp2AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75635737"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="75635737"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 03:38:25 -0700
X-CSE-ConnectionGUID: 2iEW2c82ThmfhXAndNcHVg==
X-CSE-MsgGUID: XiRsjR+EQJOXzcpBWBmzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="227159073"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 03:38:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6R3b-00000000BJx-0DxV;
	Sat, 28 Mar 2026 10:38:19 +0000
Date: Sat, 28 Mar 2026 18:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Zeng Heng <zengheng4@huawei.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>
Subject: [morse:mpam/glue/v7.0-rc3 33/40]
 drivers/resctrl/mpam_resctrl.c:25:1: sparse: sparse: symbol
 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
Message-ID: <202603281842.c2K96tJA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/glue/v7.0-rc3
head:   4ce0a2ccc0358f3f746fa50815a599f861fd5d68
commit: 4aab135bda1661a795e4fe96418bf840833e1119 [33/40] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-randconfig-r113-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281842.c2K96tJA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281842.c2K96tJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281842.c2K96tJA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/resctrl/mpam_resctrl.c:25:1: sparse: sparse: symbol 'resctrl_mon_ctx_waiters' was not declared. Should it be static?

vim +/resctrl_mon_ctx_waiters +25 drivers/resctrl/mpam_resctrl.c

09e61daf8e96b9 James Morse 2026-03-13  24  
2a3c79c6153977 James Morse 2026-03-13 @25  DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
2a3c79c6153977 James Morse 2026-03-13  26  

:::::: The code at line 25 was first introduced by commit
:::::: 2a3c79c61539779a09928893518c8286d7774b54 arm_mpam: resctrl: Allow resctrl to allocate monitors

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
