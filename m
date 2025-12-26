Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB8B2BD5AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766750483; cv=none; b=GVIUFiJ1TI4YKZm01dgz3bSuX2/92xcbivSkSCD36BQNDeoLA6VWN6gnI/2rXVdB4JM1+DAn/02g96qk+PWTPcbG3dwwW10DIGbAYmP8JgcthTV3JjniO6p3wprq8ktHmZ1RmT0aRF72EUIjENnSY0Cw70+hv25qDrLRugaXjjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766750483; c=relaxed/simple;
	bh=xNCr9ES6hlOo3emIBsyAUgjMN1ME68NIOJTmaIgtVrU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VWPP10LJei6SZQY8Rtv0jrmOleSG/kptNr83qa5PTnyaiJSmaHfsF/f3ZYL2O91OOC7mToxzdD96SH7DAMMb6Jtpdj8xYVO660NB2/IBun9/X8eBiaP3CyzLvYLuVErIkKfGIx1iXp4sXKgtVYAPqdBejTyQtVbPsMzRU7Hf/+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciuflmLB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciuflmLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766750482; x=1798286482;
  h=date:from:to:cc:subject:message-id;
  bh=xNCr9ES6hlOo3emIBsyAUgjMN1ME68NIOJTmaIgtVrU=;
  b=ciuflmLBakQWln+Jr7MIS+I/4olGke37I2MON1ej3cG5m6Xi2EhIKnJc
   BBXXJW3TeFswFd9vE1JfrUqXjS+gfvdZYS4dMLdScpnGlP46PEA/XVXST
   SVciXkWFJsD/06Byz+aSM5zuE7ABdKuD5SPWKVmW5SwHpn2dmDSw9wMel
   hr/AEU7zKwbmLP9TX5qi5cDFRCXS+htv1+YQO+nJmOh1qhNe7X8fxbMcn
   Z88WeCvPUJ5EgOLizROF63YvC7pdsi7MC7QoUE8+cdVUY05q+9jY+B8rW
   X7Xl+ugD/g8PKOyh5LK0SP+2lXrAwDXiE23N7nyJgoo1F738kVAbHFutg
   w==;
X-CSE-ConnectionGUID: TsAFFDCIRAGGUG7uqZslYg==
X-CSE-MsgGUID: f80HXXw1SAGUrrF8F9g27g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68441879"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68441879"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 04:01:19 -0800
X-CSE-ConnectionGUID: wH05WVfMRJONAprpSDQ5Rg==
X-CSE-MsgGUID: PCuuK0piTSyC0l1YTPnvHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200124707"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Dec 2025 04:01:18 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ6VP-0000000050z-05Gc;
	Fri, 26 Dec 2025 12:01:15 +0000
Date: Fri, 26 Dec 2025 20:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/ub/ubus/services/ras.c:328:6: warning: no previous prototype for
 'ub_ras_init'
Message-ID: <202512261906.0Yqmph2F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: b16c9013e8adf3fbfb1f5a016785fd034c744a1c [13/13] ub:ubus: Support UBUS RAS capability
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261906.0Yqmph2F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261906.0Yqmph2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261906.0Yqmph2F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/ubus/services/ras.c:32:5: warning: no previous prototype for 'cper_severity_to_ub_ras' [-Wmissing-prototypes]
      32 | int cper_severity_to_ub_ras(int cper_severity)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/services/ras.c:272:6: warning: no previous prototype for 'ub_ras_recover_queue' [-Wmissing-prototypes]
     272 | void ub_ras_recover_queue(struct cper_sec_ubus *ubus_err, int severity)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/services/ras.c:328:6: warning: no previous prototype for 'ub_ras_init' [-Wmissing-prototypes]
     328 | void ub_ras_init(void)
         |      ^~~~~~~~~~~
>> drivers/ub/ubus/services/ras.c:333:6: warning: no previous prototype for 'ub_ras_uninit' [-Wmissing-prototypes]
     333 | void ub_ras_uninit(void)
         |      ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/ub_ras_init +328 drivers/ub/ubus/services/ras.c

   327	
 > 328	void ub_ras_init(void)
   329	{
   330		ub_ras_register_recover_func(ub_ras_recover_queue);
   331	}
   332	
 > 333	void ub_ras_uninit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
