Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B9B2FAF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674483314; x=1706019314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EVI4+3AA6iG3XzYduRkdkEHiXiBVMdOEvJGxLAPkLDU=;
  b=RGP/xYBQDqUshjFtHYYjJ7oYB40+dPTWoSeB5Z08ueF/RU7gbpLrCHh1
   SJoKrGrc4WtdcIIfHoPubEZr82itOuJ+oANOgLfgmkuCATwSR8YcgxFFy
   bG11RwVqGzzhEyqz+jdYElJKqkarYeVm7YzpdIg8aQnRrZ5e40iBcgRPM
   SFHF433Ke+0wGI4EFtbBhIxp1QxcBlnTUGwMnA8ir87iz+mMOXzqLlQV/
   27HQeQ96+vsKjEbLKAD69AXo9nbv/t+KUHaRJu5hXH1cf3hNFKQo17s+i
   bTWQXq0oyfjZ3lXsgWdlzIH3hTFEfXoRkOT4RZKn3UmJ2fJIkbmiWTVft
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="305706169"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="305706169"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="692167644"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="692167644"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 06:15:09 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJxbJ-0005gW-0n;
	Mon, 23 Jan 2023 14:15:09 +0000
Date: Mon, 23 Jan 2023 22:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-next-queue:dev-queue 56/72]
 drivers/net/ethernet/intel/ice/ice_main.c:652:30: warning: format '%llu'
 expects argument of type 'long long unsigned int', but argument 4 has type
 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202301232259.PLN1vLGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   65cdfcc3e172e7aa64ed4f881b053b4f6232d064
commit: 9df85f44b2d8f5a783fc6888536ed7c900b75745 [56/72] ice: Fix RDMA latency issue by allowing write-combining
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230123/202301232259.PLN1vLGM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?id=9df85f44b2d8f5a783fc6888536ed7c900b75745
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue dev-queue
        git checkout 9df85f44b2d8f5a783fc6888536ed7c900b75745
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from include/linux/skbuff.h:31,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/intel/ice/ice.h:12,
                    from drivers/net/ethernet/intel/ice/ice_main.c:9:
   drivers/net/ethernet/intel/ice/ice_main.c: In function 'ice_map_hw_addr':
>> drivers/net/ethernet/intel/ice/ice_main.c:652:30: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     652 |                 dev_err(dev, "%s: remap at offset %llu failed\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_main.c:652:17: note: in expansion of macro 'dev_err'
     652 |                 dev_err(dev, "%s: remap at offset %llu failed\n",
         |                 ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_main.c:652:54: note: format string is defined here
     652 |                 dev_err(dev, "%s: remap at offset %llu failed\n",
         |                                                   ~~~^
         |                                                      |
         |                                                      long long unsigned int
         |                                                   %u


vim +652 drivers/net/ethernet/intel/ice/ice_main.c

   628	
   629	/**
   630	 * ice_map_hw_addr - map a region of device registers to memory
   631	 * @pdev: the PCI device
   632	 * @map: the address map structure
   633	 *
   634	 * Map the specified section of the hardware registers into memory, storing
   635	 * the memory mapped address in the provided structure.
   636	 *
   637	 * Returns 0 on success or an error code on failure.
   638	 */
   639	static int ice_map_hw_addr(struct pci_dev *pdev, struct ice_hw_addr_map *map)
   640	{
   641		struct device *dev = &pdev->dev;
   642		resource_size_t size, base;
   643		void __iomem *addr;
   644	
   645		if (WARN_ON(map->end <= map->start))
   646			return -EIO;
   647	
   648		size = map->end - map->start;
   649		base = pci_resource_start(pdev, map->bar) + map->start;
   650		addr = ioremap(base, size);
   651		if (!addr) {
 > 652			dev_err(dev, "%s: remap at offset %llu failed\n",
   653				__func__, map->start);
   654			return -EIO;
   655		}
   656	
   657		map->addr = addr;
   658	
   659		return 0;
   660	}
   661	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
