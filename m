Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62492C9D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 03:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783136792; cv=none; b=AqgRQgdhK3K6gdwFz1JrkbB5OlEJk/nI0r7kzYE3KfChxn7nW7r/CcZi6sYSVAvcdrt7/OY3Ml/yv01lNHwnmxDx8alBMsMULBtzSs+uWMbpiT7BIRvnHQotkNRsF8Pvp52tfqGVvRrtOB9dUoOA0caaNhXNbrnV6Qq4PmvxE/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783136792; c=relaxed/simple;
	bh=V1xqYrpyvA/zof5OMlw3r0jWcu3GJi9Onm1ck6ikrcU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NNJQD2/tXyKhT9+IClUcSrj7t26Jaa0GJ0UFilOcavAZ0RGkKLgOglv+3P688Uzgxcj85kca+gLhFjUfesWt8Qx9wfVmZRq0duGA5S6SmJ09mbDgsjvuVGBCp8mLjwEF/Q1oNsd6HxYb/rNWrg0+eQ7OSWa0bsS5a2vSPy9+AB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqh+dyGw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqh+dyGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783136791; x=1814672791;
  h=date:from:to:cc:subject:message-id;
  bh=V1xqYrpyvA/zof5OMlw3r0jWcu3GJi9Onm1ck6ikrcU=;
  b=gqh+dyGwgA6mKeGT5hMmJkO/kJeomxSmNQ+4f83jafnbPI1lMXHCun6a
   a1XvTWjNzba0i3BvASia4Znn3BQvRxin465oJ0l7yQulujNjd0YKXcFdi
   kpFFQsZuMb4t5h4KlJFi63fjWZzHBh/UUJJvTBg3vaCdPEvXfwNXq7pM4
   tka1N3PoTip1O2Erx6AkL+6qi1QEOWVdFp/zWPdmf3+NwZzKGERm6lRuV
   dWMcT8vZOEy2cWrcVewDp1DSD7UCbQxB18BwpX0bGXVUzLOotqX9ZSLoe
   kTZs5NnCeD0cAnfEvaqIeaE3ICsKB10y2P9Hd+lZAXz1Gq9NZgtse5oZ+
   A==;
X-CSE-ConnectionGUID: 6hb7sDoVS6am87hV8ACCJA==
X-CSE-MsgGUID: wC9KuWCpRRak94R6SGs/iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87551962"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="87551962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 20:46:31 -0700
X-CSE-ConnectionGUID: OUmFQg2aQ7Ks4toCGG83iQ==
X-CSE-MsgGUID: otfB3HVJSv+yT7O7PWTpKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="291379871"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 03 Jul 2026 20:46:29 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfrKk-000000001ft-3kuh;
	Sat, 04 Jul 2026 03:46:26 +0000
Date: Sat, 04 Jul 2026 05:46:06 +0200
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 117/121]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202607040533.zp0VulDT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: 63514548c205d2605589a9789c27343506074acd [117/121] media: qcom: camss: qcom-icp: Add minimal ICP driver with HFI infrastrucutre
reproduce: (https://download.01.org/0day-ci/archive/20260704/202607040533.zp0VulDT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#276: FILE: drivers/media/platform/qcom/camss/camss-icp-hfi.h:254:
+	/*
+	* Synchronization

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
