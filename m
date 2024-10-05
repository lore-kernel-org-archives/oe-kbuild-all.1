Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B831136B0D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728106322; cv=none; b=tDTHEasp24gCUGDoPES/fcfXfnFuKJy24bqzLPcCZKlx63dLNg8Plh0FbKlvcjwiBrzxDPml5B/qDOkfcPGmokJTHL+J8V/l/haWu/93UuYXp4E1hQ9AEJEnBQL/RyhWQ1t3VrHDd3V0PIXTMnX78O4GREbPizG7WEvwAJP/DDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728106322; c=relaxed/simple;
	bh=MSJQcu09NhgVlBg6t+sthjOcXlDsuEHCViJDn1NkpFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5q1uZw1QERj/8xw4Ze9aK4DDBTCQwdeN55xo8VHrZ1rxhbTjJvnSFVGGeicimzvccIYQ932DHQTvF7ayn1xOtulzEct3KmLkZ2nRaQENsrLJrjU4mrKUbeeug8tEMhaYOonLGLrXTS4BRnC19XqoDPzCPvYGKATmu4ola2iC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDJOQKeA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDJOQKeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728106320; x=1759642320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MSJQcu09NhgVlBg6t+sthjOcXlDsuEHCViJDn1NkpFA=;
  b=iDJOQKeAHTOMXXn7m2rtpXcrieSK4k4BKbIN+5XOVwTB+AZuBOqOxHCp
   OYDmyzdQKHkVsi05bd7o4AH0W+w6rDbIs9drb0nY0zbdzv6wuejvFcJfA
   of5UcAWiC6gckvMeEP1CZSbQ5z9flJEsWuHioiZaWAMWGJND0cieMtBOo
   +MIasUPadGT64j1CWVoPAXBA32gTw5VhTcaEBy05Kr+KsHKupY4IljlyW
   AvPs1TTFSrICrM8IDrVUzGIxS3eAU/aAGJfaIedLL1ykAhCBbc1lwOk51
   zssq7q1aEb9Fc1g0Pz4kpC1FiYX8uwm0ZtJZKWwV3GDq1OIMbcpOP27sQ
   A==;
X-CSE-ConnectionGUID: odGfoOEEQz60sDEFgYQuYg==
X-CSE-MsgGUID: yjWrFFUIQne78MIJQ8Uidg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27275065"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27275065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 22:31:57 -0700
X-CSE-ConnectionGUID: xFugop3XQFKr3U/7Rp/YLA==
X-CSE-MsgGUID: fKI2lYG+S1+H+ngLXHe8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79486525"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 22:31:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swxOU-0002bS-0u;
	Sat, 05 Oct 2024 05:31:54 +0000
Date: Sat, 5 Oct 2024 13:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v6 15/44] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Message-ID: <202410051303.Vy1EjQPJ-lkp@intel.com>
References: <20241003200129.1732122-16-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-16-harry.wentland@amd.com>

Hi Harry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20241004-040629
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241003200129.1732122-16-harry.wentland%40amd.com
patch subject: [PATCH v6 15/44] drm/vkms: Add kunit tests for linear and sRGB LUTs
config: x86_64-randconfig-101-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051303.Vy1EjQPJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051303.Vy1EjQPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051303.Vy1EjQPJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/vkms/tests/vkms_color_test.o
>> ERROR: modpost: "srgb_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "srgb_inv_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "linear_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
