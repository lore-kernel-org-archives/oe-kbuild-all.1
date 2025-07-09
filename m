Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD692DAFBA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065971; cv=none; b=D86GyNq/3/Kd0xIb+o+O1JXko4MbJLHMgY62dzr9GHIq872FztlOKVFLnce11/8F8Z2TuGGNqAu+CR9DtkDXkGSl6Xx5T2KPy1VvlhjflzNvtqS62IJRJTzqzUJXeYhWA32sxfwhnMwrP+RsGAgIbn1wQVCosDM1vi7Q/xOjNZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065971; c=relaxed/simple;
	bh=C63x60Qd8u5sQn/iDR2zQxLDZZfj/u12Sl9H2arxZtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WepQXLy+XYfOp2aYQKpHq9WmtFDPBDvKp4WYOYqijYHc1c7BwrkpiSEr4ucSAc2UwNbuiXz0BZPMt3Pv3VkoxFX6Y7f+4e1R3bhd7M2qTjkwYB0qSyISgfmhda1pOuIwurm/g41FeVhtBAV5N8ctXcQEVu7ly0ny6THE5+QtPJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2AF5+BT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2AF5+BT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752065969; x=1783601969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C63x60Qd8u5sQn/iDR2zQxLDZZfj/u12Sl9H2arxZtg=;
  b=l2AF5+BTa6cunrtNjnMYeoPZy3idCn5WNBPFXYptt0Sxjle6FpQVuEXl
   HotfUVnicIWYBvzTdpVjodZUuq3aD1IiSPwdgZZ5Vtj8K1F5Qj84W5q5Q
   78rHxCLjKu5wC9RMzJEvas3V+T/qtEUz6oawH1EXwQU7QgmEPCVgVkrMl
   eL8wFlcB5FcjBwveXFVxBmI2MTfcO1DQCVPF6Ho7384jx9/VfQUqF01GT
   q0LaZN5aTde2fF1eYItGQtirpsnujZ9GKxAfiw4QnvSJLbLmbMvlEnKVJ
   x1L2lMsiHR37nN6KQmgo21OyYLLY3pfHrfpGIEb3UPYd1a/aTG7cSZmea
   A==;
X-CSE-ConnectionGUID: btT8tJWMQIu9xRpmgUmcrg==
X-CSE-MsgGUID: Mr9pJpboQmKXzMSL+Cxvcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53432692"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="53432692"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 05:59:29 -0700
X-CSE-ConnectionGUID: qO+4NcSIRMKoFvhQEPbWmw==
X-CSE-MsgGUID: Kf0nICIpRZG3JZi1dINZuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156252416"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2025 05:59:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZUOT-0003XP-2H;
	Wed, 09 Jul 2025 12:59:25 +0000
Date: Wed, 9 Jul 2025 20:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 6/6] ld.lld: error: undefined symbol:
 is_dma_buf_file
Message-ID: <202507092028.MagBkotp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c8fdc081cfa165aaa5bd87979d33b419499574cf
commit: f44d593749dcbd4e1013121fa615ecca412d1cb3 [6/6] ANDROID: Track per-process dmabuf RSS
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20250709/202507092028.MagBkotp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507092028.MagBkotp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507092028.MagBkotp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: is_dma_buf_file
   >>> referenced by file.c
   >>>               fs/file.o:(fd_install) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_account_task
   >>> referenced by file.c
   >>>               fs/file.o:(fd_install) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
