Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6932BF22
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330062; cv=none; b=InVE6T4CIfGSrTAYTIbGVxncDMoA8XJ3RyU1Wgoba7xhzEqGgybAvAM8fT5r2j7qAM74ljrl1c3g1wAihfDf/+PBDOc5+igOxoigogMspAjkiB3DviebN8oSKxx9tFtpUBKJc50SU7SUjgCOQ0pRsgh70+XuA6yxpwfrdl9Y+Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330062; c=relaxed/simple;
	bh=0jwH+63aD1CoHdz7eWUDptisJrCiu79661EKChh/Bz4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dW+RTBQ2P6mMLOHM5mjddpmkXoLIlgXdOia1xF+ayGmkEfLrGcsjVD/fEmyB2HxGnvGaTN5v5GKWezdzyUrX0mbjFOWv0Wh0sBf8kBHenVlw4P+Kf5jzUFBST20YUqo76EwSPWavswc9cPeC62dRIVSwVz+YgLjx7jsUbQCv35k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkK4POv0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkK4POv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771330061; x=1802866061;
  h=date:from:to:cc:subject:message-id;
  bh=0jwH+63aD1CoHdz7eWUDptisJrCiu79661EKChh/Bz4=;
  b=NkK4POv0Wj1XVWp5ZBJZNrZ2R1qka7TkCDktvwCb/RwcCMxYBOFgJLgp
   pSqZfZzMTN030kSWBRUvZ+ZnWJQeDsslVpRnv746JDas+nxpKb9L60dcc
   wY9h4JVHC3VZTh7RHNSvTv+bdKBnvHqX84lyZNT52gAuaj5IyOjcsiUzs
   /yOY3HG1ki0mmCaR5rAViI9af9CUQ/iyy8NbEDcysaN02gpeBpZa99WBI
   AowcOmkkV1Itqui33j2oai6QhzgEcLBbLGLS0L5Yf1bxcs8JMWGdpdzMh
   9phVFMo+2fk+WI/7yAeNhhnOeVJMwHvmJcTGJ2QkFWxvKY6xCsedaT76a
   A==;
X-CSE-ConnectionGUID: CIKzCQxNQqGqMm8trahnMw==
X-CSE-MsgGUID: hnfSMZPRR1WvOCHrENN5YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="97856773"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="97856773"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 04:07:40 -0800
X-CSE-ConnectionGUID: WNHMBjHgSDKllHImtEtzJw==
X-CSE-MsgGUID: XndW2rDqQ2yaKEpK1EDiTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213875897"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Feb 2026 04:07:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsJrc-000000010v6-0qao;
	Tue, 17 Feb 2026 12:07:36 +0000
Date: Tue, 17 Feb 2026 20:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 include/linux/compiler_types.h:477:27: error: expression in static assertion
 is not an integer
Message-ID: <202602171954.ZXzDQp5Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kurt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   590a98f7b9783af3a52d4213d1f276148be94b4e
commit: 82c3c913af0c82e7da403f126de414662b19d5ab [2/2] UPSTREAM: ACPI: platform_profile: Move platform_profile_handler
config: i386-randconfig-006-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171954.ZXzDQp5Z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171954.ZXzDQp5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171954.ZXzDQp5Z-lkp@intel.com/

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
