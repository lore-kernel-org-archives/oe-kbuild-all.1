Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9766182A5C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721252575; cv=none; b=Ct8dXdZHN8ynE4cUfY7aTjLDeVBV+BguTd6j95hkQeJukgHAOU6OwNoQqpT1WIJ5WMcyF+ojLsJkqlfxqKG2kJIQVMm3Ig30kRDIwwtg7v8bZxGxxdNQNXgY3/19hpXi2I3Aa45dlLZOQgN38cs8OJApRcgVEa70gjQySsGUbK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721252575; c=relaxed/simple;
	bh=RVGXi/DkoXRkphCSW/Gf89SE1KFtpbw+czftyDLm2Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f81R2HcJ/u+gyD8eeOBFpfAeD8Tq2UnaL0FlFCbcTOU2g0zVK7wL28PSjwep8Z18EF+ICquh21/idzWUlLeGCboIxFg3PMpqd9HOXUjpcbCI4V5chGWre8rpIgEH4CTg1z7N2WZulK5hYDhsjaUbbdCtRoB1NRge50cq9FO/C4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iz6Fl+RS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iz6Fl+RS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721252573; x=1752788573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RVGXi/DkoXRkphCSW/Gf89SE1KFtpbw+czftyDLm2Lw=;
  b=iz6Fl+RSXcpIVNkNppqGPhdTOz1RsugZqv6C7AZJJO9ytyNL5dRpnxA2
   bsTcXJBWPHd7SShvmkMX3q8o8Snb9KfGR6euINt8Ux98JT8/UpHxEZKRj
   mGlgvW9k6AeSGyZOF1NEu36dAsdpmHcw0eI0RydkVfTNqZTKS8ipeCCFQ
   12pMqeBs3SlOONr1yKGAyI4JFWb/EL3Mhlt/uKYeVO5+YXu8LRL1rP7qP
   z/RGqxfsWJXrThydy6GXa5Dq2f/kGDlkxeiTfDVWOBmGBh3SdPHA8tZGB
   yqRSMTv/ycxYHoYu3wC0KScBVR3KwAzvJAhrF9lUE0tf2vcR5ucdcBMbc
   g==;
X-CSE-ConnectionGUID: npDGfNcYQ4ymc5ofQdpzag==
X-CSE-MsgGUID: XVa7msRAQly60uwIeS0obQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29398412"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="29398412"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 14:42:53 -0700
X-CSE-ConnectionGUID: ne/Sqd2bSCu9Jp+tUix1mA==
X-CSE-MsgGUID: aNNh6cqDSxy/y4pSM48jeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="55666147"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jul 2024 14:42:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUCQD-000ghi-2i;
	Wed, 17 Jul 2024 21:42:49 +0000
Date: Thu, 18 Jul 2024 05:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.07.11a 76/78] rcuscale.c:undefined reference to
 `rcu_tasks_trace_torture_stats_print'
Message-ID: <202407180545.iMSf0giu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.07.11a
head:   2c5a7c46f900887cd4204d634896ed4fbb9aaafd
commit: 03feaca0778e71bafbdccc67ee2a54f613cf72d9 [76/78] rcuscale: Print detailed grace-period and barrier diagnostics
config: i386-buildonly-randconfig-003-20240718 (https://download.01.org/0day-ci/archive/20240718/202407180545.iMSf0giu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180545.iMSf0giu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180545.iMSf0giu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/rcu/rcuscale.o: in function `rcu_tasks_trace_scale_stats':
>> rcuscale.c:(.text+0x77b): undefined reference to `rcu_tasks_trace_torture_stats_print'
   ld: kernel/rcu/rcuscale.o: in function `rcu_tasks_rude_scale_stats':
>> rcuscale.c:(.text+0x8c3): undefined reference to `rcu_tasks_rude_torture_stats_print'
   ld: kernel/rcu/rcuscale.o: in function `rcu_tasks_scale_stats':
>> rcuscale.c:(.text+0x8e3): undefined reference to `rcu_tasks_torture_stats_print'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
