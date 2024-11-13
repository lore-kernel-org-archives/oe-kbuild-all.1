Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF7F18C023
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 22:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538250; cv=none; b=ibnsN46mLizk2doyWzCAP4jlF9VQcf5XtJB62y48x6SGnDInj8Sn9pb4I0oMIWSTXGzyvEYhjtTQCnfqvHEePWuAgGhZJNkcI8uP+cf3I57eqlQ3p2ARHUmu46WpQbZQXQ6KfuDtj9ACa9ahuf3H2pkhX09KZsfaHEtkSI0pQZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538250; c=relaxed/simple;
	bh=Y2Fk0Pazim2y/9EDcvj6rZCzPdkv14iN01Tnh1nG1fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ0gMwaDr8FWPeRYVAhYG4SQ4zLNl2tcbFWnQErb6RgX3tGB35ZscLrHN66urKHchxpRVKSJ6i3fFJVI+9m2kwVwoPQaaigxogKoCchb/Sl8DR1Po3lFzwjSi/srVvwhuSr3RiEtZrc4UfozdpUX22LSm/cgmXz9pBs/8o1APPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rq7bVHvY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rq7bVHvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731538249; x=1763074249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y2Fk0Pazim2y/9EDcvj6rZCzPdkv14iN01Tnh1nG1fI=;
  b=Rq7bVHvYWK1vC0VnLgI+AR4ubTzQQAyGCzT9+EZtQfZNZtpKVyvGxlR6
   AKmNMN2z6jZ7Z9gB9JyGHiwZZE1X3usDUqntSFNzps7KRrbYqppv6QBkl
   AjD025fz5A6WKn/yXdq5yEoq5Z0q67YvXgL9jP9whDQzXGlJLxs9xlFVu
   L3ju/nmGKCH31ILlr0mukIoPIiOPdH2E+Prlyj8AYABvhZgOMrRNuX0bX
   jfAagFKNYIMB3v36q4CKxY8y7qteByl3xFf0vu/jJEkxegGLfR+/vFzRc
   vrr0ZbWGnHKjNAh74hLI8w3Wjzi2X1glRT8iADoL5d5TdIXOkmkb7HSwW
   Q==;
X-CSE-ConnectionGUID: ob8J8uI6R3C2XKlrPKAHiw==
X-CSE-MsgGUID: OaFgfNJjT8yo+N/I4RsOzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30862589"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="30862589"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 14:50:47 -0800
X-CSE-ConnectionGUID: ekTj//LXTtKoYNP8Euh5pw==
X-CSE-MsgGUID: UJA+x4OiSQ2xFeq09IDLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88806296"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2024 14:50:45 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBMCB-0000nx-0M;
	Wed, 13 Nov 2024 22:50:43 +0000
Date: Thu, 14 Nov 2024 06:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	Paulo Zanoni <paulo.r.zanoni@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v13 2/8] drm/ttm: Provide a shmem backup implementation
Message-ID: <202411140637.T225Mshs-lkp@intel.com>
References: <20241113183550.6228-3-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113183550.6228-3-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Balance-ttm_resource_cursor_init-and-ttm_resource_cursor_fini/20241114-023727
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241113183550.6228-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v13 2/8] drm/ttm: Provide a shmem backup implementation
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241114/202411140637.T225Mshs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140637.T225Mshs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140637.T225Mshs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_backup.c:172: warning: expecting prototype for ttm_backup_shmem_bytes_avail(). Prototype was for ttm_backup_bytes_avail() instead


vim +172 drivers/gpu/drm/ttm/ttm_backup.c

   161	
   162	/**
   163	 * ttm_backup_shmem_bytes_avail() - Report the approximate number of bytes of backup space
   164	 * left for backup.
   165	 *
   166	 * This function is intended also for driver use to indicate whether a
   167	 * backup attempt is meaningful.
   168	 *
   169	 * Return: An approximate size of backup space available.
   170	 */
   171	u64 ttm_backup_bytes_avail(void)
 > 172	{
   173		/*
   174		 * The idea behind backing up to shmem is that shmem objects may
   175		 * eventually be swapped out. So no point swapping out if there
   176		 * is no or low swap-space available. But the accuracy of this
   177		 * number also depends on shmem actually swapping out backed-up
   178		 * shmem objects without too much buffering.
   179		 */
   180		return (u64)get_nr_swap_pages() << PAGE_SHIFT;
   181	}
   182	EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
