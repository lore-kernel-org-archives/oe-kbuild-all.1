Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D695030EF97
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765531369; cv=none; b=gUW8rrsKj/a2KZL4wST4NHTLevEPFAaIOgNbEf/cOSWC8YeuRUHGUiLnanD+f1qqe4ztZLjAGnudsncJJHIgUfC/ody6fx6swllCqpI7o6bn3LwhVxo+lwQ+E5v69jrsnMP5N3ObbqM6r6E8QFG7Q6xdNiN9HdtclRKDZn+1HDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765531369; c=relaxed/simple;
	bh=rtHqofUE0KYsDU0vQUfBDfz7Wk+n4ETsDP4VkbpI/Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zy9MF7NRXgZmQjexMwMFnanYCgd0hklk+D+vDIVxeZx6iXtuyiJB8hGze1zfQSBLWffMHShz20fWaXEyDJP8wi5eHSD9gCSV8C3oXs593WXMhqZxVQaAquB53hv6fE4ymkVZbFDK68CzscYG6ge6mK0fFfuTevIm/5f4wKyrMtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9GCbjVW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9GCbjVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765531366; x=1797067366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rtHqofUE0KYsDU0vQUfBDfz7Wk+n4ETsDP4VkbpI/Lo=;
  b=h9GCbjVWSmeu32Q/iinl1OzqzieU/VHyKxTBRRxAlmgi0C0h3RFlnYG0
   Sg7n1L0XnHYjc+1tDUTpc45a+GS5ix23tnP8WB/QGsBgqjjIg/lt6nPmV
   atKhwaVGcPM95SqYyzI6JBCaWM795+s0KH43TwooDXj1O4gjoBGvZLH4s
   PwhdOmVK5WcJja3ORafFOeJVuWOOmAmp+r5RkriLGLLpdEmQ+hAFOnRUQ
   y+26iDHVz1QrjpKqGX0aiCUu/gChK6r9191QV6d2wHTp7WI4o7VOc/ncl
   HP+olqTPCha368370R6ziIhLFiIAIT7Fwm27WLmSfGNwfv1VfLWS6WSf3
   A==;
X-CSE-ConnectionGUID: nYvaqZb0TRiwHqASJwS6Ew==
X-CSE-MsgGUID: 9bv+RsfjQLWD+iEJ6sMuFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67688396"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67688396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:22:44 -0800
X-CSE-ConnectionGUID: x8uVIk5UTRyTmncute2I6A==
X-CSE-MsgGUID: /4Mgf3ZCTqWbb5q+FcQgkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="227681122"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 01:22:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzMH-000000005rj-0VEw;
	Fri, 12 Dec 2025 09:22:41 +0000
Date: Fri, 12 Dec 2025 17:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] kernel/irq/proc.c:338:13: warning: no
 previous prototype for 'register_irqchip_proc'
Message-ID: <202512121754.9WlPC9ui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   da8948fdddb84e5496272bab85973165594dd469
commit: a05426a568e457640f58698c8ebd636fcde4d202 [3406/3406] arm64: Introduce Xint software solution
config: arm64-randconfig-003-20251211 (https://download.01.org/0day-ci/archive/20251212/202512121754.9WlPC9ui-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121754.9WlPC9ui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121754.9WlPC9ui-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/proc.c:338:13: warning: no previous prototype for 'register_irqchip_proc' [-Wmissing-prototypes]
     338 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         |             ^~~~~~~~~~~~~~~~~~~~~
>> kernel/irq/proc.c:339:13: warning: no previous prototype for 'unregister_irqchip_proc' [-Wmissing-prototypes]
     339 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/register_irqchip_proc +338 kernel/irq/proc.c

   337	
 > 338	void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
 > 339	void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
