Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE741EB2B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712297314; cv=none; b=b1r84uHNLRJNai40xU7cQy4K+u7XTFwy/XH4QqgzBaXmtRHcb3uFaWtlEqRs9Xo+ay1pf5E1o815v+SuIYzwYuMqcOI7nRwYjTn3ELSQXHyjjWzhaX406ZTx1B9DX+ntbruAiI0cXIMHCqqTrUyVy8+bM796f7aPkLeYbQWR6+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712297314; c=relaxed/simple;
	bh=+khIB/KPRp5g2dP6PbBJ8R77m16C7SFGBjFEl/cJu3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pDoMeakTSY3RqE7TQOp/WTtH6VoDzmUcS54b5lcgJqSWDgwI+LaOoqUp9ueCL6GHEI7ti6q5ww8TFT7tm6IZflOtiI1OSYtxMXAbHEfhQ44AUrUaWo2qOeEjzUs8tDSF6RQrEoYpL/Z9v9jozedv0LFH5y/hS+N3eHNNpRLNXNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg1uL1aX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg1uL1aX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712297313; x=1743833313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+khIB/KPRp5g2dP6PbBJ8R77m16C7SFGBjFEl/cJu3o=;
  b=Dg1uL1aX76U5npACeXK9Y3qQiJGDkRY9uHpdpWeL7emf/sMAzBHW9C6R
   Cp92c0lhkfgdUlSm87koTrOIfXMa0XqXPS8wfwpSNos6zzZa1mUHN8cQb
   cibqpPIvj5aiP+J8PB9rHwxjo5IB/YyVy2bV0T4OmuXw64Vp4ynXWe/uj
   pU576YS4V6KOj6I8WlulcEAnDK4xzwr2L4YNpNrSVfiNKjK3tgt0mzE2L
   R1Ko2i98MhRKph9AQDvYZ8Dp749BMna8VNn36yTVmwJ6zSqY7u6WIeDv/
   deMwPrgyXylTpRqMFCLKFIrQrT0hU47yW3Fd3026n7wd5n7gjiIYueTve
   w==;
X-CSE-ConnectionGUID: hWu8rHSdT9K8OAaA/C0Kmw==
X-CSE-MsgGUID: CqK/TWOzR92M7jhQ+UtMxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7800676"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7800676"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 23:08:32 -0700
X-CSE-ConnectionGUID: 6EI2uxerRAGGoQ9pGO4nEQ==
X-CSE-MsgGUID: ZXlF9ssrQD+9znCX+J+U4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="50301719"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 23:08:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsckW-0001xW-2d;
	Fri, 05 Apr 2024 06:08:28 +0000
Date: Fri, 5 Apr 2024 14:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 4050/4242] verifier.c:undefined reference to
 `__SCK__perf_snapshot_branch_stack'
Message-ID: <202404051333.7und7PPW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
commit: 314a53623cd4e62e1b88126e5ed2bc87073d90ee [4050/4242] bpf: inline bpf_get_branch_snapshot() helper
config: loongarch-randconfig-r021-20221204 (https://download.01.org/0day-ci/archive/20240405/202404051333.7und7PPW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051333.7und7PPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051333.7und7PPW-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/bpf/verifier.o: in function `.LBB5162':
>> verifier.c:(.text+0xa960): undefined reference to `__SCK__perf_snapshot_branch_stack'
>> loongarch64-linux-ld: verifier.c:(.text+0xa964): undefined reference to `__SCK__perf_snapshot_branch_stack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
