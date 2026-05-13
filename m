Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1F357D17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657623; cv=none; b=Y82GbSyN38/hSl/lyiEesyFhs3PJqsT8JJFD9tGH9Ot4THFHLY69FIbAKUyLv/S7joNsb9btdqq6sOmmRmnmGpY7M0vPKj/JS8QWLjD+gjOABZZYJXnkZEEtkp8X/wtOHO4v/iQu5GvLW5WbcBVXDA8mO98EsvNU3ipfEYIIGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657623; c=relaxed/simple;
	bh=Q0Iom7Hd0rUbolL9SVaU6dTQGZXDl3qzU1lU3b0aglg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V57co9a1G6DbX+4FEEKa18tWmmR0U0KdxMbchE2VzfREaJnw/33029NKRiirU87QNZXnaGg4vRDwhjQhQ/i2Fl3alStGIsaHl33DuPtAi/M+eE11MTPgu0LzzNkQGEM9JgPOmpFII9N6USGSkYD/ueLe3suqXlbt0f1PXVY5fI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWPJ1Cpo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWPJ1Cpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778657622; x=1810193622;
  h=date:from:to:cc:subject:message-id;
  bh=Q0Iom7Hd0rUbolL9SVaU6dTQGZXDl3qzU1lU3b0aglg=;
  b=JWPJ1CpobLWAzAai3u3aGuCAv+F5to5DEIW6vYFqqejbICWcL8dUOTh4
   A13ggDSwL2xzm8JuQeABAHXlX6mSkK7QgLIh++NyWZ04Mz30hZ8erCvqM
   IXtsU/pQOahual+QgHDMJFDw0tpPHPGGR3ZPgGZdDj4MkFbVfUBaiNGGo
   aTwpsaxAR4HgpBE1iR89laJiTl/cdMs/3blYyfhvM7Xrgyyac49+9b81b
   N+1t1HwxZ42zJhUy3h5Od5JB5MQm8YvkuVo422mgXXs+//MxIF41Ew68i
   IGGkqkYLyt/dmQxK58BLgPkgRC8XH8yxEKMccI9tzhsneEfkXq3aN5ULa
   g==;
X-CSE-ConnectionGUID: 5Y6UpPeATjO/IX6iCVIMxg==
X-CSE-MsgGUID: 8k6YpwJRQqy8HrgYs3qXrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89881530"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="89881530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:33:41 -0700
X-CSE-ConnectionGUID: GjhByJdjTYe3je2NI34TxA==
X-CSE-MsgGUID: sxTncVlpSEWq81oGFMvP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="242966684"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 May 2026 00:33:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN465-000000008VU-36AY;
	Wed, 13 May 2026 07:33:37 +0000
Date: Wed, 13 May 2026 09:33:36 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Hsu <Jeff.Hsu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@kernel.org>
Subject: [nbd168-wireless:pr/17 37/37]
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:43: error: 'device'
 undeclared
Message-ID: <202605130912.xc5U1ul6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless pr/17
head:   b0f5b3976cca04fffdf61e07483536cef5baa39f
commit: b0f5b3976cca04fffdf61e07483536cef5baa39f [37/37] wifi: mt76: mt7925: Add coredump callback in pci_driver
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260513/202605130912.xc5U1ul6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130912.xc5U1ul6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130912.xc5U1ul6-lkp@intel.com/

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
