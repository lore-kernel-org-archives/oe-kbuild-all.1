Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F93111E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690893895; x=1722429895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DjnSPHFl5CqUJDQGOwJX95HbCHfCqqNHHkXZUWKCtUE=;
  b=nwpIUlPn5Zsi4+9odSFfpwljXTFeBLaj1rr1C702smpkozt9Cbs8JiVG
   629La9Z8mqoFF8LaAtJaCs3TI1UXgIwuSWlQvJnTojx7sANuW8yiMGw6N
   aidLGPzsygTBuvPisWK+zwc6i1MMrBac1orqxVy6GybotIbTBdVZugGUh
   zIoPPvG9M8OiqCflgpG6CDiRASA99YfRzQ6xAwNhInZnHrpM4D3rdLDwB
   ndnZvH4lZTMdmGF0NO7JQiXzti+gBtn95j1V9BRjo/ZeUjGjIWqpY1oEy
   P4hLmKBYt2P8myFvQEb3Cj0tD4CDmM+P/As2nzm1GnQC8nYd+QRExffnN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369281068"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="369281068"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 05:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="763746030"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="763746030"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Aug 2023 05:44:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQok8-0000H5-04;
	Tue, 01 Aug 2023 12:44:52 +0000
Date: Tue, 1 Aug 2023 20:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/x86/kernel/cpu/amd.c:1289:6: error: no previous prototype for
 'amd_check_microcode'
Message-ID: <202308012053.HaahUjPR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
commit: 522b1d69219d8f083173819fde04f994aa051a98 x86/cpu/amd: Add a Zenbleed fix
date:   2 weeks ago
config: x86_64-sof-customedconfig-edison-defconfig (https://download.01.org/0day-ci/archive/20230801/202308012053.HaahUjPR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012053.HaahUjPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012053.HaahUjPR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/amd.c:1289:6: error: no previous prototype for 'amd_check_microcode' [-Werror=missing-prototypes]
    1289 | void amd_check_microcode(void)
         |      ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/amd_check_microcode +1289 arch/x86/kernel/cpu/amd.c

  1288	
> 1289	void amd_check_microcode(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
