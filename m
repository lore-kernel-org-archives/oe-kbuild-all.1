Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C041B377
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769057621; cv=none; b=Wuj7OqLMVFdFeSoSMz0nguPBWBDq9tUwL3I5mAM4FuyRsHflxgAY6stqr9V3zWzaYlB8DY3jiWRRj5OgcPGrSlMR1kWeinA8/4fQfrNAOT4bMNBND2SacxRB8exYBjxGfAojX9/RbeCtAEJfEawhMBrDi4q+SB3XM8ezbiZFG0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769057621; c=relaxed/simple;
	bh=jWI4jWRLxi3kNJU4MPRjKyUvUT4lMwTXIsI19neC4t8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ie/16ELmXs527eNjvgoq78WS6cCnqadQg8MOiQ9ATfkARI+sfbuDA+eTCw0YHdElyS6WM07lIN5l/WUhgQ+1rY7waF0Krp0r2y0AiQGBlW+E+vx8VWCRnBUC3/wOMisH02CaqWSgTyxhQo0o6XlRRHbXn3THQHcierlo2SImxU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TR9taWqR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TR9taWqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769057619; x=1800593619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWI4jWRLxi3kNJU4MPRjKyUvUT4lMwTXIsI19neC4t8=;
  b=TR9taWqRepFLRSv9QXoy4MLR3LDm+28rd5hCjQQWnLWIr3rusTIemBLP
   8Z1fYVBCiMZiUO5DdZnzUuj6Ero8euEhZoVWnCQRnPQFwiwcqENciXEvy
   pmL2Oc7VgT7gouSKK3jcw7rAFajhYW++V1mLwWqmzBzHk0cerEtutVB0n
   fPZdufJji0rqtNA0JIs1P0yGfNbhgYBS6sSEkgS4bL86aTXvsHrPBvs7D
   KDCdJyIbaSapJ13fgTjm9N3Rlv0W+wydji3UNpiQxVxoLmTKnVu3H3cHH
   IKsy0ORS362rFcZXO7E9QCUXKbN1yV4OvsASGxpayqt1Zex1pYXFDy7vc
   g==;
X-CSE-ConnectionGUID: Sl7ospikQLa24hPiAJU/qg==
X-CSE-MsgGUID: jOZruZFvTYG/PPRqtuVBkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80596700"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="80596700"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:53:38 -0800
X-CSE-ConnectionGUID: DrDt8fGNQ2egjQEUwIjWKQ==
X-CSE-MsgGUID: ts8JFmmfT2ugWBuNFsgX1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="237897970"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jan 2026 20:53:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vimhJ-00000000SRZ-3UBu;
	Thu, 22 Jan 2026 04:53:33 +0000
Date: Thu, 22 Jan 2026 12:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 73/74] drivers/accel/ivpu/ivpu_gem.c:290:3:
 error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean
 'IVPU_DBG_IPC'?
Message-ID: <202601221207.aOcdctmt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   a0210189eae9fa2042083c4136cca1f6d80e93fa
commit: 052e80bfefb1f41d87a573f70f4ccffc5e4e3f39 [73/74] accel/ivpu: implement IVPU_DBG_* as a dyndbg classmap
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260122/202601221207.aOcdctmt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221207.aOcdctmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221207.aOcdctmt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/ivpu/ivpu_gem.c:290:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     290 |                 ivpu_dbg(vdev, IOCTL, "Can't add BO %pe to ctx %u: already in ctx %u\n",
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:153:1: note: expanded from here
     153 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
>> drivers/accel/ivpu/ivpu_gem.c:290:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     290 |                 ivpu_dbg(vdev, IOCTL, "Can't add BO %pe to ctx %u: already in ctx %u\n",
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:153:1: note: expanded from here
     153 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem.c:371:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     371 |                 ivpu_dbg(vdev, IOCTL, "Invalid BO flags 0x%x\n", args->flags);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:92:1: note: expanded from here
      92 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem.c:371:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     371 |                 ivpu_dbg(vdev, IOCTL, "Invalid BO flags 0x%x\n", args->flags);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:92:1: note: expanded from here
      92 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem.c:376:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     376 |                 ivpu_dbg(vdev, IOCTL, "Invalid BO size %llu\n", args->size);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:104:1: note: expanded from here
     104 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem.c:376:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     376 |                 ivpu_dbg(vdev, IOCTL, "Invalid BO size %llu\n", args->size);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:104:1: note: expanded from here
     104 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem.c:382:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     382 |                 ivpu_dbg(vdev, IOCTL, "Failed to allocate BO: %pe ctx %u size %llu flags 0x%x\n",
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:116:1: note: expanded from here
     116 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem.c:382:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     382 |                 ivpu_dbg(vdev, IOCTL, "Failed to allocate BO: %pe ctx %u size %llu flags 0x%x\n",
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:116:1: note: expanded from here
     116 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem.c:391:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     391 |                 ivpu_dbg(vdev, IOCTL, "Failed to create handle for BO: %pe ctx %u size %llu flags 0x%x\n",
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:139:1: note: expanded from here
     139 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem.c:391:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     391 |                 ivpu_dbg(vdev, IOCTL, "Failed to create handle for BO: %pe ctx %u size %llu flags 0x%x\n",
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
--
>> drivers/accel/ivpu/ivpu_gem_userptr.c:87:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
      87 |                 ivpu_dbg(vdev, IOCTL, "Failed to pin user pages: %d\n", ret);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:29:1: note: expanded from here
      29 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
>> drivers/accel/ivpu/ivpu_gem_userptr.c:87:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
      87 |                 ivpu_dbg(vdev, IOCTL, "Failed to pin user pages: %d\n", ret);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:29:1: note: expanded from here
      29 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem_userptr.c:92:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
      92 |                 ivpu_dbg(vdev, IOCTL, "Pinned %d pages, expected %lu\n", pinned, nr_pages);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:41:1: note: expanded from here
      41 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem_userptr.c:92:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
      92 |                 ivpu_dbg(vdev, IOCTL, "Pinned %d pages, expected %lu\n", pinned, nr_pages);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:41:1: note: expanded from here
      41 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem_userptr.c:105:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     105 |                 ivpu_dbg(vdev, IOCTL, "Failed to create sg table: %d\n", ret);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:61:1: note: expanded from here
      61 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem_userptr.c:105:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     105 |                 ivpu_dbg(vdev, IOCTL, "Failed to create sg table: %d\n", ret);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:61:1: note: expanded from here
      61 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem_userptr.c:119:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     119 |                 ivpu_dbg(vdev, IOCTL, "Failed to export userptr dma-buf: %d\n", ret);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:73:1: note: expanded from here
      73 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem_userptr.c:119:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     119 |                 ivpu_dbg(vdev, IOCTL, "Failed to export userptr dma-buf: %d\n", ret);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:73:1: note: expanded from here
      73 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem_userptr.c:174:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     174 |                 ivpu_dbg(vdev, IOCTL, "Invalid BO flags: 0x%x\n", args->flags);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:85:1: note: expanded from here
      85 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_gem_userptr.c:174:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     174 |                 ivpu_dbg(vdev, IOCTL, "Invalid BO flags: 0x%x\n", args->flags);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
--
>> drivers/accel/ivpu/ivpu_job.c:351:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     351 |                 ivpu_dbg(vdev, IOCTL, "Failed to find command queue with ID: %u\n", cmdq_id);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:131:1: note: expanded from here
     131 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
>> drivers/accel/ivpu/ivpu_job.c:351:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     351 |                 ivpu_dbg(vdev, IOCTL, "Failed to find command queue with ID: %u\n", cmdq_id);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:131:1: note: expanded from here
     131 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_job.c:774:4: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     774 |                         ivpu_dbg(vdev, IOCTL, "Failed to lookup GEM object with handle %u\n",
         |                         ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:25:1: note: expanded from here
      25 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_job.c:774:4: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     774 |                         ivpu_dbg(vdev, IOCTL, "Failed to lookup GEM object with handle %u\n",
         |                         ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:25:1: note: expanded from here
      25 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_job.c:788:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     788 |                 ivpu_dbg(vdev, IOCTL, "Buffer is already in use by another job\n");
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:37:1: note: expanded from here
      37 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_job.c:788:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     788 |                 ivpu_dbg(vdev, IOCTL, "Buffer is already in use by another job\n");
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:37:1: note: expanded from here
      37 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_job.c:793:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     793 |                 ivpu_dbg(vdev, IOCTL, "Invalid commands offset %u for buffer size %zu\n",
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:49:1: note: expanded from here
      49 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_job.c:793:3: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     793 |                 ivpu_dbg(vdev, IOCTL, "Invalid commands offset %u for buffer size %zu\n",
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:49:1: note: expanded from here
      49 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_job.c:804:4: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     804 |                         ivpu_dbg(vdev, IOCTL, "Preemption buffer is too small\n");
         |                         ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
         |                                ^
   <scratch space>:61:1: note: expanded from here
      61 | IVPU_DBG_IOCTL
         | ^
   drivers/accel/ivpu/ivpu_drv.h:107:2: note: 'IVPU_DBG_IPC' declared here
     107 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_job.c:804:4: error: use of undeclared identifier 'IVPU_DBG_IOCTL'; did you mean 'IVPU_DBG_IPC'?
     804 |                         ivpu_dbg(vdev, IOCTL, "Preemption buffer is too small\n");
         |                         ^
   drivers/accel/ivpu/ivpu_drv.h:117:25: note: expanded from macro 'ivpu_dbg'
     117 |         _dynamic_func_call_cls(IVPU_DBG_##type, fmt, __dynamic_dev_dbg, \
..


vim +290 drivers/accel/ivpu/ivpu_gem.c

647371a6609ddf Jacek Lawrynowicz 2023-01-17  281  
42328003ecb6a5 Wachowski, Karol  2024-02-14  282  static int ivpu_gem_bo_open(struct drm_gem_object *obj, struct drm_file *file)
b035224134626f Jacek Lawrynowicz 2023-10-31  283  {
b035224134626f Jacek Lawrynowicz 2023-10-31  284  	struct ivpu_file_priv *file_priv = file->driver_priv;
b035224134626f Jacek Lawrynowicz 2023-10-31  285  	struct ivpu_device *vdev = file_priv->vdev;
b035224134626f Jacek Lawrynowicz 2023-10-31  286  	struct ivpu_bo *bo = to_ivpu_bo(obj);
b035224134626f Jacek Lawrynowicz 2023-10-31  287  	struct ivpu_addr_range *range;
b035224134626f Jacek Lawrynowicz 2023-10-31  288  
b7a0e75632eb65 Jacek Lawrynowicz 2024-01-15  289  	if (bo->ctx) {
db892a9f7a8415 Karol Wachowski   2025-11-04 @290  		ivpu_dbg(vdev, IOCTL, "Can't add BO %pe to ctx %u: already in ctx %u\n",
db892a9f7a8415 Karol Wachowski   2025-11-04  291  			 bo, file_priv->ctx.id, bo->ctx->id);
b7a0e75632eb65 Jacek Lawrynowicz 2024-01-15  292  		return -EALREADY;
b7a0e75632eb65 Jacek Lawrynowicz 2024-01-15  293  	}
b7a0e75632eb65 Jacek Lawrynowicz 2024-01-15  294  
b035224134626f Jacek Lawrynowicz 2023-10-31  295  	if (bo->flags & DRM_IVPU_BO_SHAVE_MEM)
b035224134626f Jacek Lawrynowicz 2023-10-31  296  		range = &vdev->hw->ranges.shave;
b035224134626f Jacek Lawrynowicz 2023-10-31  297  	else if (bo->flags & DRM_IVPU_BO_DMA_MEM)
b035224134626f Jacek Lawrynowicz 2023-10-31  298  		range = &vdev->hw->ranges.dma;
b035224134626f Jacek Lawrynowicz 2023-10-31  299  	else
b035224134626f Jacek Lawrynowicz 2023-10-31  300  		range = &vdev->hw->ranges.user;
b035224134626f Jacek Lawrynowicz 2023-10-31  301  
b035224134626f Jacek Lawrynowicz 2023-10-31  302  	return ivpu_bo_alloc_vpu_addr(bo, &file_priv->ctx, range);
b035224134626f Jacek Lawrynowicz 2023-10-31  303  }
b035224134626f Jacek Lawrynowicz 2023-10-31  304  

:::::: The code at line 290 was first introduced by commit
:::::: db892a9f7a841575868756017a47921c7dc93042 accel/ivpu: Improve debug and warning messages

:::::: TO: Karol Wachowski <karol.wachowski@linux.intel.com>
:::::: CC: Karol Wachowski <karol.wachowski@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
