Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A2379CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675172816; x=1706708816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6LQuKMVGn9lDzaCAKt7l5RglSlG+OlWAVXM/4EX43y8=;
  b=W7xWvLYTRGljHNjbecqBBWLDjfMFJU7+27GE6LIqawWblT/Ofr2bkDIS
   ky7jb6I17nrxv5xBh5zgcHAw6CKykLfU1LCHvgVzo1HXEUu4iITCk8fQ9
   iVFSKWAWSsutK4qqOROF1nQla+fKEWWCxBWMQyJpwADCX4YpFPZDUN7MC
   hKWx2t9W+2Y25WaTFHEyttM2nUwPHvGKgAhBD+kvpkQbAGYj3C3iMSari
   w/fKm6lk9GR+dN0GshXk6kvDRKCJjWjFJ8muxs6vPS8mk0HEUYDxloQkL
   67I8zFAOZheruEt9RJQHmi+LIGZ9eiAsP5EgAynajZjNRGiGqrGDHVPPK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="414056953"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="414056953"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 05:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993273693"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="993273693"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2023 05:46:54 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMqyM-0004Sg-0T;
	Tue, 31 Jan 2023 13:46:54 +0000
Date: Tue, 31 Jan 2023 21:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 8/23] drivers/cxl/core/pci.c:495:23: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202301312132.GzeygYUG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   6d855ec241ff68e65ed7badd7658c3e6d56b8da7
commit: 5d86c9625529753b42f36555b97e54fb2ab47050 [8/23] cxl/pci: Use synchronous API for DOE
config: arc-randconfig-s031-20230131 (https://download.01.org/0day-ci/archive/20230131/202301312132.GzeygYUG-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/l1k/linux/commit/5d86c9625529753b42f36555b97e54fb2ab47050
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 5d86c9625529753b42f36555b97e54fb2ab47050
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/pci.c:495:23: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] request @@     got restricted __le32 [usertype] @@
   drivers/cxl/core/pci.c:495:23: sparse:     expected unsigned int [usertype] request
   drivers/cxl/core/pci.c:495:23: sparse:     got restricted __le32 [usertype]
   drivers/cxl/core/pci.c:510:19: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:510:19: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:510:19: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:510:19: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:510:19: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:510:19: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:525:31: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] request @@     got restricted __le32 [usertype] @@
   drivers/cxl/core/pci.c:525:31: sparse:     expected unsigned int [usertype] request
   drivers/cxl/core/pci.c:525:31: sparse:     got restricted __le32 [usertype]
   drivers/cxl/core/pci.c:546:43: sparse: sparse: cast to restricted __le16
   drivers/cxl/core/pci.c:546:43: sparse: sparse: cast to restricted __le16
   drivers/cxl/core/pci.c:546:43: sparse: sparse: cast to restricted __le16
   drivers/cxl/core/pci.c:546:43: sparse: sparse: cast to restricted __le16
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:550:32: sparse: sparse: cast to restricted __le32

vim +495 drivers/cxl/core/pci.c

   483	
   484	#define CDAT_DOE_REQ(entry_handle) cpu_to_le32				\
   485		(FIELD_PREP(CXL_DOE_TABLE_ACCESS_REQ_CODE,			\
   486			    CXL_DOE_TABLE_ACCESS_REQ_CODE_READ) |		\
   487		 FIELD_PREP(CXL_DOE_TABLE_ACCESS_TABLE_TYPE,			\
   488			    CXL_DOE_TABLE_ACCESS_TABLE_TYPE_CDATA) |		\
   489		 FIELD_PREP(CXL_DOE_TABLE_ACCESS_ENTRY_HANDLE, (entry_handle)))
   490	
   491	static int cxl_cdat_get_length(struct device *dev,
   492				       struct pci_doe_mb *cdat_doe,
   493				       size_t *length)
   494	{
 > 495		u32 request = CDAT_DOE_REQ(0);
   496		u32 response[32];
   497		int rc;
   498	
   499		rc = pci_doe(cdat_doe, PCI_DVSEC_VENDOR_ID_CXL,
   500			     CXL_DOE_PROTOCOL_TABLE_ACCESS,
   501			     &request, sizeof(request),
   502			     &response, sizeof(response));
   503		if (rc < 0) {
   504			dev_err(dev, "DOE failed: %d", rc);
   505			return rc;
   506		}
   507		if (rc < 2 * sizeof(u32))
   508			return -EIO;
   509	
   510		*length = le32_to_cpu(response[1]);
   511		dev_dbg(dev, "CDAT length %zu\n", *length);
   512	
   513		return 0;
   514	}
   515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
