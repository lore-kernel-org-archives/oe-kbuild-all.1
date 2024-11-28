Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B171136349
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732776667; cv=none; b=j3X8NnUIhMz7G54O0twcbpcFAPC3oTPlTYNsLfkTilN0EnWdPr5MaaeUj3mGgrtCVUjPX/ajF4Z2MdzBoE/0st8SNtoQmYqorhsxCNhhq0D5+PPbMy8GBnv9bTdzlSBxUsavYfjgT2QCnTJVSNgo5AHJpgaXgI9C8dZ0J2urFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732776667; c=relaxed/simple;
	bh=kBlMce0bfqtYpIdDAQQjtdcB2Zfpwh/LxArvqKWW+uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9a2JC4d2seJ74xFCJbllyD0S7lUWw3vOd2tha9Fp6jSNecKJM3lvanZp7o46Xp2AtrwNuKUAjqYcnX63UrLbN6/wGPJZYXQbXGIWIPtOHA/JPpfpdbBVH6XP6vJRZeklTwn9ErW4oFGHf+6+PmsMQXqmvXqDwjtwp5hgdebZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyCG/+se; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyCG/+se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732776665; x=1764312665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBlMce0bfqtYpIdDAQQjtdcB2Zfpwh/LxArvqKWW+uw=;
  b=GyCG/+seFnVh5s2AMzh4Mt0LPLUKkpv0ZRzyqNEOzPE8hI6p4U6le81C
   DqVrlk6jTM4gal6VjnsChRkbrHL9cdUVFm9km0BQKlE1mGT8L+5UpJe5Z
   ld4LYIXgX1gjmtLHC9Qvn9hUsGXpXAMqjvxkttWHkmiOK+6tvgPfUiCVJ
   WW7Nlxx8YCcvwEW8C1aZUaIeFiCzPT7FinfpNzc4e2kJPlaoc5Y3576LI
   14+7QAMMt1syWUoAn/IpX8EqnudgKO2elActm2y0gvWf+RbxEvXHH0tCA
   DiFyyVGrrrNdxX0/bXzInyMLNo8Va4kPHsCrnNCiYlzLRV2smOwOHzpkM
   w==;
X-CSE-ConnectionGUID: solpY9cdQl20v0BBhJA3+g==
X-CSE-MsgGUID: Z9YsZq8NTDuMBkgVKc6mIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="20590429"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="20590429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 22:51:04 -0800
X-CSE-ConnectionGUID: 6c3m7rgBTsC017oXcQiHbg==
X-CSE-MsgGUID: Qv7Ymy3aTym/ZFMQRrVe+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="97111215"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2024 22:51:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGYMe-0009Cg-2N;
	Thu, 28 Nov 2024 06:51:00 +0000
Date: Thu, 28 Nov 2024 14:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-loongarch 2/4] arch/loongarch/kernel/syscall.o:
 warning: objtool: do_syscall+0x11c: return with modified stack frame
Message-ID: <202411281409.q5OUQLx0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-loongarch
head:   719e621826002a47d82ee36f9f436e9126b65980
commit: 608b37bdda2a1bb6ea171f9711d0aabaf953bc2e [2/4] objtool/loongarch: Simplify frame pointer detection
config: loongarch-loongson3_defconfig (https://download.01.org/0day-ci/archive/20241128/202411281409.q5OUQLx0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281409.q5OUQLx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281409.q5OUQLx0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/syscall.o: warning: objtool: do_syscall+0x11c: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
