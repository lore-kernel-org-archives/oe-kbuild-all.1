Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2E28504D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753778310; cv=none; b=l5tgvPsAHQVB/+owAum907/0BZiZuMptlXWD9gBWknKdoeY9YvJsXHPFAX1Bn7gYtAkydKbhGUqzEOB3lAxm808vbmP1Hyhlip6Txs73NlNhAD/ntwHR3eMs8pFwuZ85S1okw2eUTkHYABrEPjA3g4hH812NcAXDUDeU1rAO9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753778310; c=relaxed/simple;
	bh=r+ZaePei3HhgTHoPTFFZddCyxWvIAoiqd3FMg7CabwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eR/Pdi8DxCFzlYVawW39LeHI8Dd3sSi0VSVaL2tPhTVlrUZw2KlpfivEiQL26yKY4BdAaWOYmqytjYLNivyMUe+ykMFttEJANaCriNsH5LPR9w4v0qtyVCzY2LmmfuXsL/R7ONJKDwPVVTWvgoR5O/3xwKRwva44w2Y6dm/oLNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBozXM03; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBozXM03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753778308; x=1785314308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+ZaePei3HhgTHoPTFFZddCyxWvIAoiqd3FMg7CabwU=;
  b=eBozXM0389GPoFQBnzxJDZvCkEY+mMn8dcom/NN82ZiC+4BpcaJg+hKT
   Ta2SYsIZvaQXLObf2U+OrRLX6M/dxRyCkHNjZe6LMxzmTaCy7JUMqQT+R
   cHiQV8+msKoafvoVP/m49kPcVtHN6tZn8mi2XKf10LnBEomfGrUnEOnW1
   K2yk8UTw9hGnQgg4cuDOA83lG2C7d10/qOmLsOoTibSbfee8C2vdL7Qu4
   iD/iO8aRmrJZvpFDh7QloZRvj8/toXqpVQBFoiaE4hvh8dPmiwKh4WZx6
   a0g0O1YcbmashSjwcBJS8HmCTMbvW+YW/hRKtVN3Qyfc2py3I8IHR/DtW
   A==;
X-CSE-ConnectionGUID: dPG0EGymSVeNYjemCmcjcg==
X-CSE-MsgGUID: sbmT9XboRY2dhJbsuBlYfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67123935"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="67123935"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 01:38:27 -0700
X-CSE-ConnectionGUID: 1BOpBvehR264uWKJBNxSdw==
X-CSE-MsgGUID: TSDHU+8HSSysWclBKqldsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163421844"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 01:38:27 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugfqq-0000cp-1n;
	Tue, 29 Jul 2025 08:38:24 +0000
Date: Tue, 29 Jul 2025 10:37:28 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/92]
 drivers/vdpa/mlx5/net/mlx5_vnet.c:2650:13: error: incompatible function
 pointer types initializing 'void (*)(struct vdpa_mgmt_dev *, struct
 vdpa_device *, int)' with an expression of type 'void (struct vdpa_mgmt_dev
 *, struct vdpa_device *)'
Message-ID: <202507291012.Gc6NdTvO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: e4b7b11288fc91b44fd73cd10b954c515eeb26ca [0/92] bytedance: vdpa: Add deletion timeout support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250729/202507291012.Gc6NdTvO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291012.Gc6NdTvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291012.Gc6NdTvO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vdpa/mlx5/net/mlx5_vnet.c:11:
   In file included from include/linux/mlx5/cq.h:36:
   In file included from include/linux/mlx5/driver.h:53:
   In file included from include/linux/mlx5/device.h:37:
   In file included from include/rdma/ib_verbs.h:26:
   include/net/ip.h:450:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     450 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
     105 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:2650:13: error: incompatible function pointer types initializing 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *, int)' with an expression of type 'void (struct vdpa_mgmt_dev *, struct vdpa_device *)' [-Wincompatible-function-pointer-types]
    2650 |         .dev_del = mlx5_vdpa_dev_del,
         |                    ^~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
>> drivers/vdpa/ifcvf/ifcvf_main.c:553:13: error: incompatible function pointer types initializing 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *, int)' with an expression of type 'void (struct vdpa_mgmt_dev *, struct vdpa_device *)' [-Wincompatible-function-pointer-types]
     553 |         .dev_del = ifcvf_vdpa_dev_del
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:600:39: warning: shift count >= width of type [-Wshift-count-overflow]
     600 |         ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
      76 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.


vim +2650 drivers/vdpa/mlx5/net/mlx5_vnet.c

58926c8aab104d Eli Cohen 2021-04-08  2647  
58926c8aab104d Eli Cohen 2021-04-08  2648  static const struct vdpa_mgmtdev_ops mdev_ops = {
58926c8aab104d Eli Cohen 2021-04-08  2649  	.dev_add = mlx5_vdpa_dev_add,
58926c8aab104d Eli Cohen 2021-04-08 @2650  	.dev_del = mlx5_vdpa_dev_del,
58926c8aab104d Eli Cohen 2021-04-08  2651  };
58926c8aab104d Eli Cohen 2021-04-08  2652  

:::::: The code at line 2650 was first introduced by commit
:::::: 58926c8aab104daa49f35b9fcf664d95c22c8ac7 vdpa/mlx5: Enable user to add/delete vdpa device

:::::: TO: Eli Cohen <elic@nvidia.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
