Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA4D2DC78C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jul 2026 03:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783223013; cv=none; b=bKjGM7XCjGdAl5O4au98sEo5lN+CSnFwpzP8zTUDMTEO1RdodVcZyq2NyD+gZ0MupJ1iYrSZJ24okb+3FF6XnSG4yZz+Zrj9MKTGBPBds0h592uNnyUneMWPT4FztHiBTwWgwJUKLryTJlkERH9eBASum3pu/EE3rVeVy3CSrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783223013; c=relaxed/simple;
	bh=PGoU/tIexr7D1/Xsp6dq4sfcU7rzJRuAVrXpp6N1XDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uP8J7Hz5FNV2l0aPuI7JTcXtmf+V5WE6YOaQ7+ATOuQdsWOmdNpBO0BMaWTrLsFzosclqAUKjlf5tXb0KURBrcDuE9YfGd6bQXcfZWmrdZCCSprA9k0BhttcIaFnbMHlOnyB4QMZO6a8RbjZdQUUaZpi/FwqUMMZ22OoXswxMJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2q+/0/+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2q+/0/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783223010; x=1814759010;
  h=date:from:to:cc:subject:message-id;
  bh=PGoU/tIexr7D1/Xsp6dq4sfcU7rzJRuAVrXpp6N1XDY=;
  b=e2q+/0/+6FLyhoBtAk2+0pByK4X2WXd1S5ZNAGFf7XmDnOCScElKx/2D
   qVc88seAvjfJDqzIM3hYnn4kXJLVri5KDb6PvcLTedkmtpIirdijdwGRN
   Tj1aRbO2chHadP1APfnToDc0C5qTOUBPZb7rMV1Z957Y9b64l2oEExfOI
   5tOAnNxc/iEybFI0ObZu02NlXCje3BxWemWDjUle1F9IOIiorXmRmQUjC
   XTzc0fNxagWi3y9OSixONUnNkWrAwXgRkkFcOANPk/FVuEDH1oeDqxwFr
   I2yCLERSIo6XcZDT5t+7IaIg8JTNKpCmvV0qZaVZoWKeGTsRagrmScZFL
   A==;
X-CSE-ConnectionGUID: RpVu5IXnSZy9gRTUNOKl1Q==
X-CSE-MsgGUID: Vy0ZLX3uSUORq1qyb7nzAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="84024743"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="84024743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 20:43:29 -0700
X-CSE-ConnectionGUID: km+PlIWPRNWWFmVxxCp3/Q==
X-CSE-MsgGUID: QJW1llyTSnaVnU9eFoXbmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="291553153"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Jul 2026 20:43:27 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgDlM-000000001s5-2c44;
	Sun, 05 Jul 2026 03:43:24 +0000
Date: Sun, 05 Jul 2026 05:43:16 +0200
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cwang@multikernel.io>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/userspace-api/seccomp_filter.rst:330: WARNING: Inline literal
 start-string without end-string. [docutils]
Message-ID: <202607050546.ql206lFF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/mm-add-__do_mmap-and-vm_mmap_remote-vm_munmap_remote/20260705-072005
head:   6fe40c9ec33b138a8d0a62b0750144d8384a7215
commit: 6030255b582d365ac34a1e512ae5ec9f44751391 docs/seccomp: document pinned-memfd redirect ioctls
date:   4 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260705/202607050546.ql206lFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050546.ql206lFF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/userspace-api/seccomp_filter.rst:330: WARNING: Inline literal start-string without end-string. [docutils]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]


vim +330 Documentation/userspace-api/seccomp_filter.rst

   320	
   321	    struct seccomp_notif_pin_install {
   322	        __u64 id;
   323	        __u32 flags;       /* reserved, must be 0 */
   324	        __u32 memfd;
   325	        __u64 target_addr;
   326	        __u64 size;
   327	        __u64 offset;      /* page-aligned offset into memfd */
   328	    };
   329	
 > 330	``id`` names an active notification (the trapped task to install into).
   331	``target_addr``, ``size`` and ``offset`` are page-aligned; ``offset`` selects
   332	where in ``memfd`` the mapping starts, so one memfd can back several pins. If
   333	``target_addr`` is ``0`` the kernel picks a free address and writes it back;
   334	otherwise an existing mapping there yields ``-EEXIST``. The pin is read-only
   335	and sealed, the target and its threads cannot unmap, move, reprotect or
   336	overwrite it, and lasts until the target ``execve()``s or exits.
   337	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
