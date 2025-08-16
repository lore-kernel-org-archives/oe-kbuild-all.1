Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B837483
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 03:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755313439; cv=none; b=qPv3ekk+LG9SdGsYJm28MFRur64hD+cOJpdp5TFp6ivSXyncJ5be/PQfzttBRW2rv7Y0CGCKaFRfGSXCKtGOkLI2mwZkjrJWP1aYMKOx2gvGLHWEN1VXJCZo/sRBKcLJ40AmFTVx/mjEcUqK3UiC5Iqrch3EKQyxTdL2fs1QOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755313439; c=relaxed/simple;
	bh=fNqSDaRVocB5RlcNtWo+wuUcmCWPT4lkhysov/vkiUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZDLFRvbfPjJNDltDfgXwLwfWCJh2zCl2lC8kBXpeouKGYf1tjQVqvR25gWI8NL7PubGyv8ZlV5+qT2T728qv6MBxR2CUjranWlMXSoDPz/e6ALPedNUTICpF9BRwTPdwUU41TE+nrGTgp3RdT7RCfjeEQx3OKSZdstaxNgE3gaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiIR+Q6l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiIR+Q6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755313436; x=1786849436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNqSDaRVocB5RlcNtWo+wuUcmCWPT4lkhysov/vkiUE=;
  b=QiIR+Q6lyMB0vT/yFbC5bzvgQaicrQQoG4kxnI9zBEfipMX7NhLE1KvZ
   E7M/4EI3a/K/2TCeqekGvYFCPo05rnM9RwjS7TfOSzkS8OFt/gmRgy58x
   0KrnAX4CXEUeogK4sKCrmQIeO1uwUa3vnKTAQ0svqPu+VRdcwvI0wmWdD
   1ChL32jNDmxTCBVQ8M3WohKVbl9owOmI92HjJw5umSejTi+HTiU6gKDpS
   sBXku0KTT8NwHJrQWe+h3SCLmPAQ5j6w6R0d2AQ103FFxTh8cgVm7Q9Zw
   VNlFAD+LNm8VvttTs78CWpFZiEebZxtfJ5JhaWdYNqyBg/W0NGrV+2qle
   w==;
X-CSE-ConnectionGUID: +vif+fyHTpGSaoyUWiyk2w==
X-CSE-MsgGUID: YdQtmLzgR+K1CkCFFv28RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57557770"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57557770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 20:03:56 -0700
X-CSE-ConnectionGUID: 00KgoiPsTbuYFnk5mlTh+g==
X-CSE-MsgGUID: t0twjbp9RhiSH7UJnyfUYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172360186"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2025 20:03:55 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un7Cz-0000et-0S;
	Sat, 16 Aug 2025 03:03:53 +0000
Date: Sat, 16 Aug 2025 05:03:50 +0200
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: "__st_r13_to_r15" [lib/zstd/zstd_decompress.ko]
 undefined!
Message-ID: <202508160533.gJesbe9d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dfd4b508c8c6106083698a0dd5e35aecc7c48725
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   5 months ago
config: arc-randconfig-2006-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160533.gJesbe9d-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160533.gJesbe9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160533.gJesbe9d-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__ld_r13_to_r23_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r16_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r19_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r22_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r15" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r16" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r24" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r19" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r23" [lib/zstd/zstd_decompress.ko] undefined!
WARNING: modpost: suppressed 7 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
