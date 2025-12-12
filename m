Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5774A2DC78F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533888; cv=none; b=b1KFl7adQUjd3AVxtTn04oVIiYtHVkKO9X/GU1a+Fof/5Cx7ofJHK5DscBhWtZ1ZvDPbQgsbjpMbnFleuaYPhTXnDHZSAL3BLi70g0b030myBskvFjwgoyeGA/2yXPoUaC0mrIOLn7lEBBtowy6TyZP7PPofcNOsp8gHguuPDJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533888; c=relaxed/simple;
	bh=LtM9PS5WzCFflDQ7O+u/5NKF1XRGiVcYP0ooB0qFLYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHBSSXIDxRyQYcF+LnWQji4KXGekCPbiDRfwpFV2oV4AYcUPsg3Tbsv4ZBT7OosntrSRzcJ3/6MC44Ue+5IrbGBUd4UTqla+zE/EAbSwjzyiPWXNRw5jXaTJ22VZ3xpAwEi/LV2+8LJB+ea+roE+HcWRWc2GIshRK6ha8vEzAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6u9kYP5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6u9kYP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765533886; x=1797069886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtM9PS5WzCFflDQ7O+u/5NKF1XRGiVcYP0ooB0qFLYU=;
  b=n6u9kYP5j+Cou5IyyrG15GpPvMhIMJL4faFDdAWxsLMcOgsof3FYv1+R
   aBTYhk32aKY0fKRGj8p+/y4D4j8WtxMT6jEM0BQaYbc/0hPFSB1CZVn66
   ziPNlZgs+o2XfIosH74bLMOOmRKJNPTRmlL5LKwG3np8O9EC8O9diq7SA
   cN1wh6te/VlIgu04zjDW7XfywyWzTjpN+dcjf+St66aT3zHrdGvuM0bbX
   jGfNI1CVP1BvwCwuW3RRPW2DRfzGiC0N3ZfU3l9lHO/XOs9IHV5Yn3LZO
   8J6l0LHHOK+Zl/JqMeMy3SEeK2kuXorgzXFxL8QSbXt320VV3gXyd6UKz
   Q==;
X-CSE-ConnectionGUID: s8AHN13rQjyjvbTS4Rth/Q==
X-CSE-MsgGUID: f05qw/20TS+nnoRB53yqFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85129351"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="85129351"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:04:45 -0800
X-CSE-ConnectionGUID: guzBYBTdTw6/dbPAv3YiRQ==
X-CSE-MsgGUID: a3jN9akdS4OJSzVbDpydqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="228103656"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 02:04:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU00w-000000005u7-3Sra;
	Fri, 12 Dec 2025 10:04:42 +0000
Date: Fri, 12 Dec 2025 18:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/prjc 583/596] Warning: kernel/sched/alt_core.c:3501
 function parameter 'prev' not described in 'prepare_task_switch'
Message-ID: <202512121742.toP68z4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.18/prjc
head:   3a7d9c177e26aeca8de1b259a7fe74908b3f4190
commit: e4b255e7df335060384f25467dd358d002112e24 [583/596] sched/alt: [Sync] 378b7708194f sched: Make migrate_{en,dis}able() inline
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512121742.toP68z4z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121742.toP68z4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121742.toP68z4z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sched/alt_core.c:3501 function parameter 'prev' not described in 'prepare_task_switch'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
