Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A27EEF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713544757; cv=none; b=JlxEKdYKwYgZKJ7/qhdjA1uTNKO6MlEOB6LgpQd89Hm+iJuYhRN5RBVWOKxsCC4vChVNXOctaiD0+Wwkpow/69oW4TD434YyjO+6Jb2XVMfa2PSJgACxLGccncpE2KoldfWVnRyk5V0Pq62M09zdd5aNWb2KpFs1ZT4vUDG9w5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713544757; c=relaxed/simple;
	bh=uzOfxChoHVJlBkbxenNWHW+6Lz510xzMxXwAhFeFbbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k7lybvrIxzTavvOSpzOhdoAT57i4ijyXiExiCOLqAbVWhUmLR4iigmWgBupYvYUKY43v0tyjwoZGyx0M4zDlOj8r9ahcPKHUWpWK8yuVdIsmuoamwomocire5cTXVRzqxk3vlO7FHdYaV0cCO+PUNMWT3k3r2ycL7fqlWyU/VqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfP0hv3/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfP0hv3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713544755; x=1745080755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzOfxChoHVJlBkbxenNWHW+6Lz510xzMxXwAhFeFbbc=;
  b=UfP0hv3/3hBP55jwxaXzhLqFv2pRA7xWAA/3PsjP8BmwN+CtbPXrX+C1
   WpLZ+ecZWZDJtAw98o/ippjxZpjOvLUULlM0n+lJ8R5KVJC+6aPCcKNWx
   bCvqO+c7k+AKpVAkzr1UnAbTABqCL6WjlbdUVpmY1TAWAKqP1V/RqP6y0
   5t/VFO9jQwl73fAkrsR4mqL0hjwOKt4xgsVEFKUL/l0yTUHN2J63cI19I
   eXd07FBiPIE1iUsUwWSpI4iBiVXdauQpRcA1ezBSP/P3dAln2/deuEqSp
   /TxbLdjDK2OBeg7RGPwnFgD+nbF6cgkPwX/olXoSHmoksAbIm5GX+yg8+
   Q==;
X-CSE-ConnectionGUID: DTbY/oyFSX+aN4SUMgzQwA==
X-CSE-MsgGUID: z+Xfl01NQmCX+xJZHRreDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="8990590"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="8990590"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 09:39:15 -0700
X-CSE-ConnectionGUID: sUvobFaiRsmC+6z5c3hCsA==
X-CSE-MsgGUID: zuBVzm5ISfOqsv3jbHnfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="23881909"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2024 09:39:14 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxrGY-000AJA-2m;
	Fri, 19 Apr 2024 16:39:10 +0000
Date: Sat, 20 Apr 2024 00:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 15894/18115]
 drivers/mfd/maxim_serdes.c:63:5: warning: no previous prototype for function
 'maxim_serdes_chain_register_remote'
Message-ID: <202404200059.XAcznBlY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 4679c4f90240fab234b9faa70db8ed791ef6e570 [15894/18115] LF-10269-5: mfd: add Maxim SerDes link manager layer
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240420/202404200059.XAcznBlY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200059.XAcznBlY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200059.XAcznBlY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/maxim_serdes.c:63:5: warning: no previous prototype for function 'maxim_serdes_chain_register_remote' [-Wmissing-prototypes]
      63 | int maxim_serdes_chain_register_remote(struct device *dev, int link, void (*cb)(void *), void *data)
         |     ^
   drivers/mfd/maxim_serdes.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | int maxim_serdes_chain_register_remote(struct device *dev, int link, void (*cb)(void *), void *data)
         | ^
         | static 
>> drivers/mfd/maxim_serdes.c:109:5: warning: no previous prototype for function 'maxim_serdes_chain_register_local' [-Wmissing-prototypes]
     109 | int maxim_serdes_chain_register_local(struct device *dev, int remote_links_used,
         |     ^
   drivers/mfd/maxim_serdes.c:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     109 | int maxim_serdes_chain_register_local(struct device *dev, int remote_links_used,
         | ^
         | static 
   2 warnings generated.
--
   In file included from drivers/mfd/max96752-core.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mfd/max96752-core.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mfd/max96752-core.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/mfd/max96752-core.c:146:5: warning: no previous prototype for function 'max96752_set_link_params' [-Wmissing-prototypes]
     146 | int max96752_set_link_params(struct max96752 *max96752)
         |     ^
   drivers/mfd/max96752-core.c:146:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     146 | int max96752_set_link_params(struct max96752 *max96752)
         | ^
         | static 
   7 warnings generated.


vim +/maxim_serdes_chain_register_remote +63 drivers/mfd/maxim_serdes.c

    62	
  > 63	int maxim_serdes_chain_register_remote(struct device *dev, int link, void (*cb)(void *), void *data)
    64	{
    65		struct maxim_serdes_chain *serdes_chain;
    66		struct device_node *dn;
    67		int i;
    68	
    69		dn = of_node_get(dev->of_node);
    70	
    71		while (dn) {
    72			serdes_chain = maxim_serdes_get_chain(dn);
    73			if (serdes_chain) {
    74				of_node_put(dn);
    75				break;
    76			}
    77	
    78			dn = of_get_next_parent(dn);
    79		}
    80	
    81		if (!dn) {
    82			dev_err(dev, "could not find the local device of_node in the chains list\n");
    83			return -ENODEV;
    84		}
    85	
    86		if (link > serdes_chain->remotes_no - 1) {
    87			dev_err(dev, "invalid remote link id provided\n");
    88			return -EINVAL;
    89		}
    90	
    91		serdes_chain->remote_late_setup[link].cb = cb;
    92		serdes_chain->remote_late_setup[link].data = data;
    93	
    94		/* let's find out if all remotes registered their late setup routines */
    95		for (i = 0; i < serdes_chain->remotes_no; i++) {
    96			if (!serdes_chain->remote_late_setup[i].cb)
    97				return 0;
    98		}
    99	
   100		/* we're good to go, let's queue the late setup work */
   101		INIT_WORK(&serdes_chain->late_setup_work, maxim_serdes_worker);
   102	
   103		queue_work(system_unbound_wq, &serdes_chain->late_setup_work);
   104	
   105		return 0;
   106	};
   107	EXPORT_SYMBOL(maxim_serdes_chain_register_remote);
   108	
 > 109	int maxim_serdes_chain_register_local(struct device *dev, int remote_links_used,
   110					      void (*cb)(void *), void *data)
   111	{
   112		struct maxim_serdes_chain *chain;
   113		int extra_space;
   114	
   115		extra_space = remote_links_used * sizeof(struct maxim_serdes_late_setup);
   116		chain = devm_kzalloc(dev, sizeof(*chain) + extra_space, GFP_KERNEL);
   117		if (!chain)
   118			return -ENOMEM;
   119	
   120		chain->local_dev_node = dev->of_node;
   121		chain->local_late_setup.cb = cb;
   122		chain->local_late_setup.data = data;
   123		chain->remotes_no = remote_links_used;
   124	
   125		list_add_tail(&chain->entry, &maxim_serdes_chains_list);
   126	
   127		return 0;
   128	}
   129	EXPORT_SYMBOL(maxim_serdes_chain_register_local);
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
