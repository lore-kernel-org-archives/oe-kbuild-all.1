Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169504C6F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 05:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708235263; cv=none; b=Sr5R8Xu5iVYqXcZm0guGvD0ZEYBd1JiaIVfwDFdxOGGsOy2q2Exu1+Re8P3kvHTQ3wGHbbHQc/ciJeyaM0sehl4a44xrKUr62gghwugYW1UvRoDH3n6NvajhVRfFkCdlNGNQiNfjCPl6jxpFIj1/MApPnX6Gb9oHw6HmcKLH9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708235263; c=relaxed/simple;
	bh=xwuDXcERyjdRkevU4gzchFx7Nil9kU05DSCEVdfgRbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSfAtBf8Oar6jieMr0Y5/88Eud4ZZo/3Vp4S6KXCgtfJRGersVhIbU5LKk24UKO/pOjUbqE60S3UsFEgbiFnqJ8TzDnPUGvH6y/eU9P0IuXwxre6mbJL30/86/qJbx/dmS4/Hpi914CKRTIh7KYqFDc5MaNEv/TWccDN2YsSLIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ax4droSf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ax4droSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708235261; x=1739771261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwuDXcERyjdRkevU4gzchFx7Nil9kU05DSCEVdfgRbI=;
  b=ax4droSfgFrQL4iiUmcB31BXneUlTN5z+nIr82rW5cWuBnjK7zf0kur3
   OuP/QiuBDm5BTzzRHLhv9EXlBSWWoVAUGiH7EwVtaxbTj5nss+Is/og/A
   kO6LxPfpmUeZ8tTYQUnMuBGqJMLU8Q3+M26lybK+wjJufjsSJYRIpp7cr
   /3dIsthYaIq675B2005Ze6Ek+kG3G2nSvJ4OT5GwGGVeRr/E9J+SE98PJ
   YTLd9whgWiKTkTS20d0USr7CZve5YgLGYrWFVrEYmmTNrB1zDRgcD2CJH
   7UAnq7xZ4a1v61zyURSAXdh58poK7NjopP6J/R01rCLxqJBPYPq/42ge+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="24793923"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="24793923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 21:47:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="34988418"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2024 21:47:40 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rba1G-0002pE-0G;
	Sun, 18 Feb 2024 05:47:18 +0000
Date: Sun, 18 Feb 2024 13:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 13/18] drivers/pci/cma.c:260:3: warning: void
 function 'pci_cma_reauthenticate' should not return a value
Message-ID: <202402181351.MyGgqUI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   604c8507a13bc715106467906e1c20214d5b1f06
commit: 7ba328177f0c01ea521a398e72fc230aca180ba1 [13/18] PCI/CMA: Grant guests exclusive control of authentication
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240218/202402181351.MyGgqUI3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181351.MyGgqUI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181351.MyGgqUI3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/cma.c:39:5: error: assigning to 'ssize_t' (aka 'long') from incompatible type 'void'
      39 |         rc = pci_cma_reauthenticate(pdev);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/cma.c:260:3: warning: void function 'pci_cma_reauthenticate' should not return a value [-Wreturn-type]
     260 |                 return -EPERM;
         |                 ^      ~~~~~~
   1 warning and 1 error generated.


vim +/pci_cma_reauthenticate +260 drivers/pci/cma.c

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
