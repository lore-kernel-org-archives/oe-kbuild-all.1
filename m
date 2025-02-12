Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C81F76A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739386054; cv=none; b=JD8V4+SynlunJEc55fU1OwSDnY69LhbmbPBRYiNjYpzsn/l8AuUISztb+IdcYQwcLFRDMXEsmjofKcdNyNL4hwTDsUR92Q8ouV2Zrq3JTeqFLbKHnvbM5QCAgFjaycORmtakEjBE8KQ/VdoFwXE7HiSJa7aa8Fy/Jxik5ousF/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739386054; c=relaxed/simple;
	bh=2fUkyWXdguFtBqw4O8SCoY+0cR2Kgp6Rxtp8+z5+3/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uf/kMXSmHny1IKxfTmzg3c4KDN2vHuXDC1FpZPJAkhEKblIgf3Y8sCWt1iB6kisQWngC7LmIb8VXAnzY++sft7dNgpBLwhpNjYEA5/Rb4MALbDABB4vF2pDy3HotKEZpQJbNCfhFiY8k73j7Ua9sAOFu2gz+rxB+3Qtfeyh/RyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gunw8gra; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gunw8gra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739386052; x=1770922052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2fUkyWXdguFtBqw4O8SCoY+0cR2Kgp6Rxtp8+z5+3/A=;
  b=Gunw8grairVbSRad/7Lf6MpsRZN6KSAJVl8KVXKCKxRgcmZtg3TWQuiV
   dbxO0bUFfFDTIeFrGoWeobQM4bnUMmVwSEKTRMQ5EvjZ65fFR6hQjZazO
   nXBKib7rVHomFvbAPLE+u2RBSldi5TvR7Uz2Z3vWdUxuWT80W3NPO7Fwe
   DRVS/TOrZF6s3GFNqv5GdsbQkfpa2tv4xMxdYbmflfSxfM2mEvh4T4I83
   3hZn0RvvirlqstWZ2gwrXUPXvx/BGfegQFgu+Fyeko98LaMKtt1mnQJPT
   CUVNEt2nmbNry36qkOq2uI2fhU9RwdI+YUt2FIAmj0Rqh+XZk2/8zV5kC
   g==;
X-CSE-ConnectionGUID: UzE48YPoTHCM5xtwrxxM6g==
X-CSE-MsgGUID: YrVGRbI9TbO8wEkS6o6ImA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43995208"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="43995208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 10:47:31 -0800
X-CSE-ConnectionGUID: FMyX3r4nTSqtBNJ8t7YGNQ==
X-CSE-MsgGUID: Hs5ack4qRHOgvusC5uDWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="113567219"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Feb 2025 10:47:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiHlf-001619-29;
	Wed, 12 Feb 2025 18:47:27 +0000
Date: Thu, 13 Feb 2025 02:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: [linux-next:master 1795/2407] dcssblk.c:undefined reference to
 `kill_dax'
Message-ID: <202502130222.AkPLUckI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c674aa7c289e51659e40dda0f954886ef7f80042
commit: 740746a039fa6ba8ebaefa3290bb2dc0a424d14e [1795/2407] dcssblk: mark DAX broken, remove FS_DAX_LIMITED support
config: s390-randconfig-001-20250213 (https://download.01.org/0day-ci/archive/20250213/202502130222.AkPLUckI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130222.AkPLUckI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130222.AkPLUckI-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_remove_store':
>> dcssblk.c:(.text+0xfba): undefined reference to `kill_dax'
>> s390-linux-ld: dcssblk.c:(.text+0xffe): undefined reference to `put_dax'
   s390-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_shared_store':
   dcssblk.c:(.text+0x21f0): undefined reference to `kill_dax'
   s390-linux-ld: dcssblk.c:(.text+0x2234): undefined reference to `put_dax'
   s390-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_add_store':
   dcssblk.c:(.text+0x61c4): undefined reference to `kill_dax'
   s390-linux-ld: dcssblk.c:(.text+0x6208): undefined reference to `put_dax'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
