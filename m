Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28F275AFE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376585; cv=none; b=OO2qzfR0ea6iXr+LaiJjGh0LffTOowt6AydfPZRcLyklnTwW2ozze3vPWtq/A/hdR5o2TmBWSnyu5239hyCliX0sK3hlT6nUPyBkAF6WcxRnjWcb7pAGCpeqL4z3pLmCNsMlPQQ67nW3AYJaD2df6OZJwWuKz9pdJD7a2NY8SCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376585; c=relaxed/simple;
	bh=10wsBQAnUR5ZPYn89F7zSsTY+CJk4YZy8H8tXWW+nVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hCI2LAhX5zX7osuKX8GY6pkNGVDAiCdgzybh3kqOyIGHow9H7W5s8bmBhHM9NEBI7lM3QzZsX3/PlticDwgg03oto08LDDvglQvV6+lV8dWM6LL78oe8ob4cTva8Icix6qyuLFPsKNiB6U0QMGzHYd0Wa18y1tmG7aqVkc0ONBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJpuA4J+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJpuA4J+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751376584; x=1782912584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10wsBQAnUR5ZPYn89F7zSsTY+CJk4YZy8H8tXWW+nVE=;
  b=XJpuA4J+x0lCEWcsqEob4ATD3QtyzkC65C5XAG9rt8GALpeHtidS9zCl
   W3fXnO0cBMFiDdn989xw7bv79TgFLbVUaNiggQ2Qwr5Nx5RBbL0cPYN/k
   llU+en/7LaiAcsmuEuc3NGZnGnzbUe8m4vPNDs128zabjM6gWuFPEcNf8
   udjWptVhsJYd42zr51v1tLpdmIQHUp6VPMaPmrjHsXPfEg9xn/w5dM7u/
   m/mJUG8nfVlLHWlOWxud0uRA4afDqNDaZa9/Huln38+4OOqiBDFDtn5+w
   Nle172pajzkJOGAp3IGydmQ7/kBliRlrq7eL5d1yX8SSXkI1RDYnYcIn/
   w==;
X-CSE-ConnectionGUID: 2Jsb2gFuSiCOVzSxX2AqOQ==
X-CSE-MsgGUID: jM6Gxlt+QwGHEJ9eLV/Qyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="76189776"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="76189776"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 06:29:43 -0700
X-CSE-ConnectionGUID: aQh4tUgeRMmEzh5sUJ6jTw==
X-CSE-MsgGUID: yhT5CeLWShSHPyBaA/HFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159484891"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jul 2025 06:29:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWb3M-000aD2-0D;
	Tue, 01 Jul 2025 13:29:40 +0000
Date: Tue, 1 Jul 2025 21:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 19/24] drivers/accel/ethos/ethos_job.c:532:33:
 warning: format '%ld' expects argument of type 'long int', but argument 5
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202507012104.RRJ0WgWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   e2533aabd58e39b5a86438a8884e75b665fd885c
commit: e47b72ad46c1f22faaea2d29a7f24ac294b5893c [19/24] drm: ethos: Add bounds check on cmd stream regions
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250701/202507012104.RRJ0WgWj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507012104.RRJ0WgWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507012104.RRJ0WgWj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-buf.h:21,
                    from include/drm/drm_gem.h:38,
                    from include/drm/drm_gem_dma_helper.h:7,
                    from drivers/accel/ethos/ethos_gem.h:8,
                    from drivers/accel/ethos/ethos_job.c:7:
   drivers/accel/ethos/ethos_job.c: In function 'ethos_ioctl_submit_job':
>> drivers/accel/ethos/ethos_job.c:532:33: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     532 |                                 "cmd stream region %d size greater than BO size (%lld > %ld)\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/accel/ethos/ethos_job.c:531:25: note: in expansion of macro 'dev_err'
     531 |                         dev_err(dev->dev,
         |                         ^~~~~~~
   drivers/accel/ethos/ethos_job.c:532:91: note: format string is defined here
     532 |                                 "cmd stream region %d size greater than BO size (%lld > %ld)\n",
         |                                                                                         ~~^
         |                                                                                           |
         |                                                                                           long int
         |                                                                                         %d


vim +532 drivers/accel/ethos/ethos_job.c

   493	
   494	
   495	static int ethos_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
   496					   struct drm_ethos_job *job)
   497	{
   498		struct ethos_device *edev = to_ethos_device(dev);
   499		struct ethos_file_priv *file_priv = file->driver_priv;
   500		struct ethos_job *ejob = NULL;
   501		int ret = 0;
   502	
   503		ejob = kzalloc(sizeof(*ejob), GFP_KERNEL);
   504		if (!ejob)
   505			return -ENOMEM;
   506	
   507		kref_init(&ejob->refcount);
   508	
   509		ejob->dev = edev;
   510	
   511		ret = drm_sched_job_init(&ejob->base,
   512					 &file_priv->sched_entity,
   513					 1, NULL);
   514		if (ret)
   515			goto out_put_job;
   516	
   517		ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
   518		if (!ejob->cmd_bo)
   519			goto out_cleanup_job;
   520	
   521		for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
   522			struct drm_gem_object *gem;
   523	
   524			if (job->region_bo_handles[i] == 0)
   525				continue;
   526	
   527			gem = drm_gem_object_lookup(file, job->region_bo_handles[i]);
   528	
   529			/* Verify the command stream doesn't have accesses outside the BO */
   530			if (to_ethos_bo(ejob->cmd_bo)->info->region_size[i] > gem->size) {
   531				dev_err(dev->dev,
 > 532					"cmd stream region %d size greater than BO size (%lld > %ld)\n",
   533					i, to_ethos_bo(ejob->cmd_bo)->info->region_size[i],
   534					gem->size);
   535				ret = -EOVERFLOW;
   536				goto out_cleanup_job;
   537			}
   538	
   539			ejob->region_bo[ejob->region_cnt] = gem;
   540			ejob->region_bo_num[ejob->region_cnt] = i;
   541			ejob->region_cnt++;
   542		}
   543		ret = ethos_job_push(ejob);
   544		if (ret)
   545			goto out_cleanup_job;
   546	
   547	out_cleanup_job:
   548		if (ret)
   549			drm_sched_job_cleanup(&ejob->base);
   550	out_put_job:
   551		ethos_job_put(ejob);
   552	
   553		return ret;
   554	}
   555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
