Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA37C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690662084; x=1722198084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OST7aykYo27Vqc4IzfrypFSyPsGOYMH1HgY5w/1ZOIs=;
  b=Jg/2bsaOES/egiXQqk66IKq0sW0fXtOY3axkesetYwPstzANpRuHp/GK
   J2eU8WwVaCpaZydVDue5lj/TtGqKaOWnGayRF6bWu1rMaccAOZCFWLdUL
   VbJPpfaB3iy/85/DNCa6Qqyu4iAv+u1BJRA1sTtEB3OGDR8Igd350jKwJ
   i0p4hdinW+VNx/QkCeraSAKWpl1/WqttIRpviwr2wjFqtcLdbvNwsvXL8
   bkHtA+H2N+VGAdlor8SRJAmDYLqoOqIch7q1/+ru68OEFjtJehLWJiYH/
   oRSVtxRJj62kYfl/cWy/C/ufJAT1S8OpJmujCrOedT9yEaFsSE/TpEexL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="348392273"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="348392273"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 13:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="704932252"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="704932252"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Jul 2023 13:21:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPqRC-0004Hx-0K;
	Sat, 29 Jul 2023 20:21:18 +0000
Date: Sun, 30 Jul 2023 04:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Peens <louis.peens@corigine.com>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Simon Horman <simon.horman@corigine.com>,
	Yinjun Zhang <yinjun.zhang@corigine.com>,
	Tianyu Yuan <tianyu.yuan@corigine.com>, oss-drivers@corigine.com
Subject: Re: [PATCH net-next 05/12] nfp: introduce keepalive mechanism for
 multi-PF setup
Message-ID: <202307300422.oPy5E1hB-lkp@intel.com>
References: <20230724094821.14295-6-louis.peens@corigine.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724094821.14295-6-louis.peens@corigine.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Peens/nsp-generate-nsp-command-with-variable-nsp-major-version/20230724-180015
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230724094821.14295-6-louis.peens%40corigine.com
patch subject: [PATCH net-next 05/12] nfp: introduce keepalive mechanism for multi-PF setup
config: openrisc-randconfig-r081-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300422.oPy5E1hB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300422.oPy5E1hB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300422.oPy5E1hB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/netronome/nfp/nfp_main.c: note: in included file (through drivers/net/ethernet/netronome/nfp/nfp_net.h):
>> include/linux/io-64-nonatomic-hi-lo.h:22:16: sparse: sparse: cast truncates bits from constant value (6e66702e62656174 becomes 62656174)

vim +22 include/linux/io-64-nonatomic-hi-lo.h

797a796a13df6b include/asm-generic/io-64-nonatomic-hi-lo.h Hitoshi Mitake 2012-02-07  18  
3a044178cccfeb include/asm-generic/io-64-nonatomic-hi-lo.h Jason Baron    2014-07-04  19  static inline void hi_lo_writeq(__u64 val, volatile void __iomem *addr)
797a796a13df6b include/asm-generic/io-64-nonatomic-hi-lo.h Hitoshi Mitake 2012-02-07  20  {
797a796a13df6b include/asm-generic/io-64-nonatomic-hi-lo.h Hitoshi Mitake 2012-02-07  21  	writel(val >> 32, addr + 4);
797a796a13df6b include/asm-generic/io-64-nonatomic-hi-lo.h Hitoshi Mitake 2012-02-07 @22  	writel(val, addr);
797a796a13df6b include/asm-generic/io-64-nonatomic-hi-lo.h Hitoshi Mitake 2012-02-07  23  }
3a044178cccfeb include/asm-generic/io-64-nonatomic-hi-lo.h Jason Baron    2014-07-04  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
