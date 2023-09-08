Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12AD6FD1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694214336; x=1725750336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZtwfvzMYTm05m+TJSjnBo4oZPPsXdXbRTm5U1Q+0M1c=;
  b=VFVNH8j2m1Cug63hQ1UC59fLFbeSaHRHiW8S3OP0Vcr/36U1gM4rE/e/
   pJ3wj3mjqeKM53YbLJ6etbFKA37WiaFHUmMBDdqg5d7Nl5AmClbLdTe1V
   y8jtXtRdJ9uU4wR3xbYN1VjV9MbdxlqtY3NpAo07QLbiC6FZ11xAi5vhN
   n0fTmfgPrcDOiLT9a+Z6qsf8VIzqzLGHaVKvV5heU8r0npo0W/+WD41iH
   qmQE5n5o9GJ4hx6arqRUawMV81b62KOEdydAq+82KGD4FeHK/yd+JGU61
   M3z8o/PWfgnA/cc/fo3yOats0HWfYZMwueGDXMZAaXWRffw+8eamrGO1J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441777932"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="441777932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 16:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="808173202"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="808173202"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Sep 2023 16:05:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qekXc-0002hm-1x;
	Fri, 08 Sep 2023 23:05:32 +0000
Date: Sat, 9 Sep 2023 07:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-ia64@vger.kernel.org
Subject: [aegl:resctrl2_v65 3/4] fs/resctrl2/arch/x86/amd_smba.c:243:32:
 warning: 'smba_feature' defined but not used
Message-ID: <202309090740.o2jakl2Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_v65
head:   13c888afbee9f7da0a4a969617dea9889da9d711
commit: 75c85a7905a138996d3d1309cc87798db5979de0 [3/4] resctrl2: AMD Slow Memory Bandwidth Allocation
config: i386-randconfig-054-20230909 (https://download.01.org/0day-ci/archive/20230909/202309090740.o2jakl2Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090740.o2jakl2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090740.o2jakl2Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl2/arch/x86/amd_smba.c:243:32: warning: 'smba_feature' defined but not used [-Wunused-const-variable=]
     243 | static const struct x86_cpu_id smba_feature[] = {
         |                                ^~~~~~~~~~~~


vim +/smba_feature +243 fs/resctrl2/arch/x86/amd_smba.c

   242	
 > 243	static const struct x86_cpu_id smba_feature[] = {
   244		X86_MATCH_FEATURE(X86_FEATURE_SMBA, 0),
   245		{ },
   246	};
   247	MODULE_DEVICE_TABLE(x86cpu, smba_feature);
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
