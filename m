Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9E9455
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 19:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680203532; x=1711739532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lD5a0ND9/w/SGSYm61kUl0WbwTOD0/MFLQpa6l0Mp6I=;
  b=kKCxTbFd7aO5Fnowfopx5DGW/KGXJunhCggTnLimpOm+88pBXXmZLz2i
   LOugASkci/RXnQ0e7RUQ2rrn7kbGKzHunuS8a6pcnh4p3xY5qp5CuaQlj
   VTfnUVwahNBftxGuB9R2mgM3PKf3YqI6n8LjjmX+wxnKNDauiq7wBFKPr
   VIfGCqPmy0o08ae7vylN0Xdvqnz+6h1xcupg5bZQ/IebUK5EICy2xmsYL
   4tAcF8TK9QlXqWt/kaMe//gUX+LLkLzIH3ulAjPaFrF2M95WRQ4ViyTdl
   49qt8bH+VRlt7uEE04GiHw75ovK9ioX5fSM8kRqss4En71wDxEn0aTiFb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329786407"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="329786407"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 12:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687373452"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="687373452"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Mar 2023 12:12:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phxgs-000L84-0Q;
	Thu, 30 Mar 2023 19:12:06 +0000
Date: Fri, 31 Mar 2023 03:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH bpf RFC-V3 4/5] mlx4:
 bpf_xdp_metadata_rx_hash add xdp rss hash type
Message-ID: <202303310203.lHSJJtAT-lkp@intel.com>
References: <168019608094.3557870.11753259102366277974.stgit@firesoul>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168019608094.3557870.11753259102366277974.stgit@firesoul>

Hi Jesper,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesper-Dangaard-Brouer/xdp-rss-hash-types-representation/20230331-010857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/168019608094.3557870.11753259102366277974.stgit%40firesoul
patch subject: [Intel-wired-lan] [PATCH bpf RFC-V3 4/5] mlx4: bpf_xdp_metadata_rx_hash add xdp rss hash type
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230331/202303310203.lHSJJtAT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8d79e730d9b22b00ef3a0bbf73d3aa2c68fb898b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jesper-Dangaard-Brouer/xdp-rss-hash-types-representation/20230331-010857
        git checkout 8d79e730d9b22b00ef3a0bbf73d3aa2c68fb898b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310203.lHSJJtAT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx4/en_rx.c: In function 'mlx4_en_xdp_rx_hash':
>> drivers/net/ethernet/mellanox/mlx4/en_rx.c:698:21: warning: implicit conversion from 'enum xdp_rss_type_bits' to 'enum xdp_rss_hash_type' [-Wenum-conversion]
     698 |                 xht = XDP_RSS_L4_TCP;
         |                     ^
   drivers/net/ethernet/mellanox/mlx4/en_rx.c:700:21: warning: implicit conversion from 'enum xdp_rss_type_bits' to 'enum xdp_rss_hash_type' [-Wenum-conversion]
     700 |                 xht = XDP_RSS_L4_UDP;
         |                     ^


vim +698 drivers/net/ethernet/mellanox/mlx4/en_rx.c

   683	
   684	int mlx4_en_xdp_rx_hash(const struct xdp_md *ctx, u32 *hash,
   685				enum xdp_rss_hash_type *rss_type)
   686	{
   687		struct mlx4_en_xdp_buff *_ctx = (void *)ctx;
   688		struct mlx4_cqe *cqe = _ctx->cqe;
   689		enum xdp_rss_hash_type xht = 0;
   690		__be16 status;
   691	
   692		if (unlikely(!(_ctx->dev->features & NETIF_F_RXHASH)))
   693			return -ENODATA;
   694	
   695		*hash = be32_to_cpu(cqe->immed_rss_invalid);
   696		status = cqe->status;
   697		if (status & cpu_to_be16(MLX4_CQE_STATUS_TCP))
 > 698			xht = XDP_RSS_L4_TCP;
   699		if (status & cpu_to_be16(MLX4_CQE_STATUS_UDP))
   700			xht = XDP_RSS_L4_UDP;
   701		if (status & cpu_to_be16(MLX4_CQE_STATUS_IPV4|MLX4_CQE_STATUS_IPV4F))
   702			xht |= XDP_RSS_L3_IPV4;
   703		if (status & cpu_to_be16(MLX4_CQE_STATUS_IPV6)) {
   704			xht |= XDP_RSS_L3_IPV6;
   705			if (cqe->ipv6_ext_mask)
   706				xht |= XDP_RSS_L3_DYNHDR;
   707		}
   708		*rss_type = xht;
   709	
   710		return 0;
   711	}
   712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
