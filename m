Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0971624C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755666055; cv=none; b=JiJTKu6TQUEH+4nL5110V/Fv1svi3W8WU1hpoUoxU2jLBpzwZANabLe4o8BDlnaUjlVjBCkezCpR5PHmWWVt+g1E4Jw8q2llf7I2WKWI8JhuDBKZAEc7QQlVTaqbwKpORjA/S9wWVYyc9k50SUHrcfDfnbiyr83XrGFnBD3krws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755666055; c=relaxed/simple;
	bh=iZ4/c16OXh/RaoEkUSdyRzlvCP9Ws1bGG3yiLElsKLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCiKUFj1arvddp0EI7I1+idY3VVwvvSBu2xRP6sjiZKG10JEclcsnJeVNzbWhXPT0hF1fiASsRl47vwds6sRWSEcVb2253ty+BxLIgvhw5h4A51KYtfyDmUDT6P1x3Uh31ZzrYtih/mgE+JqRYI9dt4z8VKONPRNFreHmHpRJ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7wEUF+g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7wEUF+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755666054; x=1787202054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iZ4/c16OXh/RaoEkUSdyRzlvCP9Ws1bGG3yiLElsKLw=;
  b=j7wEUF+gVwFoaoKYlkWMiv/JmUYBq3FwQwZQAcYcXQzmyhNHDT6tAwQ5
   DhFhq6QxJLwerihhmclMHof7EVl9Z9VuX++NbAMr1qWkSoh6EIfRqgBlf
   tzvC4cEXSG0hckOIcFyHv/h35ukTu2ibNRwPm4svdi62YVC3SHmtgnWzM
   IIHsViTASNfqgDa83ZF+73i6HpA4yK5S4/1Hls1aBZheMta0CO0Ph7VrS
   QtSeus4YtgK0vI7Qbm5jW9jWGH27wWa2GgViAZPtBsTNLDqcEDbLG5FLj
   smG/wh0KDqQxbQYf49sGzsQJzuN4sLM8vrUrbO2Y4AVV+D3+F6h4oyIQB
   w==;
X-CSE-ConnectionGUID: OqDdhrM+R9Gi0gDEM1+wTQ==
X-CSE-MsgGUID: jojJffEgTdKobCc1W3VVog==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57128346"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57128346"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 22:00:53 -0700
X-CSE-ConnectionGUID: 3kexp0vjTXe2SPYJD6FxSw==
X-CSE-MsgGUID: aS1Yif4cS7eXi7REQkkl+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167250989"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Aug 2025 22:00:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoawL-000I9b-1L;
	Wed, 20 Aug 2025 05:00:49 +0000
Date: Wed, 20 Aug 2025 13:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and
 implementation
Message-ID: <202508201255.tGOgoIaz-lkp@intel.com>
References: <20250819114932.597600-8-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819114932.597600-8-dev@lankhorst.se>

Hi Maarten,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250819]
[cannot apply to tj-cgroup/for-next akpm-mm/mm-everything linus/master v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/page_counter-Allow-for-pinning-some-amount-of-memory/20250819-195117
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250819114932.597600-8-dev%40lankhorst.se
patch subject: [RFC 3/3] drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and implementation
config: i386-buildonly-randconfig-003-20250820 (https://download.01.org/0day-ci/archive/20250820/202508201255.tGOgoIaz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201255.tGOgoIaz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201255.tGOgoIaz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_bo_unpin_user':
>> drivers/gpu/drm/xe/xe_bo.c:1709:17: error: implicit declaration of function 'dmem_cgroup_unpin'; did you mean 'mem_cgroup_init'? [-Werror=implicit-function-declaration]
    1709 |                 dmem_cgroup_unpin(bo->ttm.resource->css, xe_bo_size(bo));
         |                 ^~~~~~~~~~~~~~~~~
         |                 mem_cgroup_init
   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_bo_create_user':
>> drivers/gpu/drm/xe/xe_bo.c:2154:39: error: implicit declaration of function 'dmem_cgroup_try_pin'; did you mean 'mem_cgroup_tryget'? [-Werror=implicit-function-declaration]
    2154 |                                 ret = dmem_cgroup_try_pin(bo->ttm.resource->css, size);
         |                                       ^~~~~~~~~~~~~~~~~~~
         |                                       mem_cgroup_tryget
   cc1: some warnings being treated as errors


vim +1709 drivers/gpu/drm/xe/xe_bo.c

  1701	
  1702	static void xe_bo_unpin_user(struct xe_bo *bo)
  1703	{
  1704		xe_bo_unpin_external(bo);
  1705	
  1706		if (bo->flags & XE_BO_FLAG_SYSTEM)
  1707			WARN_ON(1);
  1708		else
> 1709			dmem_cgroup_unpin(bo->ttm.resource->css, xe_bo_size(bo));
  1710	}
  1711	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
