Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940535;
	b=019gcnPLLR5J46GvoKafUKuVu75fo07K+b1Wz8bEcuEg3xXIEfHz3oQ3OJeKYKzTf3Ln
	 YVTFdPIq2DyLElEbYfCXiyKQiPpEEpJw/CyA5wiKxELtx9iwCDxQSJR9xjLdy9ep02aDO
	 LwYWsfK9930Q+ghU467kWZItHBTInlOgKwCFOeTJpSv1s58Zf9mjH2gRbzFB95bkQkjEt
	 9uEP8Dd7tnJAKXu4PMf3IYeCj5U0cveKVO3ItLhvjM+DaK6xWSocu/Qhtf+gcW40w97Sf
	 uwvPl/ih25ECNyIsYULFnAMy4cq8+guMXEckCAcSmq1N2LgxogoLlhJ57y5e7eUFdJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940535;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ih7nCEl3GvNwfn9J0uRMhp9Y+N1BjRlQIugn+xog/n4=;
	b=PoltqENNhOBHtv8oM2JfaPazctmBfbLXPIGrO/RWr685py43WjEX8qYkz+Vk0WOih+QP
	 LFcGYQWqKqaDGtfIJzdXNxBdu9aYurD0yNEpgjNSjTfK3ZWZyAKrbE68CmJOQItB3ay0F
	 pEL0quUCfZI7vfarSimqCzhVK1qgYi2XTcJunJVmaVCWL6DVoszcpaUM+KXXzlQ5YBH65
	 Fdz6inxYkkI9SCUXk3bDtCbaXPkU3B3nKllkLTJoWTJfiVVE80mN7g3W+XKpv74k0IFXQ
	 Kdw1vn4B4IAwJiso9hVsAuxFyp7WrABhrrUYwRiDCr7u2NXL1HNgFnWIGvPyPs75hSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jvCm0SSo;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E3606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 15:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE3E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jvCm0SSo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792940534; x=1824476534;
  h=date:from:to:cc:subject:message-id;
  bh=/PBBauIthb8VzA6dKUFsdjDGvfV6rCDqpBR4zUVw4jI=;
  b=jvCm0SSoBeSy/1cLY9KC6zPHeYVCQEY+XrFb2inm/vD6qZl9eXuzLCDI
   YHxK/p/Zpyalquwwezj8/aQfzLWtLpwmom0QzSAvCzoDEbxFD2KQK266e
   5tGVZnYEBBaTtkerChO93KL0R1wJk7w7XLjzx6yUQYUhRIXYhfJNeCoZJ
   AFCNoXTDazAqhEFGCeE3+tle0LqsQ4yyODFRw3lEsrRUfiCfOUktfjFXi
   N2JcxeL25t7FWG8B6tU/lGFIDh6JehdQbz3X1ze5lq4ztld8y88iULRu3
   ncG239TkI9zesAQRQ4KqNKIr3I78fr/EoyimHY4uYNyRkBE9mMxbYr84+
   A==;
X-CSE-ConnectionGUID: qgZg1fjNQTqiheHcvOWK9Q==
X-CSE-MsgGUID: iHmK1YDtSxyfi0PuO0IOgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1629834"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1629834"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:02:14 -0700
X-CSE-ConnectionGUID: bjgCzMB9SzioG4Tdf3FRdQ==
X-CSE-MsgGUID: sU2aaPyIQOWUAqQTZkyu4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="5918290"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 25 Oct 2026 08:02:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKzje-000000003j1-1bA5;
	Sun, 25 Oct 2026 15:02:10 +0000
Date: Sun, 25 Oct 2026 16:01:54 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_1 17/62]
 drivers/attestation/core/core.c:22 attestation_algorithm_valid() warn: always
 true condition '(algorithm >= 0) => (0-u32max >= 0)'
Message-ID: <202610251530.aCYKBFwj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_1
head:   e63637d55bc3ae7cbef988e3525c79b9381dba1b
commit: cae6b353cbd72ec9ffa91eae8788f9c7b742e22a [17/62] attestation: Add CTLV operation handling
config: xtensa-randconfig-r2202-20261025 (https://download.01.org/0day-ci/archive/20261025/202610251530.aCYKBFwj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251530.aCYKBFwj-lkp@intel.com/

New smatch warnings:
drivers/attestation/core/core.c:22 attestation_algorithm_valid() warn: always true condition '(algorithm >= 0) => (0-u32max >= 0)'

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +22 drivers/attestation/core/core.c

16a5aa0ea7bdc1 Jiri Pirko 2026-10-14  19  
16a5aa0ea7bdc1 Jiri Pirko 2026-10-14  20  static bool attestation_algorithm_valid(enum hash_algo algorithm)
16a5aa0ea7bdc1 Jiri Pirko 2026-10-14  21  {
16a5aa0ea7bdc1 Jiri Pirko 2026-10-14 @22  	return algorithm >= 0 && algorithm < HASH_ALGO__LAST && hash_digest_size[algorithm] &&
16a5aa0ea7bdc1 Jiri Pirko 2026-10-14  23  	       hash_digest_size[algorithm] <= HASH_MAX_DIGESTSIZE;
16a5aa0ea7bdc1 Jiri Pirko 2026-10-14  24  }
16a5aa0ea7bdc1 Jiri Pirko 2026-10-14  25  

:::::: The code at line 22 was first introduced by commit
:::::: 16a5aa0ea7bdc17fc63eb251a8fcb0dc356e501c attestation: Prepare provider and instance core

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
