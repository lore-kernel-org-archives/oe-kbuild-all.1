Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052B65CB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 07:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345480; cv=none; b=oiPGJ/imrz/Rd9OSfu8y6pPY1oW+A1MHvDWUb6p5fReqyng0lfA/HgYakjIyWPanCt2cmv5NjJbwQxCsDPQ9Fk9rCvGLw4kmvfuQCxVI3AezFYgoP+B8ijTF5W3uWam/J1ztK7Fsst8g0dTaUm3y/Uvh2DSHekNmPWUYQosWSyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345480; c=relaxed/simple;
	bh=v2sh84ZloreXRX/vB5ZLpqOFxYAO03abN36m0mav+A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MBlFcHkeYCiG58zCuzkXhjIR81+Evmd8XMD0NtZT7+zHfGX6H4ZXQn9vVoEY8/H4vxjaB7SYvJTT9C45cKfVMlYXnGmWbh9IbL+nzZRAOqIBVyOHUIJGqD5FuhOi1OMI3HbM+LBK4BVgpmz8hcfNJARxjTbFZXuYn09spE9+FAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWqFL4/R; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWqFL4/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739345478; x=1770881478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2sh84ZloreXRX/vB5ZLpqOFxYAO03abN36m0mav+A8=;
  b=BWqFL4/R4A7+ExwAnSlBIkR1hxeCEYu9hSOYPqAtQOt2BCC4t2hcVFC6
   RSh+NoiYE71rVRLKMwW5wFL0hOm9pknuGao+CVgX3aN2s3lfVn6qxsyuE
   GxTUdfmkoqEXlrTYgYbms8L1vlV451j8PxSaX9htetpDGl19BQtpc404V
   xAlT3n8kEqoPQ7cvPAgOqYFQoAZ337fHe/2Xf8wxRloUFXs1/GrewDg7V
   HsQdtm1daYey/H21uBsszQKIptPezQ7OfF1DvEkpZPhbhGyWqB98DcQCY
   k/4g6G41wAQCSY1YdbLcXfgSmD8gZPiD5T1PgBiQvuDOWri878/YkFDGy
   g==;
X-CSE-ConnectionGUID: Q8DQgpbcSous7Q4RPEKg6Q==
X-CSE-MsgGUID: N4aUzGVcRUCs9L9wKF/m/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62454988"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="62454988"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 23:31:16 -0800
X-CSE-ConnectionGUID: MBurt3dAQ+idpz28aKc9RA==
X-CSE-MsgGUID: S2+ezCLiTnmkzmGxIvU0mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117922626"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2025 23:31:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti7DF-0015I1-0r;
	Wed, 12 Feb 2025 07:31:13 +0000
Date: Wed, 12 Feb 2025 15:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v13-wip 4/13] io_uring/zcrx.c: net/netdev_rx_queue.h
 is included more than once.
Message-ID: <202502121530.SxppYogI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v13-wip
head:   9fb9b8b296950bc1a7d2559bbb4b568f31ef5a50
commit: 1a3ac1edc5acdd65507a75888d0c743399073cde [4/13] io_uring/zcrx: set pp memory provider for an rx queue
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121530.SxppYogI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> io_uring/zcrx.c: net/netdev_rx_queue.h is included more than once.

vim +13 io_uring/zcrx.c

    10	
    11	#include <net/page_pool/helpers.h>
    12	#include <net/page_pool/memory_provider.h>
  > 13	#include <net/netdev_rx_queue.h>
    14	#include <net/netlink.h>
  > 15	#include <net/netdev_rx_queue.h>
    16	#include <net/tcp.h>
    17	#include <net/rps.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
