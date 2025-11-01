Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B7CEEC0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 01:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761961036; cv=none; b=V+hOM2igOtkrrcZyLSYnueWNopIFHl412aOrpB3IGLa5eYBlLK0zw53s0xZBnusKAID1Ue4zmQGXj+EHj1tEWdRNUiMKslxjRocrpHFRfQKDsN7fg6dRqau4YcLdQjWxFljqCPovHGK+wmtpaD0SrgVvEoEX37gqryQhwceaEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761961036; c=relaxed/simple;
	bh=r568FOjPbv7calJ03LiQFSRjKURYJTYaHK8vy0k0VS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtfSkuyFaQOMQ+sXszMt9BmyJ8QrimCaTq/3tpQ6FUzAQFLSzCEpQMLJrD/NJbiL+SAbNJ15K3fLQOvsNtTpqx2/22DH848WNVtIk9uLZiIFoQ21xJ8AX4lw9ozi6eVznvo8yP1eo5zorwsOru/dW1y8hWq2k68Oh+xV5LpI+0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2ikR0Ti; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2ikR0Ti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761961034; x=1793497034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r568FOjPbv7calJ03LiQFSRjKURYJTYaHK8vy0k0VS4=;
  b=f2ikR0TigE+rMf8tkCJXxDz4ejLM5vpPysO/ZqUS92xffdp7FNgbgdld
   BCj3OFpH44jlrX87FLIykCpiv2iGV1+xqFBHy5s6RPlCgxqXPzRaDV7wL
   ZG/XVqC4EVwkN2oi8D2jun8Rw2tH5rlaFdM8/URuTl7d4V52Bxr8Pvkcb
   igZdxKtoDiFc0Ot+KD9HQy8oZdwNPRGhqTvX2/gKGNFPxCaDqL/N6xTBx
   Sbjo4jhK4OUyUzwwfNUTlHffYrfCS+BBeCQ9IYDuswiF5lQUZ8xVU8vOa
   jAJbICX3zfj6PEakp/J0OwJkl8AQWJS4PcWoKYcP/GEJ4ieQsvhryXOVZ
   w==;
X-CSE-ConnectionGUID: cdfd1v1tRaCcCob6XXW9tg==
X-CSE-MsgGUID: YDdOGMjuS0SXbPjrpb7z9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64055839"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64055839"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 18:37:13 -0700
X-CSE-ConnectionGUID: bDXCosIRRvWVPtjX7FrxPw==
X-CSE-MsgGUID: WikwTm8cT46PdKFE/JD5eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="186058417"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2025 18:37:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF0YC-000Nne-1l;
	Sat, 01 Nov 2025 01:37:07 +0000
Date: Sat, 1 Nov 2025 09:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Yury Norov <yury.norov@gmail.com>
Subject: [tglx-devel:rseq/slice 52/75] WARNING: modpost: vmlinux: section
 mismatch in reference: record_one_cpu+0x44 (section: .text) ->
 set_cpu_possible (section: .init.text)
Message-ID: <202511010921.dDZQX5SN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   bee383449566a64254362dc3ff6a1bfd5bcb6a57
commit: 062451b0e7535f465e755354d2a410c841bfc2a4 [52/75] cpumask: Cache num_possible_cpus()
config: sparc-randconfig-r054-20251101 (https://download.01.org/0day-ci/archive/20251101/202511010921.dDZQX5SN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010921.dDZQX5SN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010921.dDZQX5SN-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: record_one_cpu+0x44 (section: .text) -> set_cpu_possible (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
