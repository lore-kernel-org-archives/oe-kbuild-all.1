Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A4B32ED40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 21:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855174; cv=none; b=m1oZf6F1T63l21uEg2HFpJrcXlArrdcdkydtGjSlkFDG8OkmytFmbTXVebEYzn9mRc+0Js1nfBf4EtmoVJqGbzv4RmcV2I6aVWFevZvhu0mwJeHNOcfQ41Ct5M5jRiU0Si8/dZoqwXK0SIqEfku/gGE9koufsOHz3QsJ1oymv8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855174; c=relaxed/simple;
	bh=/GItwy46uR6c+o4skqjBDrBR/GsR5fk/Li6H7R0ZbLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hsf0mB2DLDOT3/gT2eR7Ajm6Nv2AuUAXXMM+uyTrGO4EcDE1OvfH0KYAXPPnE0FZkA26lQH9aB+qeiS5oK4M2A03OO5B3pzh8HAbncS/RtlUAfGQLH6xTQQr3nBMxJpn8U2aW1alQv7wxLOfCWhfQOr0V0IktiQaN9l1oqiSYPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIo7pAFe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIo7pAFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775855172; x=1807391172;
  h=date:from:to:cc:subject:message-id;
  bh=/GItwy46uR6c+o4skqjBDrBR/GsR5fk/Li6H7R0ZbLw=;
  b=dIo7pAFepsoYKj5AT1CgchnmcS2rcGJPKwPNc09ftpKVnEQOSe2JvRfw
   Qxoopf5KB+mdFgHKFY8cD9Br9xoMog2UC9vBRkg3+h8ab8hjb5GWkyBws
   ttZkF/8XoaAajQHAm/wkRD534kvFt2FH6i1Z8BfusL4aqyvlnD15WIvWP
   AvYnGeVDFXlWgwLT76V5cY5yZRHbJgnEdPku3T60sBB7G80YYJ1C8y7Ik
   jHdk/l95Ge/FjerCSwL8ZV1ek4OgUcefuOGjnbnq3mZmsojw0jNhSuruA
   3DznMNd7ddWtd2W+SVNV0fOqfa/pRqBx3PnBiHLY6k9C6yMtKvtqxtlPw
   w==;
X-CSE-ConnectionGUID: sdi3s8EiQuGvk1phweQlYw==
X-CSE-MsgGUID: YetY2HVIRPeVmLvI5uo0Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87581285"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87581285"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 14:06:12 -0700
X-CSE-ConnectionGUID: 7NWf3hMwSQe8xoqRJv2Idw==
X-CSE-MsgGUID: gKA0pk1eSby7f0GB6gBGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="226018432"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2026 14:06:11 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBJ3I-000000000C9-2ZEO;
	Fri, 10 Apr 2026 21:06:08 +0000
Date: Sat, 11 Apr 2026 05:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 26/26]
 include/linux/compiler_types.h:477:27: error: expression in static assertion
 is not an integer
Message-ID: <202604110412.7FAXhHtZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kurt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6f85458acd3b63a9c53998bf72b8efc188867f8d
commit: 82c3c913af0c82e7da403f126de414662b19d5ab [26/26] UPSTREAM: ACPI: platform_profile: Move platform_profile_handler
config: i386-randconfig-007-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110412.7FAXhHtZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110412.7FAXhHtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110412.7FAXhHtZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/inspur_platform_profile.c:35:41: error: field 'handler' has incomplete type
      35 |         struct platform_profile_handler handler;
         |                                         ^~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/platform/x86/inspur_platform_profile.c:8:
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_platform_profile_set':
>> include/linux/compiler_types.h:477:27: error: expression in static assertion is not an integer
     477 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c:90:40: note: in expansion of macro 'container_of'
      90 |         struct inspur_wmi_priv *priv = container_of(pprof, struct inspur_wmi_priv,
         |                                        ^~~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_platform_profile_get':
>> include/linux/compiler_types.h:477:27: error: expression in static assertion is not an integer
     477 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c:138:40: note: in expansion of macro 'container_of'
     138 |         struct inspur_wmi_priv *priv = container_of(pprof, struct inspur_wmi_priv,
         |                                        ^~~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_probe':
   drivers/platform/x86/inspur_platform_profile.c:187:16: error: too few arguments to function 'platform_profile_register'
     187 |         return platform_profile_register(&priv->handler);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/inspur_platform_profile.c:11:
   include/linux/platform_profile.h:37:16: note: declared here
      37 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_remove':
   drivers/platform/x86/inspur_platform_profile.c:192:9: error: too few arguments to function 'platform_profile_remove'
     192 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct device *dev);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_probe':
   drivers/platform/x86/inspur_platform_profile.c:188:1: warning: control reaches end of non-void function [-Wreturn-type]
     188 | }
         | ^


vim +477 include/linux/compiler_types.h

eb111869301e15 Rasmus Villemoes 2019-09-13  475  
d15155824c5014 Will Deacon      2017-10-24  476  /* Are two types/vars the same type (ignoring qualifiers)? */
d15155824c5014 Will Deacon      2017-10-24 @477  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
d15155824c5014 Will Deacon      2017-10-24  478  

:::::: The code at line 477 was first introduced by commit
:::::: d15155824c5014803d91b829736d249c500bdda6 linux/compiler.h: Split into compiler.h and compiler_types.h

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
