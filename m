Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8820DC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4DC8egB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700597115; x=1732133115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ym7qo8NmL0HQ+G4C07X+eTOz7bc8bNC+d71MXVKkqk4=;
  b=i4DC8egBJXDQCU1zLC7Z8GxCUnnL8Ao7+2BRgKqIsRI7QYCI8TNh7QhK
   Ln/VFFRYQg7v2Be7ycIvfZrhffBCckBnqkwtJWPB3rSIwb9fMhos9iaRw
   35vs0T0GaysU4zjVK0ovRBxfUtJAUZN1AAyFGmbaJhElQTlH5VQOyvUpy
   x3qxxv3YNpIpzVI+WlmngFU69Ur6O9TlmrbWLKfMZORxmRYXvHFeY2zly
   UcQ8aaI/hRmpDSMSIopTMZduvrR/kxz9WY4HbvLWTSoDl/4PU3eVQ4LPJ
   fFAlN9qMkEr7WvlmoZDvYoi9CT1VgadceVQRdnzB+e2vkwzm4h2RbLD7d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5046549"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="5046549"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 12:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="801660240"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="801660240"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Nov 2023 12:05:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Wzd-0008Cy-3B;
	Tue, 21 Nov 2023 20:05:10 +0000
Date: Wed, 22 Nov 2023 04:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [mediatek:v6.7-tmp/soc 7/7]
 drivers/soc/mediatek/mt8188-mmsys.h:126:10: error:
 'MT8188_VDO0_RST_DISP_OVL0' undeclared here (not in a function); did you
 mean 'MT8188_VDO0_DSC_WARP_SEL'?
Message-ID: <202311220351.oUPSYKN7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.7-tmp/soc
head:   c1b652b84e6a779e670bac250d80ef2f2d4a45d9
commit: c1b652b84e6a779e670bac250d80ef2f2d4a45d9 [7/7] soc: mediatek: Add MT8188 VDOSYS reset bit map
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311220351.oUPSYKN7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220351.oUPSYKN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220351.oUPSYKN7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/mediatek/mtk-mmsys.c:21:
>> drivers/soc/mediatek/mt8188-mmsys.h:126:10: error: 'MT8188_VDO0_RST_DISP_OVL0' undeclared here (not in a function); did you mean 'MT8188_VDO0_DSC_WARP_SEL'?
     126 |         [MT8188_VDO0_RST_DISP_OVL0]     = MMSYS_RST_NR(0, 0),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_DSC_WARP_SEL
>> drivers/soc/mediatek/mt8188-mmsys.h:126:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:126:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:127:10: error: 'MT8188_VDO0_RST_FAKE_ENG0' undeclared here (not in a function)
     127 |         [MT8188_VDO0_RST_FAKE_ENG0]     = MMSYS_RST_NR(0, 2),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:127:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:127:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:128:10: error: 'MT8188_VDO0_RST_DISP_CCORR0' undeclared here (not in a function)
     128 |         [MT8188_VDO0_RST_DISP_CCORR0]   = MMSYS_RST_NR(0, 4),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:128:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:128:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:129:10: error: 'MT8188_VDO0_RST_DISP_MUTEX0' undeclared here (not in a function)
     129 |         [MT8188_VDO0_RST_DISP_MUTEX0]   = MMSYS_RST_NR(0, 6),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:129:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:129:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:130:10: error: 'MT8188_VDO0_RST_DISP_GAMMA0' undeclared here (not in a function)
     130 |         [MT8188_VDO0_RST_DISP_GAMMA0]   = MMSYS_RST_NR(0, 8),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:130:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:130:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:131:10: error: 'MT8188_VDO0_RST_DISP_DITHER0' undeclared here (not in a function)
     131 |         [MT8188_VDO0_RST_DISP_DITHER0]  = MMSYS_RST_NR(0, 10),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:131:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:131:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:132:10: error: 'MT8188_VDO0_RST_DISP_WDMA0' undeclared here (not in a function)
     132 |         [MT8188_VDO0_RST_DISP_WDMA0]    = MMSYS_RST_NR(0, 17),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:132:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:132:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:133:10: error: 'MT8188_VDO0_RST_DISP_RDMA0' undeclared here (not in a function); did you mean 'MT8188_VDO0_DISP_RDMA_SEL'?
     133 |         [MT8188_VDO0_RST_DISP_RDMA0]    = MMSYS_RST_NR(0, 19),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_DISP_RDMA_SEL
   drivers/soc/mediatek/mt8188-mmsys.h:133:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:133:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:134:10: error: 'MT8188_VDO0_RST_DSI0' undeclared here (not in a function); did you mean 'MT8188_VDO0_SEL_IN'?
     134 |         [MT8188_VDO0_RST_DSI0]          = MMSYS_RST_NR(0, 21),
         |          ^~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_SEL_IN
   drivers/soc/mediatek/mt8188-mmsys.h:134:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:134:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:135:10: error: 'MT8188_VDO0_RST_DSI1' undeclared here (not in a function); did you mean 'MT8188_VDO0_SEL_IN'?
     135 |         [MT8188_VDO0_RST_DSI1]          = MMSYS_RST_NR(0, 22),
         |          ^~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_SEL_IN
   drivers/soc/mediatek/mt8188-mmsys.h:135:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:135:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:136:10: error: 'MT8188_VDO0_RST_DSC_WRAP0' undeclared here (not in a function)
     136 |         [MT8188_VDO0_RST_DSC_WRAP0]     = MMSYS_RST_NR(0, 23),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:136:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:136:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:137:10: error: 'MT8188_VDO0_RST_VPP_MERGE0' undeclared here (not in a function); did you mean 'MT8188_VDO0_VPP_MERGE_SEL'?
     137 |         [MT8188_VDO0_RST_VPP_MERGE0]    = MMSYS_RST_NR(0, 24),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_VPP_MERGE_SEL
   drivers/soc/mediatek/mt8188-mmsys.h:137:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:137:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:138:10: error: 'MT8188_VDO0_RST_DP_INTF0' undeclared here (not in a function); did you mean 'MT8188_VDO0_SEL_IN'?
     138 |         [MT8188_VDO0_RST_DP_INTF0]      = MMSYS_RST_NR(0, 25),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_SEL_IN
   drivers/soc/mediatek/mt8188-mmsys.h:138:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:138:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:139:10: error: 'MT8188_VDO0_RST_DISP_AAL0' undeclared here (not in a function); did you mean 'MT8188_VDO0_DSC_WARP_SEL'?
     139 |         [MT8188_VDO0_RST_DISP_AAL0]     = MMSYS_RST_NR(0, 26),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_DSC_WARP_SEL
   drivers/soc/mediatek/mt8188-mmsys.h:139:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:139:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:140:10: error: 'MT8188_VDO0_RST_INLINEROT0' undeclared here (not in a function)
     140 |         [MT8188_VDO0_RST_INLINEROT0]    = MMSYS_RST_NR(0, 27),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:140:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:140:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:141:10: error: 'MT8188_VDO0_RST_APB_BUS' undeclared here (not in a function); did you mean 'MT8188_VDO0_DSC_WARP_SEL'?
     141 |         [MT8188_VDO0_RST_APB_BUS]       = MMSYS_RST_NR(0, 28),
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_DSC_WARP_SEL
   drivers/soc/mediatek/mt8188-mmsys.h:141:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:141:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:142:10: error: 'MT8188_VDO0_RST_DISP_COLOR0' undeclared here (not in a function)
     142 |         [MT8188_VDO0_RST_DISP_COLOR0]   = MMSYS_RST_NR(0, 29),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:142:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:142:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:143:10: error: 'MT8188_VDO0_RST_MDP_WROT0' undeclared here (not in a function)
     143 |         [MT8188_VDO0_RST_MDP_WROT0]     = MMSYS_RST_NR(0, 30),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:143:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:143:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
>> drivers/soc/mediatek/mt8188-mmsys.h:144:10: error: 'MT8188_VDO0_RST_DISP_RSZ0' undeclared here (not in a function); did you mean 'MT8188_VDO0_DSC_WARP_SEL'?
     144 |         [MT8188_VDO0_RST_DISP_RSZ0]     = MMSYS_RST_NR(0, 31),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
         |          MT8188_VDO0_DSC_WARP_SEL
   drivers/soc/mediatek/mt8188-mmsys.h:144:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:144:10: note: (near initialization for 'mmsys_mt8188_vdo0_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:148:10: error: 'MT8188_VDO1_RST_SMI_LARB2' undeclared here (not in a function)
     148 |         [MT8188_VDO1_RST_SMI_LARB2]                     = MMSYS_RST_NR(0, 0),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:148:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:148:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:149:10: error: 'MT8188_VDO1_RST_SMI_LARB3' undeclared here (not in a function)
     149 |         [MT8188_VDO1_RST_SMI_LARB3]                     = MMSYS_RST_NR(0, 1),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:149:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:149:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:150:10: error: 'MT8188_VDO1_RST_GALS' undeclared here (not in a function)
     150 |         [MT8188_VDO1_RST_GALS]                          = MMSYS_RST_NR(0, 2),
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:150:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:150:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:151:10: error: 'MT8188_VDO1_RST_FAKE_ENG0' undeclared here (not in a function)
     151 |         [MT8188_VDO1_RST_FAKE_ENG0]                     = MMSYS_RST_NR(0, 3),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:151:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:151:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:152:10: error: 'MT8188_VDO1_RST_FAKE_ENG1' undeclared here (not in a function)
     152 |         [MT8188_VDO1_RST_FAKE_ENG1]                     = MMSYS_RST_NR(0, 4),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:152:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:152:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:153:10: error: 'MT8188_VDO1_RST_MDP_RDMA0' undeclared here (not in a function)
     153 |         [MT8188_VDO1_RST_MDP_RDMA0]                     = MMSYS_RST_NR(0, 5),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:153:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:153:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:154:10: error: 'MT8188_VDO1_RST_MDP_RDMA1' undeclared here (not in a function)
     154 |         [MT8188_VDO1_RST_MDP_RDMA1]                     = MMSYS_RST_NR(0, 6),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:154:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:154:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:155:10: error: 'MT8188_VDO1_RST_MDP_RDMA2' undeclared here (not in a function)
     155 |         [MT8188_VDO1_RST_MDP_RDMA2]                     = MMSYS_RST_NR(0, 7),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:155:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:155:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:156:10: error: 'MT8188_VDO1_RST_MDP_RDMA3' undeclared here (not in a function)
     156 |         [MT8188_VDO1_RST_MDP_RDMA3]                     = MMSYS_RST_NR(0, 8),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:156:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:156:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:157:10: error: 'MT8188_VDO1_RST_VPP_MERGE0' undeclared here (not in a function)
     157 |         [MT8188_VDO1_RST_VPP_MERGE0]                    = MMSYS_RST_NR(0, 9),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:157:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:157:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:158:10: error: 'MT8188_VDO1_RST_VPP_MERGE1' undeclared here (not in a function)
     158 |         [MT8188_VDO1_RST_VPP_MERGE1]                    = MMSYS_RST_NR(0, 10),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:158:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:158:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:159:10: error: 'MT8188_VDO1_RST_VPP_MERGE2' undeclared here (not in a function)
     159 |         [MT8188_VDO1_RST_VPP_MERGE2]                    = MMSYS_RST_NR(0, 11),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:159:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:159:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:160:10: error: 'MT8188_VDO1_RST_VPP_MERGE3' undeclared here (not in a function)
     160 |         [MT8188_VDO1_RST_VPP_MERGE3]                    = MMSYS_RST_NR(1, 0),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:160:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:160:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:161:10: error: 'MT8188_VDO1_RST_VPP_MERGE4' undeclared here (not in a function)
     161 |         [MT8188_VDO1_RST_VPP_MERGE4]                    = MMSYS_RST_NR(1, 1),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:161:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:161:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:162:10: error: 'MT8188_VDO1_RST_VPP2_TO_VDO1_DL_ASYNC' undeclared here (not in a function)
     162 |         [MT8188_VDO1_RST_VPP2_TO_VDO1_DL_ASYNC]         = MMSYS_RST_NR(1, 2),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:162:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:162:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:163:10: error: 'MT8188_VDO1_RST_VPP3_TO_VDO1_DL_ASYNC' undeclared here (not in a function)
     163 |         [MT8188_VDO1_RST_VPP3_TO_VDO1_DL_ASYNC]         = MMSYS_RST_NR(1, 3),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:163:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:163:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:164:10: error: 'MT8188_VDO1_RST_DISP_MUTEX' undeclared here (not in a function)
     164 |         [MT8188_VDO1_RST_DISP_MUTEX]                    = MMSYS_RST_NR(1, 4),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:164:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:164:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:165:10: error: 'MT8188_VDO1_RST_MDP_RDMA4' undeclared here (not in a function)
     165 |         [MT8188_VDO1_RST_MDP_RDMA4]                     = MMSYS_RST_NR(1, 5),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:165:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:165:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')
   drivers/soc/mediatek/mt8188-mmsys.h:166:10: error: 'MT8188_VDO1_RST_MDP_RDMA5' undeclared here (not in a function)
     166 |         [MT8188_VDO1_RST_MDP_RDMA5]                     = MMSYS_RST_NR(1, 6),
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mt8188-mmsys.h:166:10: error: array index in initializer not of integer type
   drivers/soc/mediatek/mt8188-mmsys.h:166:10: note: (near initialization for 'mmsys_mt8188_vdo1_rst_tb')


vim +126 drivers/soc/mediatek/mt8188-mmsys.h

   124	
   125	static const u8 mmsys_mt8188_vdo0_rst_tb[] = {
 > 126		[MT8188_VDO0_RST_DISP_OVL0]	= MMSYS_RST_NR(0, 0),
 > 127		[MT8188_VDO0_RST_FAKE_ENG0]	= MMSYS_RST_NR(0, 2),
 > 128		[MT8188_VDO0_RST_DISP_CCORR0]	= MMSYS_RST_NR(0, 4),
 > 129		[MT8188_VDO0_RST_DISP_MUTEX0]	= MMSYS_RST_NR(0, 6),
 > 130		[MT8188_VDO0_RST_DISP_GAMMA0]	= MMSYS_RST_NR(0, 8),
 > 131		[MT8188_VDO0_RST_DISP_DITHER0]	= MMSYS_RST_NR(0, 10),
 > 132		[MT8188_VDO0_RST_DISP_WDMA0]	= MMSYS_RST_NR(0, 17),
 > 133		[MT8188_VDO0_RST_DISP_RDMA0]	= MMSYS_RST_NR(0, 19),
 > 134		[MT8188_VDO0_RST_DSI0]		= MMSYS_RST_NR(0, 21),
 > 135		[MT8188_VDO0_RST_DSI1]		= MMSYS_RST_NR(0, 22),
 > 136		[MT8188_VDO0_RST_DSC_WRAP0]	= MMSYS_RST_NR(0, 23),
 > 137		[MT8188_VDO0_RST_VPP_MERGE0]	= MMSYS_RST_NR(0, 24),
 > 138		[MT8188_VDO0_RST_DP_INTF0]	= MMSYS_RST_NR(0, 25),
 > 139		[MT8188_VDO0_RST_DISP_AAL0]	= MMSYS_RST_NR(0, 26),
 > 140		[MT8188_VDO0_RST_INLINEROT0]	= MMSYS_RST_NR(0, 27),
 > 141		[MT8188_VDO0_RST_APB_BUS]	= MMSYS_RST_NR(0, 28),
 > 142		[MT8188_VDO0_RST_DISP_COLOR0]	= MMSYS_RST_NR(0, 29),
 > 143		[MT8188_VDO0_RST_MDP_WROT0]	= MMSYS_RST_NR(0, 30),
 > 144		[MT8188_VDO0_RST_DISP_RSZ0]	= MMSYS_RST_NR(0, 31),
   145	};
   146	
   147	static const u8 mmsys_mt8188_vdo1_rst_tb[] = {
 > 148		[MT8188_VDO1_RST_SMI_LARB2]			= MMSYS_RST_NR(0, 0),
 > 149		[MT8188_VDO1_RST_SMI_LARB3]			= MMSYS_RST_NR(0, 1),
 > 150		[MT8188_VDO1_RST_GALS]				= MMSYS_RST_NR(0, 2),
 > 151		[MT8188_VDO1_RST_FAKE_ENG0]			= MMSYS_RST_NR(0, 3),
 > 152		[MT8188_VDO1_RST_FAKE_ENG1]			= MMSYS_RST_NR(0, 4),
 > 153		[MT8188_VDO1_RST_MDP_RDMA0]			= MMSYS_RST_NR(0, 5),
 > 154		[MT8188_VDO1_RST_MDP_RDMA1]			= MMSYS_RST_NR(0, 6),
 > 155		[MT8188_VDO1_RST_MDP_RDMA2]			= MMSYS_RST_NR(0, 7),
 > 156		[MT8188_VDO1_RST_MDP_RDMA3]			= MMSYS_RST_NR(0, 8),
 > 157		[MT8188_VDO1_RST_VPP_MERGE0]			= MMSYS_RST_NR(0, 9),
 > 158		[MT8188_VDO1_RST_VPP_MERGE1]			= MMSYS_RST_NR(0, 10),
 > 159		[MT8188_VDO1_RST_VPP_MERGE2]			= MMSYS_RST_NR(0, 11),
 > 160		[MT8188_VDO1_RST_VPP_MERGE3]			= MMSYS_RST_NR(1, 0),
 > 161		[MT8188_VDO1_RST_VPP_MERGE4]			= MMSYS_RST_NR(1, 1),
 > 162		[MT8188_VDO1_RST_VPP2_TO_VDO1_DL_ASYNC]		= MMSYS_RST_NR(1, 2),
 > 163		[MT8188_VDO1_RST_VPP3_TO_VDO1_DL_ASYNC]		= MMSYS_RST_NR(1, 3),
 > 164		[MT8188_VDO1_RST_DISP_MUTEX]			= MMSYS_RST_NR(1, 4),
 > 165		[MT8188_VDO1_RST_MDP_RDMA4]			= MMSYS_RST_NR(1, 5),
 > 166		[MT8188_VDO1_RST_MDP_RDMA5]			= MMSYS_RST_NR(1, 6),
 > 167		[MT8188_VDO1_RST_MDP_RDMA6]			= MMSYS_RST_NR(1, 7),
 > 168		[MT8188_VDO1_RST_MDP_RDMA7]			= MMSYS_RST_NR(1, 8),
 > 169		[MT8188_VDO1_RST_DP_INTF1_MMCK]			= MMSYS_RST_NR(1, 9),
 > 170		[MT8188_VDO1_RST_DPI0_MM_CK]			= MMSYS_RST_NR(1, 10),
 > 171		[MT8188_VDO1_RST_DPI1_MM_CK]			= MMSYS_RST_NR(1, 11),
 > 172		[MT8188_VDO1_RST_MERGE0_DL_ASYNC]		= MMSYS_RST_NR(1, 13),
 > 173		[MT8188_VDO1_RST_MERGE1_DL_ASYNC]		= MMSYS_RST_NR(1, 14),
 > 174		[MT8188_VDO1_RST_MERGE2_DL_ASYNC]		= MMSYS_RST_NR(1, 15),
 > 175		[MT8188_VDO1_RST_MERGE3_DL_ASYNC]		= MMSYS_RST_NR(1, 16),
 > 176		[MT8188_VDO1_RST_MERGE4_DL_ASYNC]		= MMSYS_RST_NR(1, 17),
 > 177		[MT8188_VDO1_RST_VDO0_DSC_TO_VDO1_DL_ASYNC]	= MMSYS_RST_NR(1, 18),
 > 178		[MT8188_VDO1_RST_VDO0_MERGE_TO_VDO1_DL_ASYNC]	= MMSYS_RST_NR(1, 19),
 > 179		[MT8188_VDO1_RST_PADDING0]			= MMSYS_RST_NR(1, 20),
 > 180		[MT8188_VDO1_RST_PADDING1]			= MMSYS_RST_NR(1, 21),
 > 181		[MT8188_VDO1_RST_PADDING2]			= MMSYS_RST_NR(1, 22),
 > 182		[MT8188_VDO1_RST_PADDING3]			= MMSYS_RST_NR(1, 23),
 > 183		[MT8188_VDO1_RST_PADDING4]			= MMSYS_RST_NR(1, 24),
 > 184		[MT8188_VDO1_RST_PADDING5]			= MMSYS_RST_NR(1, 25),
 > 185		[MT8188_VDO1_RST_PADDING6]			= MMSYS_RST_NR(1, 26),
 > 186		[MT8188_VDO1_RST_PADDING7]			= MMSYS_RST_NR(1, 27),
 > 187		[MT8188_VDO1_RST_DISP_RSZ0]			= MMSYS_RST_NR(1, 28),
 > 188		[MT8188_VDO1_RST_DISP_RSZ1]			= MMSYS_RST_NR(1, 29),
 > 189		[MT8188_VDO1_RST_DISP_RSZ2]			= MMSYS_RST_NR(1, 30),
 > 190		[MT8188_VDO1_RST_DISP_RSZ3]			= MMSYS_RST_NR(1, 31),
 > 191		[MT8188_VDO1_RST_HDR_VDO_FE0]			= MMSYS_RST_NR(2, 0),
 > 192		[MT8188_VDO1_RST_HDR_GFX_FE0]			= MMSYS_RST_NR(2, 1),
 > 193		[MT8188_VDO1_RST_HDR_VDO_BE]			= MMSYS_RST_NR(2, 2),
 > 194		[MT8188_VDO1_RST_HDR_VDO_FE1]			= MMSYS_RST_NR(2, 16),
 > 195		[MT8188_VDO1_RST_HDR_GFX_FE1]			= MMSYS_RST_NR(2, 17),
 > 196		[MT8188_VDO1_RST_DISP_MIXER]			= MMSYS_RST_NR(2, 18),
 > 197		[MT8188_VDO1_RST_HDR_VDO_FE0_DL_ASYNC]		= MMSYS_RST_NR(2, 19),
 > 198		[MT8188_VDO1_RST_HDR_VDO_FE1_DL_ASYNC]		= MMSYS_RST_NR(2, 20),
 > 199		[MT8188_VDO1_RST_HDR_GFX_FE0_DL_ASYNC]		= MMSYS_RST_NR(2, 21),
 > 200		[MT8188_VDO1_RST_HDR_GFX_FE1_DL_ASYNC]		= MMSYS_RST_NR(2, 22),
 > 201		[MT8188_VDO1_RST_HDR_VDO_BE_DL_ASYNC]		= MMSYS_RST_NR(2, 23),
   202	};
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
