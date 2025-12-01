Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4953B186
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764598924; cv=none; b=j6GVmLmBfnCue/azWRotuYF9EwFMKMFCL9V1aYkw4hVZwT3+p2juuyPCiBGuhtuHk8JWO27ndZCPko9LXnF+Lx7Y9U/CVi/w4+NXjVuUqcL8H6pZWaoyQSJIIH8a3ObNIE2n6WbSp8FIMd7r1QKCKEISqu4igRq8gBzgyzytNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764598924; c=relaxed/simple;
	bh=n3Dp5GLmrKfysZMBJHMWpL6GCub8YBOyNrqyFvRytHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1sLpRyBGQnZvD2EdOFFAwfgpdDk8ag4qFPs63mWSzgwvUW3Jz79DHkhrJKUhvrVMNl8jKLOF65RZy0FEeCNRTpNS6n9xtGUQKiaPZubFcgo12fc84HdcIRsSdDsBoV1WUo+h9BGOovF4hbWI6KKo8HUkwIUvJMlDyYJOoMHNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0dVMBgE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0dVMBgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764598923; x=1796134923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n3Dp5GLmrKfysZMBJHMWpL6GCub8YBOyNrqyFvRytHg=;
  b=B0dVMBgEcPTcWvBT+6xKECPEjWzJmYKNKnXLTJBBjRpaq0TtnZZc07s7
   BzB4un1xCMJcJ0t9EO779Nz1V5kWKxjBNFls4jQd7MdQt4s35koNooLAC
   9f6EiMfHwjzB+LXVBStRSBczyELhdst7GfYPACVpvTdX1qKiVIwTfFsbr
   yjbi0r4WxwsIoaVbG0xelWrj2F+PiuqEgcdCVVEZhIeLwLzMk9kHQkeSx
   5puje3DVY5UrO8n7O5T/kvU/U02W9hTLUvAsksYb6/TwQTiauWdvVITEa
   RMyNjf8SaMx9dr0G4G9qsEg8br4BOcUcLSkVxQTbA2ysqcuMRDDfqls6x
   w==;
X-CSE-ConnectionGUID: 21bSgOaLQKufLz56jJw9Cg==
X-CSE-MsgGUID: /7rRh0D1R/qxYGKrw72RRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="83930472"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="83930472"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 06:22:02 -0800
X-CSE-ConnectionGUID: +j1YOhCXRuWkPkryA7iL3A==
X-CSE-MsgGUID: s3vVmGQaQdaz8163i6kEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193907437"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 06:21:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ4mp-000000008oz-27CC;
	Mon, 01 Dec 2025 14:21:55 +0000
Date: Mon, 1 Dec 2025 22:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chaitanya.kumar.borah@intel.com,
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
	contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
	jadahl@redhat.com, sebastian.wick@redhat.com,
	swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
	suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v7 02/15] drm/i915: Add intel_color_op
Message-ID: <202512012214.cxi2Gair-lkp@intel.com>
References: <20251201064655.3579280-3-uma.shankar@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201064655.3579280-3-uma.shankar@intel.com>

Hi Uma,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251201]
[also build test ERROR on linus/master v6.18]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.18 v6.18-rc7 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
base:   next-20251201
patch link:    https://lore.kernel.org/r/20251201064655.3579280-3-uma.shankar%40intel.com
patch subject: [v7 02/15] drm/i915: Add intel_color_op
config: i386-buildonly-randconfig-006-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012214.cxi2Gair-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012214.cxi2Gair-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512012214.cxi2Gair-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_colorop.c:5:
   drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/plist.h:76,
                    from include/linux/pm_qos.h:15,
                    from drivers/gpu/drm/i915/display/intel_display_types.h:29:
   drivers/gpu/drm/i915/display/intel_colorop.c: In function 'to_intel_colorop':
>> include/linux/compiler_types.h:552:27: error: expression in static assertion is not an integer
     552 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_colorop.c:9:16: note: in expansion of macro 'container_of'
       9 |         return container_of(colorop, struct intel_colorop, base);
         |                ^~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_colorop.c:10:1: warning: control reaches end of non-void function [-Wreturn-type]
      10 | }
         | ^


vim +10 drivers/gpu/drm/i915/display/intel_colorop.c

     6	
     7	struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop)
     8	{
     9		return container_of(colorop, struct intel_colorop, base);
  > 10	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
