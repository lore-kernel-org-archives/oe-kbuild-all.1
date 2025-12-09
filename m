Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2164D2236E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 00:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765240152; cv=none; b=tsHq6os9H6RSYD6Sg6MIaW08p3yE88VVyngCGlRcAyIBuFhQaChTVt/ZxOEMLZESXDm6q17RHDVjlOcyifWUr+9VJoSg+3jw1Xs3fwPCsH7eoYxmR4Gr1fhs/Oq5UOaM/iTST4FBldDxhhlscp/bHQb/IWMKuv0hUTKg0glRLyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765240152; c=relaxed/simple;
	bh=WpQLOEFNE4wD8jXyGnFg6LzGEcyg7DJ3CABaBvdGXnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtYngrPd4Y9b5knkEOpVhwAyshOIaJHQkr3SqdHju6tsvhsbxP4BwRglEjYY74Yp9sh2eSjk9DKAWPxYLWhzOta4FCg+NgqKqcK4C1Hypnf3ScpyYFBvMS4syaEt/FbzC19XK2wC2ZD91Fs3dzapxvI3mpszo6XrHkKCyFXP/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUvDbYiL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUvDbYiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765240150; x=1796776150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WpQLOEFNE4wD8jXyGnFg6LzGEcyg7DJ3CABaBvdGXnc=;
  b=MUvDbYiLYm2K9p2JN9wtEIgFv93ZlvpLWm65yRhefaE1xFFOWHse1NwI
   jVOOcGDmABopVTffTf+6Kzy1py0UJYQFu+0411L4aXO0O5Vzya9RPkRc4
   hm0NxUSPx7EgpAKkSQYAWMOxAcL1dqDC8LPKveWwUla0fvTsrDu1siEHB
   XvJJd5Rnfea11C8zYoAfeXSzzq1Hqppawc4E4a5DsGFYSXtSE1Gt9b+GZ
   rqHLGK2cS6pIfRX1ZQUEI5HndyPcj4w1OG6MSHlFR7IOIPBYSIyJn4QwO
   g2M9wzVifDI/bJgUKzP+6l9pw3ijE8krnrdSRuRSt4jjxpH2ZnWMHYt6i
   w==;
X-CSE-ConnectionGUID: nxxoH3PBSOG4t+nRS+LFkA==
X-CSE-MsgGUID: 0hBCn0ETS9mm7bA5s9xHlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78654986"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="78654986"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 16:29:09 -0800
X-CSE-ConnectionGUID: lO6QC4KNRUq/s6jbLED0Tg==
X-CSE-MsgGUID: IuIK7tiTQUujXk5/l3Z22A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195680711"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2025 16:29:08 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSlbG-000000002Jl-1Q8C;
	Tue, 09 Dec 2025 00:29:06 +0000
Date: Tue, 9 Dec 2025 01:28:09 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] mm/gmem_phys.c:345:19: warning: no
 previous prototype for 'gm_evict_page'
Message-ID: <202512090139.MlPNvch8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: 8f4f66a9d851f366942e8ee319292e41ad2baa95 [3493/3493] gmem: support swapping heterogeneous memory
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251209/202512090139.MlPNvch8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090139.MlPNvch8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090139.MlPNvch8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/gmem_phys.c:245:19: warning: no previous prototype for 'gm_evict_page_locked' [-Wmissing-prototypes]
     245 | enum gm_evict_ret gm_evict_page_locked(struct gm_page *gm_page)
         |                   ^~~~~~~~~~~~~~~~~~~~
>> mm/gmem_phys.c:345:19: warning: no previous prototype for 'gm_evict_page' [-Wmissing-prototypes]
     345 | enum gm_evict_ret gm_evict_page(struct gm_page *gm_page)
         |                   ^~~~~~~~~~~~~


vim +/gm_evict_page +345 mm/gmem_phys.c

   344	
 > 345	enum gm_evict_ret gm_evict_page(struct gm_page *gm_page)
   346	{
   347		struct mm_struct *mm = gm_page->mm;
   348		enum gm_evict_ret ret;
   349	
   350		mmap_read_lock(mm);
   351		ret = gm_evict_page_locked(gm_page);
   352		mmap_read_unlock(mm);
   353		return ret;
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
