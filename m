Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D714AD17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721737175; cv=none; b=eoBBV41oxIK6RgEwov1Gi4TMZ9DQCuVxq4cKWZJB8w5CDFvp8ax8IW67hriOl2HEMP04IZUY3EzqbS7/wUTf6u0VmEGWNM5hcYMrgMAWniRwxVBQyWLrk+5Pf7K0gOtFTq6YgYrG24hlzmi6woOiRbEdEEvdXyAAuBSW71CJXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721737175; c=relaxed/simple;
	bh=rszjCNfQNap/8kQkDzv2BDY8q7kJq4vXr/YDQ4U9xJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=myLSIslETVR7Li57JRR6BMzk9T29pAgl0st1eV6gG3z3WeE/e6CCPQ4xmoHp2KPJYFPHzxPe2dz5q2jiOdLeO8bjpkGSCixuFFGARHyiBabUjbkDngnJXwwTF3zxmilm+BTKyAKh/CqQd4e2pRoR0kAk88gdrQ+lTk/MAqe4aWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnFeN/c9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnFeN/c9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721737172; x=1753273172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rszjCNfQNap/8kQkDzv2BDY8q7kJq4vXr/YDQ4U9xJE=;
  b=mnFeN/c9Sp8kTfp2kvh+cd1xXLb5LYcZVDes92S5k4kKgADeQVtVlzA4
   rpRP/+qcDBj/bRZMTbOZvNgG2mVxNXEyEs8vDUUQJyfVxaBKJBMg8bNED
   YN4RWADXOOaLWfsTfYDOh4FTQpRgPo+Jg7ZgztNGp4QI0sQHtzr+iDpkR
   d8QulS+HFuoE8OYOyG2jITdTykCQhLk4RwGL95S4LdFfyKWQ25mLjxt21
   r1mLdpR+kT0tbtOtPiNN4IwEIKsZe1Q/2vUuZOxX7VvrMHIz5p8PHMxSO
   vbrro1Fz5LCPM99C2olNkKJxV6z9EjsAlmWqPtC8Wfa3vEpes8tCydyTy
   Q==;
X-CSE-ConnectionGUID: buTgXQGBSmaNYguobA2yhQ==
X-CSE-MsgGUID: usklrFtiTPCSevZZHYg2/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29948112"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29948112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 05:19:32 -0700
X-CSE-ConnectionGUID: nwkRyzloT2Skz6KAgVNjzQ==
X-CSE-MsgGUID: YlQK9ciNS0uyKAvxv4snXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="57342887"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2024 05:19:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWEUK-000lvx-17;
	Tue, 23 Jul 2024 12:19:28 +0000
Date: Tue, 23 Jul 2024 20:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1696/23347] drivers/usb/roles/class.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202407232033.iAaUwu3f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8d2f09e210f079f53eb6c1ba1ef639d73a17d61b
commit: bb87eff0e698d6e312b435f482d4b0b5672b11d0 [1696/23347] usb: roles: Add a description for the class to Kconfig
config: x86_64-buildonly-randconfig-005-20240723 (https://download.01.org/0day-ci/archive/20240723/202407232033.iAaUwu3f-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407232033.iAaUwu3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407232033.iAaUwu3f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/roles/class.c:12:
   include/linux/module.h:133:13: warning: 'init_module' specifies less restrictive attribute than its target 'usb_roles_init': 'cold' [-Wmissing-attributes]
     133 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/module.h:116:41: note: in expansion of macro 'module_init'
     116 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/usb/roles/class.c:303:1: note: in expansion of macro 'subsys_initcall'
     303 | subsys_initcall(usb_roles_init);
         | ^~~~~~~~~~~~~~~
   drivers/usb/roles/class.c:298:19: note: 'init_module' target declared here
     298 | static int __init usb_roles_init(void)
         |                   ^~~~~~~~~~~~~~
   include/linux/module.h:139:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'usb_roles_exit': 'cold' [-Wmissing-attributes]
     139 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/usb/roles/class.c:309:1: note: in expansion of macro 'module_exit'
     309 | module_exit(usb_roles_exit);
         | ^~~~~~~~~~~
   drivers/usb/roles/class.c:305:20: note: 'cleanup_module' target declared here
     305 | static void __exit usb_roles_exit(void)
         |                    ^~~~~~~~~~~~~~
>> drivers/usb/roles/class.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
