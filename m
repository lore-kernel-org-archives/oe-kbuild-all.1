Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22243360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674995531; x=1706531531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U2Q/poVrU8PriaR4JV0F2JPgSzVzAjS0z5cdLc1JvSY=;
  b=GTOEoUTFc4GoWvpts3CT23qWZAJF6YCuJ80HwDNMSIoYEODcj1wSCa5D
   f02OLhXCqvoCcvUr0YQn37PNP7mB3w4Uk3d/MtZVXR+rkTkrDTTmfpu4Y
   i4lFXYxDWxoAvhaFN2sRNq3vOf8NPbdRJko+OjGR9Sg+KIDVBNAYTTB24
   QrFLrO8p+eMDmNdfeBR0N+r2HSWwKeU1cqZKBpo31nFFam9zSF6N9LSch
   pbL3sGJ1WVMLDY4AwKy5GV2UCA0C7ZmYVURhZy9SnKMVO0sjJJse7A1zO
   GDNdjmshpBcmp5ZXPOdhclX99wDnIJnIiH1jvkcVL9+zZ3cv4JUWOZnQy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354705646"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="354705646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 04:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="837683970"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="837683970"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2023 04:32:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM6qt-0002nZ-05;
	Sun, 29 Jan 2023 12:32:07 +0000
Date: Sun, 29 Jan 2023 20:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vfedorenko@novek.ru>, Vadim Fedorenko <vadfed@fb.com>,
	Aya Levin <ayal@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>, Gal Pressman <gal@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] mlx5: fix possible ptp queue fifo
 use-after-free
Message-ID: <202301292055.CXz5AB3g-lkp@intel.com>
References: <20230126010206.13483-3-vfedorenko@novek.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126010206.13483-3-vfedorenko@novek.ru>

Hi Vadim,

I love your patch! Yet something to improve:

[auto build test ERROR on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/mlx5-fix-skb-leak-while-fifo-resync-and-push/20230128-120805
patch link:    https://lore.kernel.org/r/20230126010206.13483-3-vfedorenko%40novek.ru
patch subject: [PATCH net v3 2/2] mlx5: fix possible ptp queue fifo use-after-free
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20230129/202301292055.CXz5AB3g-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2516a9785583b92ac82262a813203de696096ccd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/mlx5-fix-skb-leak-while-fifo-resync-and-push/20230128-120805
        git checkout 2516a9785583b92ac82262a813203de696096ccd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c: In function 'mlx5e_ptp_skb_fifo_ts_cqe_resync':
   drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c:97:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      97 |         if (skb_cc > skb_id || PTP_WQE_CTR2IDX(ptpsq->skb_fifo_pc) < skb_id)
         |         ^~
   drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c:99:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
      99 |                 return false;
         |                 ^~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c:93:25: warning: unused variable 'skb' [-Wunused-variable]
      93 |         struct sk_buff *skb;
         |                         ^~~
   drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c:92:37: warning: unused variable 'hwts' [-Wunused-variable]
      92 |         struct skb_shared_hwtstamps hwts = {};
         |                                     ^~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c: At top level:
>> drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c:102:9: error: expected identifier or '(' before 'while'
     102 |         while (skb_cc != skb_id && (skb = mlx5e_skb_fifo_pop(&ptpsq->skb_fifo))) {
         |         ^~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c:110:9: error: expected identifier or '(' before 'if'
     110 |         if (!skb)
         |         ^~
>> drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c:113:9: error: expected identifier or '(' before 'return'
     113 |         return true;
         |         ^~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c:114:1: error: expected identifier or '(' before '}' token
     114 | }
         | ^


vim +102 drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c

    88	
    89	static bool mlx5e_ptp_skb_fifo_ts_cqe_resync(struct mlx5e_ptpsq *ptpsq, u16 skb_cc,
    90						     u16 skb_id, int budget)
    91	{
    92		struct skb_shared_hwtstamps hwts = {};
    93		struct sk_buff *skb;
    94	
    95		ptpsq->cq_stats->resync_event++;
    96	
    97		if (skb_cc > skb_id || PTP_WQE_CTR2IDX(ptpsq->skb_fifo_pc) < skb_id)
    98			pr_err_ratelimited("mlx5e: out-of-order ptp cqe\n");
    99			return false;
   100		}
   101	
 > 102		while (skb_cc != skb_id && (skb = mlx5e_skb_fifo_pop(&ptpsq->skb_fifo))) {
   103			hwts.hwtstamp = mlx5e_skb_cb_get_hwts(skb)->cqe_hwtstamp;
   104			skb_tstamp_tx(skb, &hwts);
   105			ptpsq->cq_stats->resync_cqe++;
   106			napi_consume_skb(skb, budget);
   107			skb_cc = PTP_WQE_CTR2IDX(ptpsq->skb_fifo_cc);
   108		}
   109	
 > 110		if (!skb)
   111			return false;
   112	
 > 113		return true;
 > 114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
