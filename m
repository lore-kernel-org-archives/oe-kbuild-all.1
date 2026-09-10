Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93454A8FE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055017; cv=none; b=cBQ/euQx7IVK1M1TSp0IPpQEBSCpRSLO2EY6repvvka1Lwq4JsDZ9oYMa7z5PeUjCJq/TXdrQUdllZq4V6/SV0nkaAnb7VeBnqPeml9MaSouGI5lU4JywUce0FKoWwdwchEPjnedQKE3x19CaCbsj9bKeGoA2dSs1/fScVMY+jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055017; c=relaxed/simple;
	bh=E3hbqsU4ye4Ilq8a2BTuZkyUuhbQp+b7TCuQX94A82Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WmtdRIXNKlUZpx7QjqDAFHf3eewUQxaee1MWqWc/d3xzjodC/cup+qxhMhoCRWmZLGynp+BUMN6ck2PUKLVfyEIs6B8WnAsd0mFGXXg8Z3ILYDvrWtRkpDzAmqiS+Kzfla7h8vJdbzRBvlrizjunbQxwWVWSP4ND7EW/dY+7iGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZhAvJpZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZhAvJpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055015; x=1820591015;
  h=date:from:to:cc:subject:message-id;
  bh=E3hbqsU4ye4Ilq8a2BTuZkyUuhbQp+b7TCuQX94A82Y=;
  b=KZhAvJpZMvkOIXtZOKoGydwP5UDLXYSiXqMlexAsenhdtoSqmP6lyRHS
   6clQL5LE3mD9PZTpqFODR2Wcqg3qF4enUOHxBt0txsVilqztGo3its72i
   UnZoIvI8O2j/iTuhRPfd0F7SmAt94/5UqSM7bN0WjRViqqgFKc8GYm6hY
   atkwc1T/m2X4fiqsDsjGWyHAFfgWryr157EisiKoNOAQTa4n6higvavjB
   KbTttY7iR6liix8Fbcr2uTnidF4rtFxMi7pCZCm+ax+Vf9Pg0IaYltwDN
   GPIhWNLd7aEV18N9MA6TpOgsCIS1rXyyfnhDRsqC2i9xxqxDhboREy44I
   g==;
X-CSE-ConnectionGUID: BwLOhrmVSN+SZ0l1oD1JiA==
X-CSE-MsgGUID: 0/5AnEbiTISazepLlSAmkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112280554"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="112280554"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:33 -0700
X-CSE-ConnectionGUID: p+dvJ2HmSjm01BrGto5Z2w==
X-CSE-MsgGUID: b0xz9glmR3CybWNXw8GMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295152008"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 08:43:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvy-000000000RP-04sl;
	Thu, 10 Sep 2026 15:43:30 +0000
Date: Thu, 10 Sep 2026 17:42:33 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 216/294]
 drivers/media/i2c/ds90ub913.c:23:10: fatal error: 'media/i2c/ds90ub9xx.h'
 file not found
Message-ID: <202609100829.dZoZmxp2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: c473be37547a95e20e5f6cc7c01968ab474a58a4 [216/294] media: i2c: ds90ub9xx: remove global platform_data definition
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100829.dZoZmxp2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100829.dZoZmxp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100829.dZoZmxp2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ds90ub913.c:23:10: fatal error: 'media/i2c/ds90ub9xx.h' file not found
      23 | #include <media/i2c/ds90ub9xx.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +23 drivers/media/i2c/ds90ub913.c

c158d0d4ff1530 Tomi Valkeinen 2023-06-19  22  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19 @23  #include <media/i2c/ds90ub9xx.h>
be1e71b1db5779 Tomi Valkeinen 2023-07-31  24  #include <media/v4l2-fwnode.h>
be1e71b1db5779 Tomi Valkeinen 2023-07-31  25  #include <media/v4l2-mediabus.h>
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  26  #include <media/v4l2-subdev.h>
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  27  

:::::: The code at line 23 was first introduced by commit
:::::: c158d0d4ff15309fd63b7d7cf50a5153bead894a media: i2c: add DS90UB913 driver

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
