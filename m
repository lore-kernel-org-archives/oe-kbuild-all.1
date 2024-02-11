Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128AE4403
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 01:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707616427; cv=none; b=u4aEQe5bLUqtHw95EutbM4AseO/SFD/Jzw9mBs9P27EEEQEQFpKL0ryke24DUgSMesMQ+AQlx5uDMNCJDfxZWGyTMxhzcTtjPCZNVytdr349XCDQEfVS2KVg9MEorECXFc0hjqR+XvQf7fA1UdjPOQELvvPzxPmfi/cG8zyTgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707616427; c=relaxed/simple;
	bh=XshEh6lmXHSokHvCGMHV5XU1fZmOu6WVqPRHiOn5mxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPJgaNF+G1S4hV0FWWNtMdZ4RCWEw50Tu9gaF8GyIM3fyTf/kjftrSYOueIWSFjzRKlFenOejk3cli8LaR1wuXqt3LXb1GTyVLe2XaiB9t0B4TfXDXSmJq0rLCYFhSuozSw25dgnHS/uW9MVomJf90obMqWSFg1/wG0y4SWrus0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp+vF+6f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp+vF+6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707616426; x=1739152426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XshEh6lmXHSokHvCGMHV5XU1fZmOu6WVqPRHiOn5mxo=;
  b=Qp+vF+6fzHrVoKQbcctWhbMifMWh+o63upliJ20vnVEnBzMSEqyhZ997
   JQw8d12haq1qiFpUTeau7NmZPYh5Q4R7XytWLdDmchnFso1gKhUaRy3jh
   s8PRde+vfIsVfWlLcIFB8nd5tMDA8kUW9mAzo9Hl0FmVCh/fYUyoDAPtK
   jdf7P+sKcCdOKir//olwSBWPT1cSllPFF3jW9wlsPsiGaO3wg8FRRtldP
   n35p3oUGt2gTkkaak/hlBOdayJwXOoYpsJaJSyV3prw0AxXcUWg3G4D26
   Xb/8wBbEfUjmQjQMSAB0FOh0w5VZrxy2Obj5avwy2vErbyG+jyEQpe883
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1474441"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="1474441"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 17:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="25486487"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2024 17:53:44 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYz2M-0006Fi-01;
	Sun, 11 Feb 2024 01:53:42 +0000
Date: Sun, 11 Feb 2024 09:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mic:wip-audit 12/12] powerpc-linux-ld: lsm_audit.c:undefined
 reference to `lockdown_reasons'
Message-ID: <202402110911.6aHxruo6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git wip-audit
head:   87033059ff9ee7214eabf93e7cacf1d0ec5e9454
commit: 87033059ff9ee7214eabf93e7cacf1d0ec5e9454 [12/12] WIP: Add audit support for Landlock
config: powerpc-xes_mpc85xx_defconfig (https://download.01.org/0day-ci/archive/20240211/202402110911.6aHxruo6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110911.6aHxruo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110911.6aHxruo6-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: security/lsm_audit.o: in function `audit_log_lsm_data':
   lsm_audit.c:(.text+0x8be): undefined reference to `lockdown_reasons'
>> powerpc-linux-ld: lsm_audit.c:(.text+0x8c2): undefined reference to `lockdown_reasons'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
