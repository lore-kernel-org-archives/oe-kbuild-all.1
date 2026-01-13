Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D41349B19
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768310750; cv=none; b=Jd5NLPqmX6iBVwj1wqDLfTN69dKGtiYCY5K6/8VVgV2g0GsY6LNlzt8kY1e0yWedniPlkvRpg4h6Vu+qNo5RF3XF06BmtjccCXYeG67a8lqcoCS953phCKYEALnb00YCPNrAA0l79BvferEgqUgMQMAPOqW4avd7cA/1Yqv0Cc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768310750; c=relaxed/simple;
	bh=pUDSWOu2eQPxyo44dQvrdmJYIalNLbHjgijFnl9VR6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jWGE2vVaLfHbuUb8TNv8rw7uPoVWCg8uj4zfJ1hT87EeJjKCrR4yeXToZ16TziMg4XJETrOn6qtEebhfmnxIoQSe+wsdTxW1YfHbMkyEr9KjXuwQkZ3iT28sYtoZ9npAd8G+kEq1CI8XIV13tDTAT99cYrrMZ/wn3g3kSENucD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/y6xWvT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/y6xWvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768310748; x=1799846748;
  h=date:from:to:cc:subject:message-id;
  bh=pUDSWOu2eQPxyo44dQvrdmJYIalNLbHjgijFnl9VR6A=;
  b=D/y6xWvTsHpg/82gxvgY5KOci1/F8B+VfOHtTiPw3XbYkzqZZog8Xvw7
   +qfnxb3aYocjXayM55ochob6G5wr7RnsHQOIlr5Uo4+JSDBpBkzqWHeYJ
   8/rchOumazaeETXt/Ts1bt66u759/FTWGlv3saBYCuxfka0EsXgPb3F+v
   liK/qcW+T8KcuQryiqMJzcZnehu+W/LXwpLk3faE0h2/VMhXnKv2lHd9X
   hlLt7nm20kbGMwTmvWMBKuVYtXRuuoCj54g5NPx+mdJKU3TgQ1wlTeVlK
   6HJoYKBOP9qeJegZAO+/bjDEIjm1EURaKgfyQxvgkYAmzwZw2aF63uPGu
   A==;
X-CSE-ConnectionGUID: jcNwG0aCQuSfvnjC9DxkSQ==
X-CSE-MsgGUID: iJvmrtr9SNGEYju9QZG/jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68800894"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68800894"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 05:25:47 -0800
X-CSE-ConnectionGUID: shRHBSSMS2a3KyMHs+bPZA==
X-CSE-MsgGUID: lX40rxKfRwqQbFZXj7sRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204659123"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 05:25:46 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfeP2-0000000018z-0SpV;
	Tue, 13 Jan 2026 13:25:44 +0000
Date: Tue, 13 Jan 2026 14:25:38 +0100
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rcec 3/3] drivers/pci/pcie/rcec.c:27:15: warning:
 unused variable 'devn'
Message-ID: <202601131406.nSeO8VtU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux rcec
head:   a40bebe03a82c4af77ad009710a5979b69c5334d
commit: 472c2e1704b7228a2f359885d64127f5500be4e6 [3/3] PCI/RCEC: Speed up checking of Association Bitmap for RCiEPs
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260113/202601131406.nSeO8VtU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131406.nSeO8VtU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131406.nSeO8VtU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pcie/rcec.c:27:15: warning: unused variable 'devn' [-Wunused-variable]
      27 |         unsigned int devn;
         |                      ^~~~
   1 warning generated.


vim +/devn +27 drivers/pci/pcie/rcec.c

507b460f814458 Sean V Kelley 2020-11-20  23  
507b460f814458 Sean V Kelley 2020-11-20  24  static bool rcec_assoc_rciep(struct pci_dev *rcec, struct pci_dev *rciep)
507b460f814458 Sean V Kelley 2020-11-20  25  {
507b460f814458 Sean V Kelley 2020-11-20  26  	unsigned long bitmap = rcec->rcec_ea->bitmap;
507b460f814458 Sean V Kelley 2020-11-20 @27  	unsigned int devn;
507b460f814458 Sean V Kelley 2020-11-20  28  
507b460f814458 Sean V Kelley 2020-11-20  29  	/* An RCiEP found on a different bus in range */
507b460f814458 Sean V Kelley 2020-11-20  30  	if (rcec->bus->number != rciep->bus->number)
507b460f814458 Sean V Kelley 2020-11-20  31  		return true;
507b460f814458 Sean V Kelley 2020-11-20  32  
507b460f814458 Sean V Kelley 2020-11-20  33  	/* Same bus, so check bitmap */
472c2e1704b722 Lukas Wunner  2026-01-13  34  	if (test_bit(PCI_SLOT(rciep->devfn), &bitmap))
507b460f814458 Sean V Kelley 2020-11-20  35  		return true;
507b460f814458 Sean V Kelley 2020-11-20  36  
507b460f814458 Sean V Kelley 2020-11-20  37  	return false;
507b460f814458 Sean V Kelley 2020-11-20  38  }
507b460f814458 Sean V Kelley 2020-11-20  39  

:::::: The code at line 27 was first introduced by commit
:::::: 507b460f814458605c47b0ed03c11e49a712fc08 PCI/ERR: Add pcie_link_rcec() to associate RCiEPs

:::::: TO: Sean V Kelley <sean.v.kelley@intel.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
