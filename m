Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE5A1BD503
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726675415; cv=none; b=oDFfa2w9ALLkEUepjwHsxxd0bwjg1NmfOOMDOo35mnqf58hwQeNXJdQwuj6E2kwQBbGofM/UbbHwm/QbuvM2pSpGF9UIAJtqrZ7mrK2pCt27Cdd1pgpfapJUsdMzEbtZrL1W0X82r8MAnC85Bp/P+k0vtNhvHaiN43rM190u1dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726675415; c=relaxed/simple;
	bh=pwdpRHJlmoYRr+M/tUhNO3e2ZJ23oilaPqbXfwFMdv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PeJGn8HeJjkEGF/ZCPik/ViQ8kXCAb7rd63ph/H25l4Bj6Qwix2bxgQRIrRAnBqL6lKSEMW3Hlm9kjxcQUoZsjCXo+KlcLf14nBecQYrI1SJMomEnTk+PQY4rs1UtKE4UuS8hxqpfBugk17x1D9RFAEu1fXaP+otCtYKA/TT8WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiBlyC35; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiBlyC35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726675413; x=1758211413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pwdpRHJlmoYRr+M/tUhNO3e2ZJ23oilaPqbXfwFMdv8=;
  b=fiBlyC35x6QL8LQOgiSAln5k43Uy1z5zMl4zSVotx5rg8d7tws0PHSWX
   F0IUFm7mmHjGbPuF4qBZMyGOw+hfAtAYoHV8+sIxV/Ej1YLnebLwXoSFD
   0RkEmsaseKxLOu8RZqPg6sJKBwy2rQQThPh4jDL4a635rUiSqqry6cbRa
   gZB7Mgf/tKxjiks+DUcEwuzqjaThAn8T6cunLqYZdKUhRhFT5frIE9ShD
   6ZXTA1SRd7zyrX9O52QEok8f/NjWCPl2mkbwIDTw5Zs+RovUYUSVnm+c3
   leSbUFI0vIJhrdfceuQ8nbVtuhumwARlHI8iDBAG8pF63S7fLKK3NJHcm
   g==;
X-CSE-ConnectionGUID: EPBZ+PhxSVOVsZOVnL/kvA==
X-CSE-MsgGUID: lHzkyIvtSouU0uRpM9k/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25083181"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="25083181"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 09:03:30 -0700
X-CSE-ConnectionGUID: 3xHrv7lKRkGyEhILhyAE1w==
X-CSE-MsgGUID: 3iW1H0UASOCjNqLLQMMRfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="100457281"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2024 09:03:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqx9J-000CNI-1R;
	Wed, 18 Sep 2024 16:03:25 +0000
Date: Thu, 19 Sep 2024 00:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9567/13952] include/linux/entry-common.h:285:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202409182352.x3x3zSa8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7df4077a020ac8c6b555718e171ec3b593a7aaf0
commit: d9ed39df777afd38fcbd4f4ca670cceb2f168124 [9567/13952] entry: Move exit to usermode functions to header file
config: loongarch-randconfig-r123-20240918 (https://download.01.org/0day-ci/archive/20240918/202409182352.x3x3zSa8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409182352.x3x3zSa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409182352.x3x3zSa8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c: note: in included file:
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *

vim +285 include/linux/entry-common.h

   264	
   265	/**
   266	 * exit_to_user_mode_loop - do any pending work before leaving to user space
   267	 */
   268	unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
   269					     unsigned long ti_work);
   270	
   271	/**
   272	 * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
   273	 * @regs:	Pointer to pt_regs on entry stack
   274	 *
   275	 * 1) check that interrupts are disabled
   276	 * 2) call tick_nohz_user_enter_prepare()
   277	 * 3) call exit_to_user_mode_loop() if any flags from
   278	 *    EXIT_TO_USER_MODE_WORK are set
   279	 * 4) check that interrupts are still disabled
   280	 */
   281	static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
   282	{
   283		unsigned long ti_work;
   284	
 > 285		lockdep_assert_irqs_disabled();
   286	
   287		/* Flush pending rcuog wakeup before the last need_resched() check */
   288		tick_nohz_user_enter_prepare();
   289	
   290		ti_work = read_thread_flags();
   291		if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
   292			ti_work = exit_to_user_mode_loop(regs, ti_work);
   293	
   294		arch_exit_to_user_mode_prepare(regs, ti_work);
   295	
   296		/* Ensure that kernel state is sane for a return to userspace */
   297		kmap_assert_nomap();
   298		lockdep_assert_irqs_disabled();
   299		lockdep_sys_exit();
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
