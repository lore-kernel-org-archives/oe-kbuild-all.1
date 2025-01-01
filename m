Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C427286A1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735721545; cv=none; b=nihILUnwUgCgOc+hU8yClKq0pieDR5tK596oHsq6OtzKR9DK2/t4KwZHbVCyqqMNh3Te7pROO4cDU5rbzUcO+z/MLV+sq+p87aF2WEAU/g9cwjZNakrJgQgHAqneCQt+3mOyZTOfT7VAnTpLpDvass4q1/eIiDFSLbVTztjRhjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735721545; c=relaxed/simple;
	bh=De4o09S7oEgOZdHWUUoLfZBoL9EU6AjvVG8hlTJtKmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uOnNLGyAwPW0UwIfg22A+MGvTbV+Zl4dF6DET/g1Us5GT01/Bw4iqB8fIA4vM9a1uFDGof9A9Jben7GfZDaJ+iIV0iWIbwtCmUfg40wNtdlBYcgOzU+x/fKlWpmg6KaFL8sYtfbhPRHOPE2K/QfAitE2OdA4CG4K52upXxaOOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVly4ufE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVly4ufE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735721543; x=1767257543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=De4o09S7oEgOZdHWUUoLfZBoL9EU6AjvVG8hlTJtKmI=;
  b=RVly4ufELiqWoweQRQe9DLLuQE0Cvgi0ppLOn0eRSrtiNiTjmNOjEJ6H
   vOLu0DsPHpR46cjGCwYijhCTrj2aMc7/dlrzx1DqkR0gtwLsLUG1ibNrY
   y+kzK6GH8EZYjIh1LTfCEZr7H+baKH1slTfYpY8yaFQhT6DkuXZ96cpoB
   zns7dQV2GcmgiWN91PAqG+eN5rY2vuZpR9QOIu0DPijO9pMUMOfNAU5Ap
   XWkIc0OCY+TVxmFDdbgjm8oqHEFj3Vz0/4UEltPWJxkicq+pq03UYNbIM
   3RgPsnpnwBWY3tYt32nfwtsOyHmxbYMPN0mo0IMly8cIPo2TwZKA/0jKr
   g==;
X-CSE-ConnectionGUID: Mv5/Wr+aQGmzZ/5qccr2mg==
X-CSE-MsgGUID: /P8oBHF2QKOU7TuR16yXAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47339205"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="47339205"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 00:52:22 -0800
X-CSE-ConnectionGUID: xsqhr26ARBuXrdkR0vOyeA==
X-CSE-MsgGUID: Pk+LWbaITteGcYyMZC9wMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124497083"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jan 2025 00:52:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSuSh-0007jJ-1s;
	Wed, 01 Jan 2025 08:52:19 +0000
Date: Wed, 1 Jan 2025 16:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2616/2616] mm/memcontrol.c:4167:5: warning: no
 previous prototype for 'memcg_swapmax_read'
Message-ID: <202501011625.6qilIzlu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   55bf638d3d29c53ddd64ed89efda8b70b47ccbbc
commit: 5361bef36768820fb029e081a669749b8001769e [2616/2616] memcg: add restrict to swap to cgroup1
config: arm64-randconfig-r052-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011625.6qilIzlu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011625.6qilIzlu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011625.6qilIzlu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4167:5: warning: no previous prototype for 'memcg_swapmax_read' [-Wmissing-prototypes]
    4167 | u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
         |     ^~~~~~~~~~~~~~~~~~


vim +/memcg_swapmax_read +4167 mm/memcontrol.c

  4166	
> 4167	u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
  4168	{
  4169		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  4170	
  4171		if (!static_branch_likely(&memcg_swap_qos_key))
  4172			return PAGE_COUNTER_MAX * PAGE_SIZE;
  4173	
  4174		return READ_ONCE(memcg->swap_dev->max) * PAGE_SIZE;
  4175	}
  4176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
