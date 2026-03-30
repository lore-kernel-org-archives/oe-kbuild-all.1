Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE463815D4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774852531; cv=none; b=bKz6QDFNdrihDK7fwOkNzE5kgEjY+1wyf2yWZ0cJNUcy6WpyjMwKQZhlHjg2p7BuoX6+p/M1+sUWPeCYulJ1yYfvqs4qD5b0MypsSFvangAhIa2oJ0GTuCZtjpodI1Q5fjzBMZpyUfuXmcWzwOLaYvP79OsLfD3BCGvJabvXODM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774852531; c=relaxed/simple;
	bh=3YEWEDFdGeb8+xmVBhVZgs3VmhzuMoNWRWo753eYyyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVnpWSFPotAW5Y7Ht7FvsvW0Up3p8WEdMuAYmP9D55xauYsVnzYa394Wd2R25iysBJofIy1dsxB/Mn8LiGcnZ+V/tU8yd6szL9Ihqv2exO6Ku6f2tYsdZxip/15RTn4lJTVXgTw6qx/eQb/V7ibLlZ13UWnhLOf7Pi0+l9PZ1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItHWVVcG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItHWVVcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774852527; x=1806388527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3YEWEDFdGeb8+xmVBhVZgs3VmhzuMoNWRWo753eYyyg=;
  b=ItHWVVcG/vrCeHHxGOggvqX7ZWPOipVgluWYVy5WmAOPxlBZBKFm4b3T
   pFy8ti3b4V/YtctEuzjALUFUOURu1OyA2s0EnVxPcqXtC0wJFh2nUihQd
   k43ytsqB0J6/56B4F4vlOVS9ls2/ck4ekISkh/i5xfkL9YZfUu6YEdpRg
   kgxlg/LJQcIIr8aE6VY2E8G3AZGwtOPz+j+368gWFH4xoBu76a+kjE2ku
   PvkyCbX4xJKLyJ41GUr/VkqQ0W4r+6I3fBjQa2HMqYt+S2dyp/Cwme7gV
   5w5XxR5rlP66Gz+SX8y4u6vj3gN2Yw2WhnvjxD7uPrYP/QV3zU8ZuiSDl
   w==;
X-CSE-ConnectionGUID: qvcPIZWRS2Wc4VSKLu/eQQ==
X-CSE-MsgGUID: +gH8G3EISymOuCzIU3jtYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79700319"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79700319"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 23:35:26 -0700
X-CSE-ConnectionGUID: beCFwWSgS+2lbCcJcK8YAQ==
X-CSE-MsgGUID: CS8WvW4LQ5uO+j83pKobFQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Mar 2026 23:35:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w76Da-00000000841-3q9D;
	Mon, 30 Mar 2026 06:35:22 +0000
Date: Mon, 30 Mar 2026 08:34:38 +0200
From: kernel test robot <lkp@intel.com>
To: Adriano Vero <litaliano00.contact@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@linux.intel.com,
	alexander.deucher@amd.com, harry.wentland@amd.com,
	sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Adriano Vero <litaliano00.contact@gmail.com>
Subject: Re: [PATCH 1/2] drm/edid: populate monitor_range from DisplayID
 Dynamic Video Timing block
Message-ID: <202603300847.vflE6oJO-lkp@intel.com>
References: <20260328132027.22383-1-litaliano00.contact@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328132027.22383-1-litaliano00.contact@gmail.com>

Hi Adriano,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc6 next-20260327]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adriano-Vero/drm-amd-display-remove-manual-DisplayID-VRR-parsing-from-freesync-caps/20260330-002329
base:   https://gitlab.freedesktop.org/drm/kernel.git drm-next
patch link:    https://lore.kernel.org/r/20260328132027.22383-1-litaliano00.contact%40gmail.com
patch subject: [PATCH 1/2] drm/edid: populate monitor_range from DisplayID Dynamic Video Timing block
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260330/202603300847.vflE6oJO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300847.vflE6oJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300847.vflE6oJO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_edid.c:6525 function parameter 'connector' not described in 'drm_get_monitor_range_displayid'
>> Warning: drivers/gpu/drm/drm_edid.c:6525 function parameter 'drm_edid' not described in 'drm_get_monitor_range_displayid'
>> Warning: drivers/gpu/drm/drm_edid.c:6525 function parameter 'connector' not described in 'drm_get_monitor_range_displayid'
>> Warning: drivers/gpu/drm/drm_edid.c:6525 function parameter 'drm_edid' not described in 'drm_get_monitor_range_displayid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
