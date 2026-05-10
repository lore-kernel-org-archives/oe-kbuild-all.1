Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA5C221D96
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 06:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778393077; cv=none; b=iLOMmdAjUOpKauunbBUfc1xDliWUdevDhQfjvSvPuGRjMMkwzi8EPC1qTfK3Z1Htx3S5xfy7lL1689sWCnohxgtHSvXnh2KMxW9pUi2YW5AzSVbS+3FQ2volLosXiwYwCfG+Aga3hQEv0ARn/ajFXLk+sEy1DVx5Y76k4/V8V2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778393077; c=relaxed/simple;
	bh=QyhthV0y7xwqJKhcOlJyVPiTQSLXxWX/JAp4VV+WHt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Aawl79k3WvJvjz2k3kfnVQFbTFAbgVKtheqYED/UUMvGnCFK+vkOfJJsZF7ja1loeTYs/iZD/QhQPhbTgEyp3g0kBBthvog3MoVPtYeBltAIVNDrZXEJKZEcboCrUUmod1+gZL/phygjZDG+6Wr47486nVQvnLY2a/2Dk9YRMW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeXxC33/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeXxC33/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778393075; x=1809929075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QyhthV0y7xwqJKhcOlJyVPiTQSLXxWX/JAp4VV+WHt8=;
  b=GeXxC33/4h1wa/d79i79cED9vo4/Pz9D7Ac4+HaGoRVMqaXgvhwWsIDp
   jAJyEasc59y0as2ULfufg5+P/QsH4C7U/IuM8Jw8Dy3BqFkQOvMwL5Ol4
   fsxpm+uzWqFpBGS0ScprltopyjI1HzPM1Nct9aF5ACcyJ3nIgXGx0Pph6
   3+kPT0PUlGCAJUCjsXYQzRo59K8LOyC5QUoF2+N3Cil6rsmI5DzzNTcML
   iCkaYzIVuGuX1+lsfmeBwqBBcRyVmHzhQ7pPcz4/OBEJyRN953Mfb+4/M
   tbXb9n+H79CIYw8/dt0YzEmI6Vb2kOyspOPS7stf/L7QFln0sXGP28YyQ
   w==;
X-CSE-ConnectionGUID: b15KXs1GTWy6G95KEjbkgA==
X-CSE-MsgGUID: H6fHMmrDSiOWUNOzE5qCCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="96738747"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="96738747"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 23:04:35 -0700
X-CSE-ConnectionGUID: wiDF/6SBRKOtFmI7jEdl6Q==
X-CSE-MsgGUID: E6IM1eViTLuP4f1mNDDj6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="232673052"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 May 2026 23:04:33 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLxHC-000000001or-1UNQ;
	Sun, 10 May 2026 06:04:30 +0000
Date: Sun, 10 May 2026 14:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe:for-7.2/block 1/2] ./usr/include/linux/drbd.h:18:10:
 fatal error: sys/types.h: No such file or directory
Message-ID: <202605101346.V2wwJqv1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
head:   8098eeb693c4cc4e774c62fbd4875197cb5578ce
commit: a54f499838292c1768f6575ed1ec7cf35f1b6489 [1/2] drbd: move UAPI headers to include/uapi/linux/
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605101346.V2wwJqv1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101346.V2wwJqv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101346.V2wwJqv1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/drbd.h:18:10: fatal error: sys/types.h: No such file or directory
      18 | #include <sys/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
