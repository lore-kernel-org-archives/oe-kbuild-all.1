Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3AFC134
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 04:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMcMMJF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700628348; x=1732164348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HLMmaO5eRFcQjJshfZEl2KySYxKXTveeGm/s8aORDZk=;
  b=CMcMMJF8pgjYx3l/PQTmLDHwQJq52ZGVXckznwVX16A4Lq4qw+R6MJYk
   Bfc1CGRgkspWE50e4DEksVdP1kxd5N//Hsx46XMEMRSO51mjm/4dvrrbK
   YS3mm3xRVldd4yutptJh+HO1HfZWfUV04iNFR2p5VOCQNXbFeGKuKJudb
   QxODG7h3BxrfCfvSwGdltpqygg6YFA02MhidxoFLaN5AKX+oqYLM5rLEw
   Fai8CEa1UWuaiDO0Q7CuU0IJmVmqHuMLEuTXA5Az/VGr8ensiXFQaUJCt
   r480+a+p+pqgWV1iS2m/benlZPOKId2LMA2aF5ZmGT4Hq5m+5/YZQ327J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5116621"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="5116621"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 20:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="801780556"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="801780556"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Nov 2023 20:45:40 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5f7K-0008f4-1R;
	Wed, 22 Nov 2023 04:45:38 +0000
Date: Wed, 22 Nov 2023 12:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, davem@davemloft.net,
	edumazet@google.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com, joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com, avifishman70@gmail.com,
	tali.perry1@gmail.com, joel@jms.id.au, andrew@codeconstruct.com.au,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	j.neuschaefer@gmx.net
Cc: oe-kbuild-all@lists.linux.dev, openbmc@lists.ozlabs.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
Message-ID: <202311221228.eaAlsztJ-lkp@intel.com>
References: <20231121151733.2015384-3-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121151733.2015384-3-tmaimon77@gmail.com>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-net-Add-support-NPCM-dwmac/20231121-231908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231121151733.2015384-3-tmaimon77%40gmail.com
patch subject: [PATCH v1 2/2] net: stmmac: Add NPCM support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311221228.eaAlsztJ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221228.eaAlsztJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221228.eaAlsztJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c:53:6: warning: no previous prototype for 'npcm_dwmac_pcs_init' [-Wmissing-prototypes]
      53 | void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~


vim +/npcm_dwmac_pcs_init +53 drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c

    52	
  > 53	void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
    54				 struct plat_stmmacenet_data *plat_dat)
    55	{
    56		u16 val;
    57	
    58		iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
    59		val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
    60		val |= PCS_RST;
    61		iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
    62	
    63		while (val & PCS_RST)
    64			val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
    65	
    66		val &= ~(PCS_AN_ENABLE);
    67		iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
