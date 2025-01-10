Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551021147F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736522728; cv=none; b=WKWg/S8lk2Sd7AvUsYOFjYJrEI5+q9NKwQitTeSlSYogol4nqQBH2DsIZ4KKa13fYDGyqQgNmqEwqw2ZhDQytGEieT1xDaajHWHwWipi82wQrOVy0B7IGGsnDKCk0CfIOfvsC+rsivXGweQxcWOEjqrkw7CJH8FPHqsRjYnxD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736522728; c=relaxed/simple;
	bh=YSOgx8+sTovgcMLEdDjN7g8+FRjZ3y9Tq3X/HdMyxUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWjONhzJci6hEHKIAI/VCOda7i9ZuA54kuHfsQ2JMSAOea6MjH5wwvi3as9oocBJsLCixCAKtIAN9VG8wMA1IfD+0BUzBl2I2BscOGIqJB+7lJOF14v2FV2sCop3pYb01qOhfHA93FJNmtgPQEavTOA2nzzxPzYZMt2+s8bwukU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWBOvCt8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWBOvCt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736522725; x=1768058725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YSOgx8+sTovgcMLEdDjN7g8+FRjZ3y9Tq3X/HdMyxUc=;
  b=EWBOvCt8C5jLp2FTVDw1zF5VVDuQyyV4VezN5QKSdvpCGEoKWfsThxpK
   ZKffo++Mi0TNOuDA8njg/D4jcSTo93d1hPjqu7b90sc6ZvlXr72dDo+kY
   iaZ+eCu4/+h5HXU8CGXruLw1JLxztfoZQdKd7Pwc2A1UYBpwmV4SZLx9I
   HhGUkX62/A9CcYNjc0BL5JPJgVUpqKyLhuoM0rpIfoMNRfXrdBvyVn7d9
   QA+Le2RZ9cZY6qTZOs+paLnDw37NYpdUI/k812TDGOvhgBe72qLjVaiGE
   ve869AJckEcraOao+1+K4cz1eFZhqrVRnJUiSmg7A3QvBwwCgVHO0FiiQ
   Q==;
X-CSE-ConnectionGUID: IOrsXdUPQpyWS/ydFbnYpw==
X-CSE-MsgGUID: k92iIeV3T/aizyHdB2841w==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40759911"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="40759911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 07:25:25 -0800
X-CSE-ConnectionGUID: PAWydq/9Q52Nu9oPpEWyXg==
X-CSE-MsgGUID: UUe29gFASECiKO/xh7eSng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103540096"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2025 07:25:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWGsz-000JP7-2T;
	Fri, 10 Jan 2025 15:25:21 +0000
Date: Fri, 10 Jan 2025 23:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2697/2697] kernel/sched/topology.o: warning:
 objtool: asym_cpu_capacity_scan()+0x3fb: unreachable instruction
Message-ID: <202501102347.RosSdNKM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6aa478cf2617c987fcc37cdc8281a4cd310d86d9
commit: bf98f63d069c5ce91efe999b23f8a399e5e606cc [2697/2697] sched/topology: Rework CPU capacity asymmetry detection
config: x86_64-buildonly-randconfig-003-20250110 (https://download.01.org/0day-ci/archive/20250110/202501102347.RosSdNKM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102347.RosSdNKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102347.RosSdNKM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/topology.o: warning: objtool: asym_cpu_capacity_scan()+0x3fb: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
