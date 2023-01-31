Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2EA808
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675159371; x=1706695371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h3a3S2q8pMEoKLtDUCoJ7Vjz9rCtG05WYSTp5zbMnrQ=;
  b=LeiJtD4D4yN3BigLHA1auD7hu7OYA2EbzgvhfC2IoL8oLdMplYZI0Rxo
   3oKOQ+tnW/sdF4yujhUd5L5c3ZKAvSt9bC7gMVvA7T1kWwpo08zpn21Zr
   +nWiz2No8y3zrl9B3T98nh1KQHEJRAnnh+abp8mKTMHraDgs6JfsBEvSj
   e4jrP7xTudif9YomwQP61wlgWd4nm6cwyn4CgYOt6UiBvN0+uUqfBD0/6
   YdS/RTQsf50RFr+usRZTSlZMzozk87yyujxgErYMp5U3ff54aGTVhXXli
   6p9F0LiCPd8RB+9twasOqWC/77mM3pIxlntczWxvdhlsaP6Qe096lQ8s5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307457101"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="307457101"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 02:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="657816759"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="657816759"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Jan 2023 02:02:48 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMnTT-0004Ly-21;
	Tue, 31 Jan 2023 10:02:47 +0000
Date: Tue, 31 Jan 2023 18:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 1/23] drivers/cxl/core/pci.c:534:19: sparse: sparse: cast
 to restricted __le32
Message-ID: <202301311701.j9FcJxt8-lkp@intel.com>
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
commit: 7d65a43d7a135805121ae8b13cb2e626ae442128 [1/23] cxl/pci: Fix CDAT retrieval on big endian
config: arc-randconfig-s031-20230131 (https://download.01.org/0day-ci/archive/20230131/202301311701.j9FcJxt8-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/l1k/linux/commit/7d65a43d7a135805121ae8b13cb2e626ae442128
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 7d65a43d7a135805121ae8b13cb2e626ae442128
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/cxl/core/pci.c:522:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] request_pl @@     got restricted __le32 [usertype] @@
   drivers/cxl/core/pci.c:522:9: sparse:     expected unsigned int [usertype] request_pl
   drivers/cxl/core/pci.c:522:9: sparse:     got restricted __le32 [usertype]
>> drivers/cxl/core/pci.c:534:19: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/pci.c:534:19: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/pci.c:534:19: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/pci.c:534:19: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/pci.c:534:19: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/pci.c:534:19: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:549:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] request_pl @@     got restricted __le32 [usertype] @@
   drivers/cxl/core/pci.c:549:17: sparse:     expected unsigned int [usertype] request_pl
   drivers/cxl/core/pci.c:549:17: sparse:     got restricted __le32 [usertype]
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32
   drivers/cxl/core/pci.c:565:32: sparse: sparse: cast to restricted __le32

vim +534 drivers/cxl/core/pci.c

   517	
   518	static int cxl_cdat_get_length(struct device *dev,
   519				       struct pci_doe_mb *cdat_doe,
   520				       size_t *length)
   521	{
   522		DECLARE_CDAT_DOE_TASK(CDAT_DOE_REQ(0), t);
   523		int rc;
   524	
   525		rc = pci_doe_submit_task(cdat_doe, &t.task);
   526		if (rc < 0) {
   527			dev_err(dev, "DOE submit failed: %d", rc);
   528			return rc;
   529		}
   530		wait_for_completion(&t.c);
   531		if (t.task.rv < sizeof(u32))
   532			return -EIO;
   533	
 > 534		*length = le32_to_cpu(t.response_pl[1]);
   535		dev_dbg(dev, "CDAT length %zu\n", *length);
   536	
   537		return 0;
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
