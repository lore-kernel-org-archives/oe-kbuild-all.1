Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617694D7D2F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401063; cv=none; b=PKWgV7UYWfPJmwIUX6y26Ve3wgoqo1pdgL2dlMOyQz+hUzgJ9AbpUz2K8FTy2BS1topofiwH/z45WmPHtDQuhgXK0DeoCd6GLWuc30/pM/ju8qGAxjmUGinO8Huo6jZ7wr2w281x47m8rVk8hhGxO8L/9innbeUIBbD5pDB+wt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401063; c=relaxed/simple;
	bh=XnUdJf5eKDRboCtb3nidv1o0jx6HhjrOjOe7ObZsUOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=angekCAVUjqcG79Pbi/RM1h7vMAqaac9HSuJu8VW55r1E+pf96Gy8Su7quLv5qXhkUmoStXpjX6bC4RTsdrWucOZe3kFjKLYTuq5Vk6UYWKh+DtB30UaOAxmEJKmlhsvMEzxpy9C6t9B1AZMPjHBDEP62iyYRB9ygkF/8+24va4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMJJebvy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMJJebvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791401063; x=1822937063;
  h=date:from:to:cc:subject:message-id;
  bh=XnUdJf5eKDRboCtb3nidv1o0jx6HhjrOjOe7ObZsUOI=;
  b=aMJJebvyFyghtL+8nKmyrCZw79GNp4kYVVD48EjF0cgY1/kBLRc5S105
   2AYa4m2Clmg0rA52AL3yqo70EyECiEDuVBx/dL5ywpQXahMihfZJ9UUn6
   82iz8LwCRyYWTR0+EGkANZnA2qYIXSBZpUNWgZy8/gfAE/2hWnvFUqZ8B
   Fy4iBTqVAtIeqKiGffpk5eIdoXRhDpfTXpvlQAkIM8hwBvOHbLwZnbjiz
   D0KeC9hE/ZVy3rUSpyao/5DouB57Nye9VLtNxxS5NdD9P4y/1ELArp5R3
   gnKzOvrzf8kc7B4xgEahRqSg8JsN4ppDfNv0E4MJyWKnpM5yjuRuvzpKU
   Q==;
X-CSE-ConnectionGUID: k6nCJcwvQdKrPv2YoW39vg==
X-CSE-MsgGUID: PAhhNiouRpOHC2e1b+X2nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="73037"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="73037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 12:24:22 -0700
X-CSE-ConnectionGUID: tvfe3k7yQnKQpwP59R/Ekg==
X-CSE-MsgGUID: P+jDUC7RTyi/ZdhNnZ+eFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="315559215"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 07 Oct 2026 12:24:21 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEXFS-000000003s7-0jkx;
	Wed, 07 Oct 2026 19:24:18 +0000
Date: Wed, 07 Oct 2026 21:23:22 +0200
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v9 13/13] io_uring/rsrc.c:922:undefined
 reference to `io_register_dmabuf'
Message-ID: <202610072132.9tkes4F3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v9
head:   a71d400980af9de2724bcc5d201040a930eecaf4
commit: a71d400980af9de2724bcc5d201040a930eecaf4 [13/13] io_uring/rsrc: add dmabuf backed registered buffers
config: m68k-randconfig-r2101-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072132.9tkes4F3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072132.9tkes4F3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072132.9tkes4F3-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: io_uring/rsrc.o: in function `io_register_dmabuf_desc':
>> io_uring/rsrc.c:922:(.text+0x30da): undefined reference to `io_register_dmabuf'


vim +922 io_uring/rsrc.c

   902	
   903	static struct io_rsrc_node *io_register_dmabuf_desc(struct io_ring_ctx *ctx,
   904							    struct io_uring_regbuf_desc *desc)
   905	{
   906		struct io_rsrc_node *node = NULL;
   907		struct io_mapped_ubuf *imu = NULL;
   908		int ret;
   909	
   910		node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
   911		if (!node)
   912			return ERR_PTR(-ENOMEM);
   913	
   914		imu = io_alloc_imu(ctx, 0);
   915		if (!imu) {
   916			ret = -ENOMEM;
   917			goto err;
   918		}
   919		memset(imu, 0, sizeof(*imu));
   920		refcount_set(&imu->refs, 1);
   921	
 > 922		ret = io_register_dmabuf(ctx, desc, imu);
   923		if (ret)
   924			goto err;
   925		node->buf = imu;
   926		return node;
   927	err:
   928		if (imu)
   929			io_free_imu(ctx, imu);
   930		if (node)
   931			io_cache_free(&ctx->node_cache, node);
   932		return ERR_PTR(ret);
   933	}
   934	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
