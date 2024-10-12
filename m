Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C71149C51
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728725525; cv=none; b=EASOdBeZF0ySzcHsmVt4DapVufH/CwGUIB1iuY5P/7aJDwYQSdnVMDJr902O3CRoGAU2KbyLXEp4niKWnz31EwAHQ4TYk9tt71piRRt1AD5sMPHC/aToeKYXeoGLLsWKmp2hIIJg4KSuXPlzHkAyzJQ/9RKZ2XCob6OxhdAo+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728725525; c=relaxed/simple;
	bh=GcloV0u0E8C/y6MbcpRH+EuF+ceJPZlnzy70XDkWA1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxG3gUeMJ9dD8onY5MnT7TBuuxleMESRC7SI8mzw9Dr3foo++h2GKV14Rb30wXfrb/ee7RZkcB2H9BbOHrwXAWVVZ2hx9g1I+uIuUDWTve3gvW3WC2c1bk6rP62zL7D2AD0X4+u9NmyWTk+pPbV7Uo3lcbQYbYG3OodJLHMJeDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOC3LF3w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOC3LF3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728725523; x=1760261523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GcloV0u0E8C/y6MbcpRH+EuF+ceJPZlnzy70XDkWA1s=;
  b=BOC3LF3w036cyleTYHpmULI5Hrkub00RIC6xQwsifjlCo1HPIjb8xUm2
   dvQmLKEB8A4zKX57zEmMUpRHOZP5tcqFjBQlaUNTeAIBGjZ49qFcOsfJF
   8pEOQEWPKDFWcUmfjhNpWnxRRzu5vtfG7+rPvnee5jsdkqtoaHk/AQJVg
   tVnA4jVhzCkk6O5/nbaRuI60HHM+FRU5Dj1Brr5HAnGOqGteqwhCZ+rt5
   ktPeGKmNsWwsOFsBhZzeSK51jRsgMjsBktvZrdw3wTesez3iA10HfXxD4
   bgI7eg7C/3czQGZ+f+OWSPIiKCoA/wUH485H3AfRAq0+0WSkEEsfG+3P6
   w==;
X-CSE-ConnectionGUID: uMeKif2VR6aE4s3Gfdnnkg==
X-CSE-MsgGUID: JTu+Y1TqT8KLglcMa9zIVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="15757207"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="15757207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 02:32:00 -0700
X-CSE-ConnectionGUID: L9MyEEaAT+yR60o3XwbfoQ==
X-CSE-MsgGUID: 8d3p4i60TweWF69bZrgWiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77599525"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Oct 2024 02:32:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szYTd-000DFM-0G;
	Sat, 12 Oct 2024 09:31:57 +0000
Date: Sat, 12 Oct 2024 17:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15383/23827]
 fs/proc/etmem_scan.c:244:18: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202410121701.6pXRhoNA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b2f1457c730cd7915663ac5d9ccb849f2657714
commit: bad4d8833739acc8eef306e7ad5c7877f9f4f0fb [15383/23827] etmem: add etmem-scan feature
config: x86_64-randconfig-121-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121701.6pXRhoNA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121701.6pXRhoNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121701.6pXRhoNA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/proc/etmem_scan.c:244:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:1> *buf @@     got void *buf @@
   fs/proc/etmem_scan.c:244:18: sparse:     expected void [noderef] <asn:1> *buf
   fs/proc/etmem_scan.c:244:18: sparse:     got void *buf
   fs/proc/etmem_scan.c:1032:40: sparse: sparse: incorrect type in assignment (incompatible argument 2 (different address spaces)) @@     expected long ( *extern [addressable] [assigned] [toplevel] read )( ... ) @@     got long ( * )( ... ) @@
   fs/proc/etmem_scan.c:1032:40: sparse:     expected long ( *extern [addressable] [assigned] [toplevel] read )( ... )
   fs/proc/etmem_scan.c:1032:40: sparse:     got long ( * )( ... )
   fs/proc/etmem_scan.c:425:46: sparse: sparse: self-comparison always evaluates to false
   In file included from fs/proc/etmem_scan.c:2:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.

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
