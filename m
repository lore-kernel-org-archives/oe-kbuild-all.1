Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65621E32C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678198; cv=none; b=KfAGweoDS0DrPkUWKGm6QWLAIiH0b4nvCYvCioOeg3hPGZiZJuzDfQ/QyphARWQbyOIfYxWLvp7UXl/WIu2ua94O7qTWKa36nk6bnR6uMAhDx7r5hvqB2+cLz7QT6eM4puBIIz9DKjMbq3pR0/qxgKhr1gcjN5Q8b/WnXsqNii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678198; c=relaxed/simple;
	bh=tFn7aFenWTN6nUD1WceIWlynzharz5ZZMsSrHxS6WVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDawU/xgM7OQuLoW1rVl3Rsvv/i1e9ZWMNPP07WMwa5bKreTwHdVcQ89ZQ0mIpU/cXfX5NqiF6qMoLO52YnljJwEw8um4tf9Ialx+nD49syAW5H4hDpYrE99+iAVTR+53WCRQjXgCpXjzvgxCaNNJRCIdwphYCZ4EVDIawaWCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrbYHNS2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrbYHNS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747678196; x=1779214196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tFn7aFenWTN6nUD1WceIWlynzharz5ZZMsSrHxS6WVk=;
  b=ZrbYHNS2H6DSi0E77+POvsK8uxe1P+i+p0XNoOdmbkW8Uj1WlAkgy3qi
   3uAKci74Oo5G5V9+xEmn7ueD3Djs3Lqj7PeZF3PZ4sFwa6wDF0vsdT/3z
   UmCPo19m+h2Wv02KCcjd9N4/V5rf17A0BYKo0rNwcjiB+dADGQWngvRVb
   TWMNld0Y15GjR+yu9mg4Tsw2gEtm86HN7fUkxjqEGiqj5OTyTyEcrMI9X
   Rig2WeoPJRC1vvHnKu3s9yy3VkFPtPr3FTCzt91MvkLTeEWFtWJb66db/
   vL82lohobKgcMSgtwfCOkgp4wkHTk1Yrt4OcitvPuKlGQrNDNCOuJ+m7+
   A==;
X-CSE-ConnectionGUID: jr577OdIReeHYDPisXIS8A==
X-CSE-MsgGUID: 4rEApJ+8RjCO7z/rxovvJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60244732"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="60244732"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 11:09:55 -0700
X-CSE-ConnectionGUID: GbhRBxtCQfOjKwA6HDu+9w==
X-CSE-MsgGUID: QO6BQoQWQhq76k+DNZOYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139280067"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 May 2025 11:09:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH4vv-000Lkm-1e;
	Mon, 19 May 2025 18:09:51 +0000
Date: Tue, 20 May 2025 02:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/2] drm/i915: Expose local memory information via sysfs
Message-ID: <202505200118.s2XVIwkW-lkp@intel.com>
References: <20250519153418.44543-2-krzysztof.niemiec@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519153418.44543-2-krzysztof.niemiec@intel.com>

Hi Krzysztof,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Niemiec/drm-i915-Expose-local-memory-information-via-sysfs/20250519-233529
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250519153418.44543-2-krzysztof.niemiec%40intel.com
patch subject: [RFC 1/2] drm/i915: Expose local memory information via sysfs
config: i386-buildonly-randconfig-003-20250519 (https://download.01.org/0day-ci/archive/20250520/202505200118.s2XVIwkW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200118.s2XVIwkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200118.s2XVIwkW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/intel_memory_region.c: In function 'vram_total_show':
>> drivers/gpu/drm/i915/intel_memory_region.c:439:36: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     439 |         return sysfs_emit(buf, "%llu\n", mr->total);
         |                                 ~~~^     ~~~~~~~~~
         |                                    |       |
         |                                    |       resource_size_t {aka unsigned int}
         |                                    long long unsigned int
         |                                 %u
   drivers/gpu/drm/i915/intel_memory_region.c: In function 'vram_total_visible_show':
   drivers/gpu/drm/i915/intel_memory_region.c:471:36: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     471 |         return sysfs_emit(buf, "%llu\n", resource_size(&mr->io));
         |                                 ~~~^     ~~~~~~~~~~~~~~~~~~~~~~
         |                                    |     |
         |                                    |     resource_size_t {aka unsigned int}
         |                                    long long unsigned int
         |                                 %u


vim +439 drivers/gpu/drm/i915/intel_memory_region.c

   430	
   431	static ssize_t
   432	vram_total_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
   433	{
   434		struct device *dev = kobj_to_dev(kobj->parent);
   435		struct intel_memory_region *mr;
   436	
   437		mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
   438	
 > 439		return sysfs_emit(buf, "%llu\n", mr->total);
   440	}
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
