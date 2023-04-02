Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138A653B1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 21:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680470421; x=1712006421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3wE+slA5qhMnqVT0sZ1mxCRIEdGhb+vZHRgo3xSqLu4=;
  b=PibU/KBEifQMfgvIC7cB5YDMF/+suxUQHXNnt6waQrcE4TXYvRA3t2C2
   dlcPSFSrUqrElCRswyGx1juQ2KESEYtL/SgZCVUfLgOptiJBkegYn4Rmb
   ohRyP+EdQo0hoN4nkyM/O/uHTDeGFDPdLSKHdsEVYCeYEYHfyOUtL7w1j
   q2ucz8yvOMqDSJ3Z+Uu+CT/pH3p5lz+noIT5qfKEQc5b6CfQOnXNPeLlg
   fnMDjXNNLaobpeABhQwrXx+GxBk3LLX0QlkMw8psdt5WsrHCBupaSbRtx
   Z4dQlhpmXjuwcTM9VNWrxCM9eB5ySmIDGlSqtX9o8H1N7d2NvDUpwve25
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="325766414"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="325766414"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 14:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="685732314"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="685732314"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Apr 2023 14:20:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj57a-000Ngx-0y;
	Sun, 02 Apr 2023 21:20:18 +0000
Date: Mon, 3 Apr 2023 05:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [matthias-bgg:v6.3-next/soc 20/23]
 drivers/soc/mediatek/mtk-mmsys.c:138: undefined reference to
 `cmdq_pkt_write_mask'
Message-ID: <202304030540.JMoZv9J7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.3-next/soc
head:   e9a6f5bca5ea56f05d92a966034ed472408821b8
commit: b34884b4c878a6ad2a4f70d7c88ef60ac39ad408 [20/23] soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230403/202304030540.JMoZv9J7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?id=b34884b4c878a6ad2a4f70d7c88ef60ac39ad408
        git remote add matthias-bgg https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
        git fetch --no-tags matthias-bgg v6.3-next/soc
        git checkout b34884b4c878a6ad2a4f70d7c88ef60ac39ad408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304030540.JMoZv9J7-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mmsys.o: in function `mtk_mmsys_update_bits':
>> drivers/soc/mediatek/mtk-mmsys.c:138: undefined reference to `cmdq_pkt_write_mask'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mmsys.o: in function `mtk_mmsys_probe':
>> drivers/soc/mediatek/mtk-mmsys.c:377: undefined reference to `cmdq_dev_get_client_reg'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mutex.o: in function `mtk_mutex_enable_by_cmdq':
>> drivers/soc/mediatek/mtk-mutex.c:883: undefined reference to `cmdq_pkt_write'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mutex.o: in function `mtk_mutex_probe':
>> drivers/soc/mediatek/mtk-mutex.c:1026: undefined reference to `cmdq_dev_get_client_reg'


vim +138 drivers/soc/mediatek/mtk-mmsys.c

   130	
   131	static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
   132					  struct cmdq_pkt *cmdq_pkt)
   133	{
   134		int ret;
   135		u32 tmp;
   136	
   137		if (mmsys->cmdq_base.size && cmdq_pkt) {
 > 138			ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
   139						  mmsys->cmdq_base.offset + offset, val,
   140						  mask);
   141			if (ret)
   142				pr_debug("CMDQ unavailable: using CPU write\n");
   143			else
   144				return;
   145		}
   146		tmp = readl_relaxed(mmsys->regs + offset);
   147		tmp = (tmp & ~mask) | (val & mask);
   148		writel_relaxed(tmp, mmsys->regs + offset);
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
