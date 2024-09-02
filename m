Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FF61388
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 03:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725246939; cv=none; b=NZ1fetzctsXdzmcS81/7TG9M5HBISwxiYEYbCa6PI6FkLdj8Bwec/5HsGa1r3oG0wVJVYVrvbaE04G5RRH0EZ+33B6uO+IA1mCftV2maXWNrb8VFPMdgxIV0zPZh67a0UaD/nDs6XmYv9v7DPDSpfGRiPDiDt1Pev4PWxna2hC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725246939; c=relaxed/simple;
	bh=bo+MlHBZffzLNLz8alAokbHK116YuWlR/rA5Vz9vdww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFQHpPNlzQXefE0daCr16RRlFLI39U9pU+r8osA4VnWrhp6Rs0JIMzEEwM9ClqXEock66liiFZt6g/6SE7LQ+4B98dAfwODol63EujP3bh+ljDjubpNPUD29XSQCR0gmzF2jjyB+PV1+4uAZZcd4hCp9ibC+/qBdUhVLqmCTo1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhTItLyV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhTItLyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725246937; x=1756782937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bo+MlHBZffzLNLz8alAokbHK116YuWlR/rA5Vz9vdww=;
  b=nhTItLyVXCI9mCYOhDd4uYz7Z2DWZzAwLqVcscMDWvJt4VwtiopbmVWD
   DKRpjaURTqEG1rzmxoAtFs4TPBcJerVsmBclLEHvIGf1mY+5viAzdZW6t
   puJnK9NclM//qtJLO6CTF6X/5dObBirnu4f22ZuotaUubRiqQ8aTrXcQJ
   Yj45WRBFm25Jm8OveoQ4To8DyurILnHd81jYnGNHjlB9ZGq1SYEXPK9S3
   lDNYI7UZ99bj4GrSsXcds6XGx0qNpDVphhlgloIS+ZQk40MIVz/b2XwXB
   u0t1a6zwMjmF7wNyyQE42GhRthZj6s6uQB2sAHV7pAn/tYrnEp5GGDtZa
   w==;
X-CSE-ConnectionGUID: PolCk5goQMKcsvpo/zn0Lg==
X-CSE-MsgGUID: zaFno8X8Q7yeSgJFqf0H+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="46322043"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="46322043"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 20:15:37 -0700
X-CSE-ConnectionGUID: l91UIdDESmyM8jJ0hSni7A==
X-CSE-MsgGUID: zqa4fV/0Ry28e3zt2YTQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="95286436"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Sep 2024 20:15:36 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skxXS-00054z-11;
	Mon, 02 Sep 2024 03:15:34 +0000
Date: Mon, 2 Sep 2024 11:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <202409021023.EWUGtkoV-lkp@intel.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829171238.609481-1-boris.brezillon@collabora.com>

Hi Boris,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-misc/drm-misc-next linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-sched-Fix-a-UAF-on-drm_sched_fence-sched/20240830-012038
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240829171238.609481-1-boris.brezillon%40collabora.com
patch subject: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240902/202409021023.EWUGtkoV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021023.EWUGtkoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021023.EWUGtkoV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h:28,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h:29,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:25:
   include/drm/gpu_scheduler.h: In function 'drm_sched_fence_timeline_release':
>> include/drm/gpu_scheduler.h:290:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     290 |         kfree(tl->name);
         |         ^~~~~
   In file included from include/linux/resource_ext.h:11,
                    from include/linux/pci.h:40,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:52:
   include/linux/slab.h: At top level:
   include/linux/slab.h:278:6: warning: conflicting types for 'kfree'; have 'void(const void *)'
     278 | void kfree(const void *objp);
         |      ^~~~~
   include/drm/gpu_scheduler.h:290:9: note: previous implicit declaration of 'kfree' with type 'void(const void *)'
     290 |         kfree(tl->name);
         |         ^~~~~
   cc1: some warnings being treated as errors


vim +/kfree +290 include/drm/gpu_scheduler.h

   283	
   284	static inline void
   285	drm_sched_fence_timeline_release(struct kref *kref)
   286	{
   287		struct drm_sched_fence_timeline *tl =
   288			container_of(kref, struct drm_sched_fence_timeline, kref);
   289	
 > 290		kfree(tl->name);
   291		kfree(tl);
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
