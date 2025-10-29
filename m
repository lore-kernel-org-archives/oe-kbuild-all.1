Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B5D3128C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726710; cv=none; b=Yp2HOzLr536bF26Mif8Y3MLIBbncHxuv9EGg1quX2gQHdK7RKPOx+JcAxhDle1jnib6zKKFWcH6qshiEtvbpE+vr4VCk9yBsmNjuhWNe1bZOKIV/Z2segtvKY+Typ3mLYrP2Xi1xZEi/k07h89gqcOD0ZH+O5vkpahk8+eWq0c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726710; c=relaxed/simple;
	bh=/HnWnQ2qmWrLVKjTiuZwHht3MudPzAX+PA7b1vEOCRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XxysWeO0K4fj5Es91urn3PpAWIY4ZHR/0puTPryhKXYhKslcbsztC+3gkeX4NQJiF1yAz9uAJkztRqoZq8eZlxGA5J2SS8gYjoZXeB43aX28lYgTqRXYmCkvTDpZCHY5AvtLb/jLJOZdOuZn7CZ/tGbRIl7miXXF6DSTE7+bISI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMFFpj8e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMFFpj8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761726709; x=1793262709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/HnWnQ2qmWrLVKjTiuZwHht3MudPzAX+PA7b1vEOCRk=;
  b=dMFFpj8elvOmBmpA5jx+cUmgHArh6yS4k07+8l0SGJDANGTWhLaoOMEZ
   yBCiJv1zB64kYG1oUx+A1leE0rB5NrmFvOzZhH0B2An9YFSnWdZNrqCC4
   HTultZBYumficlsJzkV+kmOsYlBs543lVtrVm+8DXEivMM0zCecWu0Gd9
   QZvXjeRS1GT9H/B+gO1AqsXazd/Zyio82QoMxf/Cm06r3TxJ5uaUls9Y+
   1IRfobVzJWqTljnJ3cTH+lU6G1GtHH7YdszpzoKbWXjcEySAJ3SpEINIk
   IDeVLVUJXZFDJzCP45r5HZBBdJrwu0j7YI79Sv8paCX7zriwWCg7Vl3vb
   g==;
X-CSE-ConnectionGUID: RWlcJTPPSgiWx33voQfuMg==
X-CSE-MsgGUID: /Ry1TWd8TsqJl4ZRes+2dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81469247"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="81469247"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:31:47 -0700
X-CSE-ConnectionGUID: 9MXiBTatTjKdTz55qByFVA==
X-CSE-MsgGUID: fUrlPB8gQ/OYHaXo109fXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185938776"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2025 01:31:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE1ap-000KP5-2E;
	Wed, 29 Oct 2025 08:31:43 +0000
Date: Wed, 29 Oct 2025 16:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: Golan Ben Ami <golan.ben.ami@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-chromeos:chromeos-6.12__release/core95-223 1/1]
 drivers/net/wireless/iwl7000/hdrs/backports.h:30:19: error: static
 declaration of 'pcim_request_all_regions' follows non-static declaration
Message-ID: <202510291619.GnL1c6td-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-6.12__release/core95-223
head:   66a97bfcf765197b13a20e70707589b6697492e3
commit: 66a97bfcf765197b13a20e70707589b6697492e3 [1/1] Merge remote-tracking branch 'upstream/chromeos-6.12' into chromeos-6.12__release/core95-223 Change-Id: Ida4b3ca8a631f45632ddae84ec1cedcffa1ee9a0
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251029/202510291619.GnL1c6td-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291619.GnL1c6td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291619.GnL1c6td-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:59:
>> drivers/net/wireless/iwl7000/hdrs/backports.h:30:19: error: static declaration of 'pcim_request_all_regions' follows non-static declaration
      30 | static inline int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
         |                   ^
   include/linux/pci.h:2313:5: note: previous declaration is here
    2313 | int pcim_request_all_regions(struct pci_dev *pdev, const char *name);
         |     ^
   1 error generated.
--
   In file included from <built-in>:4:
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:59:
>> drivers/net/wireless/iwl7000/hdrs/backports.h:30:19: error: static declaration of 'pcim_request_all_regions' follows non-static declaration
      30 | static inline int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
         |                   ^
   include/linux/pci.h:2313:5: note: previous declaration is here
    2313 | int pcim_request_all_regions(struct pci_dev *pdev, const char *name);
         |     ^
   drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c:10:10: fatal error: 'linux/hsr_main.h' file not found
      10 | #include <linux/hsr_main.h>
         |          ^~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/pcim_request_all_regions +30 drivers/net/wireless/iwl7000/hdrs/backports.h

2af0d92ffb74cb Miri Korenblit 2025-01-21  29  
de8055d2089eb0 Johannes Berg  2025-01-07 @30  static inline int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
de8055d2089eb0 Johannes Berg  2025-01-07  31  {
de8055d2089eb0 Johannes Berg  2025-01-07  32  	/* NOTE: this only works with pcim_enable_device() on older kernels */
de8055d2089eb0 Johannes Berg  2025-01-07  33  	int mask = 0;
de8055d2089eb0 Johannes Berg  2025-01-07  34  
de8055d2089eb0 Johannes Berg  2025-01-07  35  	for (int i = 0; i < PCI_STD_NUM_BARS; i++) {
de8055d2089eb0 Johannes Berg  2025-01-07  36  		if (!pci_resource_start(pdev, i))
de8055d2089eb0 Johannes Berg  2025-01-07  37  			continue;
de8055d2089eb0 Johannes Berg  2025-01-07  38  		if (!pci_resource_len(pdev, i))
de8055d2089eb0 Johannes Berg  2025-01-07  39  			continue;
de8055d2089eb0 Johannes Berg  2025-01-07  40  		mask |= BIT(i);
de8055d2089eb0 Johannes Berg  2025-01-07  41  	}
de8055d2089eb0 Johannes Berg  2025-01-07  42  
de8055d2089eb0 Johannes Berg  2025-01-07  43  	return pci_request_selected_regions(pdev, mask, name);
de8055d2089eb0 Johannes Berg  2025-01-07  44  }
de8055d2089eb0 Johannes Berg  2025-01-07  45  

:::::: The code at line 30 was first introduced by commit
:::::: de8055d2089eb00f8c5bac76f6d66346f795692b CHROMIUM: iwl7000: backports/pcie: fixes for PCI mappings

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Intel ChromeOS bot <linuxwifi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
