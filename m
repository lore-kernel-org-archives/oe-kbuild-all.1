Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D441CFB9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729412309; cv=none; b=bd0D9X+b4yP58l+Db4EYDb05cROVNEu4ciEfGbKYzGHaa/XY/WeeL2td+NFfPWeBaREu61bjZGfjbp8xpWH2kKkx0FxWwgBIu90MmV6GJXV/8aJRGF8o9IRdFRjWMdb9DSr8rF/4GbPOSTaCg+hr0sExvNeFKLRV7PLs2rFbwaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729412309; c=relaxed/simple;
	bh=+ICL65tf0lYp79f97fYa2N8FzwKQ/ET23c9ZBWR5IMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZ62YFJge7mncosYyqjqQJAYrJo6EVwZJWWxCjTikOoLvOd5dQIens22eHhSRy2vcYIQrpyQ/M8D5I7sOIdIrHf7RvPgxHWkd4hM4Ql4+3Tmd4ZRTFhqHlwlUTyQu+NiA/BPGDWlSI04Qo4v0n4LvI8rj5+ydNtT8CgDccslZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+FsS9GB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+FsS9GB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729412307; x=1760948307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ICL65tf0lYp79f97fYa2N8FzwKQ/ET23c9ZBWR5IMU=;
  b=R+FsS9GBNLImomBqyBWHsPLkA4fM7eoVBtFlBto9XNLJqDvI+mV6UYr6
   xrVictaxuEOQ3+aklB4Rrf6BOvFYX45adF+GxwyMfbOBGcy/WF+gEq3+x
   FU1FAzTTosbg9OtcOCZRR2ZwuFjK77HTxY9z6nKiOV7lnqghnlMOLtLZ5
   8htFxJCk7piqvOEZalFq8l9w7NR/ajUO6U4je2Dx6TxQ7qpQR5ChQdmcf
   X9Mb0VQKhweQSuQMAPo8jM2ksM7amW2AQ64Ybvf9SdxMdxgcdb9RRq3LU
   M9rdhey7CMTy2EzjHlWZJ9T37GkpxHoOio9MJcwP63ki1ZeAIBOXnCWKc
   g==;
X-CSE-ConnectionGUID: veD/clkITwSxFRQ9TDCmUQ==
X-CSE-MsgGUID: QO4QlbCsS/uk4ApLsDFIPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28361614"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="28361614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 01:18:26 -0700
X-CSE-ConnectionGUID: dFLMQLsjTd2dpxZOn3Euug==
X-CSE-MsgGUID: jq2igmfaTBaUJDCqRK41nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="116712260"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2024 01:18:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2R8o-000Q4j-2N;
	Sun, 20 Oct 2024 08:18:22 +0000
Date: Sun, 20 Oct 2024 16:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13420/23031] vmlinux.o:
 warning: objtool: set_ftrace_ops_ro+0x31: relocation to !ENDBR: kcalloc+0x34
Message-ID: <202410201645.EANkb8HA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   87b3b9b66977a75adc5b52f58da5ae9d5d919abe
commit: 92459eeb7eb0284eae10d3d52b56863c86c6bd61 [13420/23031] UPSTREAM: cpu: Re-enable CPU mitigations by default for !X86 architectures
config: x86_64-buildonly-randconfig-005-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201645.EANkb8HA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201645.EANkb8HA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201645.EANkb8HA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x31: relocation to !ENDBR: kcalloc+0x34

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
