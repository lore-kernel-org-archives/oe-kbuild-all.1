Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68576163
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 00:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712966690; cv=none; b=CDm6o1D7RxxRt55loW+2mz8Sc/VW73Ku2bOXGKdpAIzOw5vauyWgy2ZM+VXzK18He5c+Mbvp9zE9SljAnj2O9oRpg/o08NQCja5ZgUL4CttwMoOHjE300iUYJ4GBQW+qJ3qrCcJ3LX7c5YElaEGwQ9SSUx64u0HcQYQyj3c5v6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712966690; c=relaxed/simple;
	bh=WfdOvkY9j2sJmfYneNBOoSMHLHXsNzsBQYqNMrk86SU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jot0mSwvaGgdYAdGYJhBZ1fVda+Y3twhodu3FTrVZhpmRaRVKA+iPvpPUu+K0Ocl0jj34Sd5kcKbozy+QDp3XXWFXLzl4pIg4V4Am3uGhp6TWIh1XcYttM3YizLjmx+S/iVwpeQRMbHk8Lnn1CAGx/wk7jhXel8zpfw+XmJDAQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj0e/Ox9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj0e/Ox9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712966687; x=1744502687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfdOvkY9j2sJmfYneNBOoSMHLHXsNzsBQYqNMrk86SU=;
  b=Qj0e/Ox9j77ntR9YTs0KUQUzklK/BIwM1GgoiPa3HEAvdnhMBY82XjJM
   uKEsBVrV3iQE39F4ajMAoIP+8QlwggKsP5iGaT1Ms+T/k9wPTOUfJVXrq
   QWBiF4vXLXBFbCDDmcsMnZal1OpxEhgDrsRDYTJI4mojMiHHW2H15PUJg
   9SogQFMH/b4iQzhQvC9HSOhYKBgKw+QzjYX6/oq9UczCcQQJnG5/s0JAz
   f6J1qkEPK1T3/un4J7mI6+r1xCE9mg4lyIpeAFjq1AaJz5c5odRazzigg
   /c6w8giWYXDH5CDMByIo7K738BuBdawP4A9kpJ34NT4R2ad4Cf5nV13D0
   w==;
X-CSE-ConnectionGUID: rs3Cv+EwTdGnh3AwrYsXhQ==
X-CSE-MsgGUID: UNNIp1snQ1qF3Zvl7/Qc9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="11394046"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="11394046"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 17:04:46 -0700
X-CSE-ConnectionGUID: jExICiPgRYOBsREM76ZMiw==
X-CSE-MsgGUID: 4UtHR/kdSwWPRlOdmzFeXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="21405697"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Apr 2024 17:04:45 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvQss-000132-1j;
	Sat, 13 Apr 2024 00:04:42 +0000
Date: Sat, 13 Apr 2024 08:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26258/30000]
 drivers/ub/urma/ubcore/ubcore_device.c:344:6: sparse: sparse: symbol
 'ubcore_destroy_upi_list' was not declared. Should it be static?
Message-ID: <202404130852.oq58Pd8N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   30b94f5b7f90893f07314da68de8bdafb68bc2b8
commit: 84e122368ec3a37e074c9657bc09422b62f6ccd0 [26258/30000] ub: add new feature for urma
config: x86_64-randconfig-121-20240413 (https://download.01.org/0day-ci/archive/20240413/202404130852.oq58Pd8N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130852.oq58Pd8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130852.oq58Pd8N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcore_device.c:344:6: sparse: sparse: symbol 'ubcore_destroy_upi_list' was not declared. Should it be static?
--
   drivers/ub/urma/ubcore/ubcore_main.c:66:5: sparse: sparse: symbol 'ubcore_open' was not declared. Should it be static?
   drivers/ub/urma/ubcore/ubcore_main.c:90:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:90:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:90:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:121:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:121:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:121:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:143:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:143:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:143:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:159:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:159:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:159:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:184:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:184:37: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:184:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:194:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:194:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:194:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:228:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:228:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:228:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:313:18: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:313:18: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:313:18: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:511:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:511:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:511:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:518:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:518:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:518:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:524:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:524:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:524:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:530:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:530:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:530:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:536:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:536:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:536:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:542:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:542:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:542:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:549:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:549:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:549:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:556:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:556:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:556:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:563:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:563:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:563:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:569:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:569:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:569:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:575:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:575:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:575:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:614:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:614:34: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:614:34: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:639:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:639:34: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:639:34: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:673:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:673:49: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:673:49: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:724:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:724:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:724:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:738:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:738:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:738:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:764:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:764:37: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:764:37: sparse:     got void [noderef] __user *
>> drivers/ub/urma/ubcore/ubcore_main.c:890:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] reserved2 @@     got restricted __be32 [usertype] @@
   drivers/ub/urma/ubcore/ubcore_main.c:890:41: sparse:     expected unsigned int [usertype] reserved2
   drivers/ub/urma/ubcore/ubcore_main.c:890:41: sparse:     got restricted __be32 [usertype]
   drivers/ub/urma/ubcore/ubcore_main.c:891:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __be32 [usertype] ipv4 @@
   drivers/ub/urma/ubcore/ubcore_main.c:891:36: sparse:     expected unsigned int [usertype] addr
   drivers/ub/urma/ubcore/ubcore_main.c:891:36: sparse:     got restricted __be32 [usertype] ipv4
>> drivers/ub/urma/ubcore/ubcore_main.c:1061:51: sparse: sparse: restricted __be64 degrades to integer
   drivers/ub/urma/ubcore/ubcore_main.c:1168:66: sparse: sparse: restricted __be64 degrades to integer
   drivers/ub/urma/ubcore/ubcore_main.c: note: in included file:
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
--
>> drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:38:18: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:38:18: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:38:18: sparse:     got void [noderef] __user *
>> drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:50:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:50:18: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:50:18: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:201:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:201:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:201:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:309:18: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:309:18: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:309:18: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:333:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:333:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:333:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:427:18: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:427:18: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:427:18: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:475:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:475:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:475:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:483:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:483:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:483:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:572:18: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:572:18: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:572:18: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:616:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:616:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:616:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:706:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:706:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:706:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:803:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:803:43: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:803:43: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:836:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:836:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:836:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:908:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:908:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:908:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:940:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:940:34: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:940:34: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:958:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:958:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:958:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:999:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:999:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:999:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1113:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1113:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1113:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1156:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1156:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1156:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1198:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1198:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1198:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1214:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1214:34: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1214:34: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1226:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1226:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1226:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1291:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1291:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1291:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1313:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1313:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1313:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1351:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1351:34: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1351:34: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1442:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1442:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1442:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1475:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1475:34: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1475:34: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1499:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1499:43: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1499:43: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1549:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1549:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1549:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1579:18: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1579:18: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1579:18: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1604:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1604:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1604:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1629:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1629:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1629:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1670:18: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1670:18: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1670:18: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1695:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1695:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1695:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1720:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:1720:44: sparse:     expected void const *args_addr
--
   drivers/ub/urma/uburma/uburma_cmd.c:69:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:69:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:69:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:96:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:96:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:96:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:149:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:149:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:149:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:171:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:171:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:171:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:193:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:193:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:193:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:226:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:226:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:226:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:256:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:256:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:256:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:283:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:283:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:283:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:306:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_cmd.c:306:16: sparse:    void [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_cmd.c:306:16: sparse:    void *
   drivers/ub/urma/uburma/uburma_cmd.c:315:6: sparse: sparse: symbol 'uburma_jfc_event_cb' was not declared. Should it be static?
   drivers/ub/urma/uburma/uburma_cmd.c:327:6: sparse: sparse: symbol 'uburma_jfs_event_cb' was not declared. Should it be static?
   drivers/ub/urma/uburma/uburma_cmd.c:339:6: sparse: sparse: symbol 'uburma_jfr_event_cb' was not declared. Should it be static?
   drivers/ub/urma/uburma/uburma_cmd.c:351:6: sparse: sparse: symbol 'uburma_jetty_event_cb' was not declared. Should it be static?
>> drivers/ub/urma/uburma/uburma_cmd.c:363:6: sparse: sparse: symbol 'uburma_jetty_grp_event_cb' was not declared. Should it be static?
   drivers/ub/urma/uburma/uburma_cmd.c:387:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:387:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:387:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:442:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:442:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:442:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:472:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:472:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:472:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:495:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:495:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:495:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:511:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:511:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:511:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:541:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:541:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:541:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:555:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:555:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:555:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:579:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:579:37: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:579:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:593:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:593:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:593:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:621:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:621:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:621:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:639:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:639:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:639:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:667:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:667:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:667:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:718:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:718:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:718:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:748:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:748:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:748:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:772:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:772:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:772:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:788:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:788:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:788:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:818:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:818:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:818:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:832:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:832:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:832:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:856:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:856:37: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:856:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:871:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:871:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:871:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:919:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:919:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:919:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:949:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:949:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:949:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:973:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:973:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:973:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:987:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:987:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:987:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1012:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1012:37: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1012:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1064:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1064:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1064:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1130:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1130:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1130:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1171:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1171:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1171:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1195:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1195:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1195:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1211:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1211:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1211:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1254:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1254:36: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1254:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1268:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1268:44: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1268:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1292:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd.c:1292:37: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd.c:1292:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd.c:1304:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@

vim +/ubcore_destroy_upi_list +344 drivers/ub/urma/ubcore/ubcore_device.c

   343	
 > 344	void ubcore_destroy_upi_list(void)
   345	{
   346		struct ubcore_upi_entry *entry = NULL, *next;
   347	
   348		mutex_lock(&g_upi_lock);
   349		list_for_each_entry_safe(entry, next, &g_upi_list, node) {
   350			if (entry != NULL) {
   351				list_del(&entry->node);
   352				kfree(entry);
   353			}
   354		}
   355		mutex_unlock(&g_upi_lock);
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
