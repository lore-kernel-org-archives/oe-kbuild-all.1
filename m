Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D68FEACE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690016664; x=1721552664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGZ2eUSmBXmcava2ceODWu00LbZUif0EJg8x6ntMHRc=;
  b=XmxbZHRFjsv1hbilgD/GiEkzaw3zXb3l3jVBAA5+3UsaShRQx4T7WIXi
   ty+6MLzYcFq4YrkA8gJfHS9Lu2VA8HFF01R2LbRtSQTMr+ueodRhbeZ8a
   eE2zaC/D3mvHZrtvAGnG6d9ko+e+lFD8AevQAMwSFszCqhv0p+W3STcwK
   R8wnMTwtNqey1V0hCAqzK+Fr6KDCFjR8GZ+KdxuVoWFbT+OCxx1AUf81H
   uzTN4/lM4hPBmCeThAIYWVP9Cu7r04pJm2xC2mn6n6bBffHQwsWxF14H7
   2ZqH5XL9/khPfREIDJVj3PtLd5iRnxHxPYYo1zK0P5Ix+tACsGbI0iy2m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346781565"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="346781565"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 02:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055842491"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="1055842491"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2023 02:04:20 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN8XC-0008CH-1G;
	Sat, 22 Jul 2023 09:04:19 +0000
Date: Sat, 22 Jul 2023 17:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 8/67] undefined
 reference to `cdns_pcie_get_parent_irq_domain'
Message-ID: <202307221702.OnRqwdH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 7b0ad6270e48635cd221c2a13a361542f3dcb947 [8/67] driver: pcie: Add sophgo sg2042 soc support
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230722/202307221702.OnRqwdH3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221702.OnRqwdH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221702.OnRqwdH3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/controller/cadence/pcie-cadence-sophgo.c:164:5: warning: no previous prototype for 'cdns_pcie_config_read' [-Wmissing-prototypes]
     164 | int cdns_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-cadence-sophgo.c:200:5: warning: no previous prototype for 'cdns_pcie_config_write' [-Wmissing-prototypes]
     200 | int cdns_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pci/controller/cadence/pcie-cadence-sophgo.c:13:
   drivers/pci/controller/cadence/pcie-cadence-sophgo.c: In function 'cdns_pcie_msi_init':
>> drivers/pci/controller/cadence/pcie-cadence-sophgo.c:373:23: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     373 |         dev_info(dev, "msi_data is 0x%llx\n", rc->msi_data);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/pci/controller/cadence/pcie-cadence-sophgo.c:373:9: note: in expansion of macro 'dev_info'
     373 |         dev_info(dev, "msi_data is 0x%llx\n", rc->msi_data);
         |         ^~~~~~~~
   drivers/pci/controller/cadence/pcie-cadence-sophgo.c:373:41: note: format string is defined here
     373 |         dev_info(dev, "msi_data is 0x%llx\n", rc->msi_data);
         |                                      ~~~^
         |                                         |
         |                                         long long unsigned int
         |                                      %x
   drivers/pci/controller/cadence/pcie-cadence-sophgo.c: At top level:
   drivers/pci/controller/cadence/pcie-cadence-sophgo.c:473:13: warning: no previous prototype for 'cdns_handle_msi_irq' [-Wmissing-prototypes]
     473 | irqreturn_t cdns_handle_msi_irq(struct cdns_mango_pcie_rc *rc)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-cadence-sophgo.c:686:5: warning: no previous prototype for 'cdns_pcie_allocate_domains' [-Wmissing-prototypes]
     686 | int cdns_pcie_allocate_domains(struct cdns_mango_pcie_rc *rc)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-cadence-sophgo.c:711:6: warning: no previous prototype for 'cdns_pcie_free_msi' [-Wmissing-prototypes]
     711 | void cdns_pcie_free_msi(struct cdns_mango_pcie_rc *rc)
         |      ^~~~~~~~~~~~~~~~~~
--
   hppa-linux-ld: drivers/pci/controller/cadence/pcie-cadence-sophgo.o: in function `cdns_pcie_host_probe':
>> (.text+0x32f8): undefined reference to `cdns_pcie_get_parent_irq_domain'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
