Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB223817F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572832; cv=none; b=u5WAti+U/ZuazVi0y03GFVrIWDCS4lfaYMwXUFO6ZHzRWznVql19HGMDMBAMSkcuGl0CZrfL99lFo2lBVgOxxjUaJvqe55beDaWzPGNTxaYzQn+15wEoJ1iTpOUD7XH3G88oCQj1YTfbaWWGYcBOiVZ3M8ou3ylpYBoWOpdW0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572832; c=relaxed/simple;
	bh=2XxQ5lmBsKE7Omk80+ffYDa82efZE1a2RArQH9mSto4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LHjwotuMSBR++mcSYTBQ03xpg3lavsHk5dkx5iXrMo5k1jbTmDRW8ofEH7gbH+z0klZSibFwsRvhmA/FUxzy6YPrC/HeMB0Htw1aSUPc2XJHyNT0323QEj/FdP9z2fg9jMwqedqecYRNIWeKFyRslIiN/4A/1SH7d6anw519Yds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCDA8TFC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCDA8TFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751572830; x=1783108830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2XxQ5lmBsKE7Omk80+ffYDa82efZE1a2RArQH9mSto4=;
  b=kCDA8TFC8dcSxVnIMuej1ppDVkzuI+CZswIRaPnhO9NEBDVQerLmPVq1
   UBdKCGuWEeilLznJpGB/j2uiMsUvOUFLlCVQzGNOf3SIJiK2WsLVZVXtw
   Mh6jSA4MtDhBebiqg+o3ZOSELiewUpxjdu+lAOcLyqx2kWrg8BNk4iPl/
   MPBCy21r4Xl/7pPAl6zkTIhxU6tRw0ky9iXg8T3+E2nNcrYoJx2wh+U2O
   Cm9EUnVG6lj80utV3aY1t081DJXgRCZNZZBIm/FtzrtP3Quw22Rx3yv//
   D20Z+GtNaLPRuEvdKQvI1rG6OWdb+HO9E/GQuTnlTWhKH8nOvfqYCBnAX
   Q==;
X-CSE-ConnectionGUID: LRuziSxlQbuqSPlr63OlMg==
X-CSE-MsgGUID: 93gyrINhQPmzLabMdEcrSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53779696"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53779696"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 13:00:29 -0700
X-CSE-ConnectionGUID: FleP0TZgQM+ywNxNxDCANA==
X-CSE-MsgGUID: XPqDGEuzS/SZGb8pUy4x0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="159974867"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2025 13:00:29 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXQ6c-0002xn-1v;
	Thu, 03 Jul 2025 20:00:26 +0000
Date: Fri, 4 Jul 2025 04:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2 3/4] Warning: kernel/rcu/tree.c:734 function
 parameter 'value' not described in 'rcu_set_exp_qs_needed'
Message-ID: <202507040353.iTBLYq2A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2
head:   d13fd3f2e119357b03df3c5cb658e84704c4289f
commit: dfd83802e0bbd07426ac6b80b106949b5cfd615c [3/4] rcu: Add helper functions for cpu_no_qs flag setting
config: arc-randconfig-002-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040353.iTBLYq2A-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040353.iTBLYq2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040353.iTBLYq2A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/rcu/tree.c:734 function parameter 'value' not described in 'rcu_set_exp_qs_needed'
>> Warning: kernel/rcu/tree.c:745 function parameter 'rdp' not described in 'rcu_set_exp_qs_needed_cpu'
>> Warning: kernel/rcu/tree.c:745 function parameter 'value' not described in 'rcu_set_exp_qs_needed_cpu'
>> Warning: kernel/rcu/tree.c:754 function parameter 'rdp' not described in 'rcu_set_norm_qs_needed'
>> Warning: kernel/rcu/tree.c:754 function parameter 'value' not described in 'rcu_set_norm_qs_needed'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
