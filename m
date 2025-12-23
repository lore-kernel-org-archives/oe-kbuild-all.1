Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6316DEB0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520259; cv=none; b=s2SuOz4uGuQrk3ufxlpdP0KO6XY2E4DxuRBMeVDrENVyfqyVT+C9xWc7l5YGGjE7VU8C+0dQQdMMNSSpRGjdGv0j1U1NKlTH1gp8MQgWPPYrEVNsMza6WUn9+0crHVjRxH9wkzbZxu33UpTcgdIi5icJqBHgdKLGthmi7Fm+UnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520259; c=relaxed/simple;
	bh=0XVp8V/sU3XeuTFkwZ9C05+X3RpX3tBvbCFrMPSHJb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fw9qORZhDFzwRemkkvndaqFXDJMsK8MFuYhxiZO+yWuox4LrStWPHFMr9HtV8sd9cEkx6x8LC1urCbttGZYbJzTJzIJXFONynkGaPuJo8cnpbkV/xeplDa2d95DVm+ZUlPvQJkwNv/IiNkmakYgHwl4NgvD9V8BmI+ob7I91BlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKK1qZs0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKK1qZs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766520258; x=1798056258;
  h=date:from:to:cc:subject:message-id;
  bh=0XVp8V/sU3XeuTFkwZ9C05+X3RpX3tBvbCFrMPSHJb8=;
  b=jKK1qZs0JUnE9nS68OgBM6T3TKhYkur/qBu8F44CzOeZR5zfOTpZDPnO
   nRihMiqw4LRu+qm+1nTwY0dn43/+S1rPHJZ9vA9rFa/WMppdOBkppajXn
   HWBspTeVbVi+Gb2iLBV3cRirh8LywCTxTYjsq09r5u5OB/HzV+nixgict
   EfEpFyEkzU7TIBxSQjeXw0zqo3RAUnENjOpIg9Yjcx/203jmdlPqQfCox
   AC8P2hE8w0lPL6SApVxbTO8NSwYcgpg1KNWzr1mZFxPsTuC3ORkmEYhDL
   9C4Ahddr8Dd+8HDTk2SL4xYt4HJoL/3L4AQonDr31YE/xR3+FExIY8cNX
   Q==;
X-CSE-ConnectionGUID: ipzj0IF6QAe4nPFN7lLgzw==
X-CSE-MsgGUID: CkxCesQWSOGc2NOLOu4ECg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79006958"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79006958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:04:17 -0800
X-CSE-ConnectionGUID: usyMdNgoTzCHcy4FrmU83A==
X-CSE-MsgGUID: 572gIdkoRkuw5eQtTq8dMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="223342596"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 12:04:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY8c9-000000002KP-2Ab4;
	Tue, 23 Dec 2025 20:04:13 +0000
Date: Wed, 24 Dec 2025 04:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/bluetooth/.tmp_btmtkuart.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202512240426.paSRxhEJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: 7237c4c9ec92e1a4f6ef1f712bf9105d7b392c6a [1942/1942] Bluetooth: mediatek: Add protocol support for MediaTek serial devices
config: x86_64-buildonly-randconfig-004-20251213 (https://download.01.org/0day-ci/archive/20251224/202512240426.paSRxhEJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240426.paSRxhEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240426.paSRxhEJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/.tmp_btmtkuart.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
