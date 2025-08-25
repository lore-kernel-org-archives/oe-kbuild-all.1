Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B1529C33F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756111655; cv=none; b=o4enJy6ibY6vKoylevj7C2NM8qHtVVgszJHzaYJ53Fb2KmnGgkYG3Xjn0P5Qc32c/tljzPZnc1m/OPeu/rdwhedKrQ3gf9i/VGDdYPzVc9ojGYcmknYWIpbzhkohrSwyIc/Dg3OaVBm/TMGU4E14f8B4Th+2driqrBh/DsSKUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756111655; c=relaxed/simple;
	bh=db9wRhP/lkRI44kdGWVxw7kzfFlUBExPA6ExM7XeWFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N+qAlOFLlIVyqs1T5cqTOW4Q4kqKIPgsD9Zzo57sqsxE9lz+HI5atbWwybOo3LJ/lp5mkiTEaiekeG0V7NfbpaIcaZIhvCYiyc//Rd09ohQybLHqJrCWQ/MxvDGsBkKo59j8grLKJkQ94qlS1EhC7VbCY2LSfY3Z3TR5g/1rcuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISuf7NZk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISuf7NZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756111653; x=1787647653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=db9wRhP/lkRI44kdGWVxw7kzfFlUBExPA6ExM7XeWFc=;
  b=ISuf7NZkC6WAi9ZrjNgZ01CJ//536zJ+6+oUUyMy1KnuKY/xIvaeuuFh
   5mwvFk8s5NnqZxj66kLw+oEVlqCznIM91C1qjGLt1RYKDXIw5lFxAruuR
   ZeY+T78zpIb8mPOjCwDX+J2mi52+BhXGa23qOF9uj7yg5jMDhom+CtBE4
   vvx+s4hWRn4pPrX/ZgRnRft1u00egVbmF7RAH/6lvXnKHdz9H24xWb1NK
   qT3wXWIE6Ms5tWo36R/qfmJvDgQP+QVT/Q8VjlQWVGndzJ2XNawL1e+0v
   5tp/gZvFd3qKL7VwY9IgS4m4dYWWWhTOQe+DUQ8EFv8TzOQe3cW7RHAXB
   Q==;
X-CSE-ConnectionGUID: mGUncD3zRyycgY8peQcUug==
X-CSE-MsgGUID: Yc8Lasm0TsuzeEj/u6eHxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="62133716"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62133716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 01:47:33 -0700
X-CSE-ConnectionGUID: 3ofsm/zfQ+2ra6jHVak1JA==
X-CSE-MsgGUID: oj36Ze9ASymONpPQPY4tbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169133599"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 01:47:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqSrQ-000NX2-2H;
	Mon, 25 Aug 2025 08:47:28 +0000
Date: Mon, 25 Aug 2025 16:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-v4h 59/64]
 drivers/accel/ivpu/ivpu_hw_reg_io.h:69:2: error: use of undeclared
 identifier 'ivpu_dbg_mask'
Message-ID: <202508251638.3ggbzJB2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-v4h
head:   2f32032bffe62e9db729a4fdce26fb799d6f7302
commit: 93690d940ba7a67808376d4e416f62ec83edc272 [59/64] ivpu-fiddling-broken
config: x86_64-buildonly-randconfig-006-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251638.3ggbzJB2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251638.3ggbzJB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508251638.3ggbzJB2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/ivpu/ivpu_gem.c:19:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:69:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      69 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s started (exp_val 0x%x)\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_gem.c:19:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:80:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      80 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s %s (reg_val 0x%08x)\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_gem.c:19:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:92:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      92 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%08x\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_gem.c:19:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:102:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     102 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%016llx\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_gem.c:19:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:110:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     110 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%08x\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_gem.c:19:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:118:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     118 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%016llx\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_gem.c:19:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:129:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     129 |         ivpu_dbg(vdev, REG, "%s WR: %s_%d (0x%08x) <= 0x%08x\n", func, name, index, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
>> drivers/accel/ivpu/ivpu_gem.c:29:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      29 |         ivpu_dbg(vdev, BO,
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   8 errors generated.
--
   In file included from drivers/accel/ivpu/ivpu_drv.c:26:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:69:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      69 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s started (exp_val 0x%x)\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:26:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:80:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      80 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s %s (reg_val 0x%08x)\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:26:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:92:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      92 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%08x\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:26:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:102:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     102 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%016llx\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:26:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:110:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     110 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%08x\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:26:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:118:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     118 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%016llx\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:26:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:129:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     129 |         ivpu_dbg(vdev, REG, "%s WR: %s_%d (0x%08x) <= 0x%08x\n", func, name, index, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   7 errors generated.
--
>> drivers/accel/ivpu/ivpu_fw_log.c:43:3: error: use of undeclared identifier 'ivpu_dbg_mask'
      43 |                 ivpu_dbg(vdev, FW_BOOT, "Invalid header size 0x%x\n", log->header_size);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_fw_log.c:47:3: error: use of undeclared identifier 'ivpu_dbg_mask'
      47 |                 ivpu_dbg(vdev, FW_BOOT, "Invalid log size 0x%x\n", log->size);
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_fw_log.c:54:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      54 |         ivpu_dbg(vdev, FW_BOOT,
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   3 errors generated.
--
   In file included from drivers/accel/ivpu/ivpu_hw_ip.c:8:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:69:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      69 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s started (exp_val 0x%x)\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw_ip.c:8:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:80:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      80 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s %s (reg_val 0x%08x)\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw_ip.c:8:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:92:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      92 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%08x\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw_ip.c:8:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:102:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     102 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%016llx\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw_ip.c:8:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:110:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     110 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%08x\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw_ip.c:8:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:118:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     118 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%016llx\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw_ip.c:8:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:129:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     129 |         ivpu_dbg(vdev, REG, "%s WR: %s_%d (0x%08x) <= 0x%08x\n", func, name, index, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
>> drivers/accel/ivpu/ivpu_hw_ip.c:833:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     833 |         ivpu_dbg(vdev, PM, "Booting firmware, mode: %s\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw_ip.c:914:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     914 |         ivpu_dbg(vdev, PM, "Booting firmware, mode: %s\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw_ip.c:1078:2: error: use of undeclared identifier 'ivpu_dbg_mask'
    1078 |         ivpu_dbg(vdev, IRQ, "NOC Firewall interrupt detected, counter %d\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw_ip.c:1099:3: error: use of undeclared identifier 'ivpu_dbg_mask'
    1099 |                 ivpu_dbg(vdev, IRQ, "MMU sync complete\n");
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw_ip.c:1133:3: error: use of undeclared identifier 'ivpu_dbg_mask'
    1133 |                 ivpu_dbg(vdev, IRQ, "MMU sync complete\n");
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   12 errors generated.
--
   In file included from drivers/accel/ivpu/ivpu_hw.c:7:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:69:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      69 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s started (exp_val 0x%x)\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw.c:7:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:80:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      80 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s %s (reg_val 0x%08x)\n",
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw.c:7:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:92:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      92 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%08x\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw.c:7:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:102:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     102 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) RD: 0x%016llx\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw.c:7:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:110:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     110 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%08x\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw.c:7:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:118:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     118 |         ivpu_dbg(vdev, REG, "%s : %s (0x%08x) WR: 0x%016llx\n", func, name, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   In file included from drivers/accel/ivpu/ivpu_hw.c:7:
   In file included from drivers/accel/ivpu/ivpu_hw.h:10:
   In file included from drivers/accel/ivpu/ivpu_hw_btrs.h:12:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:129:2: error: use of undeclared identifier 'ivpu_dbg_mask'
     129 |         ivpu_dbg(vdev, REG, "%s WR: %s_%d (0x%08x) <= 0x%08x\n", func, name, index, reg, val);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
>> drivers/accel/ivpu/ivpu_hw.c:43:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      43 |         ivpu_dbg(vdev, MISC, "Platform type: %s (%d)\n", platform_to_str(platform), platform);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw.c:83:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      83 |         IVPU_PRINT_WA(punit_disabled);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:138:3: note: expanded from macro 'IVPU_PRINT_WA'
     138 |                 ivpu_dbg(vdev, MISC, "Using WA: " #wa_name "\n");       \
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw.c:84:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      84 |         IVPU_PRINT_WA(clear_runtime_mem);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:138:3: note: expanded from macro 'IVPU_PRINT_WA'
     138 |                 ivpu_dbg(vdev, MISC, "Using WA: " #wa_name "\n");       \
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw.c:85:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      85 |         IVPU_PRINT_WA(interrupt_clear_with_0);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:138:3: note: expanded from macro 'IVPU_PRINT_WA'
     138 |                 ivpu_dbg(vdev, MISC, "Using WA: " #wa_name "\n");       \
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw.c:86:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      86 |         IVPU_PRINT_WA(disable_clock_relinquish);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:138:3: note: expanded from macro 'IVPU_PRINT_WA'
     138 |                 ivpu_dbg(vdev, MISC, "Using WA: " #wa_name "\n");       \
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw.c:87:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      87 |         IVPU_PRINT_WA(wp0_during_power_up);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:138:3: note: expanded from macro 'IVPU_PRINT_WA'
     138 |                 ivpu_dbg(vdev, MISC, "Using WA: " #wa_name "\n");       \
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   drivers/accel/ivpu/ivpu_hw.c:88:2: error: use of undeclared identifier 'ivpu_dbg_mask'
      88 |         IVPU_PRINT_WA(disable_d0i2);
         |         ^
   drivers/accel/ivpu/ivpu_drv.h:138:3: note: expanded from macro 'IVPU_PRINT_WA'
     138 |                 ivpu_dbg(vdev, MISC, "Using WA: " #wa_name "\n");       \
         |                 ^
   drivers/accel/ivpu/ivpu_drv.h:84:33: note: expanded from macro 'ivpu_dbg'
      84 |         if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                  \
         |                                        ^
   14 errors generated.
..


vim +/ivpu_dbg_mask +69 drivers/accel/ivpu/ivpu_hw_reg_io.h

34776963452040 Jacek Lawrynowicz 2025-01-29  60  
34776963452040 Jacek Lawrynowicz 2025-01-29  61  static inline int __must_check
34776963452040 Jacek Lawrynowicz 2025-01-29  62  ivpu_hw_reg_poll_fld(struct ivpu_device *vdev, void __iomem *base,
34776963452040 Jacek Lawrynowicz 2025-01-29  63  		     u32 reg_offset, u32 reg_mask, u32 exp_masked_val, u32 timeout_us,
34776963452040 Jacek Lawrynowicz 2025-01-29  64  		     const char *func_name, const char *reg_name, const char *fld_name)
34776963452040 Jacek Lawrynowicz 2025-01-29  65  {
34776963452040 Jacek Lawrynowicz 2025-01-29  66  	u32 reg_val;
34776963452040 Jacek Lawrynowicz 2025-01-29  67  	int ret;
34776963452040 Jacek Lawrynowicz 2025-01-29  68  
34776963452040 Jacek Lawrynowicz 2025-01-29 @69  	ivpu_dbg(vdev, REG, "%s : %s (0x%08x) POLL %s started (exp_val 0x%x)\n",
34776963452040 Jacek Lawrynowicz 2025-01-29  70  		 func_name, reg_name, reg_offset, fld_name, exp_masked_val);
34776963452040 Jacek Lawrynowicz 2025-01-29  71  
34776963452040 Jacek Lawrynowicz 2025-01-29  72  	ret = read_poll_timeout(readl, reg_val, (reg_val & reg_mask) == exp_masked_val,
34776963452040 Jacek Lawrynowicz 2025-01-29  73  				REG_POLL_SLEEP_US, timeout_us, false, base + reg_offset);
34776963452040 Jacek Lawrynowicz 2025-01-29  74  

:::::: The code at line 69 was first introduced by commit
:::::: 34776963452040f199bf9985ad8a2261a82d8b99 accel/ivpu: Add support for hardware fault injection

:::::: TO: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
:::::: CC: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
