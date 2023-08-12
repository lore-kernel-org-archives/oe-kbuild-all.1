Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD4636
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 00:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691801517; x=1723337517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3rJNaJ8wjpJefAn1PXNn2GvNnjzDslHW3tdeeWKVtA=;
  b=E5dGlQMvfeP3oA60TpMxUzpZ6w5b3GxTD64BfB8K2cA9MjE1tkZzOhcK
   FPt8YwGQ46VQQVzNV5joYrVq93jJmMa7EBLydAo1/+0wmifQ9RNGaNZYg
   Kyk9M3oASBKSMEqBVqA9Fv4eg0ewnGZacjE7phnXC2JNpZlz3/gKWmwvk
   dxZwqTShDVBJ+pTZYpGMOVm4yx/3tycfwAh72tOHJMaF2YLFPw3MAT4N3
   pYPUHjadL1/PYUemcvzL2WGomqR04siTsNYNydetGQXH+EkFU1xQ13352
   R9PvZubSgMFT4Fpo2csg5spxuck0n1ppz3pdqjVOeAqnNMeg132saxmjS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438123404"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="438123404"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 17:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735936594"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="735936594"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2023 17:51:56 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUcrD-00089c-25;
	Sat, 12 Aug 2023 00:51:55 +0000
Date: Sat, 12 Aug 2023 08:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 15/24] include/linux/pci.h:352:47: warning: 'enum
 pci_ide_stream_type' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202308120858.tiZhVauM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   3e25c6d783287d7b5807e5df623589e7d53b64a8
commit: cba36ee4e7f4d5d50334a59f5a5af09605bfdde6 [15/24] pci: Add basic support for discovery of IDE on PCIe device
config: arc-randconfig-r043-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120858.tiZhVauM-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120858.tiZhVauM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120858.tiZhVauM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/media/media-device.h:16,
                    from include/media/dvbdev.h:26,
                    from drivers/media/dvb-core/dvbdev.c:24:
>> include/linux/pci.h:352:47: warning: 'enum pci_ide_stream_type' declared inside parameter list will not be visible outside of this definition or declaration
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:352:67: error: parameter 3 ('type') has incomplete type
     352 |                                          enum pci_ide_stream_type type)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/pci.h:350:19: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     350 | static inline int pcie_ide_stream_create(struct pci_dev *pdev1,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +352 include/linux/pci.h

   338	
   339	struct pci_ide {
   340		unsigned int			link_num;
   341		unsigned int			select_num;
   342		struct ida			stream_pos_ids;
   343		struct ida			stream_ids;
   344		int				stream_min;
   345		int				stream_max;
   346		const struct pci_ide_ops	*ops;
   347		enum pci_ide_stream_type	stream_type;
   348	};
   349	#else
   350	static inline int pcie_ide_stream_create(struct pci_dev *pdev1,
   351						 struct pci_dev *pdev2,
 > 352						 enum pci_ide_stream_type type)
   353	{
   354		return -EOPNOTSUPP;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
