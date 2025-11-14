Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09532F49F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 06:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102823; cv=none; b=QBybtY95zTdJdvto0NYEY0izN5Lzb2PVGRmoynXkJMRUXXmtxOBCqCiUSFSKuB+VPnHJn5fZISDSS/ARJpv/3GPtd4tnQBKh23D3ZESXQZu1KXk42SJ2MJesDrk5XFwgk2Nos5+fJ4qlMKo4W8Kf7Gg5m7Skfsy1ozuT+ohZKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102823; c=relaxed/simple;
	bh=xAsK9ZjcUkGbdxhIeeQHzo6Is7AYo+pWouV43RfXFgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fu8FqxMM8CzVwaLZDK+CjWC94XYpoStdOUZ0GhbcrquSekSIkyuI4E1h/r/ZDo8bnpEWnS3R0n2MBirnz1hjcm9UfHec6qu+u2rptyuIhBWBQgFp1RAusYocvJZI/YJUJhW38mfe/kPzeKBYfOck6bibxqfOA317McyD8qaLzNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATzIzQc3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATzIzQc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102821; x=1794638821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xAsK9ZjcUkGbdxhIeeQHzo6Is7AYo+pWouV43RfXFgw=;
  b=ATzIzQc3AQqUNPJVQ0+hmNpTZW9h1PUvqe7gdDB7jRaws8fo5LVy62Yx
   2ebfQobRfOn9uaBOfPap0ZG0bM5Zc2rKb1ZtFLqoMFt6SMYrKwd9wZxyy
   ofgmPti+ELIZ+pURNmPhTB9IX6IilDo7u6G9JXb2X1Y4fGkhY2ku9XjV3
   8UfSDTHcJCqTDPWFgwhsnJdR++5XJWFfq4AgLqL2ezS5ZmwgE4LtyZw9Y
   m3J+k71zZVd2ihW+wXvppgB76Gy/kWsETZK2JGFnXohSkdhLXvPPAzXqR
   ZA51pIvoJ4tBeIKvrkZzmHKJkR/7VwNzw71gwJyVdM7EkJuM7qDFHGvHF
   g==;
X-CSE-ConnectionGUID: S7gYwFoUR0aFZ7aQy2yy+A==
X-CSE-MsgGUID: mOGsAQB0RC+3E16EoAkg5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65227549"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="65227549"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:00 -0800
X-CSE-ConnectionGUID: 2Evz/0gtTN2JHxx9p2aApA==
X-CSE-MsgGUID: kpBniFlmRyGozVa20gp46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="193824046"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2025 22:47:00 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006F9-0f;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 5/6] vduse: add vq group asid support
Message-ID: <202511141031.9ZZcx4uZ-lkp@intel.com>
References: <20251113115558.1277981-6-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113115558.1277981-6-eperezma@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-add-v1-API-definition/20251113-200303
base:   linus/master
patch link:    https://lore.kernel.org/r/20251113115558.1277981-6-eperezma%40redhat.com
patch subject: [PATCH v9 5/6] vduse: add vq group asid support
config: arc-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141031.9ZZcx4uZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141031.9ZZcx4uZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141031.9ZZcx4uZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_dev_sync_single_for_device':
>> drivers/vdpa/vdpa_user/vduse_dev.c:910:20: warning: variable 'vdev' set but not used [-Wunused-but-set-variable]
     struct vduse_dev *vdev;
                       ^~~~
   drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_dev_sync_single_for_cpu':
   drivers/vdpa/vdpa_user/vduse_dev.c:929:20: warning: variable 'vdev' set but not used [-Wunused-but-set-variable]
     struct vduse_dev *vdev;
                       ^~~~
   drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_dev_map_page':
   drivers/vdpa/vdpa_user/vduse_dev.c:949:20: warning: variable 'vdev' set but not used [-Wunused-but-set-variable]
     struct vduse_dev *vdev;
                       ^~~~
   drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_dev_unmap_page':
   drivers/vdpa/vdpa_user/vduse_dev.c:971:20: warning: variable 'vdev' set but not used [-Wunused-but-set-variable]
     struct vduse_dev *vdev;
                       ^~~~
   drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_dev_alloc_coherent':
   drivers/vdpa/vdpa_user/vduse_dev.c:989:20: warning: variable 'vdev' set but not used [-Wunused-but-set-variable]
     struct vduse_dev *vdev;
                       ^~~~
   drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_dev_need_sync':
   drivers/vdpa/vdpa_user/vduse_dev.c:1034:20: warning: variable 'vdev' set but not used [-Wunused-but-set-variable]
     struct vduse_dev *vdev;
                       ^~~~
   drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_dev_max_mapping_size':
   drivers/vdpa/vdpa_user/vduse_dev.c:1061:20: warning: variable 'vdev' set but not used [-Wunused-but-set-variable]
     struct vduse_dev *vdev;
                       ^~~~


vim +/vdev +910 drivers/vdpa/vdpa_user/vduse_dev.c

c8a6153b6c59d9 Xie Yongji      2021-08-31  905  
1c14b0e4ba9883 Jason Wang      2025-09-24  906  static void vduse_dev_sync_single_for_device(union virtio_map token,
d7b4e3287ca3a7 Maxime Coquelin 2024-02-19  907  					     dma_addr_t dma_addr, size_t size,
d7b4e3287ca3a7 Maxime Coquelin 2024-02-19  908  					     enum dma_data_direction dir)
d7b4e3287ca3a7 Maxime Coquelin 2024-02-19  909  {
f98606c92d03d8 Eugenio Pérez   2025-11-13 @910  	struct vduse_dev *vdev;
1e9ae6f6f2d50d Eugenio Pérez   2025-11-13  911  	struct vduse_as *as;
f98606c92d03d8 Eugenio Pérez   2025-11-13  912  	struct vduse_iova_domain *domain;
f98606c92d03d8 Eugenio Pérez   2025-11-13  913  
f98606c92d03d8 Eugenio Pérez   2025-11-13  914  	if (!token.group)
f98606c92d03d8 Eugenio Pérez   2025-11-13  915  		return;
f98606c92d03d8 Eugenio Pérez   2025-11-13  916  
f98606c92d03d8 Eugenio Pérez   2025-11-13  917  	vdev = token.group->dev;
1e9ae6f6f2d50d Eugenio Pérez   2025-11-13  918  	rcu_read_lock();
1e9ae6f6f2d50d Eugenio Pérez   2025-11-13  919  	as = rcu_dereference(token.group->as);
1e9ae6f6f2d50d Eugenio Pérez   2025-11-13  920  	domain = as->domain;
1e9ae6f6f2d50d Eugenio Pérez   2025-11-13  921  	rcu_read_unlock();
d7b4e3287ca3a7 Maxime Coquelin 2024-02-19  922  	vduse_domain_sync_single_for_device(domain, dma_addr, size, dir);
d7b4e3287ca3a7 Maxime Coquelin 2024-02-19  923  }
d7b4e3287ca3a7 Maxime Coquelin 2024-02-19  924  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
