Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A88186B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 19:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689447846; x=1720983846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhiEnM0CtFrPPJFx7tCbrB3f/xZ38zvHMUktxypFU+c=;
  b=kyyAX803VpW7lrr4pGMvUnAiv3dWVEoLeVBPvko6ysSZ8GylijrZppre
   e6LT686bxfp7+1dY6MXM6yjDLtFkZoRfc+gW9L2od8VTH5uAoZ+mBauRG
   7sHc3JLLbizE4STgn85cJjf6R7VOFpChMtD3b8C49YL+LPHwSjvwK2M6o
   RcsbwOqHOo+3QMFdNImIP8dWveCqhNJvAiiuQ0ggIfQVpdmGHIcIHAPpm
   ALyjKuWaPyOVeYSpYrvI/hECBrNKh/78afvZX0EGh1S1TKXVXIN2Aj9tL
   WVMAarXMV9DbRkihYD3S9bwUYTfyaHdzcSc6BMCpb7C0GV03bVJufQNBq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="363151696"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="363151696"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 12:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846818416"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="846818416"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 12:04:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKkYm-0008Jp-0g;
	Sat, 15 Jul 2023 19:04:04 +0000
Date: Sun, 16 Jul 2023 03:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 30/38]
 arch/x86/kernel/apic/x2apic_phys.c:108:5: warning: no previous prototype for
 'x2apic_apic_id_valid'
Message-ID: <202307160209.TJBfCev3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   59df0262d2da163a8281c806688cc62e4d919908
commit: e2f40f2fdd6f60db02638b295a11feaee036fe70 [30/38] x86/apic: Sanitize APID ID range validation
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230716/202307160209.TJBfCev3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160209.TJBfCev3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160209.TJBfCev3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/apic/x2apic_phys.c:11:30: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__refdatao'
      11 | static u32 x2apic_max_apicid __refdatao;
         |                              ^~~~~~~~~~
   arch/x86/kernel/apic/x2apic_phys.c: In function 'x2apic_set_max_apicid':
   arch/x86/kernel/apic/x2apic_phys.c:15:9: error: 'x2apic_max_apicid' undeclared (first use in this function); did you mean 'x2apic_set_apic_id'?
      15 |         x2apic_max_apicid = apicid;
         |         ^~~~~~~~~~~~~~~~~
         |         x2apic_set_apic_id
   arch/x86/kernel/apic/x2apic_phys.c:15:9: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/apic/x2apic_phys.c: In function 'x2apic_phys_probe':
   arch/x86/kernel/apic/x2apic_phys.c:99:40: error: 'x2apic_max_apicid' undeclared (first use in this function); did you mean 'x2apic_set_apic_id'?
      99 |         apic_x2apic_phys.max_apic_id = x2apic_max_apicid;
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        x2apic_set_apic_id
   arch/x86/kernel/apic/x2apic_phys.c: At top level:
>> arch/x86/kernel/apic/x2apic_phys.c:108:5: warning: no previous prototype for 'x2apic_apic_id_valid' [-Wmissing-prototypes]
     108 | int x2apic_apic_id_valid(u32 apicid)
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/x2apic_phys.c: In function 'x2apic_apic_id_valid':
   arch/x86/kernel/apic/x2apic_phys.c:110:13: error: 'x2apic_max_apicid' undeclared (first use in this function); did you mean 'x2apic_set_apic_id'?
     110 |         if (x2apic_max_apicid && apicid > x2apic_max_apicid)
         |             ^~~~~~~~~~~~~~~~~
         |             x2apic_set_apic_id


vim +/x2apic_apic_id_valid +108 arch/x86/kernel/apic/x2apic_phys.c

9ebd680bd029a9 Suresh Siddha   2011-05-19  106  
981c2eac1cb97c Thomas Gleixner 2017-09-13  107  /* Common x2apic functions, also used by x2apic_cluster */
a774635db5c430 Li RongQing     2018-04-10 @108  int x2apic_apic_id_valid(u32 apicid)
981c2eac1cb97c Thomas Gleixner 2017-09-13  109  {
26573a97746c7a David Woodhouse 2020-10-24  110  	if (x2apic_max_apicid && apicid > x2apic_max_apicid)
26573a97746c7a David Woodhouse 2020-10-24  111  		return 0;
26573a97746c7a David Woodhouse 2020-10-24  112  
981c2eac1cb97c Thomas Gleixner 2017-09-13  113  	return 1;
981c2eac1cb97c Thomas Gleixner 2017-09-13  114  }
981c2eac1cb97c Thomas Gleixner 2017-09-13  115  

:::::: The code at line 108 was first introduced by commit
:::::: a774635db5c430cbf21fa5d2f2df3d23aaa8e782 x86/apic: Fix signedness bug in APIC ID validity checks

:::::: TO: Li RongQing <lirongqing@baidu.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
