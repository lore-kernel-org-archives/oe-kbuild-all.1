Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B680A4C91
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 01:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737680962; cv=none; b=m6AINb95UEaqD2LD/0sPLrIh3QiERi4FXskMJFHQuTTR8gW+AotQ9A9iDAiI3Al/2QXfM8rJR7gv2hxoZnNGhPf98cV5RbwCXYysgWGZ42YVcVQZQadOu+0wiLPuCyS0K+IpvoIFQn5a3cGr7FKfFox2iifUmfVJWdsBCvRZwKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737680962; c=relaxed/simple;
	bh=wM1WhsLIf9eUZgRkUsTND9YUSOLOJCvHPAdjnqPayNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZyS6fO1TbRvKHyzr5xCs1L4/BREtQ0T/q2dXbz+gE8J/vqmw2cc/Sd0QbrGLQ7uz+OQ/9ZTwJjcfI2TdQuF4Hq/KmqlBCr1f9wehEiCoKA/akgJTs2XGL5/eBW723aqD1BPHxNUNUKsGLz5Qmsxx3pXjgIhjkPsT5aC0umY48h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6cntcqx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6cntcqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737680960; x=1769216960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wM1WhsLIf9eUZgRkUsTND9YUSOLOJCvHPAdjnqPayNg=;
  b=F6cntcqxKMppWChFab61LzyB30P5AOucgPTVgWv9EtMk4oYijb1FoVmG
   g3xAEvGjPcCkAptSOv11ia36bhpDxIXcCdbeM0nmRY+OTuivXb5HnyFj4
   w0dyLjeeeVnULS7ml8o0iKcgSVPhlBzeIvGq+5tiqwslu3zREvrLKTHGd
   hjOtd8iclnI2AsHTm43MvDpuX27fld/80CQCnponQhk3xZSHXURmumZku
   J1ZWpUDX9SKclEnybuGGJq45Id6EL7UXw85l6g7+RKViztKdHj9sEhBeV
   3p0TIQZGdX6UUwLC5VP3F/5NjF1JUMGidMjld38GtHPAcgcbfQ/KDcpAG
   g==;
X-CSE-ConnectionGUID: VbT/TprAT+OROT7F9L8ZcA==
X-CSE-MsgGUID: qgt6sFL6RB6X57rm5i9r7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="25812906"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="25812906"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 17:09:18 -0800
X-CSE-ConnectionGUID: 4p/dJin2R1mMUcahUWq12Q==
X-CSE-MsgGUID: O8OgAx4PTQubPvwTsmZGXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="138495645"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2025 17:09:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb8CA-000bwZ-35;
	Fri, 24 Jan 2025 01:09:14 +0000
Date: Fri, 24 Jan 2025 09:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1841/1841] kismet: WARNING: unmet direct
 dependencies detected for ARM64_ERRATUM_845719 when selected by ARCH_MXC
Message-ID: <202501240914.Uj7VFpnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   30472c94514880cf07700ef041e5c611a6d6888e
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [1841/1841] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-kismet-CONFIG_ARM64_ERRATUM_845719-CONFIG_ARCH_MXC-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240914.Uj7VFpnN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240914.Uj7VFpnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240914.Uj7VFpnN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719 when selected by ARCH_MXC
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
     Depends on [n]: AARCH32_EL0 [=n]
     Selected by [y]:
     - ARCH_MXC [=y] && ARCH_NXP [=y] && COMPAT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
