Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D39635CBB2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762895846; cv=none; b=Q0mBT0YLghZHM1nZGLmS+gqKvtZBhA4F0wicybqFFwwq0HrXdVaQMo0tR+K4qbWwvGw+DYKgP2KP1clgPkCPZXR1l51yKcPPjfRkzvOgvOpnDhiNoS6hoUQ5VKcxl1GYS04R9Lz89dj+K53ipYr5UCHZJKCl8z7sX+RQgMP7QHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762895846; c=relaxed/simple;
	bh=DosRkRlem6U/Ncq19QLpd6ErK54eb7NRoeLsVEGEm9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9HeXFAI7AxWFPz0tMoTMe12fmiXtpjHsJTPi+Hhi30I0m5f4p7nP3bV8LO0AEAgdHUi55ABaJxEKEN5Qpq8KpzJzPT+HcIfPMxuKi1/73bobF1NjQ8kJlPwK4R526xvy87pUv1UiPGjxQPwiB1gRdMAh4N3w17L4Q0/ZHnM2TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfWAEXCW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfWAEXCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762895844; x=1794431844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DosRkRlem6U/Ncq19QLpd6ErK54eb7NRoeLsVEGEm9U=;
  b=lfWAEXCWWyZUw2WUPEF5vaE6uVMbZKp1SgFuX35dRgZnwRSlwoFBqvxc
   ueiGaFJIVeDE7cce5bF/GcD+i0NigvFRit8ZR32FctdhxTQqakAPWVcyx
   lDp8HBPeQJKCGgFf0/9rvmMd4C+mJAvtGrjfTfYDQDkJjE10tUXcFPG1K
   XhFV2JQnKjq1hchGeC4Bva4YQClD71aupCSSlu7iz3XrS8SV/9LbUjetr
   8OOoE8JVdhG+IsY8fa+wmOz3Ydt9OjtKn3tCf7HSUv1UXNPThko1jwvyN
   f+6o3rKqMZeU0YT380sVJryaFJf4OKllza/wkTERkayOTE3ydur0Kyr7m
   A==;
X-CSE-ConnectionGUID: 4HCNOJ6XS++5HqwtEqhT6Q==
X-CSE-MsgGUID: Dm0NGBMKSAWUkKgNDkU7kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64996049"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="64996049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 13:17:23 -0800
X-CSE-ConnectionGUID: eishCo3vQU+nUemOJma9UQ==
X-CSE-MsgGUID: UjQokckcTA2TUYy69JRQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188317539"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Nov 2025 13:17:23 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIvjs-0003Zz-2B;
	Tue, 11 Nov 2025 21:17:20 +0000
Date: Wed, 12 Nov 2025 05:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:asi/next 26/49] include/linux/set_memory.h:71:5: error:
 redefinition of 'set_direct_map_sensitive'
Message-ID: <202511120547.jvCz3coV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   3c0474df6f211ae4eebffa6f5538335687dd9e0b
commit: 6dd7718570d9a84ab2563fd3e9d696935dfd904b [26/49] mm/asi: support changing pageblock sensitivity
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511120547.jvCz3coV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120547.jvCz3coV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120547.jvCz3coV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/filter.h:19,
                    from kernel/extable.c:14:
>> include/linux/set_memory.h:71:5: error: redefinition of 'set_direct_map_sensitive'
      71 | int set_direct_map_sensitive(struct page *page, unsigned long nr, bool sensitive)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/set_memory.h:48:19: note: previous definition of 'set_direct_map_sensitive' with type 'int(struct page *, long unsigned int,  bool)' {aka 'int(struct page *, long unsigned int,  _Bool)'}
      48 | static inline int set_direct_map_sensitive(struct page *page,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/set_direct_map_sensitive +71 include/linux/set_memory.h

    67	
    68	/* Without ASI, sensitivity ops are a nop regardless of ARCH_HAS_SET_DIRECT_MAP. */
    69	#ifndef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
    70	static inline
  > 71	int set_direct_map_sensitive(struct page *page, unsigned long nr, bool sensitive)
    72	{
    73		return 0;
    74	}
    75	static inline bool direct_map_sensitive(struct page *page) { return false; }
    76	#endif /* !CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
