Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3709D1E1A05
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712121; cv=none; b=GgqZ+HXCZZorsR9/lHZocYLd0Ivv0xO7wfbEM7PaknlC6xFDGZiNE6EIGNP4/bZ6G0izplkhV/AFY8WsvEaBkv+okfvAuJbqx6JOfUy06bLEX3oEGdLht+CtvolU4ga9oVXtd91bjKk9w3Slzf5K3N12vgNTycUhh6sPVwwkJkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712121; c=relaxed/simple;
	bh=wxmJpfrdKInlgAz/dCH62FjikCtaiFHh9ygru2Nai9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRjzoQ3JLEEP1+qdE8Fb8iPdMRXPAXZ0iVpCe2UxhLC09BnQcJ5F/TVc6gmsvFSqUu3iUWESfuwqhSImh+IaSrjCT47koqYKlE8k/E7zYZ6EuxfjM/afnemB93IGMUF6oSVSUrVNWZJuFp9lit2FArV5dTwjjYFsrPRZh7pQA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIo8Urxx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIo8Urxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750712119; x=1782248119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxmJpfrdKInlgAz/dCH62FjikCtaiFHh9ygru2Nai9g=;
  b=RIo8UrxxxD1A2fM8Ia0QlBk7TXqsLVhE4SFCoyvwpCAeBm+tWp7XZOhQ
   3VgzchzVXu9QdQqmuI/8TgnP0/uoBb5qiwQ7wQt38Cjh3i19e0NUTDQAF
   Dx8zXmPzioR2bHXZmM+fQCDdMMsUfovfGl0Smc10NBMDsK/wixQRmAD8f
   4Rjjc+I/zYVc4M1bfG0rRk+gc44uWT80GpuhccMkIXizCTirEbqN4ZIBS
   T8aM/ZXnyNzpODYHoYEKNgofz9I3N+nuwOzqOb5WgEz/8Z5FFzSnNZi4O
   BMK4m4ylhNA4UPJlpR+yl5HYBptbamSWciDuEerg5ErZqLdBjM5qpT4+j
   Q==;
X-CSE-ConnectionGUID: LEmhhTDERu6NS+0I4x63EA==
X-CSE-MsgGUID: 35RTkBYlRuyBB4GYbpHQJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64366284"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="64366284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 13:55:18 -0700
X-CSE-ConnectionGUID: dGojPkxtR0a9JOAnOQqO7g==
X-CSE-MsgGUID: TVL+cyxPSk+M0qF79ju3tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="182748039"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2025 13:55:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uToCA-000PKc-1b;
	Mon, 23 Jun 2025 20:55:14 +0000
Date: Tue, 24 Jun 2025 04:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 2/3] drivers/accel/ethos/ethos_gem.c:224:57:
 warning: cast from pointer to integer of different size
Message-ID: <202506240459.XpUTirDo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   76f13e926b6aad5010b3dab68522a69904decf65
commit: 18fbf33e2b12d61167868142a4b47c598e9442f2 [2/3] accel: Add initial Arm Ethos driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240459.XpUTirDo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240459.XpUTirDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240459.XpUTirDo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-buf.h:21,
                    from drivers/accel/ethos/ethos_gem.c:5:
   drivers/accel/ethos/ethos_gem.c: In function 'ethos_gem_cmdstream_create':
>> drivers/accel/ethos/ethos_gem.c:224:57: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     224 |         dev_info(ddev->dev, "created cmd BO at %llx\n", (u64)bo->base.vaddr);
         |                                                         ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/accel/ethos/ethos_gem.c:224:9: note: in expansion of macro 'dev_info'
     224 |         dev_info(ddev->dev, "created cmd BO at %llx\n", (u64)bo->base.vaddr);
         |         ^~~~~~~~
--
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-buf.h:21,
                    from include/drm/drm_gem.h:38,
                    from include/drm/drm_gem_dma_helper.h:7,
                    from drivers/accel/ethos/ethos_gem.h:9,
                    from drivers/accel/ethos/ethos_job.c:8:
   drivers/accel/ethos/ethos_job.c: In function 'ethos_job_hw_submit':
>> drivers/accel/ethos/ethos_job.c:79:41: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      79 |                 dev_info(dev->base.dev, "Region %d base addr = %llx\n", region, bo->dma_addr);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/accel/ethos/ethos_job.c:79:17: note: in expansion of macro 'dev_info'
      79 |                 dev_info(dev->base.dev, "Region %d base addr = %llx\n", region, bo->dma_addr);
         |                 ^~~~~~~~
   drivers/accel/ethos/ethos_job.c:79:67: note: format string is defined here
      79 |                 dev_info(dev->base.dev, "Region %d base addr = %llx\n", region, bo->dma_addr);
         |                                                                ~~~^
         |                                                                   |
         |                                                                   long long unsigned int
         |                                                                %x
   drivers/accel/ethos/ethos_job.c:89:17: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      89 |                 "Submitted cmd at 0x%llx to core\n", cmd_bo->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/accel/ethos/ethos_job.c:88:9: note: in expansion of macro 'dev_info'
      88 |         dev_info(dev->base.dev,
         |         ^~~~~~~~
   drivers/accel/ethos/ethos_job.c:89:40: note: format string is defined here
      89 |                 "Submitted cmd at 0x%llx to core\n", cmd_bo->dma_addr);
         |                                     ~~~^
         |                                        |
         |                                        long long unsigned int
         |                                     %x


vim +224 drivers/accel/ethos/ethos_gem.c

   196	
   197	/**
   198	 * ethos_gem_cmdstream_create() - Create a GEM object and attach it to a handle.
   199	 * @file: DRM file.
   200	 * @ddev: DRM device.
   201	 * @exclusive_vm: Exclusive VM. Not NULL if the GEM object can't be shared.
   202	 * @size: Size of the GEM object to allocate.
   203	 * @flags: Combination of drm_ethos_bo_flags flags.
   204	 * @handle: Pointer holding the handle pointing to the new GEM object.
   205	 *
   206	 * Return: Zero on success
   207	 */
   208	int
   209	ethos_gem_cmdstream_create(struct drm_file *file,
   210				       struct drm_device *ddev,
   211				       u32 *size, u64 data, u32 flags, u32 *handle)
   212	{
   213		int ret;
   214		struct drm_gem_dma_object *mem;
   215		struct ethos_gem_object *bo;
   216	
   217		dev_info(ddev->dev, "creating cmd BO\n");
   218		mem = drm_gem_dma_create(ddev, *size);
   219		if (IS_ERR(mem))
   220			return PTR_ERR(mem);
   221	
   222		bo = to_ethos_bo(&mem->base);
   223		bo->flags = flags;
 > 224		dev_info(ddev->dev, "created cmd BO at %llx\n", (u64)bo->base.vaddr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
