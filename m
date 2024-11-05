Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDED610F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730821718; cv=none; b=gtpRh34ActLREwSsVMSFlRzLGndlddHArb4sDv7XMKui6LV9/5CunmMhSAyykRaMdt1YYoKuTWruTxBxJVbUtb2wOVXVInlWpSq3PYBpSEEpYJktJRDnLd6eSOj6yRNdmmSPhygwGH8AK/kM8bw2kHuCF1eceIF44R4c1weTrCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730821718; c=relaxed/simple;
	bh=YT2JKa3kkPwuB0xLRZSA+kBWJ8dFFCSXUhXIgwTnLYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qx4dxyMNuHlsHR8VKDZAlOP/OmjgxRLge54qOC8LX8dKdxRkpa0Uq7Fplx1nwU6aU69Xxo7Qw+Vfizyi2QCDlwXkH9EXSOqWB0KOUN9fDtgety5aeB7NiOwbV1aAPZp7lthsMXyAcOGmUzCzMmDd5Ectk69dBuWNGIwEp63SPYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/ycWgL4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/ycWgL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730821717; x=1762357717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YT2JKa3kkPwuB0xLRZSA+kBWJ8dFFCSXUhXIgwTnLYg=;
  b=B/ycWgL47JKpZMna6r7QgPgzvZgkimIkZVQyop75myA4hPmYD+QaPzAp
   66C7NYYuSEoK+3dfa19AL6RLvFfpGYYkPDfEN0uNk44aOONJj60rLApME
   tiW5tGKXBvdZyCnOTdJ3GcUCrXdDEUJ0uzTBVyRoP9YCmeYAIdksrVSMa
   e1puVouQAPTZuDC8RLHcw1UyXsTEHcV9AK82uq120IFVyQDo2fkZ+rp5l
   J5MA20zhSQFpaRcqi9LdO6frRLYmUELOzBb5QteWKhyD8DLCxVWyentNf
   8k0qNwGnyylM4qzx3X+ymCPzL2ulNiIpHOul2/xjjbbAAWkl7KgL3t/cm
   Q==;
X-CSE-ConnectionGUID: 4AOs7rnJQ0iZMRpJOc865Q==
X-CSE-MsgGUID: 3/UBG0GbQCKjvZLu4CEvlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41171352"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="41171352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 07:48:36 -0800
X-CSE-ConnectionGUID: mg9MxA7gQzqkUGtbGoL4pg==
X-CSE-MsgGUID: CWHrvgKFT9WCa6N7Egz2Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="83955804"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 07:48:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8LnE-000mBv-18;
	Tue, 05 Nov 2024 15:48:32 +0000
Date: Tue, 5 Nov 2024 23:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/9] drm/xe/display: Add intel_plane_initial_vblank_wait
Message-ID: <202411052327.1vYXqtrV-lkp@intel.com>
References: <20241105121857.17389-2-maarten.lankhorst@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105121857.17389-2-maarten.lankhorst@linux.intel.com>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20241105]
[cannot apply to linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-xe-display-Add-intel_plane_initial_vblank_wait/20241105-202047
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241105121857.17389-2-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH 2/9] drm/xe/display: Add intel_plane_initial_vblank_wait
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241105/202411052327.1vYXqtrV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411052327.1vYXqtrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411052327.1vYXqtrV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_plane_initial.c:17:1: warning: parameter names (without types) in function declaration
      17 | void intel_plane_initial_vblank_wait(plane);(struct intel_plane *plane)
         | ^~~~
>> drivers/gpu/drm/i915/display/intel_plane_initial.c:17:46: error: expected identifier or '(' before 'struct'
      17 | void intel_plane_initial_vblank_wait(plane);(struct intel_plane *plane)
         |                                              ^~~~~~
   drivers/gpu/drm/i915/display/intel_plane_initial.c: In function 'intel_initial_plane_config':
>> drivers/gpu/drm/i915/display/intel_plane_initial.c:448:25: error: implicit declaration of function 'intel_initial_vblank_wait'; did you mean 'intel_plane_initial_vblank_wait'? [-Werror=implicit-function-declaration]
     448 |                         intel_initial_vblank_wait(crtc);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         intel_plane_initial_vblank_wait
   cc1: some warnings being treated as errors


vim +17 drivers/gpu/drm/i915/display/intel_plane_initial.c

    16	
  > 17	void intel_plane_initial_vblank_wait(plane);(struct intel_plane *plane)
    18	{
    19		struct intel_crtc *crtc = intel_crtc_for_pipe(to_intel_display(plane), plane->pipe);
    20	
    21		intel_crtc_wait_for_next_vblank(crtc);
    22	}
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
