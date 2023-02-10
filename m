Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADC3622
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675988235; x=1707524235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBV1CCcvByHKYWDJ6Pn77FleOe6JE3tmZtdekYxNjbE=;
  b=XMBL9ccNF4PLaD7KJOl4zbjKWLwxeMYvfYfPbb0OIQjHIFgnBUmx7kMv
   oYWQZYu9s4MYtaU+rji72PlHYPRIMRZi9JArO7Sh4UTtFhyTZ204BrL2p
   V/mFYEDUFuojhg7VnkMCELQxzFV2Se/TXDTBvDmZ+Zq68ah/813VBxisJ
   QSBLMjOBEPHUfLNBjUHHR/u+iABtMFrXfah3jYD4Y78FfbYemMc+7kJ7z
   qLpiaauoi7IbhvxdW7cZskQFtdnPowP6ol7nmygKp31zMDbo5Z85uMA85
   04EGxDgTZMDFtM13aNzxI1z/LBM2syEDvqdNv5ijRDDJtKpUOigSRQori
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318305274"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="318305274"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 16:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="791789122"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="791789122"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Feb 2023 16:17:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQH6G-0005Oa-0C;
	Fri, 10 Feb 2023 00:17:12 +0000
Date: Fri, 10 Feb 2023 08:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: Suman Anna <s-anna@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: drivers/remoteproc/ti_k3_r5_remoteproc.c:711:17: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202302100833.iRTqJ94Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e544a07438522ab3688416e6e2e34bf0ee6d8755
commit: 1168af40b1ad8cb2e78f4a70869fa4a076320e4f remoteproc: k3-r5: Add support for IPC-only mode for all R5Fs
date:   11 months ago
config: arm64-randconfig-s043-20230208 (https://download.01.org/0day-ci/archive/20230210/202302100833.iRTqJ94Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1168af40b1ad8cb2e78f4a70869fa4a076320e4f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1168af40b1ad8cb2e78f4a70869fa4a076320e4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/infiniband/hw/hns/ drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100833.iRTqJ94Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/ti_k3_r5_remoteproc.c:476:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *cpu_addr @@
   drivers/remoteproc/ti_k3_r5_remoteproc.c:476:28: sparse:     expected void *
   drivers/remoteproc/ti_k3_r5_remoteproc.c:476:28: sparse:     got void [noderef] __iomem *cpu_addr
   drivers/remoteproc/ti_k3_r5_remoteproc.c:479:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *cpu_addr @@
   drivers/remoteproc/ti_k3_r5_remoteproc.c:479:28: sparse:     expected void *
   drivers/remoteproc/ti_k3_r5_remoteproc.c:479:28: sparse:     got void [noderef] __iomem *cpu_addr
>> drivers/remoteproc/ti_k3_r5_remoteproc.c:711:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +711 drivers/remoteproc/ti_k3_r5_remoteproc.c

   681	
   682	/*
   683	 * This function implements the .get_loaded_rsc_table() callback and is used
   684	 * to provide the resource table for the booted R5F in IPC-only mode. The K3 R5F
   685	 * firmwares follow a design-by-contract approach and are expected to have the
   686	 * resource table at the base of the DDR region reserved for firmware usage.
   687	 * This provides flexibility for the remote processor to be booted by different
   688	 * bootloaders that may or may not have the ability to publish the resource table
   689	 * address and size through a DT property. This callback is invoked only in
   690	 * IPC-only mode.
   691	 */
   692	static struct resource_table *k3_r5_get_loaded_rsc_table(struct rproc *rproc,
   693								 size_t *rsc_table_sz)
   694	{
   695		struct k3_r5_rproc *kproc = rproc->priv;
   696		struct device *dev = kproc->dev;
   697	
   698		if (!kproc->rmem[0].cpu_addr) {
   699			dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
   700			return ERR_PTR(-ENOMEM);
   701		}
   702	
   703		/*
   704		 * NOTE: The resource table size is currently hard-coded to a maximum
   705		 * of 256 bytes. The most common resource table usage for K3 firmwares
   706		 * is to only have the vdev resource entry and an optional trace entry.
   707		 * The exact size could be computed based on resource table address, but
   708		 * the hard-coded value suffices to support the IPC-only mode.
   709		 */
   710		*rsc_table_sz = 256;
 > 711		return (struct resource_table *)kproc->rmem[0].cpu_addr;
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
