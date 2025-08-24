Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B1050276
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756005031; cv=none; b=jt50K2R5wJb7X4uAMsArvEDDfhCHIR9HsSL+2OcIPxlvN8eftSCI4+J3miXOtwwJYWGVN+MhHGgYCDQNleCnGMv/NQ1B0naiqaqVWnIMipxmYc1tCeKxiMe+qVdU4HtJkQbs0Gb5CzvUWysLabqt6ulMzZgN0Y7a7KEdgWb+1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756005031; c=relaxed/simple;
	bh=zv9D0Bj24IIOceuhvRkOpzh84+Cqnd7677hopK+b81U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HS4Vvrq1swurQCgQo13QmnDLHXj9yedCTnhepYK6N1WZrC6ou5eIFVtKHPCZKidcWlTP76GpwQx3JLJPcuzdZkXmca/YMXoey0rRz3LFvPjCLAsS+5IFESLVf+51BGOr4EFIiEqEplBIwlhzfoofXOtFcSEm792t5gbkLDSeORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnzvNY0v; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnzvNY0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756005029; x=1787541029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zv9D0Bj24IIOceuhvRkOpzh84+Cqnd7677hopK+b81U=;
  b=LnzvNY0vha7WwfvsqpmLk6fwXCLZMUo6maoVeNBcow47rwqK49NyqaQM
   +HxkOZehJfTG/muOop1t8GUz77pppey5/AQNTb2FGFRanAzmmpOlAA6Zd
   GeI6fQ/nyNlnQSBHsHFWKZt7t7M4tj52dZeg6aJPwXc90HDNiJCnQBfZ2
   FVtn/5xOxB+osyc/c7XxeNAlzWIkIHxOhJQVPjRcEzwN2+UynO6iquygv
   YNgq60NydwJYR3j/r+NTJdpTC+GAFJYvnQYBs2mOfUSRQ/PK1f4ohYC5x
   MVycbGsUGUCgSsPaHI4pSVO06rDT+DlpU/3iOE5vVm4NxS7ld8+nOEnEa
   A==;
X-CSE-ConnectionGUID: 4YHcrDEyRTO7e8A7Q+Y1mA==
X-CSE-MsgGUID: OLPjE97wQh2OkwgemC+d6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58356715"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58356715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 20:10:28 -0700
X-CSE-ConnectionGUID: yudq8r60RhGu8m/hNhRI5w==
X-CSE-MsgGUID: dptiiVo8RPmcwZHyB5FAIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168243283"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Aug 2025 20:10:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq17E-000Mj9-2O;
	Sun, 24 Aug 2025 03:10:09 +0000
Date: Sun, 24 Aug 2025 11:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-v4h 58/58]
 drivers/accel/ivpu/ivpu_drv.h:327:2: error: #endif without #if
Message-ID: <202508241104.AFUYoq2M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-v4h
head:   03a5021c51f56725837f7c18a6704ea25632fd24
commit: 03a5021c51f56725837f7c18a6704ea25632fd24 [58/58] accel/ivpu: implement IVPU_DBG_* as a dyndbg classmap
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250824/202508241104.AFUYoq2M-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241104.AFUYoq2M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241104.AFUYoq2M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:327:2: error: #endif without #if
     327 | #endif /* __IVPU_DRV_H__ */
         |  ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:81:6: error: redefinition of 'ivpu_dbg_category'
      81 | enum ivpu_dbg_category {
         |      ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:81:6: note: unguarded header; consider using #ifdef guards or #pragma once
      81 | enum ivpu_dbg_category {
         |      ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:87:2: error: redefinition of enumerator 'IVPU_DBG_REG'
      87 |         IVPU_DBG_REG = 16,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:87:2: note: unguarded header; consider using #ifdef guards or #pragma once
      87 |         IVPU_DBG_REG = 16,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:88:2: error: redefinition of enumerator 'IVPU_DBG_IRQ'
      88 |         IVPU_DBG_IRQ,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:88:2: note: unguarded header; consider using #ifdef guards or #pragma once
      88 |         IVPU_DBG_IRQ,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:89:2: error: redefinition of enumerator 'IVPU_DBG_MMU'
      89 |         IVPU_DBG_MMU,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:89:2: note: unguarded header; consider using #ifdef guards or #pragma once
      89 |         IVPU_DBG_MMU,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:90:2: error: redefinition of enumerator 'IVPU_DBG_FILE'
      90 |         IVPU_DBG_FILE,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:90:2: note: unguarded header; consider using #ifdef guards or #pragma once
      90 |         IVPU_DBG_FILE,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:91:2: error: redefinition of enumerator 'IVPU_DBG_MISC'
      91 |         IVPU_DBG_MISC,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:91:2: note: unguarded header; consider using #ifdef guards or #pragma once
      91 |         IVPU_DBG_MISC,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:92:2: error: redefinition of enumerator 'IVPU_DBG_FW_BOOT'
      92 |         IVPU_DBG_FW_BOOT,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:92:2: note: unguarded header; consider using #ifdef guards or #pragma once
      92 |         IVPU_DBG_FW_BOOT,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:93:2: error: redefinition of enumerator 'IVPU_DBG_PM'
      93 |         IVPU_DBG_PM,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:93:2: note: unguarded header; consider using #ifdef guards or #pragma once
      93 |         IVPU_DBG_PM,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:94:2: error: redefinition of enumerator 'IVPU_DBG_IPC'
      94 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:94:2: note: unguarded header; consider using #ifdef guards or #pragma once
      94 |         IVPU_DBG_IPC,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:95:2: error: redefinition of enumerator 'IVPU_DBG_BO'
      95 |         IVPU_DBG_BO,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:95:2: note: unguarded header; consider using #ifdef guards or #pragma once
      95 |         IVPU_DBG_BO,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:96:2: error: redefinition of enumerator 'IVPU_DBG_JOB'
      96 |         IVPU_DBG_JOB,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:96:2: note: unguarded header; consider using #ifdef guards or #pragma once
      96 |         IVPU_DBG_JOB,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:97:2: error: redefinition of enumerator 'IVPU_DBG_JSM'
      97 |         IVPU_DBG_JSM,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:97:2: note: unguarded header; consider using #ifdef guards or #pragma once
      97 |         IVPU_DBG_JSM,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:98:2: error: redefinition of enumerator 'IVPU_DBG_KREF'
      98 |         IVPU_DBG_KREF,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:98:2: note: unguarded header; consider using #ifdef guards or #pragma once
      98 |         IVPU_DBG_KREF,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:99:2: error: redefinition of enumerator 'IVPU_DBG_RPM'
      99 |         IVPU_DBG_RPM,
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:99:2: note: unguarded header; consider using #ifdef guards or #pragma once
      99 |         IVPU_DBG_RPM,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:100:2: error: redefinition of enumerator 'IVPU_DBG_MMU_MAP'
     100 |         IVPU_DBG_MMU_MAP
         |         ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:100:2: note: unguarded header; consider using #ifdef guards or #pragma once
     100 |         IVPU_DBG_MMU_MAP
         |         ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:128:8: error: redefinition of 'ivpu_wa_table'
     128 | struct ivpu_wa_table {
         |        ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:128:8: note: unguarded header; consider using #ifdef guards or #pragma once
     128 | struct ivpu_wa_table {
         |        ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:144:8: error: redefinition of 'ivpu_device'
     144 | struct ivpu_device {
         |        ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:144:8: note: unguarded header; consider using #ifdef guards or #pragma once
     144 | struct ivpu_device {
         |        ^
   In file included from drivers/accel/ivpu/ivpu_drv.c:19:
   In file included from drivers/accel/ivpu/ivpu_coredump.h:12:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:199:8: error: redefinition of 'ivpu_file_priv'
     199 | struct ivpu_file_priv {
         |        ^
   drivers/accel/ivpu/ivpu_coredump.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:199:8: note: unguarded header; consider using #ifdef guards or #pragma once
     199 | struct ivpu_file_priv {
         |        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/accel/ivpu/ivpu_fw.c:12:
>> drivers/accel/ivpu/ivpu_drv.h:327:2: error: #endif without #if
     327 | #endif /* __IVPU_DRV_H__ */
         |  ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:81:6: error: redefinition of 'ivpu_dbg_category'
      81 | enum ivpu_dbg_category {
         |      ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:81:6: note: unguarded header; consider using #ifdef guards or #pragma once
      81 | enum ivpu_dbg_category {
         |      ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:87:2: error: redefinition of enumerator 'IVPU_DBG_REG'
      87 |         IVPU_DBG_REG = 16,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:87:2: note: unguarded header; consider using #ifdef guards or #pragma once
      87 |         IVPU_DBG_REG = 16,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:88:2: error: redefinition of enumerator 'IVPU_DBG_IRQ'
      88 |         IVPU_DBG_IRQ,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:88:2: note: unguarded header; consider using #ifdef guards or #pragma once
      88 |         IVPU_DBG_IRQ,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:89:2: error: redefinition of enumerator 'IVPU_DBG_MMU'
      89 |         IVPU_DBG_MMU,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:89:2: note: unguarded header; consider using #ifdef guards or #pragma once
      89 |         IVPU_DBG_MMU,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:90:2: error: redefinition of enumerator 'IVPU_DBG_FILE'
      90 |         IVPU_DBG_FILE,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:90:2: note: unguarded header; consider using #ifdef guards or #pragma once
      90 |         IVPU_DBG_FILE,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:91:2: error: redefinition of enumerator 'IVPU_DBG_MISC'
      91 |         IVPU_DBG_MISC,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:91:2: note: unguarded header; consider using #ifdef guards or #pragma once
      91 |         IVPU_DBG_MISC,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:92:2: error: redefinition of enumerator 'IVPU_DBG_FW_BOOT'
      92 |         IVPU_DBG_FW_BOOT,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:92:2: note: unguarded header; consider using #ifdef guards or #pragma once
      92 |         IVPU_DBG_FW_BOOT,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:93:2: error: redefinition of enumerator 'IVPU_DBG_PM'
      93 |         IVPU_DBG_PM,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:93:2: note: unguarded header; consider using #ifdef guards or #pragma once
      93 |         IVPU_DBG_PM,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:94:2: error: redefinition of enumerator 'IVPU_DBG_IPC'
      94 |         IVPU_DBG_IPC,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:94:2: note: unguarded header; consider using #ifdef guards or #pragma once
      94 |         IVPU_DBG_IPC,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:95:2: error: redefinition of enumerator 'IVPU_DBG_BO'
      95 |         IVPU_DBG_BO,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:95:2: note: unguarded header; consider using #ifdef guards or #pragma once
      95 |         IVPU_DBG_BO,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:96:2: error: redefinition of enumerator 'IVPU_DBG_JOB'
      96 |         IVPU_DBG_JOB,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:96:2: note: unguarded header; consider using #ifdef guards or #pragma once
      96 |         IVPU_DBG_JOB,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:97:2: error: redefinition of enumerator 'IVPU_DBG_JSM'
      97 |         IVPU_DBG_JSM,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:97:2: note: unguarded header; consider using #ifdef guards or #pragma once
      97 |         IVPU_DBG_JSM,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:98:2: error: redefinition of enumerator 'IVPU_DBG_KREF'
      98 |         IVPU_DBG_KREF,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:98:2: note: unguarded header; consider using #ifdef guards or #pragma once
      98 |         IVPU_DBG_KREF,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:99:2: error: redefinition of enumerator 'IVPU_DBG_RPM'
      99 |         IVPU_DBG_RPM,
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:99:2: note: unguarded header; consider using #ifdef guards or #pragma once
      99 |         IVPU_DBG_RPM,
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:100:2: error: redefinition of enumerator 'IVPU_DBG_MMU_MAP'
     100 |         IVPU_DBG_MMU_MAP
         |         ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:100:2: note: unguarded header; consider using #ifdef guards or #pragma once
     100 |         IVPU_DBG_MMU_MAP
         |         ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:128:8: error: redefinition of 'ivpu_wa_table'
     128 | struct ivpu_wa_table {
         |        ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:128:8: note: unguarded header; consider using #ifdef guards or #pragma once
     128 | struct ivpu_wa_table {
         |        ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:144:8: error: redefinition of 'ivpu_device'
     144 | struct ivpu_device {
         |        ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:144:8: note: unguarded header; consider using #ifdef guards or #pragma once
     144 | struct ivpu_device {
         |        ^
   In file included from drivers/accel/ivpu/ivpu_fw.c:14:
   In file included from drivers/accel/ivpu/ivpu_fw_log.h:11:
>> drivers/accel/ivpu/ivpu_drv.h:199:8: error: redefinition of 'ivpu_file_priv'
     199 | struct ivpu_file_priv {
         |        ^
   drivers/accel/ivpu/ivpu_fw.c:12:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      12 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_fw_log.h:11:10: note: 'drivers/accel/ivpu/ivpu_drv.h' included multiple times, additional include site here
      11 | #include "ivpu_drv.h"
         |          ^
   drivers/accel/ivpu/ivpu_drv.h:199:8: note: unguarded header; consider using #ifdef guards or #pragma once
     199 | struct ivpu_file_priv {
         |        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +327 drivers/accel/ivpu/ivpu_drv.h

eefa13a69053a0 Stanislaw Gruszka   2023-09-01  127  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17 @128  struct ivpu_wa_table {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  129  	bool punit_disabled;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  130  	bool clear_runtime_mem;
7f34e01f77f811 Karol Wachowski     2023-07-03  131  	bool interrupt_clear_with_0;
79cdc56c4a5425 Stanislaw Gruszka   2023-07-31  132  	bool disable_clock_relinquish;
3198a62eb8f841 Andrzej Kacprowski  2023-10-28  133  	bool disable_d0i3_msg;
d9dfc4eaa3c6bf Wachowski, Karol    2024-06-11  134  	bool wp0_during_power_up;
011529fe81121e Karol Wachowski     2025-02-04  135  	bool disable_d0i2;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  136  };
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  137  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  138  struct ivpu_hw_info;
263b2ba5fc93c8 Jacek Lawrynowicz   2023-01-17  139  struct ivpu_mmu_info;
02d5b0aacd0590 Jacek Lawrynowicz   2023-01-17  140  struct ivpu_fw_info;
5d7422cfb498bf Jacek Lawrynowicz   2023-01-17  141  struct ivpu_ipc_info;
852be13f3bd32c Jacek Lawrynowicz   2023-01-17  142  struct ivpu_pm_info;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  143  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17 @144  struct ivpu_device {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  145  	struct drm_device drm;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  146  	void __iomem *regb;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  147  	void __iomem *regv;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  148  	u32 platform;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  149  	u32 irq;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  150  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  151  	struct ivpu_wa_table wa;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  152  	struct ivpu_hw_info *hw;
263b2ba5fc93c8 Jacek Lawrynowicz   2023-01-17  153  	struct ivpu_mmu_info *mmu;
02d5b0aacd0590 Jacek Lawrynowicz   2023-01-17  154  	struct ivpu_fw_info *fw;
5d7422cfb498bf Jacek Lawrynowicz   2023-01-17  155  	struct ivpu_ipc_info *ipc;
852be13f3bd32c Jacek Lawrynowicz   2023-01-17  156  	struct ivpu_pm_info *pm;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  157  
263b2ba5fc93c8 Jacek Lawrynowicz   2023-01-17  158  	struct ivpu_mmu_context gctx;
34d03f2a174dce Karol Wachowski     2023-09-01  159  	struct ivpu_mmu_context rctx;
f1cc6aceecd049 Jacek Lawrynowicz   2024-01-22  160  	struct mutex context_list_lock; /* Protects user context addition/removal */
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  161  	struct xarray context_xa;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  162  	struct xa_limit context_xa_limit;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  163  
f32d59677ab142 Wachowski, Karol    2024-02-14  164  	struct xarray db_xa;
c3b0ec0fe0c7eb Tomasz Rusinowicz   2024-09-30  165  	struct xa_limit db_limit;
ae7af7d8dc2a13 Karol Wachowski     2024-10-17  166  	u32 db_next;
f32d59677ab142 Wachowski, Karol    2024-02-14  167  
bc3e5f48b7ee02 Maciej Falkowski    2025-01-07  168  	struct work_struct irq_ipc_work;
bc3e5f48b7ee02 Maciej Falkowski    2025-01-07  169  	struct work_struct irq_dct_work;
bc3e5f48b7ee02 Maciej Falkowski    2025-01-07  170  	struct work_struct context_abort_work;
bc3e5f48b7ee02 Maciej Falkowski    2025-01-07  171  
48aea7f2a2efae Jacek Lawrynowicz   2023-10-31  172  	struct mutex bo_list_lock; /* Protects bo_list */
48aea7f2a2efae Jacek Lawrynowicz   2023-10-31  173  	struct list_head bo_list;
48aea7f2a2efae Jacek Lawrynowicz   2023-10-31  174  
5bbccadaf33eea Karol Wachowski     2025-01-07  175  	struct mutex submitted_jobs_lock; /* Protects submitted_jobs */
cd7272215c4467 Jacek Lawrynowicz   2023-01-17  176  	struct xarray submitted_jobs_xa;
3b434a3445fff3 Jacek Lawrynowicz   2023-11-13  177  	struct ivpu_ipc_consumer job_done_consumer;
0e7db503c5355f Karol Wachowski     2025-04-16  178  	atomic_t job_timeout_counter;
cd7272215c4467 Jacek Lawrynowicz   2023-01-17  179  
02d5b0aacd0590 Jacek Lawrynowicz   2023-01-17  180  	atomic64_t unique_id_counter;
02d5b0aacd0590 Jacek Lawrynowicz   2023-01-17  181  
0adff3b0ef1248 Tomasz Rusinowicz   2024-05-13  182  	ktime_t busy_start_ts;
0adff3b0ef1248 Tomasz Rusinowicz   2024-05-13  183  	ktime_t busy_time;
0adff3b0ef1248 Tomasz Rusinowicz   2024-05-13  184  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  185  	struct {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  186  		int boot;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  187  		int jsm;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  188  		int tdr;
8ed520ff4682aa Krystian Pradzynski 2023-09-01  189  		int autosuspend;
3198a62eb8f841 Andrzej Kacprowski  2023-10-28  190  		int d0i3_entry_msg;
5e162f872d7af8 Tomasz Rusinowicz   2024-09-30  191  		int state_dump_msg;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  192  	} timeout;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  193  };
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  194  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  195  /*
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  196   * file_priv has its own refcount (ref) that allows user space to close the fd
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  197   * without blocking even if VPU is still processing some jobs.
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  198   */
35b137630f08d9 Jacek Lawrynowicz   2023-01-17 @199  struct ivpu_file_priv {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  200  	struct kref ref;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  201  	struct ivpu_device *vdev;
cd7272215c4467 Jacek Lawrynowicz   2023-01-17  202  	struct mutex lock; /* Protects cmdq */
76ad741ec7349b Karol Wachowski     2024-10-17  203  	struct xarray cmdq_xa;
263b2ba5fc93c8 Jacek Lawrynowicz   2023-01-17  204  	struct ivpu_mmu_context ctx;
cdfad4db775656 Tomasz Rusinowicz   2024-05-13  205  	struct mutex ms_lock; /* Protects ms_instance_list, ms_info_bo */
cdfad4db775656 Tomasz Rusinowicz   2024-05-13  206  	struct list_head ms_instance_list;
cdfad4db775656 Tomasz Rusinowicz   2024-05-13  207  	struct ivpu_bo *ms_info_bo;
c3b0ec0fe0c7eb Tomasz Rusinowicz   2024-09-30  208  	struct xa_limit job_limit;
ae7af7d8dc2a13 Karol Wachowski     2024-10-17  209  	u32 job_id_next;
76ad741ec7349b Karol Wachowski     2024-10-17  210  	struct xa_limit cmdq_limit;
76ad741ec7349b Karol Wachowski     2024-10-17  211  	u32 cmdq_id_next;
263b2ba5fc93c8 Jacek Lawrynowicz   2023-01-17  212  	bool has_mmu_faults;
f1cc6aceecd049 Jacek Lawrynowicz   2024-01-22  213  	bool bound;
b7ed87ffc7341d Maciej Falkowski    2024-06-11  214  	bool aborted;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  215  };
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  216  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  217  extern int ivpu_dbg_mask;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  218  extern u8 ivpu_pll_min_ratio;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  219  extern u8 ivpu_pll_max_ratio;
41ca33d8d356d4 Wachowski, Karol    2024-05-13  220  extern int ivpu_sched_mode;
95d440188d3082 Karol Wachowski     2023-05-18  221  extern bool ivpu_disable_mmu_cont_pages;
2c3801b17459da Wachowski, Karol    2024-05-13  222  extern bool ivpu_force_snoop;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  223  
8b5cec3c2ccf0b Karol Wachowski     2023-10-28  224  #define IVPU_TEST_MODE_FW_TEST            BIT(0)
8b5cec3c2ccf0b Karol Wachowski     2023-10-28  225  #define IVPU_TEST_MODE_NULL_HW            BIT(1)
8b5cec3c2ccf0b Karol Wachowski     2023-10-28  226  #define IVPU_TEST_MODE_NULL_SUBMISSION    BIT(2)
3198a62eb8f841 Andrzej Kacprowski  2023-10-28  227  #define IVPU_TEST_MODE_D0I3_MSG_DISABLE   BIT(4)
3198a62eb8f841 Andrzej Kacprowski  2023-10-28  228  #define IVPU_TEST_MODE_D0I3_MSG_ENABLE    BIT(5)
7df06efe1c28b2 Karol Wachowski     2024-10-17  229  #define IVPU_TEST_MODE_MIP_DISABLE        BIT(6)
3f440e0b485228 Maciej Falkowski    2024-06-11  230  #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
7459211aa6352c Andrzej Kacprowski  2024-09-30  231  #define IVPU_TEST_MODE_TURBO		  BIT(9)
55e856c344b047 Karol Wachowski     2025-02-04  232  #define IVPU_TEST_MODE_CLK_RELINQ_DISABLE BIT(10)
55e856c344b047 Karol Wachowski     2025-02-04  233  #define IVPU_TEST_MODE_CLK_RELINQ_ENABLE  BIT(11)
011529fe81121e Karol Wachowski     2025-02-04  234  #define IVPU_TEST_MODE_D0I2_DISABLE       BIT(12)
02d5b0aacd0590 Jacek Lawrynowicz   2023-01-17  235  extern int ivpu_test_mode;
02d5b0aacd0590 Jacek Lawrynowicz   2023-01-17  236  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  237  struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  238  void ivpu_file_priv_put(struct ivpu_file_priv **link);
02d5b0aacd0590 Jacek Lawrynowicz   2023-01-17  239  
02d5b0aacd0590 Jacek Lawrynowicz   2023-01-17  240  int ivpu_boot(struct ivpu_device *vdev);
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  241  int ivpu_shutdown(struct ivpu_device *vdev);
828d63042aeca1 Jacek Lawrynowicz   2023-10-03  242  void ivpu_prepare_for_reset(struct ivpu_device *vdev);
ae06e0b3bfe073 Karol Wachowski     2025-01-07  243  bool ivpu_is_capable(struct ivpu_device *vdev, u32 capability);
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  244  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  245  static inline u8 ivpu_revision(struct ivpu_device *vdev)
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  246  {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  247  	return to_pci_dev(vdev->drm.dev)->revision;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  248  }
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  249  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  250  static inline u16 ivpu_device_id(struct ivpu_device *vdev)
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  251  {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  252  	return to_pci_dev(vdev->drm.dev)->device;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  253  }
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  254  
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  255  static inline int ivpu_hw_ip_gen(struct ivpu_device *vdev)
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  256  {
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  257  	switch (ivpu_device_id(vdev)) {
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  258  	case PCI_DEVICE_ID_MTL:
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  259  	case PCI_DEVICE_ID_ARL:
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  260  		return IVPU_HW_IP_37XX;
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  261  	case PCI_DEVICE_ID_LNL:
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  262  		return IVPU_HW_IP_40XX;
c140244f0cfb96 Maciej Falkowski    2024-10-04  263  	case PCI_DEVICE_ID_PTL_P:
c140244f0cfb96 Maciej Falkowski    2024-10-04  264  		return IVPU_HW_IP_50XX;
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  265  	default:
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  266  		dump_stack();
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  267  		ivpu_err(vdev, "Unknown NPU IP generation\n");
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  268  		return 0;
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  269  	}
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  270  }
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  271  
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  272  static inline int ivpu_hw_btrs_gen(struct ivpu_device *vdev)
51d66a7b7d1298 Jacek Lawrynowicz   2023-07-31  273  {
51d66a7b7d1298 Jacek Lawrynowicz   2023-07-31  274  	switch (ivpu_device_id(vdev)) {
51d66a7b7d1298 Jacek Lawrynowicz   2023-07-31  275  	case PCI_DEVICE_ID_MTL:
9c1b2429c18424 Stanislaw Gruszka   2023-09-22  276  	case PCI_DEVICE_ID_ARL:
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  277  		return IVPU_HW_BTRS_MTL;
79cdc56c4a5425 Stanislaw Gruszka   2023-07-31  278  	case PCI_DEVICE_ID_LNL:
c140244f0cfb96 Maciej Falkowski    2024-10-04  279  	case PCI_DEVICE_ID_PTL_P:
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  280  		return IVPU_HW_BTRS_LNL;
51d66a7b7d1298 Jacek Lawrynowicz   2023-07-31  281  	default:
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  282  		dump_stack();
8a27ad81f7d3a4 Wachowski, Karol    2024-05-15  283  		ivpu_err(vdev, "Unknown buttress generation\n");
51d66a7b7d1298 Jacek Lawrynowicz   2023-07-31  284  		return 0;
51d66a7b7d1298 Jacek Lawrynowicz   2023-07-31  285  	}
51d66a7b7d1298 Jacek Lawrynowicz   2023-07-31  286  }
51d66a7b7d1298 Jacek Lawrynowicz   2023-07-31  287  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  288  static inline struct ivpu_device *to_ivpu_device(struct drm_device *dev)
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  289  {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  290  	return container_of(dev, struct ivpu_device, drm);
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  291  }
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  292  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  293  static inline u32 ivpu_get_context_count(struct ivpu_device *vdev)
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  294  {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  295  	struct xa_limit ctx_limit = vdev->context_xa_limit;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  296  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  297  	return (ctx_limit.max - ctx_limit.min + 1);
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  298  }
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  299  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  300  static inline u32 ivpu_get_platform(struct ivpu_device *vdev)
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  301  {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  302  	WARN_ON_ONCE(vdev->platform == IVPU_PLATFORM_INVALID);
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  303  	return vdev->platform;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  304  }
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  305  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  306  static inline bool ivpu_is_silicon(struct ivpu_device *vdev)
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  307  {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  308  	return ivpu_get_platform(vdev) == IVPU_PLATFORM_SILICON;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  309  }
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  310  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  311  static inline bool ivpu_is_simics(struct ivpu_device *vdev)
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  312  {
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  313  	return ivpu_get_platform(vdev) == IVPU_PLATFORM_SIMICS;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  314  }
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  315  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  316  static inline bool ivpu_is_fpga(struct ivpu_device *vdev)
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  317  {
dd4f78ec6a6f82 Karol Wachowski     2025-01-07  318  	return ivpu_get_platform(vdev) == IVPU_PLATFORM_FPGA ||
dd4f78ec6a6f82 Karol Wachowski     2025-01-07  319  	       ivpu_get_platform(vdev) == IVPU_PLATFORM_HSLE;
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  320  }
35b137630f08d9 Jacek Lawrynowicz   2023-01-17  321  
2c3801b17459da Wachowski, Karol    2024-05-13  322  static inline bool ivpu_is_force_snoop_enabled(struct ivpu_device *vdev)
2c3801b17459da Wachowski, Karol    2024-05-13  323  {
2c3801b17459da Wachowski, Karol    2024-05-13  324  	return ivpu_force_snoop;
2c3801b17459da Wachowski, Karol    2024-05-13  325  }
2c3801b17459da Wachowski, Karol    2024-05-13  326  
35b137630f08d9 Jacek Lawrynowicz   2023-01-17 @327  #endif /* __IVPU_DRV_H__ */

:::::: The code at line 327 was first introduced by commit
:::::: 35b137630f08d913fc2e33df33ccc2570dff3f7d accel/ivpu: Introduce a new DRM driver for Intel VPU

:::::: TO: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
