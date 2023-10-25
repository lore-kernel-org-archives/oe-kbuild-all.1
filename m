Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B087711732
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jM/Jqk3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698213609; x=1729749609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YChxQiLMiAbqx2jED7wzxjA10nt5snZ5/Ivp/EhE/Dw=;
  b=jM/Jqk3y2NRSBgsdDiGd0mxQas19NaZzhsquti6XCAIVu09Z0uqSJ7OB
   y+VmY07qGSvaoTxGXnVDG2CO8Ik7RgirzO6orajj4pt6MiB52rZk+OMb5
   E1dNez05fuK95CxZK+bsm59K4WcZXiz/JnLgdb7DbfV0qodYZWI63gr+s
   R0S5Od0dZd6QKjUd4/1TV9RxoE0k6zY9ZvgS9udQNtDqIbKqBo5jXTZFz
   c/m+A7XM2TWRlD+5zqoeSYh35E22QA+UU+B5/F3BNVFGK/hNkpGruZFe9
   Z9iOwcmYFt3uiBS7GCfpnn66aZCtqdhzy5BihH9zvn/NlnlWbZIK1VIxs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="5857913"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="5857913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 22:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902452210"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="902452210"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2023 22:57:28 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvWvk-0008fJ-14;
	Wed, 25 Oct 2023 05:59:48 +0000
Date: Wed, 25 Oct 2023 13:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp 27/47]
 arch/powerpc/platforms/pasemi/dma_lib.c:105:20: warning: variable 'limit'
 set but not used
Message-ID: <202310251355.ESgXuO9q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp
head:   8ff28bdbe8eb42074ec3920a5b1d49e18332aad1
commit: fa98624ff045979d246c0f0fc554c92178345c5f [27/47] powerpc: fix opencoded find_and_{set,clear}_bit()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310251355.ESgXuO9q-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251355.ESgXuO9q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251355.ESgXuO9q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/pasemi/dma_lib.c: In function 'pasemi_alloc_tx_chan':
   arch/powerpc/platforms/pasemi/dma_lib.c:122:66: error: expected ';' before 'return'
     122 |         bit = find_and_clear_next_bit(txch_free, MAX_TXCH, start)
         |                                                                  ^
         |                                                                  ;
     123 |         return bit < limit ? bit : -ENOSPC;
         |         ~~~~~~                                                    
>> arch/powerpc/platforms/pasemi/dma_lib.c:105:20: warning: variable 'limit' set but not used [-Wunused-but-set-variable]
     105 |         int start, limit;
         |                    ^~~~~
>> arch/powerpc/platforms/pasemi/dma_lib.c:104:13: warning: variable 'bit' set but not used [-Wunused-but-set-variable]
     104 |         int bit;
         |             ^~~
   arch/powerpc/platforms/pasemi/dma_lib.c:124:1: error: no return statement in function returning non-void [-Werror=return-type]
     124 | }
         | ^
   cc1: some warnings being treated as errors


vim +/limit +105 arch/powerpc/platforms/pasemi/dma_lib.c

8ee9d85779356c Olof Johansson 2007-11-28  101  
8ee9d85779356c Olof Johansson 2007-11-28  102  static int pasemi_alloc_tx_chan(enum pasemi_dmachan_type type)
8ee9d85779356c Olof Johansson 2007-11-28  103  {
8ee9d85779356c Olof Johansson 2007-11-28 @104  	int bit;
8ee9d85779356c Olof Johansson 2007-11-28 @105  	int start, limit;
8ee9d85779356c Olof Johansson 2007-11-28  106  
8ee9d85779356c Olof Johansson 2007-11-28  107  	switch (type & (TXCHAN_EVT0|TXCHAN_EVT1)) {
8ee9d85779356c Olof Johansson 2007-11-28  108  	case TXCHAN_EVT0:
8ee9d85779356c Olof Johansson 2007-11-28  109  		start = 0;
8ee9d85779356c Olof Johansson 2007-11-28  110  		limit = 10;
8ee9d85779356c Olof Johansson 2007-11-28  111  		break;
8ee9d85779356c Olof Johansson 2007-11-28  112  	case TXCHAN_EVT1:
8ee9d85779356c Olof Johansson 2007-11-28  113  		start = 10;
8ee9d85779356c Olof Johansson 2007-11-28  114  		limit = MAX_TXCH;
8ee9d85779356c Olof Johansson 2007-11-28  115  		break;
8ee9d85779356c Olof Johansson 2007-11-28  116  	default:
8ee9d85779356c Olof Johansson 2007-11-28  117  		start = 0;
8ee9d85779356c Olof Johansson 2007-11-28  118  		limit = MAX_TXCH;
8ee9d85779356c Olof Johansson 2007-11-28  119  		break;
8ee9d85779356c Olof Johansson 2007-11-28  120  	}
fa98624ff04597 Yury Norov     2023-10-21  121  
fa98624ff04597 Yury Norov     2023-10-21 @122  	bit = find_and_clear_next_bit(txch_free, MAX_TXCH, start)
fa98624ff04597 Yury Norov     2023-10-21  123  	return bit < limit ? bit : -ENOSPC;
8ee9d85779356c Olof Johansson 2007-11-28  124  }
8ee9d85779356c Olof Johansson 2007-11-28  125  

:::::: The code at line 105 was first introduced by commit
:::::: 8ee9d85779356c1dc2ba87aca27fbf9414f2d82b pasemi: DMA engine management library

:::::: TO: Olof Johansson <olof@lixom.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
