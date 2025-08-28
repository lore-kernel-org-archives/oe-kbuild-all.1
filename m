Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203773FC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 00:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756342635; cv=none; b=r6nYR/NYWd2fsEG9g5uvP0XlRC5aqx1FOujiF3xkK4RLsGI9/7HUqzHM/CET3xtOFwA3pAhgt35TXpuuaEKWJ5T/QOw+NgmWe1fjDfVy9LTyF2dEH0XbKbsiqr6Bmh38/IMtWOMZlwJHqlPMGAfsuc6buhe3jZcZs1NeIgs/v2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756342635; c=relaxed/simple;
	bh=k9JWxzmPPYyrwG/aOH5XMXC0K175DJGv2G3LVTRCZkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMPq6hKRI1YSca4t8smtAOlsoRzS4B/sAHXBoOrIRfx32sfOk5vNngDuSfJN+f9onAvALqaclMIDAf83s5W24PgRuZx4U+Gxhu7x+4zT0vAQaXt1M54l+TwtkrnxNB82us7cT0QelwVGINqT3QjltWmYxYnxSvMr3E5BNd7mPAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUmZ+xme; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUmZ+xme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756342633; x=1787878633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k9JWxzmPPYyrwG/aOH5XMXC0K175DJGv2G3LVTRCZkM=;
  b=EUmZ+xme5b1XdsuErlM9fjIaiXRV742fGn7E3WZkZ2E9A9MSMp9F5SsZ
   1eUIWucZiDATL1sPDN+9JUwIYh0IPoX7FBuGBTc5m9eD/KNo36bATDNqK
   zczire15SFLYmtkjtnHFukb8MQPN/ftyOKx46RIlh4OgaDcErjRWeC7T/
   tur9xloj9SOlQP4VlvzCNA3/KSr5g3XW0Crrwv8hPyS2psNToeejzgQ9C
   SZwwfGKtZxm4An4XoVQHlDEkhZ/n/dIsC7J6VmIAF9wu7Q4LNDbzTeLhK
   AswOTrfD/cGvH7mQJMsa0mNIwGC4c/23LqYTJn25TMq8LI3C2SwJlSj86
   g==;
X-CSE-ConnectionGUID: YeZgzxAYR1q2z/BhDjygBg==
X-CSE-MsgGUID: EaI4EtCQT7K8wcCvmua1ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58536071"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58536071"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 17:57:12 -0700
X-CSE-ConnectionGUID: 0Jhp12WqSV2dOgsSG9z/4g==
X-CSE-MsgGUID: wxsosxjvS0CfpWMRwx5Y8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="175269055"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Aug 2025 17:57:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urQwu-000TJD-36;
	Thu, 28 Aug 2025 00:57:09 +0000
Date: Thu, 28 Aug 2025 08:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-sheaves-v6-benchmarking 5/22]
 slub_kunit.c:undefined reference to `__umoddi3'
Message-ID: <202508280807.LqHsRKpp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v6-benchmarking
head:   275adcee299ce24515eac5740d4cd414430d95e7
commit: 44bb30a0a76203af426651795ff0c90bfc60bdc0 [5/22] HACK: SLUB_HAS_SHEAVES
config: powerpc-randconfig-002-20250828 (https://download.01.org/0day-ci/archive/20250828/202508280807.LqHsRKpp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280807.LqHsRKpp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280807.LqHsRKpp-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: lib/tests/slub_kunit.o: in function `print_improvement':
>> slub_kunit.c:(.text+0xc4): undefined reference to `__umoddi3'
>> powerpc-linux-ld: slub_kunit.c:(.text+0xe0): undefined reference to `__udivdi3'
   powerpc-linux-ld: lib/tests/slub_kunit.o: in function `do_bench.constprop.2':
   slub_kunit.c:(.text+0x14ec): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
