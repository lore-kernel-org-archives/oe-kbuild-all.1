Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E1450F6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 23:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695080648; x=1726616648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cHNDDuwX5FIl3Ek/pQwOCLYywPvvjREP0p9a3WzYSeU=;
  b=LoQlCw22G+c3XD7g7K5EmzORFjrEI77EUCAj+rsxmnSec4Ri3Dk16kK7
   gJfT7z4keroUp5x6InWQ6ZP4LpxNsf24vzkWmyLF7L7iRKgG67Iu1DiEV
   8LIFbU9wnlGPBccdvmueOCudbwrxwcWyzTvLmbI5uAcz8Foh1sAwKRUny
   zGg7kmolNonhVJmbVoFo64w+nDgwM0xKsWdhbhOt4/iVyA3K/J7mvohfF
   4Zt0n0wnbYXR51V6TCIJCmM8JxXCQapopTDcP7GF5mRinQK5xyy3xIIZ2
   V1xiobM//sBfvBIbg0yNeuYBNJUIVSyNqtWf7yRe1WMt7i0dYTAWiO8+D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378706598"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="378706598"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 16:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869755294"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="869755294"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Sep 2023 16:44:03 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiNuL-0006eO-0b;
	Mon, 18 Sep 2023 23:44:01 +0000
Date: Tue, 19 Sep 2023 07:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: Fang Hui <hui.fang@nxp.com>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, anle.pan@nxp.com, xuegang.liu@nxp.com
Subject: Re: [PATCH] MA-21654 Use dma_alloc_pages in
 vb2_dma_sg_alloc_compacted
Message-ID: <202309190740.sIUYQTIq-lkp@intel.com>
References: <20230914145812.12851-1-hui.fang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914145812.12851-1-hui.fang@nxp.com>

Hi Fang,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.6-rc2 next-20230918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fang-Hui/MA-21654-Use-dma_alloc_pages-in-vb2_dma_sg_alloc_compacted/20230914-154333
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230914145812.12851-1-hui.fang%40nxp.com
patch subject: [PATCH] MA-21654 Use dma_alloc_pages in vb2_dma_sg_alloc_compacted
config: sh-randconfig-002-20230919 (https://download.01.org/0day-ci/archive/20230919/202309190740.sIUYQTIq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309190740.sIUYQTIq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309190740.sIUYQTIq-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x1b8c): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x1b90): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x1b94): undefined reference to `of_clk_hw_simple_get'
   sh4-linux-ld: drivers/media/common/videobuf2/videobuf2-dma-sg.o: in function `vb2_dma_sg_alloc_compacted':
>> videobuf2-dma-sg.c:(.text+0x57c): undefined reference to `dma_alloc_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
