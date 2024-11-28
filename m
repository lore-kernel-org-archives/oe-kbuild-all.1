Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349478248C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 03:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732763276; cv=none; b=vBIgFnkRQpJiAa/UlMV4S3240bFJw32tQiQuMMorkxTy5a5Dql87goI2e62XJYG615QT96asdkdn2zbuwtPRY2HHenuloigugrerkooYPFxpA7ASHOCVqzaqMgmcq5VSXmwIprQLtYhYxO7vxjuzKR0ngyLLNLZsDInJ0yNZye8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732763276; c=relaxed/simple;
	bh=mYVIK6LylDTTtOG9WmR93ITmyVq86taonCZx6lFfUQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqPd/C9y9WOc5klOTICl/xLzKCpwuA1SE02uN7jvx+ycdQ7PcCaxZmcKRISGGfvT8zzRtJu0+GBh7nV2ZG9kdIQUY45oGRI3qZE8MhdMmHSos1Q1/PGswP9WrAZmDJgfNP4mfF9W9y5WJ7U+Gpum7iq3t1yRhMI/NRXb04fMixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqXFnKRQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqXFnKRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732763275; x=1764299275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYVIK6LylDTTtOG9WmR93ITmyVq86taonCZx6lFfUQI=;
  b=aqXFnKRQsU2Gaxzy8rWic2HUcqYVIPTP6FwsJNOYLP1vA6KdwAU2JblE
   5sEfCUOimUv/XB6hXMGVUzG2RBXIb7g96gUQikkaptROb5aryB/JXdbAr
   nDCXSvjhjkg22iW/xm2wr/JAxKZqlhf9jR8iFpJw7EF1JrhAo8ryWCFyB
   Qm+r43TrQyFqXV5flsfXML+/HBVNDq6JA2iRJy37Yv9/69QOVsEJeyOyZ
   sco5eqJADkm09uUIc08SAV1EF0otuqzTYLiXSRYqk540i21YXTl7IWN/n
   b6qFbukrduNU/nYIAcJ6bnRxjooiPCtO1wCPfKiPbsXeCWlE9cvTHp/KT
   w==;
X-CSE-ConnectionGUID: KPJ13aeJTCSbxRfJN70lSQ==
X-CSE-MsgGUID: fgrQORaDQz65GgT8eMQCnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43595682"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="43595682"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 19:07:54 -0800
X-CSE-ConnectionGUID: tEfd49JOR7SyTNpr/nioUg==
X-CSE-MsgGUID: G1stwR9aTKimB4SoPltmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="96871004"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Nov 2024 19:03:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGUoj-0008nT-0n;
	Thu, 28 Nov 2024 03:03:45 +0000
Date: Thu, 28 Nov 2024 11:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_9 8/12] uprobes.c:undefined reference
 to `arch_uprobe_optimize'
Message-ID: <202411281118.gAIPHt8I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_9
head:   b1d916ea335d828e290e0c2bb8bb5bebdf0b633a
commit: 2d5c7f0b55e1e8dd7535e47d2d034a0b2cf7f05a [8/12] uprobes/x86: Add support to optimize uprobes
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241128/202411281118.gAIPHt8I-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281118.gAIPHt8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281118.gAIPHt8I-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/events/uprobes.o: in function `uprobe_notify_resume':
>> uprobes.c:(.text+0xdd7e): undefined reference to `arch_uprobe_optimize'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
