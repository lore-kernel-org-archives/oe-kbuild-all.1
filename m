Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DA41095A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694106983; x=1725642983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+nV/A0KI51xC3F16W+WXs9hcXG9VgStb2/g8BOn2vYM=;
  b=eVE1YZGyoh/z/kYrgXyXpNIjV0YLxNj+Hif+a44ty6PyShrd/rzbRJnu
   piTt9nMiMYbn3g9PdNPU4otEBBFw0nKMpus8PD0h/VPgk0KkQpy9sWIrj
   /AjWQfIVOnl65rrsam+scaaRq+4LvHfzAmPrcMl2+atFLqsd68zsswxri
   0VymMDg0w319gMtbTE2vo3Hz6XQxx1a7NpxEkUvi9o5nFKgeGlmYxJjcl
   h32aeM+oINR3La43evwMK0WbO99M8+xjH3OBuzc+7RmqDiw77ILmBPahH
   9R5cghRCayCaHA+my/jMcVB6H6C7bv1pNqvI5Ors4EebXD9DUpNvPNtva
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357732865"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357732865"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 10:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777151153"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="777151153"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 10:15:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIb5-0001QE-2C;
	Thu, 07 Sep 2023 17:15:15 +0000
Date: Fri, 8 Sep 2023 01:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, Dan Carpenter <error27@gmail.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix uninitialized
 variable
Message-ID: <202309080051.4UKDipfX-lkp@intel.com>
References: <51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel@makrotopia.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-fix-uninitialized-variable/20230907-234141
base:   net/main
patch link:    https://lore.kernel.org/r/51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel%40makrotopia.org
patch subject: [PATCH net] net: ethernet: mtk_eth_soc: fix uninitialized variable
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309080051.4UKDipfX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080051.4UKDipfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080051.4UKDipfX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/of.h:14,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:9:
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_poll_rx':
>> include/linux/stddef.h:8:14: warning: initialization of 'dma_addr_t' {aka 'unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2008:31: note: in expansion of macro 'NULL'
    2008 |         dma_addr_t dma_addr = NULL;
         |                               ^~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
