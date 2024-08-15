Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F718C3E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 04:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723694939; cv=none; b=lu8nRJySGUbSkDjoskMDreQk9FP4U2DNFq6ckk8kvi2l7V2NoNOn7tiBRCx62kXO+tHjp3YnAiHsJgfkzz/S7wSvsXWsU71Jf0nxNR6WuLYKoSDt1wvjcdCRYS+h9mjCL3MJF3NiOQhKIbNz3hhuyrwkoT4X3zxsG0b+sRcbhtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723694939; c=relaxed/simple;
	bh=waT0Ohbgk4JC8BZts5Gdi96Io5l8Y+gcTfaxJLIFHTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PEVhPScA6hVW6hHPGU8gn76qZ5a0M26vIR8oJUjLuJci1BIFJ0v9Ei0UIJXX8+4v2AXad5u9SHGkxX1wXUz0900QBYJFtB+o53H3cq3ZczCm5DYaJcrrGc/kWm5NM9vnZ/tiSaIgRIGYw4bRkv8Y2KJbhdcTP0ntwIgce3ZYdCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agYNmAgj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agYNmAgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723694937; x=1755230937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=waT0Ohbgk4JC8BZts5Gdi96Io5l8Y+gcTfaxJLIFHTg=;
  b=agYNmAgjs/ngByK3xg3g8OKFw3g5OUaOoyTDFaV95wwmsyl4oeeFjD7u
   ws7531iTC13MjBkYU5aCT0KfyeAH/fVixOce23meJ1Ap5YzxtyblBWNF7
   bov4cIbKP4E6O47zui3sh5atN4StQqJU/oKSg1Qpv+HZix2T7BV8zwU2j
   82cnre414T7+d1fpcmoapcFS3EV86RiZQoV4+QAjbhsi/nYA6OISAfpvE
   YffeLpWJaRyk88O5Ih/GhOCY4JpDGtMMLUQZg/n6dtQXjlz2bouugkHi+
   UE7aFP4uq0pZXuEvH1BDuhYGyYGytxmvESK0mEozxE5WAg28e7vVE53d/
   w==;
X-CSE-ConnectionGUID: H69BnkCdR0iQ8fqjah0myw==
X-CSE-MsgGUID: ZJhMcirgQzuIt8KizbZtXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="47344018"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="47344018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 21:08:56 -0700
X-CSE-ConnectionGUID: 3DOo7XuzQeS8E8O+9W1/tQ==
X-CSE-MsgGUID: OmTYxdjqTTmGAUgB35+twA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="96751064"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2024 21:08:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seRnA-0003Am-1B;
	Thu, 15 Aug 2024 04:08:52 +0000
Date: Thu, 15 Aug 2024 12:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6855/13428]
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse:
 dubious one-bit signed bitfield
Message-ID: <202408151242.KQeovtav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   80659f8a805633d663edc260627f7fa51fd8b474
commit: eba3cbcfeafedc65b74eea8faf68aae00aebd5b6 [6855/13428] drivers: initial support for rnpgbe drivers from Mucse Technology
config: loongarch-randconfig-r123-20240815 (https://download.01.org/0day-ci/archive/20240815/202408151242.KQeovtav-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240815/202408151242.KQeovtav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151242.KQeovtav-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:768:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:768:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:768:9: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c:278:25: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c:278:25: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c:278:25: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sfc.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:148:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:148:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:148:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2474:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2474:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2474:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2507:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2507:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2507:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2544:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2544:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2544:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3846:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3846:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3846:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3849:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3849:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3849:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3939:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3939:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3939:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3942:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3942:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3942:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4142:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4142:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4142:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4210:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4210:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4210:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6786:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6786:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6786:17: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ptp.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sysfs.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_debugfs.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield

vim +158 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h

   136	
   137	struct phy_abilities {
   138		unsigned char link_stat;
   139		unsigned char lane_mask;
   140	
   141		int speed;
   142		short phy_type;
   143		short nic_mode;
   144		short pfnum;
   145		unsigned int fw_version;
   146		unsigned int axi_mhz;
   147		union {
   148			unsigned char port_id[4];
   149			unsigned int port_ids;
   150		};
   151		unsigned int bd_uid;
   152		int phy_id;
   153		int wol_status;
   154	
   155		union {
   156			int ext_ablity;
   157			struct {
 > 158				int valid : 1;
   159				int wol_en : 1;
   160				int pci_preset_runtime_en : 1;
   161				int smbus_en : 1;
   162				int ncsi_en : 1;
   163				int rpu_en : 1;
   164				int v2 : 1;
   165				int pxe_en : 1;
   166				int mctp_en : 1;
   167			};
   168		};
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
