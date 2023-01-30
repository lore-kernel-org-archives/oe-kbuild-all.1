Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3D362
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675081924; x=1706617924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QkMhm+0wtLWI/+bVOuBxOwf0bogGgITyP/FwG0+2HxA=;
  b=YtQcyYPZwTCQjVScHKvdJpq/pGScfNPf6Trj6GR3x8IGwDsnEFGXInMd
   TzN9twjwqrCvU/Ngwvu4axZuO7QnoGCMPT9FGX7CkMO1HQ12qv+NALYVC
   hXmkGoUC/zXnpMwITcYwO4hJwVd9Dleoi20nvFtZQBTOiCccRHeGKZQVz
   CFuHujtFkp1ZnTkAF4Wx3l8DZLgFNjtvcExLr8FStzMpAxAdOPCP+Hhq+
   QHf9Lpsvl60XlISguWfEzgdh0YysCHnEWYWJC8POr6C6TqU0r33HikoY9
   Bwju7da4QhHdeaZ8nvUfz9CXjXXXoId9zrvd/j+CD033/1YxV3Ehuv6Vn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="315503680"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="315503680"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 04:32:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="657438661"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="657438661"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jan 2023 04:32:02 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMTKM-0003cW-01;
	Mon, 30 Jan 2023 12:32:02 +0000
Date: Mon, 30 Jan 2023 20:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 13/22] drivers/cxl/core/pci.c:522:19: error: use of
 undeclared identifier 'response'
Message-ID: <202301302007.Xp4kReKv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   751e886233df0990cf1f0f497e68d962e67314ab
commit: cf19ff8aa3c0988bc72047917b5fbde1d8e4fc0c [13/22] cxl/pci: Rightsize CDAT response allocation
config: riscv-randconfig-r023-20230130 (https://download.01.org/0day-ci/archive/20230130/202301302007.Xp4kReKv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/l1k/linux/commit/cf19ff8aa3c0988bc72047917b5fbde1d8e4fc0c
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout cf19ff8aa3c0988bc72047917b5fbde1d8e4fc0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/cxl/core/pci.c:522:19: error: use of undeclared identifier 'response'
                                            le32_to_cpu(response[0]));
                                                        ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
>> drivers/cxl/core/pci.c:522:19: error: use of undeclared identifier 'response'
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
>> drivers/cxl/core/pci.c:521:16: error: assigning to 'int' from incompatible type 'void'
                   entry_handle = FIELD_GET(CXL_DOE_TABLE_ACCESS_ENTRY_HANDLE,
                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/response +522 drivers/cxl/core/pci.c

c97006046c791f Ira Weiny    2022-07-19  493  
c97006046c791f Ira Weiny    2022-07-19  494  static int cxl_cdat_read_table(struct device *dev,
c97006046c791f Ira Weiny    2022-07-19  495  			       struct pci_doe_mb *cdat_doe,
c97006046c791f Ira Weiny    2022-07-19  496  			       struct cxl_cdat *cdat)
c97006046c791f Ira Weiny    2022-07-19  497  {
cf19ff8aa3c098 Lukas Wunner 2023-01-30  498  	size_t length = cdat->length + sizeof(u32);
c97006046c791f Ira Weiny    2022-07-19  499  	u32 *data = cdat->table;
c97006046c791f Ira Weiny    2022-07-19  500  	int entry_handle = 0;
cf19ff8aa3c098 Lukas Wunner 2023-01-30  501  	u32 saved_dw = 0;
c97006046c791f Ira Weiny    2022-07-19  502  
c97006046c791f Ira Weiny    2022-07-19  503  	do {
7bfc809345f77d Lukas Wunner 2022-12-07  504  		u32 request = CDAT_DOE_REQ(entry_handle);
c97006046c791f Ira Weiny    2022-07-19  505  		size_t entry_dw;
c97006046c791f Ira Weiny    2022-07-19  506  		int rc;
c97006046c791f Ira Weiny    2022-07-19  507  
7bfc809345f77d Lukas Wunner 2022-12-07  508  		rc = pci_doe(cdat_doe, PCI_DVSEC_VENDOR_ID_CXL,
7bfc809345f77d Lukas Wunner 2022-12-07  509  			     CXL_DOE_PROTOCOL_TABLE_ACCESS,
7bfc809345f77d Lukas Wunner 2022-12-07  510  			     &request, sizeof(request),
cf19ff8aa3c098 Lukas Wunner 2023-01-30  511  			     data, length);
c97006046c791f Ira Weiny    2022-07-19  512  		if (rc < 0) {
7bfc809345f77d Lukas Wunner 2022-12-07  513  			dev_err(dev, "DOE failed: %d", rc);
c97006046c791f Ira Weiny    2022-07-19  514  			return rc;
c97006046c791f Ira Weiny    2022-07-19  515  		}
c97006046c791f Ira Weiny    2022-07-19  516  		/* 1 DW header + 1 DW data min */
7bfc809345f77d Lukas Wunner 2022-12-07  517  		if (rc < (2 * sizeof(u32)))
c97006046c791f Ira Weiny    2022-07-19  518  			return -EIO;
c97006046c791f Ira Weiny    2022-07-19  519  
c97006046c791f Ira Weiny    2022-07-19  520  		/* Get the CXL table access header entry handle */
c97006046c791f Ira Weiny    2022-07-19 @521  		entry_handle = FIELD_GET(CXL_DOE_TABLE_ACCESS_ENTRY_HANDLE,
7bfc809345f77d Lukas Wunner 2022-12-07 @522  					 le32_to_cpu(response[0]));
7bfc809345f77d Lukas Wunner 2022-12-07  523  		entry_dw = rc / sizeof(u32);
c97006046c791f Ira Weiny    2022-07-19  524  		/* Skip Header */
c97006046c791f Ira Weiny    2022-07-19  525  		entry_dw -= 1;
cf19ff8aa3c098 Lukas Wunner 2023-01-30  526  		/*
cf19ff8aa3c098 Lukas Wunner 2023-01-30  527  		 * Table Access Response Header overwrote the last DW of
cf19ff8aa3c098 Lukas Wunner 2023-01-30  528  		 * previous entry, so restore that DW
cf19ff8aa3c098 Lukas Wunner 2023-01-30  529  		 */
cf19ff8aa3c098 Lukas Wunner 2023-01-30  530  		*data = saved_dw;
c97006046c791f Ira Weiny    2022-07-19  531  		length -= entry_dw * sizeof(u32);
c97006046c791f Ira Weiny    2022-07-19  532  		data += entry_dw;
cf19ff8aa3c098 Lukas Wunner 2023-01-30  533  		saved_dw = *data;
c97006046c791f Ira Weiny    2022-07-19  534  	} while (entry_handle != CXL_DOE_TABLE_ACCESS_LAST_ENTRY);
c97006046c791f Ira Weiny    2022-07-19  535  
c97006046c791f Ira Weiny    2022-07-19  536  	return 0;
c97006046c791f Ira Weiny    2022-07-19  537  }
c97006046c791f Ira Weiny    2022-07-19  538  

:::::: The code at line 522 was first introduced by commit
:::::: 7bfc809345f77dc0adfc8a5a051097b2d2b01bcc cxl/pci: Use synchronous API for DOE

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
