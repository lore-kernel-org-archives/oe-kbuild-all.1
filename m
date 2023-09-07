Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823DD507
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694097849; x=1725633849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDWpoESvcdL1A8vhnmIcfvSEae5WHv4KUtPbSlWl6XA=;
  b=KvlXCb7Rl/X5HBg8QDOsK8d3WCfcsciFWl0jhe0mDLbIfBgzQMmlumjQ
   2z0unGzcPRXonv4SpUYNQVRLy69mLVCa6u1OkdeFylrVBdxRwEgE01ATp
   6MwTqLQp0bpZzpjcX4sNqwJ97LHfUVzqlK0S+iZKzQKgEvkeQXbzFsxhQ
   jBA6xDXGlG9t1p6wa6eljyCCc1TWm2QJSkw8dqf7+mPWDLqDYQodu8h3e
   C9yObnk0QoEH7dEdveTegBvsxakgybxQS0LtGbRFLXnFIc1mdMbwarB+f
   YuoZHzssMYPXZbFNmVkDEUVJUEpmc6iwu2BnfY/r6jm2tmpnlBRzNUAKX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="374758978"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="374758978"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771297916"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="771297916"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 07:44:06 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeGEm-0001Hv-2U;
	Thu, 07 Sep 2023 14:44:04 +0000
Date: Thu, 7 Sep 2023 22:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 106/159] include/linux/pci-ats.h:70:12:
 warning: 'pci_prg_resp_pasid_required' defined but not used
Message-ID: <202309072234.EJjIwe4J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   de158c39329c476963b106f32fc47e0ea04b4f48
commit: 86e7286d3b8f07efd8509cb913b5189888b6d848 [106/159] PCI/ATS: Add pci_prg_resp_pasid_required() interface.
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230907/202309072234.EJjIwe4J-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072234.EJjIwe4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072234.EJjIwe4J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pci.c: In function 'pci_raw_set_power_state':
   drivers/pci/pci.c:856:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     856 |                 if ((pmcsr & PCI_PM_CTRL_STATE_MASK) == PCI_D3hot
         |                    ^
   drivers/pci/pci.c:860:9: note: here
     860 |         default:
         |         ^~~~~~~
   drivers/pci/pci.c: In function 'pci_target_state':
   drivers/pci/pci.c:2259:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
    2259 |                         if (pci_no_d1d2(dev))
         |                            ^
   drivers/pci/pci.c:2262:17: note: here
    2262 |                 default:
         |                 ^~~~~~~
   In file included from drivers/pci/pci.c:32:
   include/linux/pci-ats.h: At top level:
>> include/linux/pci-ats.h:70:12: warning: 'pci_prg_resp_pasid_required' defined but not used [-Wunused-function]
      70 | static int pci_prg_resp_pasid_required(struct pci_dev *pdev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.c:219: warning: Function parameter or member 'path' not described in 'pci_dev_str_match_path'
   drivers/pci/pci.c:219: warning: Excess function parameter 'p' description in 'pci_dev_str_match_path'


vim +/pci_prg_resp_pasid_required +70 include/linux/pci-ats.h

    69	
  > 70	static int pci_prg_resp_pasid_required(struct pci_dev *pdev)
    71	{
    72		return 0;
    73	}
    74	#endif /* CONFIG_PCI_PASID */
    75	
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
