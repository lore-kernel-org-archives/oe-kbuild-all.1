Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C3931326A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054834; cv=none; b=DFeVOmoBGQq20vLHsXO9yN40P+VhXMoACkjh8ea/646j7Kp0P+P34BQVUR3TS5tfszD5OkSF9SRdrF2kPf3XqknJasW/LB8+YC6UF+ezvPAdygb+PLxCgnNttakkKMuwT7fGFzwOR/F/OfswwqF721I/i2y7KoJtisSLGiDoT4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054834; c=relaxed/simple;
	bh=Nsorh1kh3hpyh+6trpLGSmBhLEg+aUTWDG1dOyA2OOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghVsR51h5WIcp4AcIfrCbyOj40IpVWrbIMxH6KFphH+R4Heu0ScNOmZhi7a/MoNDs7XjJgPX+8ZjDXAprNL/MTSdaJjPVUOaCSYEasF+rHBCmUp/Bb7WGLaA8+AeF+OkHsufmIkSJes+Cr6JC5OU4AH/MjjKzONEjP6AOaxq0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiS2qVMj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiS2qVMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772054832; x=1803590832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nsorh1kh3hpyh+6trpLGSmBhLEg+aUTWDG1dOyA2OOs=;
  b=SiS2qVMj5QKGAorNB452jrh/i8181+cLbheDeAAFyQWSaw3IT7Y3Uq5j
   0QrMF72qUypl7DoZghwD2Cs5cPL/+MvARjxEbxBupqlJAwUga4NIVrJi1
   53grCChuhlc4ia8a2DjcbzEKXu47tviIsB5fkqWvdmR7ZfYNQGnxJA0Ov
   a/iwh/BSczW+9NGbO68UDtixM9QVwkjwWuK8SdwNxVuXTXnw8AATEfh5J
   M077uuxVV+j8P6e4yCWOOxll2+EFQvYVtBHAefT6sC+V7SdnDsaxkEW/T
   FTEuE38JlT0JD8kGv3ethpmdT6I8ny7FNwfSZHhJB1dBdRz0f0o6HcknO
   w==;
X-CSE-ConnectionGUID: IN0Tp2pGRe+5P6/eDg3ASA==
X-CSE-MsgGUID: d5AUTTRkQ2uWAZy9lczXzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73212171"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73212171"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 13:27:12 -0800
X-CSE-ConnectionGUID: p/nN14WxQ0aRuj/MGzeNRA==
X-CSE-MsgGUID: lVGSLezITIOEQ/wel91mmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="216243485"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2026 13:27:11 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvMPU-000000007PV-2A6h;
	Wed, 25 Feb 2026 21:27:08 +0000
Date: Thu, 26 Feb 2026 05:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [i915-ci-only NO-REVIEW 24/25] PREEMPT_RT injection
Message-ID: <202602260529.oLe52BkR-lkp@intel.com>
References: <20260225131931.60724-25-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225131931.60724-25-dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on next-20260225]
[cannot apply to drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-xe/drm-xe-next linus/master v7.0-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-vblank_work-Add-methods-to-schedule-vblank_work-in-2-stages/20260226-012447
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260225131931.60724-25-dev%40lankhorst.se
patch subject: [i915-ci-only NO-REVIEW 24/25] PREEMPT_RT injection
config: i386-randconfig-141-20260226 (https://download.01.org/0day-ci/archive/20260226/202602260529.oLe52BkR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260529.oLe52BkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260529.oLe52BkR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/lenovo/wmi-gamezone.c:34:31: warning: unused variable 'gz_chain_head' [-Wunused-variable]
      34 | static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
         |                               ^~~~~~~~~~~~~
   include/linux/notifier.h:119:32: note: expanded from macro 'BLOCKING_NOTIFIER_HEAD'
     119 |         struct blocking_notifier_head name =                    \
         |                                       ^~~~
   1 warning generated.


vim +/gz_chain_head +34 drivers/platform/x86/lenovo/wmi-gamezone.c

22024ac5366f06 Derek J. Clark 2025-07-01  33  
22024ac5366f06 Derek J. Clark 2025-07-01 @34  static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
22024ac5366f06 Derek J. Clark 2025-07-01  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
