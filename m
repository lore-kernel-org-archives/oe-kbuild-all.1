Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F829D2E4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVb2BgW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701755620; x=1733291620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bFFeeF8hJ3DxE50au0V2o4iCp73fC+lbzXYWg5k/A/o=;
  b=UVb2BgW6jubQX89tnWZAwYIg14QbtaP+4Y8D2eQQuZsLgHQpS72lbLaJ
   grS3eBGr0ZUcuUMaD8U+io+6u3yWolWqOjozDbyHjmRO4orkQYhtGQMkk
   v1wGUBRbm1Qu02FmIa5S6ePVidkiId15X0a34dLTGe3AcZpJHliGNMzbj
   NNxE5KiPFvgYya3m3wzaWA/YxNaMzpP6iuzZtaNISGjfEB9KmzuxMUT2M
   7E+5ITTDbBpSy26sm3ERvtzPNY1bFk/HHs2GB4hkCI8oxq7QbGjPI8+cl
   w09zHFP2VbM6m/SveRrap22U7mkr8uymmY2B3V8m36hCE3drNVHMx3vVN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="425008174"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="425008174"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 21:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841329822"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="841329822"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Dec 2023 21:53:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAONA-0008PG-1l;
	Tue, 05 Dec 2023 05:53:32 +0000
Date: Tue, 5 Dec 2023 13:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sneh Shah <quic_snehshah@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
	Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: Add sysfs nodes for
 qcom ethqos
Message-ID: <202312051347.L3L2pNLv-lkp@intel.com>
References: <20231204084854.31543-1-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204084854.31543-1-quic_snehshah@quicinc.com>

Hi Sneh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sneh-Shah/net-stmmac-qcom-ethqos-Add-sysfs-nodes-for-qcom-ethqos/20231204-165232
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231204084854.31543-1-quic_snehshah%40quicinc.com
patch subject: [PATCH net-next] net: stmmac: qcom-ethqos: Add sysfs nodes for qcom ethqos
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051347.L3L2pNLv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051347.L3L2pNLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051347.L3L2pNLv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c: In function 'gvm_queue_mapping_store':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:770:13: warning: variable 'prio' set but not used [-Wunused-but-set-variable]
     770 |         u32 prio;
         |             ^~~~


vim +/prio +770 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

   762	
   763	static ssize_t gvm_queue_mapping_store(struct device *dev,
   764					       struct device_attribute *attr,
   765					       const char *user_buf, size_t size)
   766	{
   767		struct net_device *netdev = to_net_dev(dev);
   768		struct stmmac_priv *priv;
   769		struct qcom_ethqos *ethqos;
 > 770		u32 prio;
   771		s8 input = 0;
   772	
   773		if (!netdev) {
   774			pr_err("netdev is NULL\n");
   775			return -EINVAL;
   776		}
   777	
   778		priv = netdev_priv(netdev);
   779		if (!priv) {
   780			pr_err("priv is NULL\n");
   781			return -EINVAL;
   782		}
   783	
   784		ethqos = priv->plat->bsp_priv;
   785		if (!ethqos) {
   786			pr_err("ethqos is NULL\n");
   787			return -EINVAL;
   788		}
   789	
   790		if (kstrtos8(user_buf, 0, &input)) {
   791			pr_err("Error in reading option from user\n");
   792			return -EINVAL;
   793		}
   794	
   795		if (input == ethqos->gvm_queue)
   796			pr_err("No effect as duplicate input\n");
   797	
   798		ethqos->gvm_queue = input;
   799		prio  = 1 << input;
   800	
   801		return size;
   802	}
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
