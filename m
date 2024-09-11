Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F109374C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 03:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726025915; cv=none; b=cd0DvXoo5XphgRfVLndErlE9OTenuBw3tX+WTjFMPPUc0EgRuVmjSvM+Zj/I20LxTVmijjLNyVFPQszSfYENMVUufzH7GwJ3Ewr8hLhKJARxpCR9m3E73hbI9ZvLxq93Te8dOWsoeKV2fl/tpQBCNnUMkJ5uLwBWlrN4I8KneCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726025915; c=relaxed/simple;
	bh=lNJIdyUHvIiT5oUIMElR4Xjq70bhb9CNrGDU37T7dHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E3dWIn6SKQ1rAaeA+ARSIEJ2W5qYphChgU/qW4U9R/THbxoAAZXcEN6hE3zpCIh+OnDi9eTwxEQj0AHV1P3TjEGSguRAQkFRJMz1DsLJnCtuGVhyiuepx1/7Wu0LE3GNJKiXxkuAhJVjqvLit/aeBomN+bY7+YwkTbwFU/A4ts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACNtZxau; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACNtZxau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726025913; x=1757561913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNJIdyUHvIiT5oUIMElR4Xjq70bhb9CNrGDU37T7dHM=;
  b=ACNtZxauci3B0R5oOLdAOgsrxCrKK1Vb/QLT35LO69QKS8oseDRtZ5UQ
   kaqRY0ddIhvQW+jF3z+WAFZLYQadOWrwlzbBCzQYwOapQC0dMuggI4ch2
   mex1qpsAvuwy8EEjJE9xpLlQgRjq36h9jsCqYg0aSjKGBZMmW8IYzH4BS
   yXkcSC6E7Ak7hhLBPXmuUU7LuyR+zz1OSsFBUqlKF2DwXR9uQ0YyppPSa
   W1rrE/QgvmazAhYwxvAD5a7BOhlFtnIlUe3uEa+q3RXZ1eoO6GGnl/Wxj
   /nqNKWTfDURyR1y4QEr0NaYOTfxU50hwDL53BKIRCWuscc7EXyyMS424k
   g==;
X-CSE-ConnectionGUID: cbgz00DIRVSnzj7lrCKgpA==
X-CSE-MsgGUID: yIr0CTn/T6yOEH7iA9No4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27724582"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="27724582"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 20:38:29 -0700
X-CSE-ConnectionGUID: +dM76if7RYCXeT4Rc7jSag==
X-CSE-MsgGUID: WbwTyGhdTy6fGvwcjHzCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67991567"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2024 20:38:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soEBV-00030m-2E;
	Wed, 11 Sep 2024 03:38:25 +0000
Date: Wed, 11 Sep 2024 11:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14935/23703]
 lib/.tmp_test_free_pages.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202409111103.p0J9Jp9h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bf039567abd9303dc03746afaaf0854f41ed853b
commit: 07bfcd6945a587611c2812377494457fd2c4c452 [14935/23703] mm/page_alloc.c: fix freeing non-compound pages
config: x86_64-buildonly-randconfig-006-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111103.p0J9Jp9h-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111103.p0J9Jp9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111103.p0J9Jp9h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/.tmp_test_free_pages.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
