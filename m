Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA825A34B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756591802; cv=none; b=McqCPoQToQixcg1LsZqy5iUJoV2TjA0Mn21Z6blq7MtfpIuDbV1djJrVMWxm/Kh8MeMwZEm1H5k527WagtbzggywKI5/zVmfFgFE0b0HB4FvP6I9soLC1oWSny9GYJD6Pszfmr5dssXEI2j4gDjU+KsgEUpZpSc4Vw0KxVYeV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756591802; c=relaxed/simple;
	bh=6yYdzyA0bzDYvHdnndK98qYsBcAmup/hwvt6OjoRWvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGiD/UCMrpP0SVXzcAHgjxpnPm7wzC3I9Gov4Z4Kd4jlacMctLIMfY12tCVt4J67zXKo7fmeTtlkrOA6oRjalShKTm34hkykcwnFeTD+KiulllrKMl+Cs/wcrA1Ma5eUOiqGQinDS4cV8ECZjFsciTcOLY996uc7n86Yj0f+J4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvpTM8hC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvpTM8hC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756591800; x=1788127800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6yYdzyA0bzDYvHdnndK98qYsBcAmup/hwvt6OjoRWvc=;
  b=KvpTM8hCV5z6G4grgNicdTJF/2yzyBC1kM3BdZTk3DCcYd01x46kJoCR
   Vs918+GkK2bottlelsRc1JHpp4WMl5aRP9Io2BU5t7uZrQnTO8zkHX7OE
   5jCOS+gbYCfuL/K5MFYqXtkewvaTH1YG0ECDDb9EeLbIOMf5/e0oqvWO/
   PhpVHVEQPq0ItkI6pySH/eDf4dqEwrCKsMYGtbQmcl/s0OvmvePSbid10
   kivzl22/iTf2OpmCny6cAWgRsFWxsViFF9LNMGv48q+PXjVuuDGmCuKGQ
   qABq4X5iC1duemB/+97+gFDDPtJFSWzuz35Zh8clqZLzagG/snvuvZmYf
   w==;
X-CSE-ConnectionGUID: cfsLhMfGQNOluF/af4Cf4A==
X-CSE-MsgGUID: hzXHYFVaQpuQXQ0odvkPdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58788254"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58788254"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 15:10:00 -0700
X-CSE-ConnectionGUID: VlRbkzYkSFevPeEVRptMxg==
X-CSE-MsgGUID: YHXk+KSCT5ilM2lJ8UccyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171039533"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2025 15:09:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usTlk-000Vil-00;
	Sat, 30 Aug 2025 22:09:56 +0000
Date: Sun, 31 Aug 2025 06:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1768/1768] kismet: WARNING: unmet
 direct dependencies detected for HARDLOCKUP_DETECTOR when selected by
 SDEI_WATCHDOG
Message-ID: <202508310655.7WxGinyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7dd09dff93e7ad921baf5cec4b58301d9aebb79a
commit: 818ac22d9d2f02632b39ef1a4f472e6dbe0d417a [1768/1768] sdei_watchdog: fix compile error when CONFIG_HARDLOCKUP_DETECTOR is not set
config: arm64-kismet-CONFIG_HARDLOCKUP_DETECTOR-CONFIG_SDEI_WATCHDOG-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310655.7WxGinyC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310655.7WxGinyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310655.7WxGinyC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR when selected by SDEI_WATCHDOG
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
     Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
     Selected by [y]:
     - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
