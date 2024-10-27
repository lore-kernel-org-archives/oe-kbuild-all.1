Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E562125B9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 02:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729997649; cv=none; b=JIWfkOQ7lodrxtTvE8aVfvXbpFEwLBOUIX3QuSvk+6eXl/rEjnu7Xd6o/MSnxv6qoU+rE84OwsFeYfe1CUlmKt6Jc7gq/G6WgtN9xfTqF+D+t+zZDSm71iQA/X9ic7F45t2UbhKrxZA6z4j3zSy9tfOyggua5ZtaiRh9j6ABPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729997649; c=relaxed/simple;
	bh=ygHBhmuqNYiN9jeoaF6VwegnqjTIOOa+GD/EJkO2780=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYaPmzEgZRgLSTy/iujrKNK3xkQWEknU+7M54a6LXwb0KvKI4tCDUzpbKVqnfcRuErIUtLreGGXBvBRx6ZDuRTUmUbt1Q2lmlucYIR/LoQ7hsO8QhDBHf32b4z9I2pZESMBpxnq8nGQIW+1qv3xz/+4fO/D4vzrQHxIfKpFv6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kboi2E7+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kboi2E7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729997647; x=1761533647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ygHBhmuqNYiN9jeoaF6VwegnqjTIOOa+GD/EJkO2780=;
  b=kboi2E7+fGlgMQloWXC84vTZiQ+a0YgKNewx3aJ4Zo0AgNA4IwhLtd+8
   jwDLpFG3YvCKuIGH6WFtGZ1MsxKGR56LqnakNiG8Gv35D8KOlvcVHJbYT
   Cpvwzk9dFgJ5yfYPIEfTZN46vH08h9V+9Vvw6SJ7ziZuuI0gpYmV6MQFH
   qHjGJBl84pVr5EpuJsc25Y94L5EAWr37I7ZB5kCBW3jQNwIDfYIlqjJuN
   Lg5CSlNerT2NQFW9YwpDeazdAqp4s6tCd+HBCh5nhTNjN0o6Wyi5UfyD2
   PMDqBck4sm08aTZ+g0qOGqCrnVM8W76XkCYXWCHVrzJau4sR6kosg/wso
   g==;
X-CSE-ConnectionGUID: mmXlnIXSS+i+QjLkWTxviw==
X-CSE-MsgGUID: VNeHdef5R8GN86gHvTihBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="17260876"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="17260876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 19:54:07 -0700
X-CSE-ConnectionGUID: D6CoAu1bT7mQcNvqMfNBSQ==
X-CSE-MsgGUID: VaQDH1TCS+ShfIR/iEV5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81189909"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Oct 2024 19:54:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4tPn-000aI9-14;
	Sun, 27 Oct 2024 02:54:03 +0000
Date: Sun, 27 Oct 2024 10:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13850/23866]
 arch/arm64/mm/init.c:784:17: error: 'mem_sleep_current' undeclared
Message-ID: <202410271033.v9jrl44I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: fdda68feeca82610ccbcdcbda7250623a6d187d2 [13850/23866] arm64/ascend: Set mem_sleep_current to PM_SUSPEND_ON for ascend platform
config: arm64-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271033.v9jrl44I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271033.v9jrl44I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271033.v9jrl44I-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/init.c:469:13: warning: no previous prototype for 'arm64_memblock_init' [-Wmissing-prototypes]
     469 | void __init arm64_memblock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c: In function 'ascend_enable_setup':
>> arch/arm64/mm/init.c:784:17: error: 'mem_sleep_current' undeclared (first use in this function)
     784 |                 mem_sleep_current = PM_SUSPEND_ON;
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:784:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/mem_sleep_current +784 arch/arm64/mm/init.c

   770	
   771	#ifdef CONFIG_ASCEND_FEATURES
   772	static int __init ascend_enable_setup(char *__unused)
   773	{
   774		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   775			enable_mmap_dvpp = 1;
   776	
   777		if (IS_ENABLED(CONFIG_ASCEND_IOPF_HIPRI))
   778			enable_iopf_hipri = 1;
   779	
   780		if (IS_ENABLED(CONFIG_ASCEND_CHARGE_MIGRATE_HUGEPAGES))
   781			enable_charge_mighp = 1;
   782	
   783		if (IS_ENABLED(CONFIG_SUSPEND))
 > 784			mem_sleep_current = PM_SUSPEND_ON;
   785	
   786		return 1;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
