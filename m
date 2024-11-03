Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67F189BA0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730672876; cv=none; b=mj1kzh/ZJQ1jeEryuSksfebg428KbqJztNsdZzr3kiHUkUnYK4q/RS4Hop4DimyeI1GbdqZRkVs0z5LmFg3e0EX3eGfeKt9ze4WV6AVGqf+tMh3eHjVHgz0ITmG3ghelQBxmVT9fF8CeXYOXcNMWdyf+YCwPzxYofDof+9rPCcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730672876; c=relaxed/simple;
	bh=hAu6KLIO/0CJlhUu6byRae21OeDhwBEhQIGxjoevmhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s2XA5EPaM4cuVd7WKaA1MOYhBcMElT+tkpOXoBotxYUcWcQ3yh455MjZT/VmxPbLoBoFiYL7D6/irrvhlhGqLKaRs2LVYZcqQbjWo9t1UUzbv/7VGsBb5BDeK2KkPn9LLdFQh8Q0Myu4th49ctePBWGQpZpIY0Q99P5vVeaimfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNRyKJSO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNRyKJSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730672874; x=1762208874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hAu6KLIO/0CJlhUu6byRae21OeDhwBEhQIGxjoevmhY=;
  b=KNRyKJSOitFC3yEj/mKE97oM8LzyPdHJ21vPemb53mHNZOQlMaXvnp+c
   eynIX29WHzd6gIoVeHeTCOa5z+mjmAqW9YmzX4gdu6F2+UdFftUCEooLW
   XBZ57BsK6tRwVpbqF6sb2xij5In7WYcD7Fa0ObY3LNxoYV0ZvnMawU6vt
   XVNZfRSBFiGvIqLqPdbRoW7Zq71OD78ykLo/FtLpm3H9l7HtY4IPd7034
   UBCajiKojsJxTCQ9O4tfSTv+sDKut/19A58eL43n6+Zg9zxdfW1eFyxkt
   itFTUpML6nUKkxpa1zAPLbdCfM8rcpC0CSS38lplPO3e6hpyag1tKBEHq
   A==;
X-CSE-ConnectionGUID: bROajHPPQ/uy9TwkM/f1Rw==
X-CSE-MsgGUID: JQYFuA6XQG63SeOX8Lbdaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30539957"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30539957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 14:27:53 -0800
X-CSE-ConnectionGUID: TT6vaHfjToyI6pySlujVpA==
X-CSE-MsgGUID: XtyszMkHSU2T1hAGOXg4hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="88299082"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Nov 2024 14:27:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7j4Y-000kFx-10;
	Sun, 03 Nov 2024 22:27:50 +0000
Date: Mon, 4 Nov 2024 06:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Richard Weinberger <richard@nod.at>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1223/1223] fs/ubifs/lpt_commit.o:
 warning: objtool: missing symbol for section .text.unlikely
Message-ID: <202411040610.HRP3j0oX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: 2e52eb74463f15c745d64948cedfaee722d6268c [1223/1223] ubifs: Rework ubifs_assert()
config: x86_64-buildonly-randconfig-006-20241027 (https://download.01.org/0day-ci/archive/20241104/202411040610.HRP3j0oX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040610.HRP3j0oX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040610.HRP3j0oX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/lpt_commit.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
