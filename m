Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1B200C2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764717058; cv=none; b=DnyLbOB0fQdLhT+958c4yb1C195qmLSZfhqRj4SX79kn03bhHu2kkFmxvFQg4dUYNF8FVLOCTCpr/ZCYsqsWkKmplrfF9hT5SWys1gvuT1/HQK8Y5d6bq8gRxf4dqRRyCa/ucukNYlasAfJtFT3Mjc0bjYbu2BfWx9ApT/DEj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764717058; c=relaxed/simple;
	bh=C5g1iUyo1dIBoasf3OfW78tEcJ30G2FW9jCeG2rk/Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kigtjzTNHagWzSZn9WfroSLVyZxaHuE86FD2YEUy9Ok6KVJah0mtr0WaOtQ3hVGiEXW4lBBd7jA6WOboevGnRhC0wptgl06T7kFJ7oInWsR3deiR/0LUxUDpv9HtlrFoUNxcFlS1j7UbZwWF+G3DeJIr8hYH0eOl9Dq8ELANkL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zarl9BIQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zarl9BIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764717057; x=1796253057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5g1iUyo1dIBoasf3OfW78tEcJ30G2FW9jCeG2rk/Y0=;
  b=Zarl9BIQXCql8tRBpjMmuRnfAkbf98zVURQadsUx3SgHQ75K6rOgvKWh
   KWRPOauJxZK/GusrOj87WotoVp8Le7ZlJqKIPiGZRXRterSvRFVArBNSn
   5Y0zOoRacy+d5U3tEVpmrkFxObt9RbsMrXAL+8P+ZMLqElwtRqPAbdXPY
   tKC2dckMNeT4g18LmyA0YAXCx7J1MwdJrfGm9FIwGXP7d2Opu1Kyf6fIx
   318XR57ykJfU47jMXlaTeiGyG29/TKBzQu/2X703qqf6dYctbrv83gVzT
   XeL03cDa8cktCxd92n31X4xwvVjLmRJl+Xw0Zi9ZmmZ7ksw97WhsQS5ae
   Q==;
X-CSE-ConnectionGUID: bc2RiWnUTC6iIFR++fRdaw==
X-CSE-MsgGUID: AMdL5bNDTqKz/UOnfr5I0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66662370"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66662370"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 15:10:57 -0800
X-CSE-ConnectionGUID: RAyl4jEBRV65KK7xMMUi/g==
X-CSE-MsgGUID: mtAw63SfSgak3k1bYa4iog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194749979"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2025 15:10:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQZWH-00000000AHl-07B3;
	Tue, 02 Dec 2025 23:10:53 +0000
Date: Wed, 3 Dec 2025 07:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Subject: [linux-next:master 12368/13055] drivers/pci/tsm.c:85:10: error:
 cleanup argument not a function
Message-ID: <202512030743.6pVPA4sx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 3532f6154971dc631062ed1f436b7a9eca6c8882 [12368/13055] crypto/ccp: Implement SEV-TIO PCIe IDE (phase1)
config: arm64-randconfig-004-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030743.6pVPA4sx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030743.6pVPA4sx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030743.6pVPA4sx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/tsm.c:14:
   include/linux/pci-tsm.h: In function 'is_pci_tsm_pf0':
   include/linux/pci-tsm.h:152:13: error: 'struct pci_dev' has no member named 'ide_cap'; did you mean 'devcap'?
      if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
                ^~~~~~~
                devcap
   drivers/pci/tsm.c: In function 'pci_tsm_walk_fns':
>> drivers/pci/tsm.c:85:10: error: cleanup argument not a function
      struct pci_dev *pf __free(pci_dev_put) = pci_get_slot(
             ^~~~~~~
   drivers/pci/tsm.c:97:11: error: cleanup argument not a function
       struct pci_dev *vf __free(pci_dev_put) =
              ^~~~~~~
>> drivers/pci/tsm.c:115:3: error: implicit declaration of function 'pci_walk_bus'; did you mean 'pcie_walk_rcec'? [-Werror=implicit-function-declaration]
      pci_walk_bus(pdev->subordinate, cb, data);
      ^~~~~~~~~~~~
      pcie_walk_rcec
   drivers/pci/tsm.c: In function 'pci_tsm_walk_fns_reverse':
>> drivers/pci/tsm.c:125:3: error: implicit declaration of function 'pci_walk_bus_reverse'; did you mean 'pci_tsm_walk_fns_reverse'? [-Werror=implicit-function-declaration]
      pci_walk_bus_reverse(pdev->subordinate, cb, data);
      ^~~~~~~~~~~~~~~~~~~~
      pci_tsm_walk_fns_reverse
   drivers/pci/tsm.c:129:10: error: cleanup argument not a function
      struct pci_dev *pf __free(pci_dev_put) = pci_get_slot(
             ^~~~~~~
   drivers/pci/tsm.c:137:11: error: cleanup argument not a function
       struct pci_dev *vf __free(pci_dev_put) =
              ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/pci/tsm.c:12:
   drivers/pci/tsm.c: In function 'link_sysfs_enable':
   drivers/pci/tsm.c:166:9: error: 'struct pci_dev' has no member named 'ide_cap'; did you mean 'devcap'?
      pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
            ^~~~~~~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
       _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
                                      ^~~~~~~~~~~
   include/linux/pci.h:2816:36: note: in expansion of macro 'dev_dbg'
    #define pci_dbg(pdev, fmt, arg...) dev_dbg(&(pdev)->dev, fmt, ##arg)
                                       ^~~~~~~
   drivers/pci/tsm.c:164:2: note: in expansion of macro 'pci_dbg'
     pci_dbg(pdev, "%s Security Manager detected (%s%s%s)\n",
     ^~~~~~~
   drivers/pci/tsm.c:166:37: error: 'struct pci_dev' has no member named 'ide_cap'; did you mean 'devcap'?
      pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
                                        ^~~~~~~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
       _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
                                      ^~~~~~~~~~~
   include/linux/pci.h:2816:36: note: in expansion of macro 'dev_dbg'
    #define pci_dbg(pdev, fmt, arg...) dev_dbg(&(pdev)->dev, fmt, ##arg)
                                       ^~~~~~~
   drivers/pci/tsm.c:164:2: note: in expansion of macro 'pci_dbg'
     pci_dbg(pdev, "%s Security Manager detected (%s%s%s)\n",
     ^~~~~~~
   drivers/pci/tsm.c: In function 'find_dsm_dev':
   drivers/pci/tsm.c:668:9: error: cleanup argument not a function
     struct pci_dev *pf0 __free(pci_dev_put) = pf0_dev_get(pdev);
            ^~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_TSM
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - CRYPTO_DEV_CCP_CRYPTO [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && CRYPTO_DEV_CCP_DD [=y] && CRYPTO_DEV_SP_CCP [=y]


vim +85 drivers/pci/tsm.c

3225f52cde56f4 Dan Williams 2025-10-31   78  
3225f52cde56f4 Dan Williams 2025-10-31   79  static void pci_tsm_walk_fns(struct pci_dev *pdev,
3225f52cde56f4 Dan Williams 2025-10-31   80  			     int (*cb)(struct pci_dev *pdev, void *data),
3225f52cde56f4 Dan Williams 2025-10-31   81  			     void *data)
3225f52cde56f4 Dan Williams 2025-10-31   82  {
3225f52cde56f4 Dan Williams 2025-10-31   83  	/* Walk subordinate physical functions */
3225f52cde56f4 Dan Williams 2025-10-31   84  	for (int i = 0; i < 8; i++) {
3225f52cde56f4 Dan Williams 2025-10-31  @85  		struct pci_dev *pf __free(pci_dev_put) = pci_get_slot(
3225f52cde56f4 Dan Williams 2025-10-31   86  			pdev->bus, PCI_DEVFN(PCI_SLOT(pdev->devfn), i));
3225f52cde56f4 Dan Williams 2025-10-31   87  
3225f52cde56f4 Dan Williams 2025-10-31   88  		if (!pf)
3225f52cde56f4 Dan Williams 2025-10-31   89  			continue;
3225f52cde56f4 Dan Williams 2025-10-31   90  
3225f52cde56f4 Dan Williams 2025-10-31   91  		/* on entry function 0 has already run @cb */
3225f52cde56f4 Dan Williams 2025-10-31   92  		if (i > 0)
3225f52cde56f4 Dan Williams 2025-10-31   93  			cb(pf, data);
3225f52cde56f4 Dan Williams 2025-10-31   94  
3225f52cde56f4 Dan Williams 2025-10-31   95  		/* walk virtual functions of each pf */
3225f52cde56f4 Dan Williams 2025-10-31   96  		for (int j = 0; j < pci_num_vf(pf); j++) {
3225f52cde56f4 Dan Williams 2025-10-31   97  			struct pci_dev *vf __free(pci_dev_put) =
3225f52cde56f4 Dan Williams 2025-10-31   98  				pci_get_domain_bus_and_slot(
3225f52cde56f4 Dan Williams 2025-10-31   99  					pci_domain_nr(pf->bus),
3225f52cde56f4 Dan Williams 2025-10-31  100  					pci_iov_virtfn_bus(pf, j),
3225f52cde56f4 Dan Williams 2025-10-31  101  					pci_iov_virtfn_devfn(pf, j));
3225f52cde56f4 Dan Williams 2025-10-31  102  
3225f52cde56f4 Dan Williams 2025-10-31  103  			if (!vf)
3225f52cde56f4 Dan Williams 2025-10-31  104  				continue;
3225f52cde56f4 Dan Williams 2025-10-31  105  
3225f52cde56f4 Dan Williams 2025-10-31  106  			cb(vf, data);
3225f52cde56f4 Dan Williams 2025-10-31  107  		}
3225f52cde56f4 Dan Williams 2025-10-31  108  	}
3225f52cde56f4 Dan Williams 2025-10-31  109  
3225f52cde56f4 Dan Williams 2025-10-31  110  	/*
3225f52cde56f4 Dan Williams 2025-10-31  111  	 * Walk downstream devices, assumes that an upstream DSM is
3225f52cde56f4 Dan Williams 2025-10-31  112  	 * limited to downstream physical functions
3225f52cde56f4 Dan Williams 2025-10-31  113  	 */
3225f52cde56f4 Dan Williams 2025-10-31  114  	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_UPSTREAM && is_dsm(pdev))
3225f52cde56f4 Dan Williams 2025-10-31 @115  		pci_walk_bus(pdev->subordinate, cb, data);
3225f52cde56f4 Dan Williams 2025-10-31  116  }
3225f52cde56f4 Dan Williams 2025-10-31  117  
3225f52cde56f4 Dan Williams 2025-10-31  118  static void pci_tsm_walk_fns_reverse(struct pci_dev *pdev,
3225f52cde56f4 Dan Williams 2025-10-31  119  				     int (*cb)(struct pci_dev *pdev,
3225f52cde56f4 Dan Williams 2025-10-31  120  					       void *data),
3225f52cde56f4 Dan Williams 2025-10-31  121  				     void *data)
3225f52cde56f4 Dan Williams 2025-10-31  122  {
3225f52cde56f4 Dan Williams 2025-10-31  123  	/* Reverse walk downstream devices */
3225f52cde56f4 Dan Williams 2025-10-31  124  	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_UPSTREAM && is_dsm(pdev))
3225f52cde56f4 Dan Williams 2025-10-31 @125  		pci_walk_bus_reverse(pdev->subordinate, cb, data);
3225f52cde56f4 Dan Williams 2025-10-31  126  
3225f52cde56f4 Dan Williams 2025-10-31  127  	/* Reverse walk subordinate physical functions */
3225f52cde56f4 Dan Williams 2025-10-31  128  	for (int i = 7; i >= 0; i--) {
3225f52cde56f4 Dan Williams 2025-10-31  129  		struct pci_dev *pf __free(pci_dev_put) = pci_get_slot(
3225f52cde56f4 Dan Williams 2025-10-31  130  			pdev->bus, PCI_DEVFN(PCI_SLOT(pdev->devfn), i));
3225f52cde56f4 Dan Williams 2025-10-31  131  
3225f52cde56f4 Dan Williams 2025-10-31  132  		if (!pf)
3225f52cde56f4 Dan Williams 2025-10-31  133  			continue;
3225f52cde56f4 Dan Williams 2025-10-31  134  
3225f52cde56f4 Dan Williams 2025-10-31  135  		/* reverse walk virtual functions */
3225f52cde56f4 Dan Williams 2025-10-31  136  		for (int j = pci_num_vf(pf) - 1; j >= 0; j--) {
3225f52cde56f4 Dan Williams 2025-10-31  137  			struct pci_dev *vf __free(pci_dev_put) =
3225f52cde56f4 Dan Williams 2025-10-31  138  				pci_get_domain_bus_and_slot(
3225f52cde56f4 Dan Williams 2025-10-31  139  					pci_domain_nr(pf->bus),
3225f52cde56f4 Dan Williams 2025-10-31  140  					pci_iov_virtfn_bus(pf, j),
3225f52cde56f4 Dan Williams 2025-10-31  141  					pci_iov_virtfn_devfn(pf, j));
3225f52cde56f4 Dan Williams 2025-10-31  142  
3225f52cde56f4 Dan Williams 2025-10-31  143  			if (!vf)
3225f52cde56f4 Dan Williams 2025-10-31  144  				continue;
3225f52cde56f4 Dan Williams 2025-10-31  145  			cb(vf, data);
3225f52cde56f4 Dan Williams 2025-10-31  146  		}
3225f52cde56f4 Dan Williams 2025-10-31  147  
3225f52cde56f4 Dan Williams 2025-10-31  148  		/* on exit, caller will run @cb on function 0 */
3225f52cde56f4 Dan Williams 2025-10-31  149  		if (i > 0)
3225f52cde56f4 Dan Williams 2025-10-31  150  			cb(pf, data);
3225f52cde56f4 Dan Williams 2025-10-31  151  	}
3225f52cde56f4 Dan Williams 2025-10-31  152  }
3225f52cde56f4 Dan Williams 2025-10-31  153  

:::::: The code at line 85 was first introduced by commit
:::::: 3225f52cde56f46789a4972d3c54df8a4d75f022 PCI/TSM: Establish Secure Sessions and Link Encryption

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
