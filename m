Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBCA4D9F7F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 18:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791225400; cv=none; b=ImNEX/vqVwtrWDw16df7zLoJEqQ+vnGQE0Xmf6+Le0OTzR9ZVU2r88jP6JBRl0SIR0sZExicOXc+v/gU3CCSdknX1cdnDzV9xFKuXk4hIP21xiL/fzWO8TOeBA4bKhc4xC/kO5SsOMrSsdRY9OJNE4+afnCsIsRNjgA6pAmcA8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791225400; c=relaxed/simple;
	bh=myh1qxZ/vlJpsuh74M+ALAt0c1tmoUuSRV+ekKouHno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t1wQ0RvZFIQYdqjb/zxg2DCMMB8Y5Lxfj+Ce48M7xP1qxEVULGC64tgHG/Bi49SzU9mZkOTfoD9vCjKJ/3Ftww/6LiHf3rATubueQdMmiVAgA6Ualo4SZnGTOgOLpf5SRXEXKRT51bwVi3xP50TxBa2DpgHtUOilyY41clckX+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQ7tt/WI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQ7tt/WI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791225398; x=1822761398;
  h=date:from:to:cc:subject:message-id;
  bh=myh1qxZ/vlJpsuh74M+ALAt0c1tmoUuSRV+ekKouHno=;
  b=ZQ7tt/WI1XoN6/V76vy6OCR/m7iHiKaDcTdXemtzLRVvOpGKPnaj7Ie4
   Z8bsFA9t55D6q/pm/wYvjaxtgfOofwvWDwUp/8ozu/myrX6zSM8S7bY6w
   obbRZ6wb7b/qOlseW4Ke0aV5CR12lfcBF7ovrB5RFok5aloVficb4ewci
   wB26uYr7yYd++uM9TQ12ZddWx2X/EdP2sS1FJfRSCJ5PuototYKLnB/yL
   NlyFRXsP/DEsDfPUf7iZxprwfucaA2ZpvDQrwIwL0NhlBsMbwu3x/qdNe
   ulgLFLlUu16QVO4BzUX9Nc4WoLF0Bo39XVgp4zzVfDOP3r3pwr3aaVhbF
   A==;
X-CSE-ConnectionGUID: NqgHh0+hQ8uAXa5EP13AjA==
X-CSE-MsgGUID: c5I55DSZTh2alFOw7xjThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113687718"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="113687718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:36:37 -0700
X-CSE-ConnectionGUID: RrEpqw93R920Rv8bXhxvHg==
X-CSE-MsgGUID: OCrBNt4GTo65euoCtnZAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="281672874"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2026 11:36:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDnYA-000000000GR-1R6p;
	Mon, 05 Oct 2026 18:36:34 +0000
Date: Mon, 05 Oct 2026 20:35:58 +0200
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-23 65/95] ld.lld: error: undefined
 symbol: xfs_qm_dqget_inode
Message-ID: <202610052008.hD6YG2LQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-23
head:   cfeb0e609481f4df242684d426d8972e120e1826
commit: d1a9d46e808953ae087cdd9dd7ff545f491064c5 [65/95] xfs: reattach dquots after changing inode ids
config: x86_64-randconfig-2100-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052008.hD6YG2LQ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052008.hD6YG2LQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052008.hD6YG2LQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_qm_dqget_inode
   >>> referenced by inode_repair.c:1773 (fs/xfs/scrub/inode_repair.c:1773)
   >>>               vmlinux.o:(xrep_inode_ids)
   >>> referenced by inode_repair.c:1773 (fs/xfs/scrub/inode_repair.c:1773)
   >>>               vmlinux.o:(xrep_inode_ids)
   >>> referenced by inode_repair.c:1773 (fs/xfs/scrub/inode_repair.c:1773)
   >>>               vmlinux.o:(xrep_inode_ids)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
