Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF6F1C84CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745057725; cv=none; b=O+leYWVPrfsMSNL3vJpMDQ2KsWSaqP3iF9kksBHhFVil8ED+r5FCTs1eg/LwNwXob9BWDjnu74WRNFVxvwCrXAy4k1j/JHLgsAjtxufPqXsbwVZb8VrdqrUsoTUZqZtdEvBbgmf+r4a+AyvwpueM5saUiZUj7JZ7dndDVxzaIbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745057725; c=relaxed/simple;
	bh=VgJGpYQ+G+mAUTDAI3NsozWBc2SUqGOmx7VG75yZ2MA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=salREtjyH1lQfr6kIDLuBLS4JR+bAhfECSk+mxwa9yxZOLkmHqNQncxXr8UTV25e8M8yR/g3kzJrmBwrxrOBSc67QU3RphU7NbcXG5VNY2gRaudJ6ez8fJyE3lEYrT+GDRY98GFIlwA0ryhwEJT8q3LWMAkHspae9gV7CzjhY1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DN2yOAtg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DN2yOAtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745057723; x=1776593723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VgJGpYQ+G+mAUTDAI3NsozWBc2SUqGOmx7VG75yZ2MA=;
  b=DN2yOAtgmTZ9g5wMerQS59ParNd6q6Ul/ojK9Tf/zJ6CgEZNyA9yNI0w
   /BG7srxwHsGQ8IVetJrwefhIpAb6T8XP7vVBnfiZse0OJ+HQSh1l5GeiU
   wTVvIWwETejluazTPMxHK9ot4eH5T9N6TiBcMog4RCnA8g2G9oMyWIs/l
   bnPvIoAxPhM6aYRyVFt5rrY089fL1RFAiS03LEngkk3mYFl53p0REkCBH
   bvSXOaUqOcigV0AAsTkvzOM4hJtPCUBKdF8A6KvYIhINrYCqFP6wEavgu
   ppVoQ7ClUkGPKH0y9laewckIF/kgNnkBTSypZkat7yaC7EyfciKsJ7Neh
   A==;
X-CSE-ConnectionGUID: 1Qo2HfhsRqeOWlSIbCLfDA==
X-CSE-MsgGUID: PYVSPG3eTd6V6I7tE124zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46589033"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46589033"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 03:15:19 -0700
X-CSE-ConnectionGUID: 7BgYwb9QQ327YhglJUIZWQ==
X-CSE-MsgGUID: DHhBTgWvR7udEtGBFg+PIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="136287815"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2025 03:15:17 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u65EB-0003mw-0Y;
	Sat, 19 Apr 2025 10:15:15 +0000
Date: Sat, 19 Apr 2025 18:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2138/2138] include/linux/entry-common.h:285:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202504191800.HGHPELMl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8382e5fc4db31572a2be5a540ea7e11ac725e3d8
commit: d9ed39df777afd38fcbd4f4ca670cceb2f168124 [2138/2138] entry: Move exit to usermode functions to header file
config: loongarch-randconfig-r121-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191800.HGHPELMl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250419/202504191800.HGHPELMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191800.HGHPELMl-lkp@intel.com/

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
