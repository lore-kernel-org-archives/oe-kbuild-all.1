Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA82FD66D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 03:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769483551; cv=none; b=t7IBl/5C0tsqyLGlTALjRp3kXeMN1l+OKJDIA0xT7KyPzCRJTBMsLMVpNcNSPooBuqKmT10kvPFz/Lpgwjif3yS3BWnduUIsFri5UAQW311lWKHVQwWKwfwZ9L1h6mIsC82THSPxwpVUPbJVjY4tDCgy2VpxON+ivfjZytYymbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769483551; c=relaxed/simple;
	bh=dZgHfJZYAxmdqz59PWencQ8OBDK2kZfeaz/nBXhr6gA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fqDwksDNIwSQFb3wI/vsUk37larGL27Ndcvy3DsQFU9QMccOXfWANDhKEOTWA+AI2iPbJc5lEIPKseZQi6m8+GjSIZ1cfj/1DqvkjH9TZKjYaDYiGja+o654uCU/Ca0M5JPeQZLJoC3R4ZBK83VU9Wc8drK/c3ncWWgJ4I5nfjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyjQIdZ0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyjQIdZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769483549; x=1801019549;
  h=date:from:to:cc:subject:message-id;
  bh=dZgHfJZYAxmdqz59PWencQ8OBDK2kZfeaz/nBXhr6gA=;
  b=DyjQIdZ06JwM9kuqZtcJJyXue6xFOUOGtIwdTYaQCrU0Foy01ycbQdsE
   J/g/D37Y4PvL0T7WtiSQ6bQPejVZDwxYG69vHSlOM7wRrLAXwKDKgPWIF
   SVjyV8eaghmImFxZ+ZSaJgtnEq2SpZxwljuk9kKN2OHxA9xKqKkCTChJ5
   ikuteH/iow6QFTSmrU3WP0QrhqsEL7uHoNw6zelrtxcvFUb1USvGO5sKi
   ygdcH+sxgtZGIrH4Fqj0vV/fy9ArnCJU5XltK6/qe3N+nHeR2dBdxVZiy
   nfxSfT1Kl4t7J+QS586tZvZU72PSqRa66FwvR8bvS+A1XNVvJXG7Gyv+9
   g==;
X-CSE-ConnectionGUID: y7ZR7k3kSsyvQVYEcCP4Ow==
X-CSE-MsgGUID: QlaQVzHCSS2LEM1gbRygvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81388195"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81388195"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 19:12:29 -0800
X-CSE-ConnectionGUID: 8ak+eCnfRAiSBOiCuSg8Hg==
X-CSE-MsgGUID: 7DxmuoSNRymJZwc3JfAhtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207910343"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2026 19:12:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkZVA-00000000XwL-3wk3;
	Tue, 27 Jan 2026 03:12:24 +0000
Date: Tue, 27 Jan 2026 11:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 14/18]
 include/linux/acpi.h:1582:16: error: returning 'int' from a function with
 return type 'struct acpi_pptt_cache *' makes pointer from integer without a
 cast
Message-ID: <202601271144.gwdzBOIQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   8182dddb709d03a64b99b430d05f8f21103aa9b3
commit: 60aed9e92fe0ca93b56a46ae251eb1ff851d572f [14/18] acpi: pptt: Add helper to find a cache from id
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260127/202601271144.gwdzBOIQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271144.gwdzBOIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271144.gwdzBOIQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:31:
   include/linux/acpi.h: In function 'find_acpi_cache_from_id':
>> include/linux/acpi.h:1582:16: error: returning 'int' from a function with return type 'struct acpi_pptt_cache *' makes pointer from integer without a cast [-Wint-conversion]
    1582 |         return -EINVAL;
         |                ^


vim +1582 include/linux/acpi.h

  1579	
  1580	static inline struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
  1581	{
> 1582		return -EINVAL;
  1583	}
  1584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
