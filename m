Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E0133FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 23:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679181839; x=1710717839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hu+/NwdRIHyU5j0Va7l/sDzXW15h5l9YhnLpkIjv3TM=;
  b=fs3Jgr3prQGDo6YSn2hK8oaObdG1pq6+ZS1a3QIwVPxTag13NfZ3sa14
   OJNBB3dvjBr8rVW8Q603S7fUtzRAFYa88PIjpnh97u+InNsJxp5ptHK6J
   ck1EAOmwyTLiV+4hIYjvnoOp4EclAxYcDzJ5nFrzD3TQxq9KKB2khK7vk
   M4M377m4whKfqTa3qt6ZMwGz2hOhn3Vn5zke4JKBa5Av7QMCs/4pPTpY1
   rl7ISnKZnG/byI4H3dxr8iz7+FkHjqgp+yulk9hOVnDK8F7MbFzdjfGG9
   /J13H6h9Z8BYpfpmQFZ9uH2eNQWQCU2+xfOwIxy2q1YJ+Jg2rDaVVSQ17
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="401043953"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="401043953"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 16:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="1010055221"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="1010055221"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2023 16:23:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdfu0-000AJK-29;
	Sat, 18 Mar 2023 23:23:56 +0000
Date: Sun, 19 Mar 2023 07:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/soc/mediatek/mtk-svs.c:1700:21: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202303190732.o5ec22r0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: 8cafd5ac5f113cb45e075c67cdf1217569d93a36 FROMLIST: soc: mediatek: SVS: introduce MTK SVS engine
date:   1 year, 10 months ago
config: openrisc-randconfig-s043-20230319 (https://download.01.org/0day-ci/archive/20230319/202303190732.o5ec22r0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=8cafd5ac5f113cb45e075c67cdf1217569d93a36
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core62-50-1
        git checkout 8cafd5ac5f113cb45e075c67cdf1217569d93a36
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/firmware/broadcom/ drivers/soc/mediatek/ drivers/vfio/platform/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303190732.o5ec22r0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/mtk-svs.c:1700:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *base @@
   drivers/soc/mediatek/mtk-svs.c:1700:21: sparse:     expected void *addr
   drivers/soc/mediatek/mtk-svs.c:1700:21: sparse:     got void [noderef] __iomem *base

vim +1700 drivers/soc/mediatek/mtk-svs.c

  1626	
  1627	static int svs_probe(struct platform_device *pdev)
  1628	{
  1629		int (*svs_get_svs_platform_data)(struct svs_platform *svsp);
  1630		struct svs_platform *svsp;
  1631		unsigned int svsp_irq;
  1632		int ret;
  1633	
  1634		svsp = devm_kzalloc(&pdev->dev, sizeof(*svsp), GFP_KERNEL);
  1635		if (!svsp)
  1636			return -ENOMEM;
  1637	
  1638		svs_get_svs_platform_data = of_device_get_match_data(&pdev->dev);
  1639		if (!svs_get_svs_platform_data) {
  1640			dev_err(svsp->dev, "no svs platform data? why?\n");
  1641			return -EPERM;
  1642		}
  1643	
  1644		svsp->dev = &pdev->dev;
  1645		ret = svs_get_svs_platform_data(svsp);
  1646		if (ret) {
  1647			dev_err_probe(svsp->dev, ret, "fail to get svsp data\n");
  1648			return ret;
  1649		}
  1650	
  1651		if (!svs_is_supported(svsp)) {
  1652			dev_notice(svsp->dev, "svs is not supported\n");
  1653			return -EPERM;
  1654		}
  1655	
  1656		ret = svs_resource_setup(svsp);
  1657		if (ret) {
  1658			dev_err(svsp->dev, "svs resource setup fail: %d\n", ret);
  1659			return ret;
  1660		}
  1661	
  1662		svsp_irq = irq_of_parse_and_map(svsp->dev->of_node, 0);
  1663		ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
  1664						svsp->irqflags, svsp->name, svsp);
  1665		if (ret) {
  1666			dev_err(svsp->dev, "register irq(%d) failed: %d\n",
  1667				svsp_irq, ret);
  1668			return ret;
  1669		}
  1670	
  1671		svsp->main_clk = devm_clk_get(svsp->dev, "main");
  1672		if (IS_ERR(svsp->main_clk)) {
  1673			dev_err(svsp->dev, "failed to get clock: %ld\n",
  1674				PTR_ERR(svsp->main_clk));
  1675			return PTR_ERR(svsp->main_clk);
  1676		}
  1677	
  1678		ret = clk_prepare_enable(svsp->main_clk);
  1679		if (ret) {
  1680			dev_err(svsp->dev, "cannot enable main clk: %d\n", ret);
  1681			return ret;
  1682		}
  1683	
  1684		svsp->base = of_iomap(svsp->dev->of_node, 0);
  1685		if (IS_ERR_OR_NULL(svsp->base)) {
  1686			dev_err(svsp->dev, "cannot find svs register base\n");
  1687			ret = -EINVAL;
  1688			goto svs_probe_clk_disable;
  1689		}
  1690	
  1691		ret = svs_start(svsp);
  1692		if (ret) {
  1693			dev_err(svsp->dev, "svs start fail: %d\n", ret);
  1694			goto svs_probe_iounmap;
  1695		}
  1696	
  1697		return 0;
  1698	
  1699	svs_probe_iounmap:
> 1700		iounmap(svsp->base);
  1701	
  1702	svs_probe_clk_disable:
  1703		clk_disable_unprepare(svsp->main_clk);
  1704	
  1705		return ret;
  1706	}
  1707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
