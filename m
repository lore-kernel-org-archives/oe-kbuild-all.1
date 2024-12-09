Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722E9156C52
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717353; cv=none; b=Kg+MF2pO98Q/VCLYXSE3IlZrmLv5ZmNtt3XjG/950encYBCMETF1+Zs2cSLqA32UdpJI50+9G2zmk3LW0+KHAhdDRlg5YILt2b+9OYkbKLx9L4hKG8eBEN/xHFQx4oaykPo25XsFU+rd6gFOwAWny5NWZU68zaleJJDY3fuHufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717353; c=relaxed/simple;
	bh=5Yy5XV8Z4BN10Un6VUDL2aw9Bp4qYNJx+VxgOyjpFfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ieR7TnbIbPazfLhQgMVslC2KiJaG/CTstXKbb/cJ4nIq3wrQVvgyPv1RatnE+RnO6d2TNGzGrmoQbmcOeyFKaOY5YaX1Tqjc7IeHMWPrQpI9jqgrjyBmqXxhPTpUMt84RsxFpz//rLGecICkuuxKzB/CILSUZs9oksMvVtp6PR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Er522P6H; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Er522P6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717352; x=1765253352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Yy5XV8Z4BN10Un6VUDL2aw9Bp4qYNJx+VxgOyjpFfI=;
  b=Er522P6Hj5+TNlvijR/kSBbP/iwAmh+lvB+r7/TKcSdF+gk4YLwSj7dt
   dVsUdmMA8p15hdX15iRf74wx2at9zm9kOVfD7DWBS2uwuGkDrdG9T840s
   Q1deXyW6LFGWMcVa2GT3AOSh7tJZHvsWUb6ZDKuXsTzjjcv4yBlbqz4Eb
   6WZbFlLp4O5s8/o546UljiNL2aurg0S1QinNZF99Uo3G66zuQWEKnI/ul
   NBH7DoNIIMcR9YxyBiVO2BtkL9bJpxaTJvsKw6vBxAs01LuNY4zn/iZ3Q
   pULpcodntdtMYisZhRo8Xlj3ZuvAjx+Ty/EziPYu32AHJzdG5qZXOjZZS
   w==;
X-CSE-ConnectionGUID: Q4/ovwtZTHS9IY9HIeuONA==
X-CSE-MsgGUID: jgNkAmAWT0ONtlyOPKO0Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="36841937"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="36841937"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:09:08 -0800
X-CSE-ConnectionGUID: TH8+VBKeQwuEorje2g4lEQ==
X-CSE-MsgGUID: IfuW1rpcQFKFv7iFqYCURQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95044972"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:09:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV4x-0003nP-26;
	Mon, 09 Dec 2024 04:09:03 +0000
Date: Mon, 9 Dec 2024 12:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/os-Linux/skas/process.c:391:5: sparse: sparse: symbol
 'unscheduled_userspace_iterations' was not declared. Should it be static?
Message-ID: <202412071423.c7PgbhHM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 0b8b2668f9981c1fefc2ef892bd915288ef01f33 um: insert scheduler ticks when userspace does not yield
date:   6 weeks ago
config: um-randconfig-r111-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071423.c7PgbhHM-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071423.c7PgbhHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071423.c7PgbhHM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/um/os-Linux/skas/process.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/skas/process.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:426:10: sparse: this was the original definition
   arch/um/os-Linux/skas/process.c: note: in included file (through arch/um/include/shared/init.h):
   include/linux/compiler_types.h:91:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
   include/linux/compiler_types.h:112:56: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
>> arch/um/os-Linux/skas/process.c:391:5: sparse: sparse: symbol 'unscheduled_userspace_iterations' was not declared. Should it be static?

vim +/unscheduled_userspace_iterations +391 arch/um/os-Linux/skas/process.c

   390	
 > 391	int unscheduled_userspace_iterations;
   392	extern unsigned long tt_extra_sched_jiffies;
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
