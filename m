Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA93D627F4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 21:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707858981; cv=none; b=OmB5ssOKhmhVPBu+uBMF6rtFKdayFd2xx0P1mKQ3BGnW/vCsB9yN1liKWFL25b33G1DOnLbJK5JM9v+JcA8WSqL/cNINwrjK+64zTO3XTV4xKFUyi3Pq15cfsOC33rDDC+JPWqqjWOp9f1WN8c6Ma1rkQUB/wv5GTFbSCoysbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707858981; c=relaxed/simple;
	bh=70aOWZb2as+h/oFF9yERAyk5l+enGnLqVYb+kh+qAx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ggj4tcRwSAVxgfnX1LFfeysVTJnm72p/CLNwvAHfbbayMK3eh25YY8H1VOIpJyklxahZ1IFmWOq4TEq7cXAZ+KIH8Zq0DCC5x2mOkR18ihzCpFHDP8S2jCfcNgEF7Uw6gdk4193Nh64dFxMwDDQ5q8ERW/Jcmgny+L5RESEloFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KI8uCoUI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KI8uCoUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707858980; x=1739394980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70aOWZb2as+h/oFF9yERAyk5l+enGnLqVYb+kh+qAx4=;
  b=KI8uCoUIGbHlb8n9t0Ly6MSYlGgiu2GB41J0rNBM1JNZujm1cBS1MGbI
   C5lRXHWkcZ3NUInSwFJs0Nv/KYnLLeEe4OfonOpZlorH0rIIqsrMiPep6
   Ha/u/rM79RNCqGKXo+aPvPLP1ZF3fKdsZN5N2ZvcBgHe/gP7HMcLyyUEP
   Tn/FfKZ47cWSVYi83JlZG81adJsr4utUtDm65Gy3NTWsI1sq8TBe5+ar5
   I+4Zz7pSfciUG/f7bR8uv1o5j8hRmoqCzds2HMWfWwsMTFCZvu44zw9SJ
   7IDl2oIhUoovQ1vjfmsOs9KgAuHm2TbHw1YMqEepN0FpTz0EyHZM3hMdm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19300548"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="19300548"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 13:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7576918"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2024 13:16:13 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra08R-00083s-0R;
	Tue, 13 Feb 2024 21:16:11 +0000
Date: Wed, 14 Feb 2024 05:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, ville.syrjala@linux.intel.com,
	pekka.paalanen@collabora.com, contact@emersion.fr,
	harry.wentland@amd.com, mwen@igalia.com, jadahl@redhat.com,
	sebastian.wick@redhat.com, shashank.sharma@amd.com,
	agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
	aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
	daniel@ffwll.ch, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
	quic_abhinavk@quicinc.com, arthurgrillo@riseup.net,
	marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
	sean@poorly.run, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
Message-ID: <202402140432.nUFiOWYE-lkp@intel.com>
References: <20240213064835.139464-2-uma.shankar@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213064835.139464-2-uma.shankar@intel.com>

Hi Uma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next next-20240213]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20240213-144544
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240213064835.139464-2-uma.shankar%40intel.com
patch subject: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240214/202402140432.nUFiOWYE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140432.nUFiOWYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140432.nUFiOWYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_colorop.c:268: warning: Function parameter or struct member 'type' not described in 'drm_get_colorop_curve_1d_type_name'
   drivers/gpu/drm/drm_colorop.c:268: warning: Excess function parameter 'range' description in 'drm_get_colorop_curve_1d_type_name'


vim +268 drivers/gpu/drm/drm_colorop.c

   259	
   260	/**
   261	 * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
   262	 * @range: 1d curve type to compute name of
   263	 *
   264	 * In contrast to the other drm_get_*_name functions this one here returns a
   265	 * const pointer and hence is threadsafe.
   266	 */
   267	const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
 > 268	{
   269		if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_name)))
   270			return "unknown";
   271	
   272		return colorop_curve_1d_type_name[type];
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
