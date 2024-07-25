Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E70119AA4F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721911929; cv=none; b=gNSkQiKrDbD/DIBrUNL1dft9H/QFH087QFc80vPxLNMalBPqy36ZdfP87I672t//0cki2U3MhYCBzfoPlRbPJ5Iu0zDJNFdKHtTer7USZJYvx7ggaadzhvg9NnUrcv+19/8jGG10ErSPm7E/0F+h47GLljEwD9dFL4fGGYCtnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721911929; c=relaxed/simple;
	bh=Bfhv8epP6z78zrgah65PddcalnNFCVl+xpV72dezGTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r72VndqSIQtoSe+8V7EtI1+527RHNavAfUbM36AehetzuG4cTv4LRM8cL5mH0lr+2bo/O2BwSNGf8NxanHR9jyAwWlH4RPZ8bfa0ALBRW1nVUVdL4PvJebsrfgpUptcfArv1xOh42354wsF+m5U/xbJsrmKY92x4ZOILcPcsl9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDGCazLj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDGCazLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721911927; x=1753447927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bfhv8epP6z78zrgah65PddcalnNFCVl+xpV72dezGTg=;
  b=mDGCazLjma0dKbp6xUiIiZivzGQ/+5gMlwh+/TXPhrCzb9joFdlXhkbq
   6RKympxQ+5/WP7Yy07guATzU3IVLbcupf6it4F7wa+kmuIcVW83gmgF/a
   QAAd30UqDvJBNjpRuzbQYQLwyEMvk/x1EZFx1pwCe6ybftzBD4A+FtgT6
   WGo7tvEKUSdrMzn6rVRRq0uEKTaSa8nE/mqyWNrLrucrD1bjvkH+uG2yY
   WZR3O7GcIIR23qzi3vaysz8s9qn77gqtXQotRwPXyzBbtxTTqlLjU74zB
   6rOQz+C/TusHmz7QBwGzHFyYmzMQQIcnupT2G1WvclGb/PIbtvJDMMmpR
   w==;
X-CSE-ConnectionGUID: 6Lgyp2cZRkO4h4+KlDICmQ==
X-CSE-MsgGUID: mI7cRM1URWaysQexT/pSFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19258127"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19258127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:52:07 -0700
X-CSE-ConnectionGUID: ucTzmQzkSWejGnibmMgVtQ==
X-CSE-MsgGUID: RaOsH6HcQ/+Qxs8WPfA9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="57713834"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jul 2024 05:52:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWxww-000o7A-2t;
	Thu, 25 Jul 2024 12:52:02 +0000
Date: Thu, 25 Jul 2024 20:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:for-linus/hardening 10/10] lib/tests/stackinit_kunit.c:347:1:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202407252004.pIzkw1cD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-linus/hardening
head:   31dd42261251178ca18358714294b1f2a05f9f54
commit: 31dd42261251178ca18358714294b1f2a05f9f54 [10/10] lib: Move KUnit tests into tests/ subdirectory
config: i386-randconfig-063-20240725 (https://download.01.org/0day-ci/archive/20240725/202407252004.pIzkw1cD-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407252004.pIzkw1cD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407252004.pIzkw1cD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/stackinit_kunit.c:347:1: sparse: sparse: Using plain integer as NULL pointer
>> lib/tests/stackinit_kunit.c:347:1: sparse: sparse: Using plain integer as NULL pointer
>> lib/tests/stackinit_kunit.c:347:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:349:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:350:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:350:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:350:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:350:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:350:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:350:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:351:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:352:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:353:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:353:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:353:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:353:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:353:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:353:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:354:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:354:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:354:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:357:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:357:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:357:1: sparse: sparse: Using plain integer as NULL pointer
   lib/tests/stackinit_kunit.c:359:1: sparse: sparse: Using plain integer as NULL pointer
--
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:386:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:393:1: sparse: sparse: self-comparison always evaluates to true
>> lib/tests/overflow_kunit.c:487:9: sparse: sparse: cast truncates bits from constant value (12c becomes 2c)
>> lib/tests/overflow_kunit.c:489:9: sparse: sparse: cast truncates bits from constant value (1112c becomes 112c)
>> lib/tests/overflow_kunit.c:491:9: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/tests/overflow_kunit.c:492:9: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/tests/overflow_kunit.c:509:9: sparse: sparse: cast truncates bits from constant value (12c becomes 2c)
   lib/tests/overflow_kunit.c:511:9: sparse: sparse: cast truncates bits from constant value (1112c becomes 112c)
   lib/tests/overflow_kunit.c:513:9: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/tests/overflow_kunit.c:514:9: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
>> lib/tests/overflow_kunit.c:526:9: sparse: sparse: cast truncates bits from constant value (100 becomes 0)
   lib/tests/overflow_kunit.c:528:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   lib/tests/overflow_kunit.c:530:9: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   lib/tests/overflow_kunit.c:531:9: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
>> lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
>> lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
>> lib/tests/overflow_kunit.c:1056:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1057:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1058:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1058:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1059:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1059:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1060:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1060:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1061:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1061:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1156:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1156:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1156:9: sparse: sparse: cast truncates bits from constant value (ffffff01 becomes 1)
   lib/tests/overflow_kunit.c:1157:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1157:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)
   lib/tests/overflow_kunit.c:1157:9: sparse: sparse: cast truncates bits from constant value (ffff0001 becomes 1)

vim +347 lib/tests/stackinit_kunit.c

02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  316  
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  317  #define DEFINE_SCALAR_TEST(name, init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  318  		DEFINE_TEST(name ## _ ## init, name, SCALAR,	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  319  			    init, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  320  
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  321  #define DEFINE_SCALAR_TESTS(init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  322  		DEFINE_SCALAR_TEST(u8, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  323  		DEFINE_SCALAR_TEST(u16, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  324  		DEFINE_SCALAR_TEST(u32, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  325  		DEFINE_SCALAR_TEST(u64, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  326  		DEFINE_TEST(char_array_ ## init, unsigned char,	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  327  			    STRING, init, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  328  
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  329  #define DEFINE_STRUCT_TEST(name, init, xfail)			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  330  		DEFINE_TEST(name ## _ ## init,			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  331  			    struct test_ ## name, STRUCT, init, \
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  332  			    xfail)
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  333  
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  334  #define DEFINE_STRUCT_TESTS(init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  335  		DEFINE_STRUCT_TEST(small_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  336  		DEFINE_STRUCT_TEST(big_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  337  		DEFINE_STRUCT_TEST(trailing_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  338  		DEFINE_STRUCT_TEST(packed, init, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  339  
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  340  #define DEFINE_STRUCT_INITIALIZER_TESTS(base, xfail)		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  341  		DEFINE_STRUCT_TESTS(base ## _ ## partial,	\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  342  				    xfail);			\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  343  		DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  344  
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  345  /* These should be fully initialized all the time! */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  346  DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16 @347  DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  348  /* Struct initializers: padding may be left uninitialized. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  349  DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  350  DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  351  DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  352  DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  353  DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  354  DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  355  /* No initialization without compiler instrumentation. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  356  DEFINE_SCALAR_TESTS(none, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  357  DEFINE_STRUCT_TESTS(none, BYREF_PASS);
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  358  /* Initialization of members with __user attribute. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  359  DEFINE_TEST(user, struct test_user, STRUCT, none, USER_PASS);
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  360  

:::::: The code at line 347 was first introduced by commit
:::::: 02788ebcf521fe78c24eb221fd1ed7f86792c330 lib: stackinit: Convert to KUnit

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
