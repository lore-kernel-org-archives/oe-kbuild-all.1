Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20086118
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 01:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyyJmQVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702862104; x=1734398104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1PVdXSjNP+aLFdoGmXcm97KkHtd3HN3gwqQwcKvCJWI=;
  b=HyyJmQVkkthc0Q/oq6JA/c+fzpN9MddAo4Sj6lVMlM1ZADm2xxLQsJCq
   bUWU46ZxlyU9rp2QrHwfs/I3kplCX2Qk+QOkSXsetos7cIIdaF1RJ62Si
   KihqdZM8kYmVvXyttyMpnoaDbrgBDDQ01fnZaeevnmEPpCM3HYhzGprJ0
   +GY3JQUgRhrvgILlXes9nRbPuDrj8WAqWSGawb/XR9adHfyj4Qo84ojoe
   YsuEc0j1IlaJHIVKcYXm0SZq/Acl2svJdWq7mx29WubrS1tdWCOBeoXyS
   d/XwNlPoajfUKlNKoQRdNTCmLpVM/Y4PHbOqRJT6Covm3Xd/mfjQMfFqx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="426572363"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="426572363"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 17:15:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="841301655"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="841301655"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2023 17:15:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF2Dk-0003cA-2H;
	Mon, 18 Dec 2023 01:15:00 +0000
Date: Mon, 18 Dec 2023 09:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-hmem-report 20/24] drivers/cxl/mem.c:288:3: error:
 'dev_attr_mem_qos_class' undeclared here (not in a function); did you mean
 'dev_attr_pmem_qos_class'?
Message-ID: <202312180901.Ae3fzn7T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   da30cd12e1d2c65f67dcdae7cb4842d73184d98e
commit: d1877054cac84876a5263ea668dc0b76d321049d [20/24] fixup missing chunk
config: i386-buildonly-randconfig-003-20231218 (https://download.01.org/0day-ci/archive/20231218/202312180901.Ae3fzn7T-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180901.Ae3fzn7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180901.Ae3fzn7T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/mem.c:288:3: error: 'dev_attr_mem_qos_class' undeclared here (not in a function); did you mean 'dev_attr_pmem_qos_class'?
     &dev_attr_mem_qos_class.attr,
      ^~~~~~~~~~~~~~~~~~~~~~
      dev_attr_pmem_qos_class


vim +288 drivers/cxl/mem.c

   285	
   286	static struct attribute *cxl_mem_attrs[] = {
   287		&dev_attr_trigger_poison_list.attr,
 > 288		&dev_attr_mem_qos_class.attr,
   289		&dev_attr_pmem_qos_class.attr,
   290		NULL
   291	};
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
