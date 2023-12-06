Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E8870963
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZtgraE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701903489; x=1733439489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FfbV609DCID9qR6ezb5mNSnsdjhr6Zs1WD3pAs6XK2M=;
  b=AZtgraE096zC59d/rPsPmGS18beQTTK1FV/pe6hJ+dWRqFM4njbGPP7X
   TZmwdsH/a+ENpxs02XLei9ZlzvEaflObqsIq95X8sr+wjTnC6N15M1Ooq
   rmo/2c+ebsNXZDTKxn3i7cyGFwzKFpyaiv0FBUvNosWHsGtqqLbnyWJxC
   EV3Wgi0v6WDGBqPDt4jVQoPjViRNO5b0OPPUR4750gF69h7O/1H5qdbd9
   6APJclrb/2I9J1WnGISYHFyQ7WsDDNIlXmmVA7KF4tNAi22f9Reyszl48
   iMjlhKJh2zM6PT/DLLlUW02+81WjizDR1oKIGsGb9LJfuejjuxIzNCCh7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12854618"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12854618"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 14:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771470237"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="771470237"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 06 Dec 2023 14:58:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB0qC-000BX8-1L;
	Wed, 06 Dec 2023 22:58:04 +0000
Date: Thu, 7 Dec 2023 06:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 639/1891]
 security/chromiumos/alt-syscall.c:513:9: warning: 'strncpy' specified bound
 33 equals destination size
Message-ID: <202312070638.bxV2ZrMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b92a48381564e28f2ab3a5b9379814f2330bc9d1
commit: dfb9fa4c7ef05f59798f296fc178c1f4b2587479 [639/1891] CHROMIUM: ARM64: Add alt-syscall support
config: arm64-randconfig-r061-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070638.bxV2ZrMD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070638.bxV2ZrMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070638.bxV2ZrMD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'alt_syscall_init_one',
       inlined from 'chromiumos_alt_syscall_init' at security/chromiumos/alt-syscall.c:549:9:
>> security/chromiumos/alt-syscall.c:513:9: warning: 'strncpy' specified bound 33 equals destination size [-Wstringop-truncation]
     513 |         strncpy(t->name, wl->name, sizeof(t->name));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +513 security/chromiumos/alt-syscall.c

587f68cd451ceb Guenter Roeck 2018-09-21  504  
587f68cd451ceb Guenter Roeck 2018-09-21  505  static int __init alt_syscall_init_one(const struct syscall_whitelist *wl)
587f68cd451ceb Guenter Roeck 2018-09-21  506  {
587f68cd451ceb Guenter Roeck 2018-09-21  507  	struct alt_sys_call_table *t;
587f68cd451ceb Guenter Roeck 2018-09-21  508  	int err;
587f68cd451ceb Guenter Roeck 2018-09-21  509  
587f68cd451ceb Guenter Roeck 2018-09-21  510  	t = kzalloc(sizeof(*t), GFP_KERNEL);
587f68cd451ceb Guenter Roeck 2018-09-21  511  	if (!t)
587f68cd451ceb Guenter Roeck 2018-09-21  512  		return -ENOMEM;
587f68cd451ceb Guenter Roeck 2018-09-21 @513  	strncpy(t->name, wl->name, sizeof(t->name));
587f68cd451ceb Guenter Roeck 2018-09-21  514  
587f68cd451ceb Guenter Roeck 2018-09-21  515  	err = arch_dup_sys_call_table(t);
587f68cd451ceb Guenter Roeck 2018-09-21  516  	if (err)
587f68cd451ceb Guenter Roeck 2018-09-21  517  		return err;
587f68cd451ceb Guenter Roeck 2018-09-21  518  
587f68cd451ceb Guenter Roeck 2018-09-21  519  	err = alt_syscall_apply_whitelist(wl, t);
587f68cd451ceb Guenter Roeck 2018-09-21  520  	if (err)
587f68cd451ceb Guenter Roeck 2018-09-21  521  		return err;
587f68cd451ceb Guenter Roeck 2018-09-21  522  	err = alt_syscall_apply_compat_whitelist(wl, t);
587f68cd451ceb Guenter Roeck 2018-09-21  523  	if (err)
587f68cd451ceb Guenter Roeck 2018-09-21  524  		return err;
587f68cd451ceb Guenter Roeck 2018-09-21  525  
587f68cd451ceb Guenter Roeck 2018-09-21  526  	return register_alt_sys_call_table(t);
587f68cd451ceb Guenter Roeck 2018-09-21  527  }
587f68cd451ceb Guenter Roeck 2018-09-21  528  

:::::: The code at line 513 was first introduced by commit
:::::: 587f68cd451ceb0cf42e01dd980180cc2ccef02c CHROMIUM: create alt-syscall infrastructure

:::::: TO: Guenter Roeck <groeck@chromium.org>
:::::: CC: Tzung-Bi Shih <tzungbi@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
