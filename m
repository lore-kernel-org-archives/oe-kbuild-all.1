Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045761DE2A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 05:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754889153; cv=none; b=BK93oF77w9/sOivZAN8xO973oQhzuS44P3mSCdu3edq3X1tUeYg7z3VjotmzP9g3C72aLSuh2bNaRuNA0KvFlnhBZxPEty9ATNPsLNfqjTiqpVRpZkxjcwOfFw3wdWLme5GKFaQEg4Z/xBJaFHgujmCMtqKNmYAN397xGN+v6Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754889153; c=relaxed/simple;
	bh=dzAYkTvpfWzFEcZhPBMpWgESQmMYrDwexRrH+XP5qDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePVO5eQb9X1trU9aGX12TmCSFJByChWHNogxP9u9mKgy2Bq5ySV6oxoPFqcab1DBsaLM9s5LqJa9rFo0y9iuroFXvZtyM20lSeHqdIETCIG5fMCUXr1qNDEW7DbdA+R5cuoRN6BworG8M7GzSjs3ThtJcZlNYQ9Z+hDGenjho2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ym+yys5c; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ym+yys5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754889152; x=1786425152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dzAYkTvpfWzFEcZhPBMpWgESQmMYrDwexRrH+XP5qDk=;
  b=Ym+yys5cLzo5BpbhFZfl5vEEWERt/+tHO3F157u/fIF1na1f/yB6RXzQ
   EZJqnsuzdeRNZkFHxJXkOkpGP4B7VLR7XVpbreC6R6O+Tj5eTD4lrdpfC
   fURqZyq8fl3DYBRdEPixGKX+zrbqLrIJNrav5NSlM9px6+A62sUs5NUJZ
   jFPuCrk4jKVj40y34Iphe5d8FzmeIw/OoRRaBnGqsym/lrw6eW+AkgfYs
   cuNGDEFvFQ/70/4B6rqaiSMknlCeRc4ymJBMZ5QfzS+e6hmcUGKWstTs2
   LngbWUsLdFBejGmATbOcma6KjmwPO1q+xC+mABdTlqWPz8JEEfXcDQdiJ
   g==;
X-CSE-ConnectionGUID: njxiUWKXSJK3E80DnQsAXw==
X-CSE-MsgGUID: cHK+0gznTxSgsmC5D1tteA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67729609"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67729609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 22:12:32 -0700
X-CSE-ConnectionGUID: TUvFEAs0SmqMDd1Mg5BR1Q==
X-CSE-MsgGUID: b+r2gddAQnKxn4I/9EUjJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165312647"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Aug 2025 22:12:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulKpg-0005Yc-28;
	Mon, 11 Aug 2025 05:12:28 +0000
Date: Mon, 11 Aug 2025 13:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-next 2/9]
 lib/../scripts/dtc/libfdt/libfdt_internal.h:9:10: fatal error: string.h: No
 such file or directory
Message-ID: <202508111330.qcuvcrC9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   18adc1b2661a506b233aa53c4fbe2243c7f4db20
commit: 2a52e4d89847745f8ab76265199a371ef5e7f93f [2/9] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
config: i386-buildonly-randconfig-006-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111330.qcuvcrC9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111330.qcuvcrC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111330.qcuvcrC9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/../scripts/dtc/libfdt/fdt_wip.c:11,
                    from lib/fdt_wip.c:2:
>> lib/../scripts/dtc/libfdt/libfdt_internal.h:9:10: fatal error: string.h: No such file or directory
       9 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.


vim +9 lib/../scripts/dtc/libfdt/libfdt_internal.h

   > 9	#include <string.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
