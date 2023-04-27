Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C38110EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682591782; x=1714127782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Px5B2Gou+pRMmjzFHaxFdtgcphKDMykbYTeJSM0wkQs=;
  b=hBeCRAWSXvN9j8W+8jci8QhmdHKCvZiBgaPKO5rmD/F1qvpRylHVnI0G
   9+EheZDU2tdaW+LdNd9P9LDACwF5zrQd6xFlZrCnIIpbKq1gh1vs+1prw
   kT3ShFDxClnf0/joY/ufdLc1IgYCFY4H0tX4pKTVbeSXW68m6PPoSkx7d
   MA+4vu+E+OpuVEEkX9GGEzx9ZH4bIT3SNlt+lYGGd3IywlY+csvpJn1G1
   A2M6qiSFBn80MvHybzHHzBvZXjn8CWTZmwatlj8VBfYRaYc7ObljbFK2x
   awFYMRvumF99jSmk4Xm8icJPy69Y/PhBTYAs8J++M+bIclh/AQ08OxZ6f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433682470"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="433682470"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 03:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="783685885"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="783685885"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2023 03:36:19 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pryz5-0000Az-0C;
	Thu, 27 Apr 2023 10:36:19 +0000
Date: Thu, 27 Apr 2023 18:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: Suman Anna <s-anna@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: drivers/remoteproc/ti_k3_dsp_remoteproc.c:432:17: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202304271850.sdzTf7L3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6e98b09da931a00bf4e0477d0fa52748bf28fcce
commit: b8431920391d36c273f63a29eab0dfc7e884dd17 remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs
date:   1 year, 2 months ago
config: arm64-randconfig-s042-20230427 (https://download.01.org/0day-ci/archive/20230427/202304271850.sdzTf7L3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b8431920391d36c273f63a29eab0dfc7e884dd17
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b8431920391d36c273f63a29eab0dfc7e884dd17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271850.sdzTf7L3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/ti_k3_dsp_remoteproc.c:432:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +432 drivers/remoteproc/ti_k3_dsp_remoteproc.c

   402	
   403	/*
   404	 * This function implements the .get_loaded_rsc_table() callback and is used
   405	 * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
   406	 * firmwares follow a design-by-contract approach and are expected to have the
   407	 * resource table at the base of the DDR region reserved for firmware usage.
   408	 * This provides flexibility for the remote processor to be booted by different
   409	 * bootloaders that may or may not have the ability to publish the resource table
   410	 * address and size through a DT property. This callback is invoked only in
   411	 * IPC-only mode.
   412	 */
   413	static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
   414								  size_t *rsc_table_sz)
   415	{
   416		struct k3_dsp_rproc *kproc = rproc->priv;
   417		struct device *dev = kproc->dev;
   418	
   419		if (!kproc->rmem[0].cpu_addr) {
   420			dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
   421			return ERR_PTR(-ENOMEM);
   422		}
   423	
   424		/*
   425		 * NOTE: The resource table size is currently hard-coded to a maximum
   426		 * of 256 bytes. The most common resource table usage for K3 firmwares
   427		 * is to only have the vdev resource entry and an optional trace entry.
   428		 * The exact size could be computed based on resource table address, but
   429		 * the hard-coded value suffices to support the IPC-only mode.
   430		 */
   431		*rsc_table_sz = 256;
 > 432		return (struct resource_table *)kproc->rmem[0].cpu_addr;
   433	}
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
