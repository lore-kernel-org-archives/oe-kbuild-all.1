Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358338C03
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 22:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692658422; x=1724194422;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BXehpyEr7jCwjyDMxr+P8B0YytqUQKJWQAAKRW3afBM=;
  b=Vi/yVkieQTtFxzwwwfX/HD6twFNuN5PSstuRWmq376K7c4joWt4bLZ3e
   7byVZ9GxxIC7RsF/4IOEvaiAZG9OmrL4QMF60olEXfgWHZEJOzLCGQYWe
   xJJPuu2r2RIb29CbIeRrLXyBHiFDZQAaaJya2Nhrre0qjEhmCiGX29InY
   u+SdSbv+uWgM3bxcbNpupcJ1Mu/6BJFmg0c6KxzUaoDIEdzMj9bCLVlg4
   YncKlYGIgGXJYNVzmJJxebbewp9gQmhLKRnLCy4QhktY4GLE4g1TvyodA
   9rlW4FgJBIMIO9FyplZYs2d4LDXLweBu+TK5H9FDvtHEse0GhB5M/foVd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460085301"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="460085301"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 15:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712935092"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="712935092"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 15:53:39 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYDlz-00011m-0H;
	Mon, 21 Aug 2023 22:53:27 +0000
Date: Tue, 22 Aug 2023 06:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Paulo Alcantara <paulo@paulo.ac>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Moore <paul@paul-moore.com>
Subject: [linux-stable-rc:linux-4.14.y 10551/26782]
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c:40:34: warning:
 'mtk_mdp_comp_dt_ids' defined but not used
Message-ID: <202308220619.37AZcS6b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Paulo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   d4d51e77b58d0c75103d4df5558535d0059ef324
commit: 760f8522ce08a24abac3208290f93fe3fffc0d6c [10551/26782] selinux: use kernel linux/socket.h for genheaders and mdp
config: x86_64-buildonly-randconfig-005-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220619.37AZcS6b-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220619.37AZcS6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220619.37AZcS6b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mtk-mdp/mtk_mdp_core.c:40:34: warning: 'mtk_mdp_comp_dt_ids' defined but not used [-Wunused-const-variable=]
    static const struct of_device_id mtk_mdp_comp_dt_ids[] = {
                                     ^~~~~~~~~~~~~~~~~~~


vim +/mtk_mdp_comp_dt_ids +40 drivers/media/platform/mtk-mdp/mtk_mdp_core.c

c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  39  
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08 @40  static const struct of_device_id mtk_mdp_comp_dt_ids[] = {
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  41  	{
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  42  		.compatible = "mediatek,mt8173-mdp-rdma",
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  43  		.data = (void *)MTK_MDP_RDMA
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  44  	}, {
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  45  		.compatible = "mediatek,mt8173-mdp-rsz",
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  46  		.data = (void *)MTK_MDP_RSZ
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  47  	}, {
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  48  		.compatible = "mediatek,mt8173-mdp-wdma",
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  49  		.data = (void *)MTK_MDP_WDMA
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  50  	}, {
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  51  		.compatible = "mediatek,mt8173-mdp-wrot",
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  52  		.data = (void *)MTK_MDP_WROT
55d80506c5f7c3 Vincent Stehlé 2016-10-27  53  	},
55d80506c5f7c3 Vincent Stehlé 2016-10-27  54  	{ },
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  55  };
c8eb2d7e8202fd Minghsiu Tsai  2016-09-08  56  

:::::: The code at line 40 was first introduced by commit
:::::: c8eb2d7e8202fd9cb912f5d33cc34ede66dcb24a [media] media: Add Mediatek MDP Driver

:::::: TO: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
