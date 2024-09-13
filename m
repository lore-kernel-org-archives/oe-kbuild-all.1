Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E12A8E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726194755; cv=none; b=b4nO57KYiGg/fNZNT+e6zT9+vKvSjqnoPNwm7Z7deWgd8ahl/+fL6qkLShQXozE5QHH2X1myj8mGmL2+ppWzNr+3cH3OUDy/aD6Ijx47V635CVi0KpiHKpt0/eB5SAZCSS2QRqEFsSKcSIQk6elQ3DS3sFQNkkjVWZanA76heYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726194755; c=relaxed/simple;
	bh=dRGFIf4RmzpPSVyufXA41JX39qUCUFZ7fQav99Zmjt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sbv2W/9j1S9rhupmgOQilglLNnKq17QplmALz9B6BWHE0tQZ5OMgeG/6nBTYMSLUnOlAvZkZL5B/H4KRqTAqkEGGV0S/+UYRUHg+S7f27q4nrPYQh70SmJ1E0zP6Y65gGfHdOCbknJ1UPoDpeCrErHdn+U/Ub7m9Tbp4KXwprG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLOr/ujd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLOr/ujd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726194752; x=1757730752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dRGFIf4RmzpPSVyufXA41JX39qUCUFZ7fQav99Zmjt0=;
  b=NLOr/ujdMd31MkpYY42jOVo3fbPLzrBqK2PZ6MXhV1RHVc5Vn4StHzHJ
   W19lNf2z8FCTinkeUy9eixwESqbixIM6TZ7LRr+zHXWsksgUvR6VJN1ci
   Xpq4OGCxfrAocb4HA2Z16QDNTDTYaKAY7Fwp8A358V0t6Naib5CrZA+ei
   BQg3LNfDsIb5gApcvowXcn8erR2sCFdb/klTUZ4gVcgRPnZFwJt7G7VIK
   3v31JFi4op5KOHQUnpRXVBOiKUzNCUTAKe7pk4PcHUKbiChGBDS7x7pWG
   i/XlyyDqaMC/lUex1/52XxerRSCLlw8eTr3wR1dSN9xfRkslTqnWrodHO
   A==;
X-CSE-ConnectionGUID: YznfsNdARvS1+BtcirOFbw==
X-CSE-MsgGUID: yNEq366vQDqtQxYwtvIHcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25234321"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="25234321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 19:32:32 -0700
X-CSE-ConnectionGUID: 8JdUpyGxQZu47zK+12JzBw==
X-CSE-MsgGUID: ++BEliUGRw2bGkLqahq8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="72712567"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2024 19:32:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sow6m-0005vI-1o;
	Fri, 13 Sep 2024 02:32:28 +0000
Date: Fri, 13 Sep 2024 10:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jie Liu <liujie375@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15777/30000] kernel/sched/topology.c:1618:9:
 error: implicit declaration of function 'register_sysctl_init'; did you mean
 'register_sysctl'?
Message-ID: <202409131024.K0DyIWpz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tim,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8f53b22e47e98837db7830541a369ed0cd5df749
commit: 8ce3e706b31409147f035c037055caa68e450ce5 [15777/30000] scheduler: Add runtime knob sysctl_sched_cluster
config: arm64-randconfig-003-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131024.K0DyIWpz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131024.K0DyIWpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131024.K0DyIWpz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/topology.c:5:
   kernel/sched/sched.h:2967:22: error: array type has incomplete element type 'struct cftype'
    2967 | extern struct cftype cgroup_v1_psi_files[];
         |                      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/topology.c: In function 'sched_cluster_sysctl_init':
>> kernel/sched/topology.c:1618:9: error: implicit declaration of function 'register_sysctl_init'; did you mean 'register_sysctl'? [-Werror=implicit-function-declaration]
    1618 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         register_sysctl
   cc1: some warnings being treated as errors


vim +1618 kernel/sched/topology.c

  1615	
  1616	static int __init sched_cluster_sysctl_init(void)
  1617	{
> 1618		register_sysctl_init("kernel", sched_cluster_sysctls);
  1619		return 0;
  1620	}
  1621	late_initcall(sched_cluster_sysctl_init);
  1622	#endif
  1623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
