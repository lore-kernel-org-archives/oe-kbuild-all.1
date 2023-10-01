Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87049138C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 05:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696137940; x=1727673940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=joegzXhg5L+b8SSVj6+0MYAuuAUqG6uDyIMOODbsjGY=;
  b=ExooD7mBh5ckcp8WZcyfsedY2PMX5brWHa2NNPMUvflikakYmnW8NtSH
   Vqyghp58z0cNKh25NBISezA4dvWKhXPcV1xN8+/Ku+fRC60B3DrZDV59l
   PKthGaLCj7ouh+zxrcnAAUIB+YRk1LMpYaH6spZZZFU77uDpe+KMYYuPi
   X1jFBRoSSWLvXJg2/S5gEJr4NEe5hwJ3WM5uzePtEQQphIz2wzloDKj0j
   Nz3iN16mBa13F8By1oij/IzWsF480HTYOlDb10a0Qe4oDAijiPHEPkAge
   dvNvwfQ3aKSPgoZEjl9aCfZzmgHbVozE8Rk6YMeMsnu32vXv4Mg7HssVc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="448984492"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="448984492"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 22:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="750282701"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="750282701"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Sep 2023 22:25:34 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmoxQ-0004mf-0m;
	Sun, 01 Oct 2023 05:25:32 +0000
Date: Sun, 1 Oct 2023 13:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, clin@suse.com,
	conor+dt@kernel.org, pierre.gondois@arm.com, festevam@gmail.com,
	linux-imx@nxp.com, davem@davemloft.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, gaurav.jain@nxp.com,
	alexander.stein@ew.tq-group.com, V.Sethi@nxp.com
Cc: oe-kbuild-all@lists.linux.dev, Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: Re: [PATCH v6 09/11] firmware: imx: enable trng
Message-ID: <202310011350.nKG627KP-lkp@intel.com>
References: <20230927175401.1962733-10-pankaj.gupta@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927175401.1962733-10-pankaj.gupta@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on robh/for-next linus/master v6.6-rc3]
[cannot apply to next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-added-imx-se-fw-to-other_interfaces/20230927-202918
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230927175401.1962733-10-pankaj.gupta%40nxp.com
patch subject: [PATCH v6 09/11] firmware: imx: enable trng
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231001/202310011350.nKG627KP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011350.nKG627KP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011350.nKG627KP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/imx/ele_trng.c:16:5: error: redefinition of 'ele_trng_init'
      16 | int ele_trng_init(struct device *dev)
         |     ^~~~~~~~~~~~~
   In file included from drivers/firmware/imx/ele_trng.c:8:
   drivers/firmware/imx/ele_common.h:25:19: note: previous definition of 'ele_trng_init' with type 'int(struct device *)'
      25 | static inline int ele_trng_init(struct device *dev)
         |                   ^~~~~~~~~~~~~


vim +/ele_trng_init +16 drivers/firmware/imx/ele_trng.c

    15	
  > 16	int ele_trng_init(struct device *dev)
    17	{
    18		struct ele_trng *trng;
    19		int ret;
    20	
    21		trng = devm_kzalloc(dev, sizeof(*trng), GFP_KERNEL);
    22		if (!trng)
    23			return -ENOMEM;
    24	
    25		trng->dev         = dev;
    26		trng->rng.name    = "ele-trng";
    27		trng->rng.read    = ele_get_hwrng;
    28		trng->rng.priv    = (unsigned long)trng;
    29		trng->rng.quality = 1024;
    30	
    31		dev_dbg(dev, "registering ele-trng\n");
    32	
    33		ret = devm_hwrng_register(dev, &trng->rng);
    34		if (ret)
    35			return ret;
    36	
    37		dev_info(dev, "Successfully registered ele-trng\n");
    38		return 0;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
