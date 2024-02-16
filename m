Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640077F34
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708087881; cv=none; b=bYyKhF/a4B+MGy6KOk4Xk3bK1+3x1P4DT9hkzsp0iDaRBM5lZsjHLZnyjk8VoS1yLDfpcJcvm/xlTDU9H9mnav4NvO/HS9Y69qUHQVSgkUArWgiHko/cibFeTg7AD4DNfU974iWev6tXd20VGC25ZF18janXZysYjiEG7hJKCpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708087881; c=relaxed/simple;
	bh=sOmTuTssorHMuvlq9y262p6Bh4j+VZ1A9Ml9Grb2SjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jA8XifEByKaBBKRXD8OPQiTVwLs6wLEbmX/cDHmrhw1gno5sZfB6vPBxfcSzECEnfTeXKUfG8l/GjXkSTL1IuQfzxRSFivpsUOkLpkbL3UaBQRrjrfLUdfB/AeeZkdNae+NAobZPytYe4c/iiLn4GQUOrRkoYyWkGghKGlwTFjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0Pd7snV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0Pd7snV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708087879; x=1739623879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sOmTuTssorHMuvlq9y262p6Bh4j+VZ1A9Ml9Grb2SjE=;
  b=c0Pd7snVV1uTMKUqJPJjCOSiyrRndRWP7YYf+xjGyZ1ESkZ4rmq+lLLI
   v6yz/sgo9XfTL6RFH4RdPT++St2aPyHtAqMp6Ok3xkT2IPqxn2dYvjgCx
   SLCzVFSFh2zlphypkNwITxRAuFnpYuV6XOiiEEnnVJbCvzGPZyH618R+M
   y7jzRTUIgCM7w4PuusDhD+CjN9UPvEMreJ2lvjp6fwBDWfskALuYjqdUQ
   8X8M7oi73w2ueY9Db7nhfxOruExUlxWWVTf6NXwt4y1zot3hBvWQJLiF4
   RfnsU+Ov8vwbFG41TkeFznStzbgzLrr7WUREY+Ia6Mgb/karzrX5+5XxZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2069248"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2069248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 04:51:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="4149712"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Feb 2024 04:51:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raxfp-0001G6-1w;
	Fri, 16 Feb 2024 12:50:44 +0000
Date: Fri, 16 Feb 2024 20:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 13/18] drivers/pci/cma.c:260:24: warning: 'return'
 with a value, in function returning void
Message-ID: <202402162016.dbSSEFpX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   2e15718c3d046dd029e9924e3d674ffbac2a350d
commit: 7ba328177f0c01ea521a398e72fc230aca180ba1 [13/18] PCI/CMA: Grant guests exclusive control of authentication
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20240216/202402162016.dbSSEFpX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402162016.dbSSEFpX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402162016.dbSSEFpX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/cma.c: In function 'authenticated_store':
   drivers/pci/cma.c:39:12: error: void value not ignored as it ought to be
      39 |         rc = pci_cma_reauthenticate(pdev);
         |            ^
   drivers/pci/cma.c: In function 'pci_cma_reauthenticate':
>> drivers/pci/cma.c:260:24: warning: 'return' with a value, in function returning void [-Wreturn-type]
     260 |                 return -EPERM;
         |                        ^
   drivers/pci/cma.c:252:6: note: declared here
     252 | void pci_cma_reauthenticate(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/return +260 drivers/pci/cma.c

   251	
   252	void pci_cma_reauthenticate(struct pci_dev *pdev)
   253	{
   254		int rc;
   255	
   256		if (!pdev->spdm_state)
   257			return;
   258	
   259		if (test_bit(PCI_CMA_OWNED_BY_GUEST, &pdev->priv_flags))
 > 260			return -EPERM;
   261	
   262		rc = spdm_authenticate(pdev->spdm_state);
   263		if (rc >= 0)
   264			pci_info(pdev, "authenticated with certificate slot %d\n", rc);
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
