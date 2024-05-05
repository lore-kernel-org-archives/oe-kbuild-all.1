Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93B7FB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714870199; cv=none; b=nEyQFYwouabbOR9G0xdOHekJ4yeJXKDIwMzZUH5A2nxqSAtfUF3s3AARYFE4IqTk1OeZ9qqqMgq8I28yVLqH4UwCf3gpqKV2VUu+AAIo87ZOCtvKRv7c1idgayM0L+STrJb7QA3UL8D+4nrkxFjf4/csSa/atkaNUBjbxV4FJoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714870199; c=relaxed/simple;
	bh=Jk96xeH8EK1C5WXa875dR5MPYTqRxDlQvXIOFwK11M8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJuJws228s8UjFRLb2bjAQOvUJu5Cg3RAVNfBJqEfJZLB/NGlCSHpLmCh2/UgWyU3ulG+maU55z8Sxtl4V/PI0mOuxuU9+BYui5Lt+yincqfDTASA9z7fsf83aHJJFpSO0TfW+B3smb0SGfVh5w6QiatQeUjAciX91UJhTDg5E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnZSELxa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnZSELxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714870197; x=1746406197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jk96xeH8EK1C5WXa875dR5MPYTqRxDlQvXIOFwK11M8=;
  b=LnZSELxawTiT8nLSSTrqUUxlgEWf0ZPh+wsSg3X8wnFCxNvvrP2WZQXl
   nLgzlDzrLJG+9Un+QIzCbVAvhn3y3PZOvp0PU/5TelO6pIyOcHC3kheMz
   xICMJBx69oyJd0BXNzrOBlGT8ho/0tCX6pzJs3N6pA9EGXJa+kVaMf30q
   exhkZ8K/UmxZNpVhlhpm+c6ia3A23ay/5PLvocIaYEY59rwwNvYAStXWS
   u0AIPfF4vuztcn8sjnZsPV7JUrTVogNecN6ptbJOO0HPmtJWd0IrcvvQl
   kC2GwE6z4BL98eVXBhwWcllkw/rumEWPqpc/g4+mihC7+rllA1v6lVutN
   A==;
X-CSE-ConnectionGUID: sDPM1G+PQQmYbgjWNEUT7Q==
X-CSE-MsgGUID: ZsKX5i8xRtK9z4XF/xUAPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10497008"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10497008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 17:49:56 -0700
X-CSE-ConnectionGUID: I23HbAoTQXaqG0Jwyq9IRw==
X-CSE-MsgGUID: TApCq7VKSLSqPeu/EI5DNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="28215358"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 May 2024 17:49:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Q4e-000DJk-2a;
	Sun, 05 May 2024 00:49:52 +0000
Date: Sun, 5 May 2024 08:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 40/42] powerpc-linux-ld: warning: orphan
 section `.init.plt' from `drivers/dma/fsl-edma-trace.o' being placed in
 section `.init.plt'
Message-ID: <202405050820.V9a9KYHz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   28059ddbee0eb92730931a652e16a994499a7858
commit: 11102d0c343ba06ddd303f2503c0ce46d70052f2 [40/42] dmaengine: fsl-edma: add trace event support
config: powerpc-randconfig-001-20240505 (https://download.01.org/0day-ci/archive/20240505/202405050820.V9a9KYHz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050820.V9a9KYHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050820.V9a9KYHz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-trace.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/mfd/rsmu_core.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-trace.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/mfd/rsmu_core.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-trace.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/mfd/rsmu_core.o' being placed in section `.init.plt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
