Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D542BD11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771761525; cv=none; b=H9VJGZpF1dvLHixjmhez/KALIZWDt5PlpexCfDIX3e++D8Mcou5VrxiMEPHlHeweuM6jxtxQ6dmDhRymuxWMrd/VIDNz4IK4OwthuZbwIXEd7S+/S83ArhFzDazWSeZQuiztLnh2gggLsgvxYlRB/Wq/48ZUL7eViZ4QGwp0Ajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771761525; c=relaxed/simple;
	bh=95pmaP666IWVDs4KrS6UzIxLygyFtvC2jNv5elb2nws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iZ1AYQ4V9LoWryEV4HiMZut3rFVZZX/bCidF2bQBW1pVA50HUtgTEwoeUHmsSTsmPR9cQkL1uyPkEDtUN8UVncL2as/KZjxCJP3ZjjTQ1VISvKQ10HmiodeP1PcO54Qq31kpMNaj+mUOmgxV8Y0KXWIthm9qefxaB7oMiT6YLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMX8NsxY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMX8NsxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771761522; x=1803297522;
  h=date:from:to:cc:subject:message-id;
  bh=95pmaP666IWVDs4KrS6UzIxLygyFtvC2jNv5elb2nws=;
  b=GMX8NsxYFKYj2R5LZHQFXTZBy257vTrfqqQ1RmLe76XgUkrn+4PsboW9
   DNJm7vb0drCsGk1JLtiwuauTcRONtEPQO5L46VfqexWuT1U3W/JdOF6nH
   qKPccXtVHog5tsJKW40kR+hO6XiGm+oF/8eX81xgDVvXgj5yO7yFlbk8S
   KZhMNx9LVwCmVwg4jPz/g4oFGNT0+dGVZpmBH1df+4Jtu0PtY4UwaCW60
   oGKo2l71YRrDDFFIeechBVSfK7CmxezFNpwnroZSTdx8TruMnPKL8035Y
   iD6OIk0eKxS5FTKzDU6ge9qdk/WQzhJvOyn7PMPC22KKNbChg9uMrQErN
   Q==;
X-CSE-ConnectionGUID: +mMXHwSyTPW03SduEuke/A==
X-CSE-MsgGUID: 3d6rxAzgR6ijDdhQ6xv/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="83408465"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="83408465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 03:58:42 -0800
X-CSE-ConnectionGUID: mq7I+wGsQ52k49Z5riis5A==
X-CSE-MsgGUID: 7HYwJuX7QzKON/qZ4zoPlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="215426174"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2026 03:58:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu86e-000000015SW-44K8;
	Sun, 22 Feb 2026 11:58:37 +0000
Date: Sun, 22 Feb 2026 19:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 19/60]
 drivers/dax/kmem.c:216:1: warning: control reaches end of non-void function
Message-ID: <202602221901.2hvPihLP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: 5ff2dd414217df1fbed8de6c06536504e2ec2103 [19/60] dax/kmem: add sysfs interface for atomic whole-device hotplug
config: s390-randconfig-002-20260222 (https://download.01.org/0day-ci/archive/20260222/202602221901.2hvPihLP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221901.2hvPihLP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221901.2hvPihLP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dax/kmem.c: In function 'dax_kmem_do_hotremove':
   drivers/dax/kmem.c:215:10: error: 'ENOSUPP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
     return -ENOSUPP;
             ^~~~~~~
             ENOTSUPP
   drivers/dax/kmem.c:215:10: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/dax/kmem.c:216:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +216 drivers/dax/kmem.c

af7cd15fb8a39f Gregory Price 2026-01-14  166  
af7cd15fb8a39f Gregory Price 2026-01-14  167  #ifdef CONFIG_MEMORY_HOTREMOVE
af7cd15fb8a39f Gregory Price 2026-01-14  168  /**
af7cd15fb8a39f Gregory Price 2026-01-14  169   * dax_kmem_do_hotremove - hot-remove memory for dax kmem device
af7cd15fb8a39f Gregory Price 2026-01-14  170   * @dev_dax: the dev_dax instance
af7cd15fb8a39f Gregory Price 2026-01-14  171   * @data: the dax_kmem_data structure with resource tracking
af7cd15fb8a39f Gregory Price 2026-01-14  172   *
5ff2dd414217df Gregory Price 2026-01-14  173   * Offlines and removes all ranges in the dev_dax region.
af7cd15fb8a39f Gregory Price 2026-01-14  174   *
5ff2dd414217df Gregory Price 2026-01-14  175   * Returns the number of successfully removed ranges, or negative error.
af7cd15fb8a39f Gregory Price 2026-01-14  176   */
af7cd15fb8a39f Gregory Price 2026-01-14  177  static int dax_kmem_do_hotremove(struct dev_dax *dev_dax,
af7cd15fb8a39f Gregory Price 2026-01-14  178  				 struct dax_kmem_data *data)
af7cd15fb8a39f Gregory Price 2026-01-14  179  {
af7cd15fb8a39f Gregory Price 2026-01-14  180  	struct device *dev = &dev_dax->dev;
af7cd15fb8a39f Gregory Price 2026-01-14  181  	int i, success = 0;
af7cd15fb8a39f Gregory Price 2026-01-14  182  
af7cd15fb8a39f Gregory Price 2026-01-14  183  	for (i = 0; i < dev_dax->nr_range; i++) {
af7cd15fb8a39f Gregory Price 2026-01-14  184  		struct range range;
af7cd15fb8a39f Gregory Price 2026-01-14  185  		int rc;
af7cd15fb8a39f Gregory Price 2026-01-14  186  
af7cd15fb8a39f Gregory Price 2026-01-14  187  		rc = dax_kmem_range(dev_dax, i, &range);
af7cd15fb8a39f Gregory Price 2026-01-14  188  		if (rc)
af7cd15fb8a39f Gregory Price 2026-01-14  189  			continue;
af7cd15fb8a39f Gregory Price 2026-01-14  190  
af7cd15fb8a39f Gregory Price 2026-01-14  191  		/* Skip ranges not currently added */
af7cd15fb8a39f Gregory Price 2026-01-14  192  		if (!data->res[i])
af7cd15fb8a39f Gregory Price 2026-01-14  193  			continue;
af7cd15fb8a39f Gregory Price 2026-01-14  194  
5ff2dd414217df Gregory Price 2026-01-14  195  		rc = offline_and_remove_memory(range.start, range_len(&range));
af7cd15fb8a39f Gregory Price 2026-01-14  196  		if (rc == 0) {
af7cd15fb8a39f Gregory Price 2026-01-14  197  			/* Release the resource for the successfully removed range */
af7cd15fb8a39f Gregory Price 2026-01-14  198  			remove_resource(data->res[i]);
af7cd15fb8a39f Gregory Price 2026-01-14  199  			kfree(data->res[i]);
af7cd15fb8a39f Gregory Price 2026-01-14  200  			data->res[i] = NULL;
af7cd15fb8a39f Gregory Price 2026-01-14  201  			success++;
af7cd15fb8a39f Gregory Price 2026-01-14  202  			continue;
af7cd15fb8a39f Gregory Price 2026-01-14  203  		}
af7cd15fb8a39f Gregory Price 2026-01-14  204  		any_hotremove_failed = true;
af7cd15fb8a39f Gregory Price 2026-01-14  205  		dev_err(dev, "mapping%d: %#llx-%#llx hotremove failed\n",
af7cd15fb8a39f Gregory Price 2026-01-14  206  			i, range.start, range.end);
af7cd15fb8a39f Gregory Price 2026-01-14  207  	}
af7cd15fb8a39f Gregory Price 2026-01-14  208  
af7cd15fb8a39f Gregory Price 2026-01-14  209  	return success;
af7cd15fb8a39f Gregory Price 2026-01-14  210  }
af7cd15fb8a39f Gregory Price 2026-01-14  211  #else
af7cd15fb8a39f Gregory Price 2026-01-14  212  static int dax_kmem_do_hotremove(struct dev_dax *dev_dax,
af7cd15fb8a39f Gregory Price 2026-01-14  213  				 struct dax_kmem_data *data)
af7cd15fb8a39f Gregory Price 2026-01-14  214  {
af7cd15fb8a39f Gregory Price 2026-01-14  215  	return -ENOSUPP;
af7cd15fb8a39f Gregory Price 2026-01-14 @216  }
af7cd15fb8a39f Gregory Price 2026-01-14  217  #endif /* CONFIG_MEMORY_HOTREMOVE */
af7cd15fb8a39f Gregory Price 2026-01-14  218  

:::::: The code at line 216 was first introduced by commit
:::::: af7cd15fb8a39fb0d8799c2d54dae5864d67632b dax/kmem: extract hotplug/hotremove helper functions

:::::: TO: Gregory Price <gourry@gourry.net>
:::::: CC: Gregory Price <gourry@gourry.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
