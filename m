Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937A1292D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713267265; cv=none; b=VoQeFGEpr+vTnjQAddAOe4ZotTqw9ODcMNblRelS/m+g2EycPGoggqXirP7brsbzd61xJ1EXkAqZeUFzhWeztyR0yZwtbPdtqDl9CPxebQcSaE9XtDVgJ7GXelLZMzMF6CCfJrmD3gM45oKgHEqZyoPtZecsMy+7XNh1hDYtpeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713267265; c=relaxed/simple;
	bh=p01y3goSyhXE07/t+b5drGkeVtWXmZ//RTdQVgycnnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XUtKpljZIgazf3xOmeJlmyPasiU3lxcdl8y8vAPXzH6UrvwLd2qwrcm8J4MbtxR2H+meXCju+kgmKVBrJZghshRSYFSV+HCmCHXp0upZoQhhrVU7WPe2tt1cefLPoPc2afBvTe9aOtJ+8mWq82bkUH9wnvhvibXzCdZXgx8rRo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyzGJawj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyzGJawj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713267263; x=1744803263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p01y3goSyhXE07/t+b5drGkeVtWXmZ//RTdQVgycnnU=;
  b=FyzGJawjsWKmhMOdwzEJdaed2fgRgA6mBafehWHR3Fo4h/qL4A08k3j/
   wlEgkO0RpLasNaYZ1hJw1xFNuYvkrkF3pE8M+ARjFzSMp6HKLUrP/ZxQ+
   xufKpxuhBZJo61Z2jG9o4RKSByvEUYPFjl0MNg7hAYUOgm94EcFa8QLjS
   DRLJxEZnr27hiK8bPugQocBaNKTEd4ROqmX8gyh+LMCgJBIRfBnM1EJLL
   ldf3w0GUm6eSklqyR1NQ+ZgFJrWXM1rzyIgXKfn3HtZ1drXxzX9GE8pu7
   UMBD14Pwp8ybLzljX8CtR7ZWQn+mzqNhLsLS9TBPGdxz0qSAKGLxoNYK0
   A==;
X-CSE-ConnectionGUID: QjOCy78wSAW5tIBc+bLEXA==
X-CSE-MsgGUID: Lnuy/w2XS6GaXUPsl5pxWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8824899"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8824899"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 04:34:23 -0700
X-CSE-ConnectionGUID: rBolqOlnRAuhU5ux6FcXGg==
X-CSE-MsgGUID: pnG+BP/wQMOB6uN7nbbUEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22131286"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Apr 2024 04:34:21 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwh4t-0005Ce-0B;
	Tue, 16 Apr 2024 11:34:19 +0000
Date: Tue, 16 Apr 2024 19:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15383/22122]
 fs/proc/etmem_scan.c:244:18: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202404161919.wESDtt1C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b8899e6883a3bc8649d051cd90b96f37066e356
commit: bad4d8833739acc8eef306e7ad5c7877f9f4f0fb [15383/22122] etmem: add etmem-scan feature
config: arm64-randconfig-r133-20240401 (https://download.01.org/0day-ci/archive/20240416/202404161919.wESDtt1C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240416/202404161919.wESDtt1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161919.wESDtt1C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/proc/etmem_scan.c:244:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:1> *buf @@     got void *buf @@
   fs/proc/etmem_scan.c:244:18: sparse:     expected void [noderef] <asn:1> *buf
   fs/proc/etmem_scan.c:244:18: sparse:     got void *buf
   fs/proc/etmem_scan.c:1032:40: sparse: sparse: incorrect type in assignment (incompatible argument 2 (different address spaces)) @@     expected long ( *extern [addressable] [assigned] [toplevel] read )( ... ) @@     got long ( * )( ... ) @@
   fs/proc/etmem_scan.c:1032:40: sparse:     expected long ( *extern [addressable] [assigned] [toplevel] read )( ... )
   fs/proc/etmem_scan.c:1032:40: sparse:     got long ( * )( ... )
   fs/proc/etmem_scan.c:590:46: sparse: sparse: self-comparison always evaluates to false
   fs/proc/etmem_scan.c: In function 'mm_idle_walk_range':
   fs/proc/etmem_scan.c:971:61: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     971 |                                          pic->next_hva, end);
         |                                                             ^

vim +244 fs/proc/etmem_scan.c

   240	
   241	static void setup_page_idle_ctrl(struct page_idle_ctrl *pic, void *buf,
   242					int buf_size, unsigned int flags)
   243	{
 > 244		pic->buf = buf;
   245		pic->buf_size = buf_size;
   246		pic->bytes_copied = 0;
   247		pic->next_hva = 0;
   248		pic->gpa_to_hva = 0;
   249		pic->restart_gpa = 0;
   250		pic->last_va = 0;
   251		pic->flags = flags;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
