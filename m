Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2324C3A2E28
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694010; cv=none; b=J1TD8VZ7GC03c3qKMsgr+Qjuz0n4T34pDsgKO8rU4DANgKMrGSJpPsjZRDwzr7+jMsflPqpG5dRcvPH6r8i1a6PohXiNBGUfVXMUndjDES18sg7v3U/PifapHX1Uew9eVzgoewm/WxrNqugqvIKaFfaALw0owfAJRcSYFODj7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694010; c=relaxed/simple;
	bh=9bOYXFnksE5Xl497UDvhV1D5SBd5DAd2EIJ+Kjphf+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bafdgfbQb/0ldVkEe2C7zXU+R2DZgZt7kEIleAC6g8ZmUq8fs1FFri95/BFyTrzINIYHFQa4JhjzxSmyS294VPnDdmopf9hjatTehjovjl1EzdGi+XMzS5SzGkauSLE/ciQRNavPSVQqWbWWXe+M0zM/fwwv83E3/OElmS12Xw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFZAgJ5d; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFZAgJ5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778694009; x=1810230009;
  h=date:from:to:cc:subject:message-id;
  bh=9bOYXFnksE5Xl497UDvhV1D5SBd5DAd2EIJ+Kjphf+Y=;
  b=IFZAgJ5dLvYz+eDa5D491W5uZBcTC6Y2pqKRhp1U7z4d3qsdjx79AOdj
   bAkzXoNVGEoo5BMnsh9bRQmfvs83YAQLnStlRtwP4hfGphjJS6ADM6cyk
   5pMkwJZzniu29HEsoQEs1PFZhNIZ8o5eXuIcn20MyyrP78KDJxfCLGsBx
   Fn58uD6qNzwyK2iNDYcMieahICnphZxkoC+c/W2MxGhJSmtEmMBZi5HjX
   96QYIoxMDlzew+FzbOjXobMxdaziqHofQ37xO1PDccDNZyGYFKcKao+ts
   R9mK+zHQzVtl5QvsD5UpeWAkUZGxfKXcPPBnCl4AT4VaKb+tsK9x6Hcbv
   g==;
X-CSE-ConnectionGUID: aA0XxZHZTw6Cj5RjrZQVSQ==
X-CSE-MsgGUID: hmJ3qBhLRwGiN9usVgG6EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105086802"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="105086802"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:40:08 -0700
X-CSE-ConnectionGUID: DJ0tWtA/SdajoXCRgCFGOg==
X-CSE-MsgGUID: bpDBbm/qS4uXXA2Nk61aGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="237169662"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2026 10:40:07 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNDYy-000000004mr-1Sg0;
	Wed, 13 May 2026 17:40:04 +0000
Date: Thu, 14 May 2026 01:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Hsu <Jeff.Hsu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@kernel.org>
Subject: [nbd168-wireless:pr/17 37/37]
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:43: error: 'device'
 undeclared
Message-ID: <202605140159.DS89s5tn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless pr/17
head:   b0f5b3976cca04fffdf61e07483536cef5baa39f
commit: b0f5b3976cca04fffdf61e07483536cef5baa39f [37/37] wifi: mt76: mt7925: Add coredump callback in pci_driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260514/202605140159.DS89s5tn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140159.DS89s5tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140159.DS89s5tn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:22,
                    from drivers/net/wireless/mediatek/mt76/mt7925/pci.c:4:
   drivers/net/wireless/mediatek/mt76/mt7925/pci.c: In function 'mt7925_coredump':
>> drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:43: error: 'device' undeclared (first use in this function)
     682 |         struct pci_dev *pdev = to_pci_dev(device);
         |                                           ^~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:32: note: in expansion of macro 'to_pci_dev'
     682 |         struct pci_dev *pdev = to_pci_dev(device);
         |                                ^~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:43: note: each undeclared identifier is reported only once for each function it appears in
     682 |         struct pci_dev *pdev = to_pci_dev(device);
         |                                           ^~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:32: note: in expansion of macro 'to_pci_dev'
     682 |         struct pci_dev *pdev = to_pci_dev(device);
         |                                ^~~~~~~~~~
   In file included from include/linux/container_of.h:5:
   include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/pci.h:609:23: note: in expansion of macro 'container_of'
     609 | #define to_pci_dev(n) container_of(n, struct pci_dev, dev)
         |                       ^~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:32: note: in expansion of macro 'to_pci_dev'
     682 |         struct pci_dev *pdev = to_pci_dev(device);
         |                                ^~~~~~~~~~


vim +/device +682 drivers/net/wireless/mediatek/mt76/mt7925/pci.c

   679	
   680	static void mt7925_coredump(struct device *dev)
   681	{
 > 682		struct pci_dev *pdev = to_pci_dev(device);
   683		struct mt76_dev *mdev = pci_get_drvdata(pdev);
   684		struct mt792x_dev *dev_792x = container_of(mdev, struct mt792x_dev, mt76);
   685	
   686		mt792x_mutex_acquire(dev_792x);
   687		mt7925_mcu_chip_config(dev_792x, "assert");
   688		mt792x_mutex_release(dev_792x);
   689	}
   690	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
