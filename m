Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2F439FEC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721682725; cv=none; b=TiCYWL6iVh2a4KzemLH2K45DqTe+b7/OheQbv8Fd30SHtzMz9rDLspKFX/DvAU64BxtLRe9FEBz3wdZsjnBcm6853I6cz3QxZAY0r0UMlwMwjLrCShzdZetOjgGY/r/IKkR/9kgPLhb4gMyYNUHok5ewggvtz4iK25LnHtqcfnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721682725; c=relaxed/simple;
	bh=yAU+t+QdRx1i0i5vQ8cVD0uSFuUBRa6uPtjKP/dFSl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iv8zanZYa7NteA8J48E28ol/KwO3+n+YVHvnLGfLwpbsK+6zxtl+5PUfft6j58dCH0yhEgrougssco7kg+e6o/s7Thpp7AZp435R2RoMn+vfGENSjoy/NeXD5cmbIFJFHvsH8ZOQfie7T72ZN6DDrTYKNsQO4QJbYsAc5DYUyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXGFv9Nz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXGFv9Nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721682724; x=1753218724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yAU+t+QdRx1i0i5vQ8cVD0uSFuUBRa6uPtjKP/dFSl4=;
  b=QXGFv9Nz9nB6dT7WAV8ozkBC71BL6R0yoWVbf5nQMCZteBJf3eJ9gu/z
   x4YN1Z0+/qcnzXTyF8dzv3EbLQLVyU5j4TNNY5+Z2k16ip72oRGL6Z3zj
   drVcAJARnV0kuJ2trAn2rMxEFZYbK4aoFm/jToXRV9Q2YCCvqvSsXTzgu
   sUJIopMLu86ytuvHliKcpuFXNMIB9KKA75whqOQ/N3rJOzIh/pK7cNGYD
   lIi5K0GPIWxtdAP9KHRLoOM3o0bHOu4mLPCJ73vJdvreO3Z+Ama4iiQyV
   9ra5BDYqwB/A5EBNr/Bl9t71QNcQ9pW6EnawHJn3roc0s7RglpcuhV1Js
   w==;
X-CSE-ConnectionGUID: sKaVAD4dRnOkQvjlFN7UmA==
X-CSE-MsgGUID: epkVTnxFRvOVPzSgbugZhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="44699941"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="44699941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 14:12:01 -0700
X-CSE-ConnectionGUID: W7qq+zGSRSmrUp2Te/QuXg==
X-CSE-MsgGUID: Vje4JjN1SaaC/0/2yTsCSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="56172205"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2024 14:12:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW0K6-000lOz-0k;
	Mon, 22 Jul 2024 21:11:58 +0000
Date: Tue, 23 Jul 2024 05:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8557/23347]
 drivers/thermal/intel_powerclamp.o: warning: objtool: missing symbol for
 section .text.unlikely
Message-ID: <202407230549.TmLejsNZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8d2f09e210f079f53eb6c1ba1ef639d73a17d61b
commit: 775947c125d5bd6e00e0dcf9d12c57fd5d44d07f [8557/23347] asm-generic: fix -Wtype-limits compiler warnings
config: x86_64-buildonly-randconfig-002-20240723 (https://download.01.org/0day-ci/archive/20240723/202407230549.TmLejsNZ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230549.TmLejsNZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407230549.TmLejsNZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/intel_powerclamp.o: warning: objtool: missing symbol for section .text.unlikely
--
>> net/ipv6/icmp.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
