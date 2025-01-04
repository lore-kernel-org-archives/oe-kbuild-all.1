Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1D510E0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735973532; cv=none; b=OA+MDuhT7ursyeHGwjAPZl60b5JovQ0S5F32FVI989dhzxtlGZXaZNpPVVRklXAjkijKOaFbZZxq0IxVGzsQvT5sAq+Uolp2QNK7n5aTCxistSYy6hQiePckKX1jp1xCxn9vg/15RXXrkD284tHdSXAmIXbU8J1erxQQALeMMSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735973532; c=relaxed/simple;
	bh=1qoyNI0A5ZQRZZnOxKLhLlZuulWLhIQIlN5wZKtKBqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KC8cyYfYqiar/UoEE/gGSAS6/lj+lnZvquFJ54AN7IQgV+A8U/+dnbenKFZU5RlrTNDChQ2QhyyYFw/dJH33tmuy59TwLWb5sugxqvdGDarh5iIi2qEuJ1fy9IsdzY7XX4Ip9mFFp5kHKJD1wWjnZ1UNYw/sX54rEE/N2VqlzbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRSgz1no; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRSgz1no"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735973530; x=1767509530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qoyNI0A5ZQRZZnOxKLhLlZuulWLhIQIlN5wZKtKBqM=;
  b=gRSgz1nonF8pnl/wSo/XrTnHdGVlVe1JPjVMczmU6kNEUOWliQ9s+Y3l
   5CFMTZ46jjVo25dWNoFLbs3WINOL1puXs6jlU9R45Op2PVrw4m0Y3Cd+o
   3t/FAu8XX6rwkiDd0f1OI0jOzmAxaUtVZo4K4SNK6SPqyUdhcS0rjL6SN
   3/wYM6L6ZIBis0krk5JVp38kpXzW90Li4esAvhGB6qLvp3+tgAQRyIS3V
   lk+bDR8NLRwofRZITxbQWL4ZER8MAjmECLw56LjfQfhrjJ5DpEbJOXdmE
   l3Ksgkbirlg8dHmstBKYqOaDzDvwhVWIA7RcM0ck65xZD6m6dR3ys+v0G
   g==;
X-CSE-ConnectionGUID: nlmU68SVSmCrw0ClfusVHw==
X-CSE-MsgGUID: NdmbiQ83Sg6swPpa6SQhEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="35906167"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="35906167"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 22:52:10 -0800
X-CSE-ConnectionGUID: uL/ZdzKURmeJwB6ENCig3g==
X-CSE-MsgGUID: hlM9zFesRIKfDByZWWLrzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="102147897"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2025 22:52:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTy10-000AiS-1w;
	Sat, 04 Jan 2025 06:52:06 +0000
Date: Sat, 4 Jan 2025 14:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2626/2626] ld.lld: error: undefined symbol:
 latency_fsnotify
Message-ID: <202501041734.WciMoLAr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d51fb86ce6a3a3e59d7cba58738b63903b8cb37c
commit: d11dbe8b4e8ad4c5bd90147912352ef6f13a2bb6 [2626/2626] trace: Add osnoise tracer
config: x86_64-randconfig-104-20250103 (https://download.01.org/0day-ci/archive/20250104/202501041734.WciMoLAr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041734.WciMoLAr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041734.WciMoLAr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: latency_fsnotify
   >>> referenced by trace_osnoise.c:933 (kernel/trace/trace_osnoise.c:933)
   >>>               trace/trace_osnoise.o:(run_osnoise) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
