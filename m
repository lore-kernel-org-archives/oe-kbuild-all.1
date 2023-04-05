Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8251FBB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680719663; x=1712255663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lCM5tGWW/vzUTd0lZuHEmX8iYl4Qt+typVZPzGaWWC0=;
  b=KCMcgxz51boCrWfodyr6XunOXxGurJ1LznwYLMz3djbbpDrmgFK8C2HT
   I6hUhxGesTSlzlkOmgaKLesmRDoqdlberNNbCzHUCzuge/2QVMVNt9CS4
   qj0HQpL+Q4Gfd1rPokApOChOzZBjnNH9fPMFPO4Bnah77fGBVBJ9mtLAp
   XyYdOYGO0HXLo5lbm7imFMiM8yvrdbc1XQn/ZTlxdmr4Tl1emOieDnGev
   nJJo5ZA12K05aOqyN3dFvVYAnUovpZbTD9xsRZIjZHqfigS2ggYy1b62M
   wsNI0w3kSxYoH852Dwf32Q4oU0aYPKIaD8uF1KPgMY7q1tZMhER3Wj0TD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370364724"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="370364724"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 11:34:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="686844339"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="686844339"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2023 11:34:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk7xc-000Qhi-1n;
	Wed, 05 Apr 2023 18:34:20 +0000
Date: Thu, 6 Apr 2023 02:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Georgiev <glipus@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/5] Add ndo_hwtstamp_get/set support to vlan code
 path
Message-ID: <202304060246.Vxhd7U2x-lkp@intel.com>
References: <20230405063323.36270-1-glipus@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405063323.36270-1-glipus@gmail.com>

Hi Maxim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on next-20230405]
[cannot apply to horms-ipvs/master linus/master v6.3-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxim-Georgiev/Add-ifreq-pointer-field-to-kernel_hwtstamp_config-structure/20230405-143518
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230405063323.36270-1-glipus%40gmail.com
patch subject: [RFC PATCH v3 3/5] Add ndo_hwtstamp_get/set support to vlan code path
config: arc-randconfig-r034-20230404 (https://download.01.org/0day-ci/archive/20230406/202304060246.Vxhd7U2x-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e48fe7f9909e9c0768e866c43b1cc880c0eb329f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxim-Georgiev/Add-ifreq-pointer-field-to-kernel_hwtstamp_config-structure/20230405-143518
        git checkout e48fe7f9909e9c0768e866c43b1cc880c0eb329f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash net/8021q/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060246.Vxhd7U2x-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/8021q/vlan_dev.c: In function 'vlan_dev_hwtstamp':
>> net/8021q/vlan_dev.c:369:51: error: 'real_dev' undeclared (first use in this function)
     369 |                         return ops->ndo_eth_ioctl(real_dev, &ifr, cmd);
         |                                                   ^~~~~~~~
   net/8021q/vlan_dev.c:369:51: note: each undeclared identifier is reported only once for each function it appears in
>> net/8021q/vlan_dev.c:369:61: error: passing argument 2 of 'ops->ndo_eth_ioctl' from incompatible pointer type [-Werror=incompatible-pointer-types]
     369 |                         return ops->ndo_eth_ioctl(real_dev, &ifr, cmd);
         |                                                             ^~~~
         |                                                             |
         |                                                             struct ifreq **
   net/8021q/vlan_dev.c:369:61: note: expected 'struct ifreq *' but argument is of type 'struct ifreq **'
>> net/8021q/vlan_dev.c:370:17: error: expected '}' before 'else'
     370 |                 else
         |                 ^~~~
   cc1: some warnings being treated as errors


vim +/real_dev +369 net/8021q/vlan_dev.c

   355	
   356	static int vlan_dev_hwtstamp(struct net_device *dev, struct ifreq *ifr, int cmd)
   357	{
   358		const struct net_device_ops *ops = dev->netdev_ops;
   359		struct kernel_hwtstamp_config kernel_config = {};
   360		struct hwtstamp_config config;
   361		int err;
   362	
   363		if (!netif_device_present(dev))
   364			return -ENODEV;
   365	
   366		if ((cmd == SIOCSHWTSTAMP && !ops->ndo_hwtstamp_set) ||
   367		    (cmd == SIOCGHWTSTAMP && !ops->ndo_hwtstamp_get)) {
   368			if (ops->ndo_eth_ioctl) {
 > 369				return ops->ndo_eth_ioctl(real_dev, &ifr, cmd);
 > 370			else
   371				return -EOPNOTSUPP;
   372		}
   373	
   374		kernel_config.ifr = ifr;
   375		if (cmd == SIOCSHWTSTAMP) {
   376			if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
   377				return -EFAULT;
   378	
   379			hwtstamp_config_to_kernel(&kernel_config, &config);
   380			err = ops->ndo_hwtstamp_set(dev, &kernel_config, NULL);
   381		} else if (cmd == SIOCGHWTSTAMP) {
   382			err = ops->ndo_hwtstamp_get(dev, &kernel_config, NULL);
   383		}
   384	
   385		if (err)
   386			return err;
   387	
   388		hwtstamp_kernel_to_config(&config, &kernel_config);
   389		if (copy_to_user(ifr->ifr_data, &config, sizeof(config)))
   390			return -EFAULT;
   391		return 0;
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
