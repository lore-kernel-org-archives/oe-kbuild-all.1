Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0762EA8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zio5WSyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585177; x=1733121177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBneNhaSZ+fkOXCXhzrLXPZFh7WQvZ5+2lA0FQrAFy4=;
  b=Zio5WSykf26khKkfWEMRgY8A2KRcNHY16WhcAExAXioYzMqbyYok1eoR
   Ojeo9pIbglZVI+pKbmBtztgR6+7AlqcDi/MfqZberVXft7suAoBUNv5rL
   VtarpgaSFQrW1Nzbiv9AnGLhHfwhDErR4yFZ3H2KlAekUfiEDCzQXGJLF
   EPOy3rNj2pERWvcXPnt0S6oQ34mFA+lgTFiiMhhDZ+unhipaoatAlwqF2
   XzdU54DLezpVH52CmNvPTgT+6G0YOp3WzuIYp4X3V1k0RTQMYi4tRTSRr
   lnrU8pgljkNJBcEUfS5Bodw/bG/cxje7U105KH7NXIinRzA85O49S1ckH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906526"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906526"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191157"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191157"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006Lh-22;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	"Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: drivers/cpufreq/powernv-cpufreq.c:521:50: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202312030500.WC4krvMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: c89f2682a39192433c296bf97b834fd2815a758b cpufreq: powernv: Replace pr_info with trace print for throttle event
date:   8 years ago
config: powerpc64-randconfig-r113-20231107 (https://download.01.org/0day-ci/archive/20231203/202312030500.WC4krvMp-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030500.WC4krvMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312030500.WC4krvMp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/cpufreq/powernv-cpufreq.c:190:18: sparse: sparse: symbol 'cpufreq_freq_attr_cpuinfo_nominal_freq' was not declared. Should it be static?
   drivers/cpufreq/powernv-cpufreq.c:436:6: sparse: sparse: symbol 'powernv_cpufreq_work_fn' was not declared. Should it be static?
   drivers/cpufreq/powernv-cpufreq.c:476:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] type @@     got unsigned long long @@
   drivers/cpufreq/powernv-cpufreq.c:476:19: sparse:     expected restricted __be64 [usertype] type
   drivers/cpufreq/powernv-cpufreq.c:476:19: sparse:     got unsigned long long
   drivers/cpufreq/powernv-cpufreq.c:499:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] chip @@     got unsigned long long @@
   drivers/cpufreq/powernv-cpufreq.c:499:27: sparse:     expected restricted __be64 [usertype] chip
   drivers/cpufreq/powernv-cpufreq.c:499:27: sparse:     got unsigned long long
   drivers/cpufreq/powernv-cpufreq.c:500:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] throttle_status @@     got unsigned long long @@
   drivers/cpufreq/powernv-cpufreq.c:500:38: sparse:     expected restricted __be64 [usertype] throttle_status
   drivers/cpufreq/powernv-cpufreq.c:500:38: sparse:     got unsigned long long
   drivers/cpufreq/powernv-cpufreq.c:516:48: sparse: sparse: restricted __be64 degrades to integer
   drivers/cpufreq/powernv-cpufreq.c:519:25: sparse: sparse: restricted __be64 degrades to integer
   drivers/cpufreq/powernv-cpufreq.c:520:25: sparse: sparse: restricted __be64 degrades to integer
>> drivers/cpufreq/powernv-cpufreq.c:521:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] throttle_reason @@     got restricted __be64 [usertype] throttle_status @@
   drivers/cpufreq/powernv-cpufreq.c:521:50: sparse:     expected unsigned char [usertype] throttle_reason
   drivers/cpufreq/powernv-cpufreq.c:521:50: sparse:     got restricted __be64 [usertype] throttle_status
   drivers/cpufreq/powernv-cpufreq.c:478:21: sparse: sparse: restricted __be64 degrades to integer
   drivers/cpufreq/powernv-cpufreq.c:478:21: sparse: sparse: restricted __be64 degrades to integer
   drivers/cpufreq/powernv-cpufreq.c:436:6: warning: no previous prototype for 'powernv_cpufreq_work_fn' [-Wmissing-prototypes]
     436 | void powernv_cpufreq_work_fn(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/powernv-cpufreq.c: In function 'powernv_cpufreq_occ_msg':
   drivers/cpufreq/powernv-cpufreq.c:519:42: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     519 |                 if (omsg.throttle_status >= 0 &&
         |                                          ^~

vim +521 drivers/cpufreq/powernv-cpufreq.c

   465	
   466	static int powernv_cpufreq_occ_msg(struct notifier_block *nb,
   467					   unsigned long msg_type, void *_msg)
   468	{
   469		struct opal_msg *msg = _msg;
   470		struct opal_occ_msg omsg;
   471		int i;
   472	
   473		if (msg_type != OPAL_MSG_OCC)
   474			return 0;
   475	
   476		omsg.type = be64_to_cpu(msg->params[0]);
   477	
   478		switch (omsg.type) {
   479		case OCC_RESET:
   480			occ_reset = true;
   481			pr_info("OCC (On Chip Controller - enforces hard thermal/power limits) Resetting\n");
   482			/*
   483			 * powernv_cpufreq_throttle_check() is called in
   484			 * target() callback which can detect the throttle state
   485			 * for governors like ondemand.
   486			 * But static governors will not call target() often thus
   487			 * report throttling here.
   488			 */
   489			if (!throttled) {
   490				throttled = true;
   491				pr_warn("CPU frequency is throttled for duration\n");
   492			}
   493	
   494			break;
   495		case OCC_LOAD:
   496			pr_info("OCC Loading, CPU frequency is throttled until OCC is started\n");
   497			break;
   498		case OCC_THROTTLE:
   499			omsg.chip = be64_to_cpu(msg->params[1]);
   500			omsg.throttle_status = be64_to_cpu(msg->params[2]);
   501	
   502			if (occ_reset) {
   503				occ_reset = false;
   504				throttled = false;
   505				pr_info("OCC Active, CPU frequency is no longer throttled\n");
   506	
   507				for (i = 0; i < nr_chips; i++) {
   508					chips[i].restore = true;
   509					schedule_work(&chips[i].throttle);
   510				}
   511	
   512				return 0;
   513			}
   514	
   515			for (i = 0; i < nr_chips; i++)
   516				if (chips[i].id == omsg.chip)
   517					break;
   518	
   519			if (omsg.throttle_status >= 0 &&
   520			    omsg.throttle_status <= OCC_MAX_THROTTLE_STATUS)
 > 521				chips[i].throttle_reason = omsg.throttle_status;
   522	
   523			if (!omsg.throttle_status)
   524				chips[i].restore = true;
   525	
   526			schedule_work(&chips[i].throttle);
   527		}
   528		return 0;
   529	}
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
