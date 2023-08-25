Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E6101E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692972729; x=1724508729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6LfVs46EWrUq21ponp+1uRTAdaFTtgzgJC5q+zmT464=;
  b=KKTDXtp/EGYGMgPE5BriqGhKnwdPXtjL3F2Tydu1m2YkNG627xKs657x
   YkYxNSBjWe7sIGWFunmCB0GBTwJqTaYoNTerRuixPk93/wUhZIhAWUsCx
   1Ucj3Ae9ujameQjw0Uw2kStlzsKJGwIOATwsuJWhJVs183z4yLvjOEqKe
   R8Jrud4oSb9eOqV+9gPYIn9MzrHlLSjCclH/rblcCxn15lKUgFF9gOF5R
   1roaLGy+vz9MyvUA/pe90xcAZa1mLMu9dyjsgv0+iGVl4t1P7Ic9oMbf9
   8ekrdadmAimgjun9xWrVjDH9fU1ZP7hfz/2QqptzIDLdzgyrpZyVoHp5h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354249813"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354249813"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 07:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911289687"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="911289687"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Aug 2023 07:11:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZXXN-0003fF-0M;
	Fri, 25 Aug 2023 14:11:49 +0000
Date: Fri, 25 Aug 2023 22:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Valentine Sinitsyn <valesini@yandex-team.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Vetter <daniel.vetter@ffwll.ch>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] PCI: Implement custom llseek for sysfs resource
 entries
Message-ID: <202308252133.YO5zs5rv-lkp@intel.com>
References: <20230823125834.492298-2-valesini@yandex-team.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823125834.492298-2-valesini@yandex-team.ru>

Hi Valentine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 89bf6209cad66214d3774dac86b6bbf2aec6a30d]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentine-Sinitsyn/PCI-Implement-custom-llseek-for-sysfs-resource-entries/20230823-210101
base:   89bf6209cad66214d3774dac86b6bbf2aec6a30d
patch link:    https://lore.kernel.org/r/20230823125834.492298-2-valesini%40yandex-team.ru
patch subject: [PATCH v5 2/2] PCI: Implement custom llseek for sysfs resource entries
config: arc-randconfig-r023-20230824 (https://download.01.org/0day-ci/archive/20230825/202308252133.YO5zs5rv-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252133.YO5zs5rv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252133.YO5zs5rv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pci-sysfs.c:1268:12: warning: no previous prototype for 'pci_create_resource_files' [-Wmissing-prototypes]
    1268 | int __weak pci_create_resource_files(struct pci_dev *dev) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci-sysfs.c:1269:13: warning: no previous prototype for 'pci_remove_resource_files' [-Wmissing-prototypes]
    1269 | void __weak pci_remove_resource_files(struct pci_dev *dev) { return; }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci-sysfs.c:838:15: warning: 'pci_llseek_resource' defined but not used [-Wunused-function]
     838 | static loff_t pci_llseek_resource(struct file *filep,
         |               ^~~~~~~~~~~~~~~~~~~


vim +/pci_llseek_resource +838 drivers/pci/pci-sysfs.c

   837	
 > 838	static loff_t pci_llseek_resource(struct file *filep,
   839					  struct kobject *kobj __always_unused,
   840					  struct bin_attribute *attr,
   841					  loff_t offset, int whence)
   842	{
   843		return fixed_size_llseek(filep, offset, whence, attr->size);
   844	}
   845	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
