Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D585E213E66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530741; cv=none; b=TSX2uDANHWS9FYvw86UOfzg+s4iTAheSrnSaOBbdmJFXB55g3LBBlAxuwjTAmvR+oyxHOs0zGMf/I9QpAMj4AvH/71mbT5qZVdxdX+3b8KmvfGOMcR9Ne35qqGhdJf0X9rB/OpvZcWo0ja6uTOhTq6T9vXdEWLMPK6n5PIOIatA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530741; c=relaxed/simple;
	bh=jtFQ6GF9AMhANPu2yc6bKdQiG0gDT/hOYOe+pWqU1zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJHIpYgBjm339Rp2aN5QfsYsd4RTUq/dRaydmL6f9lHPocQgZAgtnDMzxrV6M0p2nBQT0VoFOyZJLWvMV/sgiRDSmFqdxJnnJ8utO29VzdV2zKLb3c8FrNwYOsh6B+EQfxXlU0/sBx/7SZfSYsC6jtSBLZXCBRDyK0OKpb+9It4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4iBd6fB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4iBd6fB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736530739; x=1768066739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtFQ6GF9AMhANPu2yc6bKdQiG0gDT/hOYOe+pWqU1zk=;
  b=S4iBd6fBVp4A+xghAuxKHVmMHO/UfQS2R6mZUh1xkhic+VOY1gWlZ8kX
   y/0GDKaobKSIFj5sTZ3lDTYuIg4yhS8r0nvboSbAwjUJw6jEeFEdxl/hf
   Z6TDStw/6S8ZgeR7fI1Z8uAlSwlkdOpaOxV4VNG0pZ61GarQuwixO8ETM
   7QP49n0Lv95IArwZnf0vt2QQrq2U8++82w70kAR9SoqwDXUqOoRTN92YU
   Kz4SK1MtT2ect+Wde19iuEx5j+JTv0YoKOKxhQ/5bPuTkHjeHGMuljJkO
   TV2gfFLINMEW1FPiv/d5Z/fD6X0GWoDbdgPkIyBVvN0LwzB39D3sqWDGZ
   g==;
X-CSE-ConnectionGUID: 0DtUyHXySiyQozhnWvddWA==
X-CSE-MsgGUID: u5LLjCaOQRGHwgVH3vuOJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47823714"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47823714"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 09:38:59 -0800
X-CSE-ConnectionGUID: orckjJYgQGWfbXZfhXPCmA==
X-CSE-MsgGUID: xuQIEPMQQC+5rR7eAMqmqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108894361"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 09:38:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWIy3-000JYd-0I;
	Fri, 10 Jan 2025 17:38:43 +0000
Date: Sat, 11 Jan 2025 01:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/gadget/function/rndis.c:60:23: warning: '%03d' directive
 writing between 3 and 10 bytes into a region of size 7
Message-ID: <202501110148.c1kVuj6t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2144da25584eb10b84252230319b5783f6a83041
commit: df8df5e4bc37e39010cfdf5d50cf726fe08aae5b usb: get rid of 'choice' for legacy gadget drivers
date:   4 years, 10 months ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250111/202501110148.c1kVuj6t-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110148.c1kVuj6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110148.c1kVuj6t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/rndis.c: In function 'rndis_register':
>> drivers/usb/gadget/function/rndis.c:60:23: warning: '%03d' directive writing between 3 and 10 bytes into a region of size 7 [-Wformat-overflow=]
      60 | #define NAME_TEMPLATE "driver/rndis-%03d"
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/rndis.c:903:31: note: in expansion of macro 'NAME_TEMPLATE'
     903 |                 sprintf(name, NAME_TEMPLATE, i);
         |                               ^~~~~~~~~~~~~
   drivers/usb/gadget/function/rndis.c:60:37: note: format string is defined here
      60 | #define NAME_TEMPLATE "driver/rndis-%03d"
         |                                     ^~~~
   drivers/usb/gadget/function/rndis.c:60:23: note: directive argument in the range [0, 2147483647]
      60 | #define NAME_TEMPLATE "driver/rndis-%03d"
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/rndis.c:903:31: note: in expansion of macro 'NAME_TEMPLATE'
     903 |                 sprintf(name, NAME_TEMPLATE, i);
         |                               ^~~~~~~~~~~~~
   drivers/usb/gadget/function/rndis.c:903:17: note: 'sprintf' output between 17 and 24 bytes into a destination of size 20
     903 |                 sprintf(name, NAME_TEMPLATE, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_PCI_POWERNV
   Depends on [n]: PCI [=y] && HOTPLUG_PCI [=n] && PPC_POWERNV [=y] && EEH [=y]
   Selected by [y]:
   - OCXL [=y] && PPC_POWERNV [=y] && PCI [=y] && EEH [=y]


vim +60 drivers/usb/gadget/function/rndis.c

d6d22922d9070b drivers/usb/gadget/function/rndis.c Andrzej Pietrasiewicz 2015-02-06  59  
d6d22922d9070b drivers/usb/gadget/function/rndis.c Andrzej Pietrasiewicz 2015-02-06 @60  #define	NAME_TEMPLATE "driver/rndis-%03d"
^1da177e4c3f41 drivers/usb/gadget/rndis.c          Linus Torvalds        2005-04-16  61  

:::::: The code at line 60 was first introduced by commit
:::::: d6d22922d9070b660e3dce0a87a94f0b581e803e usb: gadget: rndis: remove the limit of available rndis connections

:::::: TO: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
