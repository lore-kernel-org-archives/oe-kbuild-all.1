Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744193EBF09
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 00:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771633420; cv=none; b=jnjy+zyONM09RLijLNprkVj165dUawvPUG+NZufbvVjaAhNx5rpXufMk/F6xoW+yiI74k1nvhNeyj+0AXAKvtHnwq3UnniQsqBMjbaCy251KWrNp8gJlmPBGwh5bxTnOPtg27f+HFaoWWpe6TZqjgj0BUPKvRn8DrYhW88OJb6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771633420; c=relaxed/simple;
	bh=uLV3J4l0CCz0n7ukwLmuVT4NxWMgUxKMwGD19ll2BJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VWjq8BErbVvqsvjjTlkQRe1IZK6OHPM88XbRRJC5x8qNVUOoabZGtOTjS6GtoWOEKH7/fyPMQIYSrwodOX7CjfvK8wiK0BSm//MlP34RT2MIXOWq3kn3DyogPjzlc91jSTE+VKGUfEB0c8X3QGBSuEc40GF+pH+UQ6mjdJYChhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzaZvH1O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzaZvH1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771633417; x=1803169417;
  h=date:from:to:cc:subject:message-id;
  bh=uLV3J4l0CCz0n7ukwLmuVT4NxWMgUxKMwGD19ll2BJk=;
  b=nzaZvH1OY1CNWoioQFGJ93CFjhiFmRiRqP/fh3/OY7x4rIBSEYPdp170
   aEk2Mvkmf+Xb4Z8vcbGtVk0rjTcNEl+Rc7TQ7tFRciO/GHkV4t3LfQChx
   4OZXy3enrMx0lKozDk2Nk5vmgrNU9D9l4JoXyPNPbCTzP46/W6C2F4g1m
   AjovDSeQOSrX3RRKN+uOJiftrxCFvpm6okZ3MMUTiaBAo4V7SgLVgWu9H
   1B0xZoa2i2KxR2Ycdn3M7FEsJ9QMQNoQMEmCCvw4lP2jMBD/eUN4rEppV
   4Z+C4cieaHqfKYr0WroMA4PMDoNcIwTJTCKa88obaRUcSCh0YeZo8aqx3
   A==;
X-CSE-ConnectionGUID: sImAUTbURf+Phnr7qzoFZA==
X-CSE-MsgGUID: 4CqFRz/aSUaTpwgM3KC9tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76561901"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76561901"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 16:23:37 -0800
X-CSE-ConnectionGUID: YT4KI2zkRsqENa/X7yIy8A==
X-CSE-MsgGUID: fngd6SBhQUCmASLwdy/guA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="215128961"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2026 16:23:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtamT-000000014aS-2IlZ;
	Sat, 21 Feb 2026 00:23:33 +0000
Date: Sat, 21 Feb 2026 08:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 7/20] kernel/bpf/core.o: error:
 objtool: ___bpf_prog_run+0x8ad9: sibling call from callable instruction with
 modified stack frame
Message-ID: <202602210846.ldalne16-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   f4536209da12a51a798128b7a8361c67e17c1e91
commit: 71a77a720285d76e44f1154c96ef851e517bb8db [7/20] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-076-20260221 (https://download.01.org/0day-ci/archive/20260221/202602210846.ldalne16-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210846.ldalne16-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210846.ldalne16-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.o: error: objtool: ___bpf_prog_run+0x8ad9: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
