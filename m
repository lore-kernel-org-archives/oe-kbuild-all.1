Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92063239
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675528072; x=1707064072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxrofWmFbd74YcDHNwbv1mGUigO7V1QfPS1f8H3AYfw=;
  b=luqOt3KL8+/SiwAVyhOVh+uvZxzt0pX6bdmQ3yL4KFpet9ed69Y8G0f6
   TLrb6MhobcgsRXayN1d3UB1qBAFAENPxeBWa9xB9Lhzmff1d3+oiUhr06
   1+V+8EGqkQNuBeVBBiRo0R58WmoIcMPz4Ctj9Q7UY0YfUNmdaR7aSSmGC
   0tw0ttkYT9XhOFXCo1MGN3JFTJ0QXGFrnwlL3lbnC6PH/sRshz7Xa9TBA
   yrlmgC1GO0PA2J5xIViH7W8tOqsaeyzkF4VpybrPkmCAAIC/oqJk5J1Rm
   AJ2YW97mkVBdNfEUd9Q/+3+X68wKr1lpfIUXju4nrAhSuBCm6bU3EdVM9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393554705"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393554705"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 08:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="774678668"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="774678668"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2023 08:27:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOLOH-0001QV-2d;
	Sat, 04 Feb 2023 16:27:49 +0000
Date: Sun, 5 Feb 2023 00:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 4683/10357]
 drivers/remoteproc/qcom_q6v5_pas.c:550:30: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202302050024.hJM9mOuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4fafd96910add124586b549ad005dcd179de8a18
commit: 29814986b82e820ae9d3eb7474cdcf66605bd114 [4683/10357] remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading
config: arm-randconfig-s033-20230204 (https://download.01.org/0day-ci/archive/20230205/202302050024.hJM9mOuJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=29814986b82e820ae9d3eb7474cdcf66605bd114
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 29814986b82e820ae9d3eb7474cdcf66605bd114
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/qcom_q6v5_pas.c:528:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:528:26: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:528:26: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/qcom_q6v5_pas.c:550:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dtb_mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:550:30: sparse:     expected void *dtb_mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:550:30: sparse:     got void [noderef] __iomem *

vim +550 drivers/remoteproc/qcom_q6v5_pas.c

   508	
   509	static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
   510	{
   511		struct device_node *node;
   512		struct resource r;
   513		int ret;
   514	
   515		node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
   516		if (!node) {
   517			dev_err(adsp->dev, "no memory-region specified\n");
   518			return -EINVAL;
   519		}
   520	
   521		ret = of_address_to_resource(node, 0, &r);
   522		of_node_put(node);
   523		if (ret)
   524			return ret;
   525	
   526		adsp->mem_phys = adsp->mem_reloc = r.start;
   527		adsp->mem_size = resource_size(&r);
   528		adsp->mem_region = devm_ioremap_wc(adsp->dev, adsp->mem_phys, adsp->mem_size);
   529		if (!adsp->mem_region) {
   530			dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
   531				&r.start, adsp->mem_size);
   532			return -EBUSY;
   533		}
   534	
   535		if (!adsp->dtb_pas_id)
   536			return 0;
   537	
   538		node = of_parse_phandle(adsp->dev->of_node, "memory-region", 1);
   539		if (!node) {
   540			dev_err(adsp->dev, "no dtb memory-region specified\n");
   541			return -EINVAL;
   542		}
   543	
   544		ret = of_address_to_resource(node, 0, &r);
   545		if (ret)
   546			return ret;
   547	
   548		adsp->dtb_mem_phys = adsp->dtb_mem_reloc = r.start;
   549		adsp->dtb_mem_size = resource_size(&r);
 > 550		adsp->dtb_mem_region = devm_ioremap_wc(adsp->dev, adsp->dtb_mem_phys, adsp->dtb_mem_size);
   551		if (!adsp->dtb_mem_region) {
   552			dev_err(adsp->dev, "unable to map dtb memory region: %pa+%zx\n",
   553				&r.start, adsp->dtb_mem_size);
   554			return -EBUSY;
   555		}
   556	
   557		return 0;
   558	}
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
