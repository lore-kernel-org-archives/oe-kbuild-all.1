Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E51CC141
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 22:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732832981; cv=none; b=FQ4ZX73Vs0Xwre7Xo1knojYweWh7VwInJbGtZmZY/Hr8G97PGvScCchaL+wxMmMiODp/pQotZuK7tYDmYJMFZlCtPLrZokS5mXJJOI9i2zwTFVHqagrYeLufxiH+9X09DBqNSVc2xTUW3+VFsip3B5VO7GesoV4Ykn+Pch98nks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732832981; c=relaxed/simple;
	bh=eu5kcjgq6moLgYJ769IW5ppHDFFMbUvXB8Z3EcCWdKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8N7PdyGfkVOK/ERwbMQZHIPNWOaOeBwUDYIE/88ehRyRNwd6W/3TvLDhKUPCR2GAq7d61XLWfIsYuhrWvNl9tm72mXvi1nny60xuPTDvZSKBspk+2g446iEZF7cy26fD5jFINujuHPH6AB7XQNOMfameg3hQyOHSdir4pdGQlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qkx0yD3Y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qkx0yD3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732832979; x=1764368979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eu5kcjgq6moLgYJ769IW5ppHDFFMbUvXB8Z3EcCWdKE=;
  b=Qkx0yD3YjOMDk3fiIKxG0/RkvVGYjyllV9cqni9InWg5sxvtGbQ6/cNf
   BsvKzWx9XpO2FCtfv1AfrcVo8wrG6oN6Rl40B5s12qK3sof/XjYBScwU2
   A7ZIFh1AvhKzfBA5h1x0HpnVT6McFq4oF9QSMgHLXbc95BBQ/Rhz0DKEW
   ISySCKlSbnP+dCc2U1oIDyhnXza2XE8dwzowR3rJ5kg4PZ8njNJYazYZ9
   yPr46s0lqQOhxLQJZXWAY5w03Irh1YnogYJoMGPf9ISYNRa4NP5jbdBgY
   GAeUzx6JAy9zA5i22T5YTVpeov+jiDhokro/QakWMC3VLBS9v+quvpkl+
   g==;
X-CSE-ConnectionGUID: ZlEQ3mrsQ/qSBAyo8uQw9Q==
X-CSE-MsgGUID: lsMxGGsUS6Gw+YcrSfAPqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33221990"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33221990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 14:29:39 -0800
X-CSE-ConnectionGUID: aQ6dhS4ZQj6AypPxo7rQXw==
X-CSE-MsgGUID: Kh4O2e1QSA6XMxK7ruUWxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="91953195"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Nov 2024 14:29:38 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGn0y-000A6n-05;
	Thu, 28 Nov 2024 22:29:36 +0000
Date: Fri, 29 Nov 2024 06:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1559/1559]
 arch/arm64/kernel/virtcca_cvm_guest.c:139:6: warning: no previous prototype
 for 'enable_swiotlb_for_cvm_dev'
Message-ID: <202411290612.rtQtIYE0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 77313e84cc513055342c5e92ac8854e78bc15276 [1559/1559] virtcca feature : disable swiotlb for passthrough device
config: arm64-randconfig-004-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290612.rtQtIYE0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290612.rtQtIYE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290612.rtQtIYE0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/virtcca_cvm_guest.c:139:6: warning: no previous prototype for 'enable_swiotlb_for_cvm_dev' [-Wmissing-prototypes]
     139 | void enable_swiotlb_for_cvm_dev(struct device *dev, bool enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/enable_swiotlb_for_cvm_dev +139 arch/arm64/kernel/virtcca_cvm_guest.c

   138	
 > 139	void enable_swiotlb_for_cvm_dev(struct device *dev, bool enable)
   140	{
   141		if (!is_virtcca_cvm_world())
   142			return;
   143	
   144		if (enable)
   145			swiotlb_dev_init(dev);
   146		else
   147			dev->dma_io_tlb_mem = &io_tlb_no_swiotlb_mem;
   148	}
   149	EXPORT_SYMBOL_GPL(enable_swiotlb_for_cvm_dev);
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
