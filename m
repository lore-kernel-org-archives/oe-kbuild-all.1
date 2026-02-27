Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2B348880
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211022; cv=none; b=FXAOeV18doQJv/+bJTp9KWX/4h1OTVPkSBSAoVkmfDTgQAKua5ttdvWwzpWXQN+XV2cBYtin/JiC2pjwJqy/n2SOYgYpgqIthLFMO0d4PJq1LNvw6xU5IPUfFpNgA6zTjiuFyt7ThGHSXo6V6ePF8A8kBIADUBLByio7LWLqnOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211022; c=relaxed/simple;
	bh=kb/vew87IGl1nyvvi4DxpDjnyDyP/rTcBkfuCZRMKig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SPZJhGOGvoNpmGTFPRkTrEmWV6SKbi1HP03NxbwGpzpHInzFN4K7qKsDI3WxiL7IMxJ9IjTgC2Po3XaWl0dgpxtINWyMtWZoOydzTzNP08zbrdFJJIMlTObkOBoYiMk5lMrEX8pyJ7ll6QbGeJArvu++EWUffNlTgQ97evHdhvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBc57beD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBc57beD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772211021; x=1803747021;
  h=date:from:to:cc:subject:message-id;
  bh=kb/vew87IGl1nyvvi4DxpDjnyDyP/rTcBkfuCZRMKig=;
  b=kBc57beDPFc0yELW0wxZr3q/YtV8xOgUzLoHO18sxZiBdOPxxJxLCsKJ
   Mwv4rmejTybUxNVDTUPubGqsTe/vrio7R+4LOMCUkEhz+TWOmYWWcFp67
   az63Ybj1TZ5t2pcW4/AD9YeYkOtldTvagEkzkDBBbxTjv+3UMSg46UXHo
   cHnj1hNP1XKgXdzMb0TfYhUj0x38xC+XW3GLaJKt6N/7kt0D3nBgDM8tq
   ylmYf9Eu7HRAGRgtmjJMeJR8kpuXo6aMOTkcyIj4v64u3LE2+UIB8Le5V
   K/3NCblfLuno1SQ89rIfB2xjQrToO3lESSDxr2WRfuVZ595h7udjGVjIL
   Q==;
X-CSE-ConnectionGUID: C+XyCWGARR2s0tGzUhh66Q==
X-CSE-MsgGUID: /UDqIQ03Rouo852TT9BJNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77136937"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="77136937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 08:50:20 -0800
X-CSE-ConnectionGUID: TN7gtk9JT1+kxx+iSilunQ==
X-CSE-MsgGUID: phw2z1HFQoyarMD08kpCdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="247454706"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2026 08:50:18 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw128-00000000AoZ-39kq;
	Fri, 27 Feb 2026 16:49:54 +0000
Date: Sat, 28 Feb 2026 00:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Tariq Toukan <tariqt@nvidia.com>
Subject: [linux-next:master 2225/2910]
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:663
 mlx5e_free_mpwqe_rq_drop_page() warn: inconsistent indenting
Message-ID: <202602280022.guFf7QI9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: 0285cc3dac1b4ceb3dacdfce43627d41d649cf47 [2225/2910] net/mlx5e: Alloc rq drop page based on calculated page_shift
config: sparc-randconfig-r073-20260227 (https://download.01.org/0day-ci/archive/20260228/202602280022.guFf7QI9-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280022.guFf7QI9-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en_main.c:663 mlx5e_free_mpwqe_rq_drop_page() warn: inconsistent indenting

vim +663 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

   655	
   656	static void mlx5e_free_mpwqe_rq_drop_page(struct mlx5e_rq *rq)
   657	{
   658		u16 page_order = max_t(s16, rq->mpwqe.page_shift - PAGE_SHIFT, 0);
   659		u32 page_size = BIT(PAGE_SHIFT + page_order);
   660	
   661		dma_unmap_page(rq->pdev, rq->wqe_overflow.addr, page_size,
   662			       rq->buff.map_dir);
 > 663		 __free_pages(rq->wqe_overflow.page, page_order);
   664	}
   665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
