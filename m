Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4E01FBEB1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753298401; cv=none; b=Wy9rWo2bNi647m9IZVe9pDpnD6V+7pxwg/MVwQqa2EzYogQAPYnc0tqNxQ9JUltNnHi0P/ORZr8bhXy+b+kfljT4DZEjNI5N6iXjERlvoivCjTrcJvnInFrnaePZ0hbxewFBBNzOSSOFSSITc6cgcp/pZudd+135JfCKBQDoelk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753298401; c=relaxed/simple;
	bh=Tn/B4TJk3uCIUCS7899WETedhDnz2JU16brELYAbBIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rVJszkfN28WaFpElJC0hWolxarZc3kvObkTeLEYbZIgVHg3p2R3TL2rFbOxg0GsQ29CezNZv365XipBKIsBhbvQesRqC3T5tX1pjbxA3KQoPtAGMw09f+lx/NR96we2MPZkA9DA7epmXfixBic1KswXFjQINJYVqqtIngdotdR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PY/M/S6R; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PY/M/S6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753298399; x=1784834399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tn/B4TJk3uCIUCS7899WETedhDnz2JU16brELYAbBIw=;
  b=PY/M/S6RFEIIwmeNnmibMFGkuShrC3E6T3/xqTV9waH8TOLOVM/lJ+0I
   ga9kKNB3zHwhcqzfnHTedLjEsHsyyh8dQP5DlBfX3jbb+oT6y7q72dsqG
   pZWL83uCqi4+gaUFUxkXhzMLOW4OtcNPmhc17bgEHgOsMU/Q7vwnzFW6N
   Uo4FNlsa9fjVRe4a6wqpA6lZfE4dYipehhn+DqpQTPza8JRq8WAW749wG
   oSjsnxELt2yPS58nhjNh3cqHz7Aqvgob0icGHD1d2rJQOrPj1seW2/oOk
   YwR1bKVYHmV7ZJxabVdEgqs4U53GQfvIfQSkhK8hiTW+kc/FNKCLpTvaF
   A==;
X-CSE-ConnectionGUID: crfYdvkJSdGRNbUd3PkG1w==
X-CSE-MsgGUID: s3LuC38RR+2ve8JXwkp0Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66293948"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="66293948"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 12:19:57 -0700
X-CSE-ConnectionGUID: YOm/jHK9Ttu5tD5/4+Cx5g==
X-CSE-MsgGUID: CityhccUSu6Wd6ExPbnOoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="163966814"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jul 2025 12:19:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uef0M-000Jil-2F;
	Wed, 23 Jul 2025 19:19:54 +0000
Date: Thu, 24 Jul 2025 03:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_reset_v1 5/7] drivers/infiniband/hw/qib/qib_pcie.c:585:15:
 error: use of undeclared identifier 'dd'
Message-ID: <202507240314.Vnuz1b6w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux aer_reset_v1
head:   aa7d1cb67ab66436de55f08005a7130768067322
commit: 39f12cb6020cd493fd7c56c67b55afd15d22d554 [5/7] IB/qib: Fix PCIe error handling
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250724/202507240314.Vnuz1b6w-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240314.Vnuz1b6w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240314.Vnuz1b6w-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/qib/qib_pcie.c:578:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     578 |                 pci_enable_device(pdev);
         |                 ^~~~~~~~~~~~~~~~~ ~~~~
>> drivers/infiniband/hw/qib/qib_pcie.c:585:15: error: use of undeclared identifier 'dd'
     585 |         if (qib_init(dd, 1)) /* same as re-init after reset */
         |                      ^
   1 warning and 1 error generated.


vim +/dd +585 drivers/infiniband/hw/qib/qib_pcie.c

   571	
   572	static pci_ers_result_t
   573	qib_pci_slot_reset(struct pci_dev *pdev)
   574	{
   575		qib_devinfo(pdev, "QIB slot_reset function called\n");
   576	
   577		if (pdev->error_state == pci_channel_io_frozen)
 > 578			pci_enable_device(pdev);
   579	
   580		/*
   581		 * Running jobs will fail, since it's asynchronous
   582		 * unlike sysfs-requested reset.   Better than
   583		 * doing nothing.
   584		 */
 > 585		if (qib_init(dd, 1)) /* same as re-init after reset */
   586			return PCI_ERS_RESULT_DISCONNECT;
   587	
   588		return PCI_ERS_RESULT_RECOVERED;
   589	}
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
