Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B932C9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711534226; cv=none; b=cPyeLKd7s4tYjjz3PYR7JdXMOy8a/joqdHe1TT+L1FH5oawbpLEMypAjpm4DhmUHQDze8AciPI6zVmmECoP95rTAOhtDE8OmwYBS0R8UniGKcL1XFM99ETXhdfhFPrer8u1Gl1zXrZUobGWpefIFzeaj91THHbMH0kuterbqkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711534226; c=relaxed/simple;
	bh=1zwSg5yX1ZF0MSJoe0+7RpxlLne16uRY0TXZbZrCYBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R3PVDbPXjf5414yA5HgmNlOmODtxesAq86CfnygxiVAqolUvzoAIFd4dYzr4/LHmhGDbYZ7/sOOvVyYDcgx+i0P88XxhCizVKWLKgNwhG4/1m4ofSkBix23bRFkANaUhoiY7fIxkGj+6DMHtv2gUovQqGI/Zw7NsbrWegLobCqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCgJd53r; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCgJd53r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711534224; x=1743070224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1zwSg5yX1ZF0MSJoe0+7RpxlLne16uRY0TXZbZrCYBw=;
  b=WCgJd53rATOO3vAHWxZpTxDKzOlOCMmI2PzvXovdesKmkkuEH39+VXFU
   w00HZ1rHwegMZk2RJxP1aSepXw9gmjonrltIgbVCBh8dJpN4FZqFQ5eLm
   Q+BcvoWJ1wnjE4EcImpDd+BbV38eTxWe2/4ldHzVLvUCcGakP2j9PXbsC
   /m8jvi3rhAUwrxvNc7BmUWPiSiAamvxmrnANGtphmeKBDmOJjmrSiuk5C
   K6SrK3yezgMhbF8DGO1IYPol9hOS7KECjck1BkCi27/kIuhUXi7MeP0B0
   b3oUHOB56p5uN1eSY6Xkx9leYtYqD8ibSHvneVmqJjjVICFUuxaQwmsjB
   w==;
X-CSE-ConnectionGUID: xjgOqaX9Tt6qk1xHHNXIZQ==
X-CSE-MsgGUID: CONjhG+7Qdmd/MkLWhojxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6490070"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6490070"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 03:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="53722808"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Mar 2024 03:10:21 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpQEd-0000xC-1O;
	Wed, 27 Mar 2024 10:10:19 +0000
Date: Wed, 27 Mar 2024 18:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:971:5: warning: no previous
 prototype for 'pci_read'
Message-ID: <202403271801.ujnkODrW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   9465fef4ae351749f7068da8c78af4ca27e61928
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240327/202403271801.ujnkODrW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271801.ujnkODrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271801.ujnkODrW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/endpoint/functions/pci-epf-vntb.c:971:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
     971 | int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
         |     ^~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:980:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
     980 | int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
         |     ^~~~~~~~~


vim +/pci_read +971 drivers/pci/endpoint/functions/pci-epf-vntb.c

   970	
 > 971	int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
   972	{
   973		if (devfn == 0) {
   974			memcpy(val, ((u8 *)pci_space) + where, size);
   975			return PCIBIOS_SUCCESSFUL;
   976		}
   977		return PCIBIOS_DEVICE_NOT_FOUND;
   978	}
   979	
 > 980	int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
   981	{
   982		return 0;
   983	}
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
