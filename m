Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB123182D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 23:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765926628; cv=none; b=s32SHGloNp4yo0zpMC5cVS9utyE3J1L77zgEJjOOvJRkOdfjscqzPpLfEv1Ady4ZxN/cbJroygEHozbHFhjTXEN53tvw8rnaRSAMbSEkWj8N30gYrW1+SSn8mbdlPhQvNFG2CFAX34ft5lavLir/15vWOnJ4u8gSCpOSnUwU5PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765926628; c=relaxed/simple;
	bh=8ZQBQ/sVQhahIPHTkH9TliFMH5sFxX6a9XlCuDwAMEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2WlrmeKnr8NdU0GjVbYeXPpKWCzHwdzCjSQ7yoztzYyJ0zXZ3QzOflR1eVm1agTsX0gtTW5lZKGZ4jjssaugAS+lmwCWp1t/dgkUIftSEmOa6Simz8O8y6RJ+ROIWA+UTbUoGcdwch9tS/Lm3vjVjYvlR7qkCqLzP9+bRkVdZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlBi5u69; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlBi5u69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765926626; x=1797462626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ZQBQ/sVQhahIPHTkH9TliFMH5sFxX6a9XlCuDwAMEk=;
  b=JlBi5u69Uf6P+GFx2HbTgSP1Gn8x5bz2kPQMb47Cb/0p328+olENOTBK
   A6TF4KWl7NPYkwWGdVPDCXeQQddVT21ZSsl8FF7V9xMlCCFhASHgful1n
   99oVSu0IG1YFJ3HwXRQ6X/N0z8K6uh5IUY/0aa6flpoA6eppw0L5fbvlH
   /9ZbFMVP+MajRGmGnIgcwz7OuTgcOeiuk+nkqaZKVlBa/8Zl9X44dx//h
   AzcCFR29EqO1CwbWMdygPSBJJ434G66A1OsCiNrAAwdyBq8/Eo807ukuC
   dki4S/6/JL3hvFDgetcSU/6vk5Bw5WesTF5bp/CZ8Q4/KzERPMNnVyQno
   w==;
X-CSE-ConnectionGUID: HCCAZH0dTQ+f72GAjAUsKA==
X-CSE-MsgGUID: rcCivhwWQICBiWmrhs+jqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="66844959"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="66844959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 15:10:26 -0800
X-CSE-ConnectionGUID: Jq8OxrpJR62czueQGs/PaA==
X-CSE-MsgGUID: hItSelb4RTeujG1246XkhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="198938892"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 15:10:25 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVeAp-000000003vE-2yMh;
	Tue, 16 Dec 2025 23:09:58 +0000
Date: Wed, 17 Dec 2025 07:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/usb/gadget/function/f_accessory.c:372:23: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202512170757.Ljm1ufYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 2b2acb8f4020d07622e2957a39e3e0bf9232427d [0/2] ANDROID: usb: f_accessory: Avoid bitfields for shared variables
config: i386-randconfig-061-20251217 (https://download.01.org/0day-ci/archive/20251217/202512170757.Ljm1ufYJ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170757.Ljm1ufYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170757.Ljm1ufYJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/f_accessory.c:372:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:769:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:783:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:825:23: sparse: sparse: Using plain integer as NULL pointer
>> drivers/usb/gadget/function/f_accessory.c:1493:5: sparse: sparse: symbol 'acc_ctrlrequest_configfs' was not declared. Should it be static?

vim +372 drivers/usb/gadget/function/f_accessory.c

483cb5629ea789 Benoit Goby 2011-12-19  363  
483cb5629ea789 Benoit Goby 2011-12-19  364  /* remove a request from the head of a list */
483cb5629ea789 Benoit Goby 2011-12-19  365  static struct usb_request *req_get(struct acc_dev *dev, struct list_head *head)
483cb5629ea789 Benoit Goby 2011-12-19  366  {
483cb5629ea789 Benoit Goby 2011-12-19  367  	unsigned long flags;
483cb5629ea789 Benoit Goby 2011-12-19  368  	struct usb_request *req;
483cb5629ea789 Benoit Goby 2011-12-19  369  
483cb5629ea789 Benoit Goby 2011-12-19  370  	spin_lock_irqsave(&dev->lock, flags);
483cb5629ea789 Benoit Goby 2011-12-19  371  	if (list_empty(head)) {
483cb5629ea789 Benoit Goby 2011-12-19 @372  		req = 0;
483cb5629ea789 Benoit Goby 2011-12-19  373  	} else {
483cb5629ea789 Benoit Goby 2011-12-19  374  		req = list_first_entry(head, struct usb_request, list);
483cb5629ea789 Benoit Goby 2011-12-19  375  		list_del(&req->list);
483cb5629ea789 Benoit Goby 2011-12-19  376  	}
483cb5629ea789 Benoit Goby 2011-12-19  377  	spin_unlock_irqrestore(&dev->lock, flags);
483cb5629ea789 Benoit Goby 2011-12-19  378  	return req;
483cb5629ea789 Benoit Goby 2011-12-19  379  }
483cb5629ea789 Benoit Goby 2011-12-19  380  

:::::: The code at line 372 was first introduced by commit
:::::: 483cb5629ea7893f94481511e630ae14a5c0d1c0 ANDROID: usb: gadget: f_accessory: Add Android Accessory function

:::::: TO: Benoit Goby <benoit@android.com>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
