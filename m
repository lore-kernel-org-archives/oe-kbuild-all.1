Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69859207A23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740218339; cv=none; b=uChmDrGMhhEwWRoVBBhQR/uVJrAkb4EdPWC5yqYef6UCeQUADz/FUKyhIshGDD39Q/qzUxD5TzHA0Ehurv6b/DhluWq/Zo52vIy4lBaYgulfXq+FP+XWWeYetv4qWsno5l2nZ8BjQZzqweqKT/fE+Xkp97bGcFg9SL3EiUe+Wac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740218339; c=relaxed/simple;
	bh=EyEQMzDnkx2JHVDCp2MeuYVWmDF1PXFUzas1pP0SVsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPqHRtwNRE+kaL2fT3gYWJ3FhAWw6Grr/1hZ65knH+F72wdXYqqTTDe0e2ZcotkN0awO2lb09/lx9trVJzext6WaY4sX1Zmrz4lruCJ2nJDSNzoPMiypEn5gG+7CfnRoJas7vTNMYzjf33PBgFugxmLar6McgeWKkNO4kbAtWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZzQbNuX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZzQbNuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740218338; x=1771754338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EyEQMzDnkx2JHVDCp2MeuYVWmDF1PXFUzas1pP0SVsU=;
  b=lZzQbNuXHAptQl3ezV02Q8Mbq+aWAhpfoc5CzpPPus1c2dKLz9c1T7sr
   2v5luSG+Rp89n5GmZdHER+KEu02IuFiHbOQeLa9svJW1TtOQjNKiTYDp5
   frjaDIhhXundPI8XaD128kcRAYxVigxHQdLHcxzo7O9m+oRw10sLQrYfO
   czLNIxf5xyr44TsABWsFY2P/dCfWRhs6TUrunZ7ndD/pkC4YQkZbiXiKt
   ry0qZxiRbnZJPDyTd/c0eWouIDvkT1w0rfWVN3bejVEv3FkYabow3fqs6
   e/RuA8Aw+TfiMMwcoFDDe1bvWXNh7AZ5W0UCKRjkJH9GznRu8gJFECJ7d
   A==;
X-CSE-ConnectionGUID: tYAF3/hhQ+eKpEHSv8CmeA==
X-CSE-MsgGUID: 9D3i+w6hTeu6juWQLjuWTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41050717"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="41050717"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 01:58:57 -0800
X-CSE-ConnectionGUID: woZSGifmQAmQQAOt/trzDA==
X-CSE-MsgGUID: hh4F/2zmQKSZpSLd5qvPFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="120221076"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Feb 2025 01:58:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlmHd-0006Sz-1L;
	Sat, 22 Feb 2025 09:58:53 +0000
Date: Sat, 22 Feb 2025 17:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>
Subject: [kees:for-next/move-kunit-tests 3/10] WARNING: modpost:
 "csum_partial" [lib/tests/checksum_kunit.ko] has no CRC!
Message-ID: <202502221712.0sIYUprL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/move-kunit-tests
head:   03d0e920d775c58d5f71febbbc6e6c2135ebe70f
commit: db6fe4d61ece24193eb4d94a82d967501d53358c [3/10] lib: Move KUnit tests into tests/ subdirectory
config: um-randconfig-002-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221712.0sIYUprL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221712.0sIYUprL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221712.0sIYUprL-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial_copy_generic" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial_copy_generic" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "csum_partial" [lib/tests/checksum_kunit.ko] has no CRC!
>> WARNING: modpost: "csum_partial" [lib/tests/checksum_kunit.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
