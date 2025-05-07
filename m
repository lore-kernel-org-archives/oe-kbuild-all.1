Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3A221147A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612253; cv=none; b=phCNAeOjA9YyvTuTfz5Zz11bTVU/S44j7PDeRr6pi9YlurTO9zsO1ZPEbpfh2xFPr95HnbZRH1rf865j3VNxXaD+Ohakb9tgiKqMSQ4pQCNFLrRZFNxOnLdW4dwIk7NjyMiTW/W226KH+Oda2oCGmjRRN4jg38OVJzi8d7Ixj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612253; c=relaxed/simple;
	bh=sZ+DCx9Gh68SB+Pf/udrSMg0HhA+/2KMuYFbIKxKEKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9WX4hs0TUeSTvq4xKfRWeyX4OiXG3uHHGj2xRDlL9d6nS2HUJ7yA6vLc3RXfOd//ok8AgXvBMYT5fIvPdYIBTKoL9EOZFHm4mwwJwoGIIcxFTdaDNtV4CP/LPCBshNuF2aKqyK5GzVq7ERJmbA2vFMA/tWeW+EqPTB/3Cs2Ai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4G3eW3P; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4G3eW3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612253; x=1778148253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sZ+DCx9Gh68SB+Pf/udrSMg0HhA+/2KMuYFbIKxKEKM=;
  b=H4G3eW3P2E9zJQGanqR7a2vRteH8N6YSlffXK/Qz7B5/au908ICm6Maj
   CRqDTias0lkODX+wxSfil6S9z9W5CCczmmDG8R5mMlYmTFlY7AuvzDAFa
   yCorFQh2cMW+q0Tj40S8VlUe8xrgFfjw5PkSnlMUQCGOF6G4/RbMBZBkG
   Nqzyauqx8X3vbZjoLcLGZ4xn+haN44O3Fl8eg8elsAsXSVtfK8k1wt7Qf
   WViqAQoLYGlH+Lik03fcBSczvdqrbLT2yR840k7W0aFETZHW5bsgHR9E1
   4q8AjiOG5JRpv2LIhBLi4xVmwKXjymEInb33mu9h+cdqGiUgsnr+blZfJ
   Q==;
X-CSE-ConnectionGUID: coooPq9dRoi1a+Fysdrhlw==
X-CSE-MsgGUID: yqjTLhtOR0SIhcMEtJQidA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52147999"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52147999"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:04:12 -0700
X-CSE-ConnectionGUID: 9SUiBLR1QnKIwcFHAxqI8w==
X-CSE-MsgGUID: lEe6xJ8pTyO7rSxlMZBh3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136841552"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2025 03:04:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbdC-0007Yo-1X;
	Wed, 07 May 2025 10:04:02 +0000
Date: Wed, 7 May 2025 18:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
	harry.wentland@amd.com, alex.hung@amd.com, leo.liu@amd.com,
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
	sebastian.wick@redhat.com, shashank.sharma@amd.com,
	agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
	aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
	daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
	marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
	Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 15/43] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Message-ID: <202505071750.LFUxqdSH-lkp@intel.com>
References: <20250430011115.223996-16-alex.hung@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430011115.223996-16-alex.hung@amd.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on next-20250507]
[cannot apply to linus/master v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250430-092409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250430011115.223996-16-alex.hung%40amd.com
patch subject: [PATCH V9 15/43] drm/vkms: Add kunit tests for linear and sRGB LUTs
config: x86_64-randconfig-073-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071750.LFUxqdSH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071750.LFUxqdSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071750.LFUxqdSH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "srgb_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "srgb_inv_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "linear_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
