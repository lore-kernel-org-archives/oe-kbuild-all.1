Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ADF2E371E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 03:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754106711; cv=none; b=m1oiVfp7M+LJylesfQuldxjHpNCJOaQxU7OkcLMJkveSiYVQmskOxq+sv67xzIVaRK0eZl4H7CR61GxqQT+8HA1GzhUEcQGGrU+SYDw6cbhRw4xZw5LzZd09DZhSLP15lRVurHYDuN0LTItgB5NLkrGcRnGIn7sE1mDFMmrH/ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754106711; c=relaxed/simple;
	bh=GGa0DxirXwBSVVrFd91XoqsW4EJG662/SWIZfYbr98M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pX3dX+ZL4WmJqv4uerJjtHwjhCOZjXiX4gNMbciQ4Hoh8/GoegHq349DXgWIJZhgK+uQ1z8tqpXyfhbLBaexcMmDSH36HomTU5Fv6L+md1r71CfsCCYKoycaLLQXP2SlZWaNa4wW0AUYlPDBjkW/A7R1wVptuJj/KxSv682YTBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6w/72Ft; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6w/72Ft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754106709; x=1785642709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GGa0DxirXwBSVVrFd91XoqsW4EJG662/SWIZfYbr98M=;
  b=D6w/72Ft9Kq/H/8AQFnGYqzcLcBuNXl4oP0Hkk5RDt2A8TwMJd2KsaBt
   7sC7bM4DexfhZ3XaD9OU/DSMej+MfG6O8fBgPBTbmMWqOCYzIPoymk6Dy
   387jM4XOMw8JHk5GBPB2d2TaTa8IKbYRE5yKWMLxZigPJizNieTFtNpZF
   GMuPkng1SN/DtEoNWWXYdCs/bF4L+F76naenPywB5pnWIKuh4ZVtzBz0d
   /iGaKVzXS0BktwoSon6+dXRHGAFGaLl1yEvNzJA29H8TIO19ttGsQCMzN
   /UxfH1t3XYd8wPdN1SznWxitD1HY07e0u+ipaCMHxXy5vL5GCsU8K6Wga
   A==;
X-CSE-ConnectionGUID: QkIQobZfS5S0b1Be++yEvQ==
X-CSE-MsgGUID: yPmRteeFRP64cJx/nsPOuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60092514"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60092514"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 20:51:48 -0700
X-CSE-ConnectionGUID: xS58oYatTzeWfjN5YN9NQw==
X-CSE-MsgGUID: JoNcJOZyRci8dkIB5xIIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163638514"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 01 Aug 2025 20:51:47 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui3Hd-0001Ld-15;
	Sat, 02 Aug 2025 03:51:45 +0000
Date: Sat, 2 Aug 2025 05:51:25 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 /kbuild/src/consumer/Makefile:626: include/config/auto.conf.cmd: No such
 file or directory
Message-ID: <202508020510.d5j0noQL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   96df9367f25b4b9a5d57e7829fea294b2a322700
commit: 9cd721e370b364f30d97f7b5ea4ec036ce5dd807 [1743/1743] kbuild: turn auto.conf.cmd into a mandatory include file
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce: (https://download.01.org/0day-ci/archive/20250802/202508020510.d5j0noQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020510.d5j0noQL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Configuration file ".config" not found!
   ***
   *** Please run some configurator (e.g. "make oldconfig" or
   *** "make menuconfig" or "make xconfig").
   ***
   make[3]: *** [/kbuild/src/consumer/scripts/kconfig/Makefile:69: syncconfig] Error 1
   make[2]: *** [/kbuild/src/consumer/Makefile:539: syncconfig] Error 2
>> /kbuild/src/consumer/Makefile:626: include/config/auto.conf.cmd: No such file or directory
   make[1]: *** [/kbuild/src/consumer/Makefile:638: include/config/auto.conf] Error 2
   /kbuild/src/consumer/Makefile:595: Failed to remake makefile 'include/config/auto.conf'.
   /kbuild/src/consumer/Makefile:626: Failed to remake makefile 'include/config/auto.conf.cmd'.
   make: *** [Makefile:146: sub-make] Error 2
   make: Target 'headers' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
