Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0C14AD0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735287899; cv=none; b=gbkaSshgPYiNSOStYveQOMWHPF3Lc4YTHqwNzf+g+pT8KO/TDFhh64sCen6DuFrznjW857JoqKtz8EylJGacSk+/1g34mFteqvmRufUDS5vllVjCuh1N6DP8nR8N5SzsIrwWSQcBQCXpORNYTbmAfN2Lhjndx7E38J6hTskKOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735287899; c=relaxed/simple;
	bh=O7BWQvYqKbt+Zs4uAYlfd8f7GcD546Bw7Eg4WFclzm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ks5dNye5LDy/mBC9PTWhxSjh50DTd9BVII9/ekhGHlbvEB7+LV5+zsau54jFuDkF1J+yHPk9umrrRNJP9VwD+t2ht0W9z5RC7lT/yj2LoeldID9m8iREPEtOw5FoBJm8KpHhxHWuM+C4BEBK9z6BPpGIym6DiamzxMS5RKsVhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYSYTDPV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYSYTDPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735287897; x=1766823897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O7BWQvYqKbt+Zs4uAYlfd8f7GcD546Bw7Eg4WFclzm4=;
  b=HYSYTDPVw9jR8Dik5nCvzj4Go7IINQ8KGU6X7erDjk3evA0TOxyhk2af
   xWHqDAVxbVLybq4Co9S7IL/KtpUtgH0spnfD7A3uM55GAUlodJdsIapWy
   TxE1hCf651Oxe/d9SDfb/tZQI8nIOepXgGtteNTWHgQfbgof/yGwQibMw
   AFW9ufU3D3Dwcqfhfr0Ugob1EkZ+BpUEkoDRtr4254kcGtarJmMTMBfrL
   i8Nb9qgnVA1VjIzB8cHksfu7z54BeCNtZ2VfEdhmHi6xGgGRjhH38RPQU
   IQm0guHqnyEqt8WVykw3QQ8SkW0j+Laf3EgWpU5ivwsjNjcpDGJxpAD5V
   w==;
X-CSE-ConnectionGUID: ZffAvAspTD+vfLXScslcmg==
X-CSE-MsgGUID: Bzz8gkn1QsS9uK+AMc00Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="39633862"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="39633862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 00:24:55 -0800
X-CSE-ConnectionGUID: LMgar/KeQPKHoXJcuLVJ2w==
X-CSE-MsgGUID: roaxLPfuSFK0dEl9O9FCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105117520"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2024 00:24:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR5eO-00035G-0i;
	Fri, 27 Dec 2024 08:24:52 +0000
Date: Fri, 27 Dec 2024 16:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] block/blk-mq.o: warning: objtool:
 blk_mq_unquiesce_queue()+0xae: unreachable instruction
Message-ID: <202412271628.GxDQTcxv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   951151c7a27bc2a9436c2c49ae12510c82137ec1
commit: ed1ab377e8ea69c014a86efe7059231138233717 [2589/2589] blk-mq: support concurrent queue quiesce/unquiesce
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241227/202412271628.GxDQTcxv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271628.GxDQTcxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412271628.GxDQTcxv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq.o: warning: objtool: blk_mq_unquiesce_queue()+0xae: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
