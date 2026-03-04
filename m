Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8C3909AC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 23:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665726; cv=none; b=ZYE8fBjeZLonWv2hjFOM5u9jb+pU6q+4VKqYGkd71FBvi6qi2MJ2daru/E2BWAFoeKZgFPcyfObXdMje9Z/Kb2kD0MQ96VJrFhIEvLsIqOxPxUBR8d9N+GfEU1tJ19UHSLeixqeV/LtN3AlYCDDTXlGOFmmji1ZzJfkCqudi8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665726; c=relaxed/simple;
	bh=gDZUAt2PKJk5mvudI8hISeOmReKHFAbTfQcoGPt+tFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyDkbxbvaugyk5IR82HcgKMX+z0jktmdqRSe0gm86V9QKyqhwBv8zOohK70g1kSIN4qSXtTDrq+rhEC2spfDplB7NcT35BDyvSsWlEuH/M5pcxCG+nAMHWRXDaSsQc/a42d7lj6BQaL74pLt8EoZrtVFqxNrwfVZGPXGfYoWXEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3k4kTjH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3k4kTjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772665724; x=1804201724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gDZUAt2PKJk5mvudI8hISeOmReKHFAbTfQcoGPt+tFo=;
  b=c3k4kTjH6nPpmIJ45f2Rr7+fxcoYJmzz+rItKSrCIMT1jR2glKkFkuNP
   d3ldnwiCDtsXFFZAnmUZ4Aub4DumlT+ZN7OVBZRRns+JufZs0+sCeZasN
   WGTnSCeK+ruh/8q2Nj2sV2cU5Woa6ijSmLXWmBQO8J22ubigzEoXGSpHb
   qdhVSNPbWtCcti410wA6kORxovCb2hLdJRyusBkEmi+fYSV9j3DsCK847
   ZvE+/fqCp39XhsmYdD+uLHpZlKm9A3ov+8B6Msr/ZkTiA/IbR0MEfA1/5
   l9JH8nUNaLZPzmpdtJFvhj9E6vTYK+izpd9SkiKHkPrHJ9HBud3EihB7L
   Q==;
X-CSE-ConnectionGUID: CuGQHopQSg2lY3yzY8OvfQ==
X-CSE-MsgGUID: EKiEABeQQaOr545qhhFQMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73647857"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73647857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:08:42 -0800
X-CSE-ConnectionGUID: uCLVVyR/QuCbdhfcyoAb+A==
X-CSE-MsgGUID: u56QrKi5QgGMR/285TOgzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222632136"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 15:08:41 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvKY-000000004et-0uLl;
	Wed, 04 Mar 2026 23:08:38 +0000
Date: Thu, 5 Mar 2026 07:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Subject: Re: [PATCH] PM: Move to_device() out of CONFIG_PM_SLEEP protection
Message-ID: <202603050624.gml2vPY4-lkp@intel.com>
References: <20260302105456.4134882-1-pengpeng.hou@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302105456.4134882-1-pengpeng.hou@isrc.iscas.ac.cn>

Hi Pengpeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge amd-pstate/linux-next amd-pstate/bleeding-edge linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/PM-Move-to_device-out-of-CONFIG_PM_SLEEP-protection/20260302-190351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260302105456.4134882-1-pengpeng.hou%40isrc.iscas.ac.cn
patch subject: [PATCH] PM: Move to_device() out of CONFIG_PM_SLEEP protection
config: sh-se7751_defconfig (https://download.01.org/0day-ci/archive/20260305/202603050624.gml2vPY4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050624.gml2vPY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050624.gml2vPY4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/ioport.h:14,
                    from include/linux/acpi.h:13,
                    from drivers/base/core.c:11:
   drivers/base/power/power.h: In function 'to_device':
>> drivers/base/power/power.h:163:56: error: 'struct dev_pm_info' has no member named 'entry'
     163 |         return container_of(entry, struct device, power.entry);
         |                                                        ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/base/power/power.h:163:16: note: in expansion of macro 'container_of'
     163 |         return container_of(entry, struct device, power.entry);
         |                ^~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/base/power/power.h:163:16: note: in expansion of macro 'container_of'
     163 |         return container_of(entry, struct device, power.entry);
         |                ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/sh/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/cleanup.h:5,
                    from include/linux/acpi.h:11:
>> include/linux/stddef.h:16:33: error: 'struct dev_pm_info' has no member named 'entry'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/base/power/power.h:163:16: note: in expansion of macro 'container_of'
     163 |         return container_of(entry, struct device, power.entry);
         |                ^~~~~~~~~~~~


vim +163 drivers/base/power/power.h

   160	
   161	static inline struct device *to_device(struct list_head *entry)
   162	{
 > 163		return container_of(entry, struct device, power.entry);
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
