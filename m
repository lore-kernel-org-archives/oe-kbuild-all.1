Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9BB644
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 01:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735351160; cv=none; b=Yuav2C3xa5XrG6Be5qk7UqzYUOUag1bR4AvGiwCsaaECsyhgDC6iDfk4Wk1/8DgDrfjzSjBhdXukDmEEGhCCHx25yZxVL4IhHEEXO10FScQdCpMGlGLQkQdFeFtxMjgtQgkwm3JMhHJWrUUjpUlD+kq8k5TFz7NshFyqkAOIq8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735351160; c=relaxed/simple;
	bh=fGZZtqu7I7YJeo6IJQD+D4MosgWbi/JEqWOo8dDXA5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ujvb1dYCIdgDELcBumXJU3A59vvmaEknVKxL20Ns688Jt4QZV72Zw9WAnnqv9FEy4aWv4XET0sPPEmBX5mpJXs00cYHMZXNiANjx07Y/87eso29UQCP8igCx9npCKMWIfAnKZCRHVTY3fR7FmU1ShCelehdphtugfrrwRuqO7WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YglXMCMY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YglXMCMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735351159; x=1766887159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGZZtqu7I7YJeo6IJQD+D4MosgWbi/JEqWOo8dDXA5g=;
  b=YglXMCMYJ7t7gAuA5H8jCimlyH4M27tEwvGPtnCKNUGGNq/lVb3yiYmJ
   Vfii2B29jBmuK6v0+6iw2ZQ2yNrwl901jevFKgwds+4CSSC2HeTYC4WEN
   6wvGG+RZYp3WVbzyQk1IawtpkPKgbBeOl7fcGI1rdWliq43VuXHH6vVvu
   wbDXOj38I66Th6D8ZPPpWxEcpcU+1BVjbKk2UVLvWb6xabErxe/AmolNB
   EyYRhk7NNL4vji2STuF+XYysSr9C10buVDd8qUDmApujtV3+jMZrIfA6i
   4lSgxwSIJK1jikgShyJTQRgkVoC7k49rwdgBJasF0DYxqQodqREFB6nkR
   Q==;
X-CSE-ConnectionGUID: kMJpwpcaR7STVTxqP1CEbw==
X-CSE-MsgGUID: GR00hn/wSwKRoiwzVQV8EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35882162"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35882162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 17:59:18 -0800
X-CSE-ConnectionGUID: uXctbIldSwu26PYy1Kz8pQ==
X-CSE-MsgGUID: PKNoCpFASpeBFNIdWyNMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="100126725"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Dec 2024 17:59:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRM6k-0003o8-2Z;
	Sat, 28 Dec 2024 01:59:14 +0000
Date: Sat, 28 Dec 2024 09:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] mm/page_counter.o: warning: objtool:
 page_counter_cancel()+0x84: unreachable instruction
Message-ID: <202412280914.VfeVCWRu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: f330d897aed4d1dfde71f7e42f47063c34e775ae [2589/2589] mm: page_counter: mitigate consequences of a page_counter underflow
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241228/202412280914.VfeVCWRu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280914.VfeVCWRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280914.VfeVCWRu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_counter.o: warning: objtool: page_counter_cancel()+0x84: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
