Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C631DC1AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132075; cv=none; b=LD7jRlsYe6WyWEz7Z9JJba+8u5hIDVZsibLtIUg+7M9o/8erxfkMIHWNXfXTrfxVA3RG6QPNUwREJJN4/RcueBcq9ZWJuYTHXZMImFXrf9Zcngb/jvsGgDcg41lhvVjtFY5f5UnZMyp2ZNLuDrjg4+Ry65VbUvoP22JWMYqz0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132075; c=relaxed/simple;
	bh=wskQGwPOkZ7/pPftJXdI6x1o9qQDgqTWkY7f7ohD0MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOiJg0ra6KxqcqWphAWdAPdZGjSaZFO3KS08kB49nnl5AqvvnIRfc+s4NGQq4WAaGgi73bNhSG7DCiFVY2ML/40DhnMRUNtbu+Wnk/Tdd3vQL4r0R5rhYLtlKu9gAj7ZmJo71jZGGZhxSSWKiMfM0o6+Y949HWUAydM6eY0olB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8mlgUAs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8mlgUAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132073; x=1804668073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wskQGwPOkZ7/pPftJXdI6x1o9qQDgqTWkY7f7ohD0MA=;
  b=Q8mlgUAsC2DnUZwH2nAbgjQdQelZmX0IPSZnSDDt/Qgc4llnz4JRS+iB
   s0s3yJOnIkr06s7tyFCxox3zW0zgn9iwTOnjoEcqW+ldsOXsOq2HRHHbq
   gAxo0IbjeBBeP8SdjyfU8OF0ytCn/LE7dfxcMUWmg5H/e17wVBOE1HKqO
   5WGtJ1PDEJJBfEMzufqUS4aAzoOz72VhnJA8uEEeogNVDvA+g/fcMnpBI
   xd4ASq1PCXezbPnSap+qlv52r87Qc4pqIIkwTnOynRdg3DqmSxmjvjTGr
   JKMcPtOpK17Q7vrfEnB+Re+J0NmUaG7TEnrBUmNrAkxfRBTabHhLNPJFm
   g==;
X-CSE-ConnectionGUID: gRmYwS7CQzWx5GqeLI4CgQ==
X-CSE-MsgGUID: 2tGeTar0S3K2Te8EyB60PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74047982"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74047982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:41:12 -0700
X-CSE-ConnectionGUID: CajO384xSZi6aW7QvMRWcQ==
X-CSE-MsgGUID: TRxIuavNQ9OqsIoobzjr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="257952863"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Mar 2026 01:41:12 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzseL-000000001bc-2NaZ;
	Tue, 10 Mar 2026 08:41:09 +0000
Date: Tue, 10 Mar 2026 16:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 09/11] drm/i915/xe3p: add V/P Override support for xe3p
Message-ID: <202603101623.t8tVjYsz-lkp@intel.com>
References: <20260308132446.3320848-10-michal.grzelak@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260308132446.3320848-10-michal.grzelak@intel.com>

Hi Michał,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc3 next-20260309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Grzelak/drm-i915-bios-search-for-Block-57-by-default/20260308-214619
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260308132446.3320848-10-michal.grzelak%40intel.com
patch subject: [RFC v1 09/11] drm/i915/xe3p: add V/P Override support for xe3p
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260310/202603101623.t8tVjYsz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101623.t8tVjYsz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101623.t8tVjYsz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/bug.h:97,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/i915/display/intel_de.h:9,
                    from drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:9:
   drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c: In function 'xe3plpd_get_lt_buf_trans':
>> include/drm/drm_print.h:779:25: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
     779 |         WARN(condition, "%s %s: [drm] " format,                         \
         |                         ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:133:31: note: in definition of macro '__WARN_printf'
     133 |                 __warn_printk(arg);                                     \
         |                               ^~~
   include/drm/drm_print.h:779:9: note: in expansion of macro 'WARN'
     779 |         WARN(condition, "%s %s: [drm] " format,                         \
         |         ^~~~
   drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1883:17: note: in expansion of macro 'drm_WARN'
    1883 |                 drm_WARN(to_intel_display(encoder)->drm,
         |                 ^~~~~~~~


vim +779 include/drm/drm_print.h

3bf149bd3fe12a Jani Nikula      2019-10-28  760  
20f5583dd7a510 Nirmoy Das       2023-12-06  761  #define drm_dbg_ratelimited(drm, fmt, ...) \
20f5583dd7a510 Nirmoy Das       2023-12-06  762  	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
20f5583dd7a510 Nirmoy Das       2023-12-06  763  
c5261e93758a6b Lyude Paul       2021-03-26  764  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
c5261e93758a6b Lyude Paul       2021-03-26  765  	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
c5261e93758a6b Lyude Paul       2021-03-26  766  
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  767  /*
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  768   * struct drm_device based WARNs
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  769   *
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  770   * drm_WARN*() acts like WARN*(), but with the key difference of
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  771   * using device specific information so that we know from which device
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  772   * warning is originating from.
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  773   *
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  774   * Prefer drm_device based drm_WARN* over regular WARN*
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  775   */
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  776  
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  777  /* Helper for struct drm_device based WARNs */
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  778  #define drm_WARN(drm, condition, format, arg...)			\
0d11307022978f Michal Wajdeczko 2024-05-23 @779  	WARN(condition, "%s %s: [drm] " format,				\
d05386a3fdf373 Jani Nikula      2025-01-23  780  			dev_driver_string(__drm_to_dev(drm)),		\
d05386a3fdf373 Jani Nikula      2025-01-23  781  			dev_name(__drm_to_dev(drm)), ## arg)
dc1a73e50f9c63 Pankaj Bharadiya 2020-01-15  782  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
