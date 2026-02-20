Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A7199EAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771608927; cv=none; b=mE5BEFKBKCMBGqKSVC4MrtgrCJ1JjZQZMd+AXUbNpkyZ4w59DM7JZFsqwf/l6UQY+PhXhrUSjSfwFJzY4CwxsVyp5UET8XPoJwvBz0MZt5QtusVWo05VBtxkELrzj8aRjUxL50AUD/BXtmGndDZUCoT1r4cB9ShniqY3y7DEzog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771608927; c=relaxed/simple;
	bh=H0QMdIVh6iZM3XVGPMqDqoI92xscSQ5C0VA+YUiX4tY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JhujUjQRbWH+a6mfuF0fMGrDrIp+hKGXDVEXidKPTD6VYJ9utSuX8FCsJ2Pvo7YVvgGTNUshNSmjLHeBLMacL6kyvLLYtVaD8yHyxg0KJQaHgipEf8uhsxx/BsZlltytLukKqRp2O1x+Glw72FEBXh8fHHjTs6QJy46yZwDksis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+ZqrmoX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+ZqrmoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771608925; x=1803144925;
  h=date:from:to:cc:subject:message-id;
  bh=H0QMdIVh6iZM3XVGPMqDqoI92xscSQ5C0VA+YUiX4tY=;
  b=i+ZqrmoX5XPv5ONls0D+spiQ7P6WUN5V0E4hYFgChTP1+juASJQ+Z8ny
   96Qvp/rc5AdVGxwDHnBauU2kZSIWkIpTat4XG7mqjoDyNz0l1qIEtP+5a
   xAf6ORPPZ75yD86FzGIOtxPpHAGf5B/+1y/bZlK6ylJCE3N6YvRiqBEy1
   efLLAT7i//F94h5UOV4RSoBteDKBd419r5sAEYLX6mS/J1Qbmri+bLKY9
   lkSSjNxO364iL53Iz4dgp6njYjH5U7zOEGTM0MdydkrJvKWLYGsNlSmfX
   XOcE45ypFlOHCiabdSgKKa4wr3xSHmJeo9MDGXCdphdyzQGV/z8flmF1d
   A==;
X-CSE-ConnectionGUID: W+PRDdS4SWqhZQsIXSTyBw==
X-CSE-MsgGUID: iewhL06yRoKnYld06u89Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60278012"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="60278012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 09:35:24 -0800
X-CSE-ConnectionGUID: tT081mWBTtmFpNO0VLUo1A==
X-CSE-MsgGUID: 5GiNZtELQx6NDnKxQYT91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219909251"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Feb 2026 09:35:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtUPQ-000000014KS-2y9A;
	Fri, 20 Feb 2026 17:35:20 +0000
Date: Sat, 21 Feb 2026 01:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 7/20] kernel/bpf/core.o: error:
 objtool: ___bpf_prog_run+0x10: ignoring unreachables due to jump table quirk
Message-ID: <202602210144.qrIoUdjE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   f4536209da12a51a798128b7a8361c67e17c1e91
commit: 71a77a720285d76e44f1154c96ef851e517bb8db [7/20] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-073-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210144.qrIoUdjE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210144.qrIoUdjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210144.qrIoUdjE-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/core.c: In function 'bpf_prog_kallsyms_add':
   kernel/bpf/core.c:590:54: warning: '%s' directive argument is null [-Wformat-truncation=]
     590 |                 snprintf(sym, (size_t)(end - sym), "_%s", func_name);
         |                                                      ^~
>> kernel/bpf/core.o: error: objtool: ___bpf_prog_run+0x10: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
