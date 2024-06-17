Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2941EC2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 01:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718587644; cv=none; b=LbCfhg7BFwuy26gINIL2Y/vLAffXBo3NVvB9Y6MhVLHI/wbph2HQ+I5IzW5N6fLZQvaLx1GMTNLofSJA13jM+XwvNkhMhrHiFji6lzEOG0I4Ed4yPHrm/WMHj7Ns52FqP6ygv9TZcC4c9cO+SfveSON9rJaSMGQuTM8aZEPzpZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718587644; c=relaxed/simple;
	bh=LrXuJLEfRxg5esabaA6yjKO0hRRImkBLHfYnuoYucNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tHd3pBKrMF0HUpNE4YwCnNRisQWhh9d2/kEdGel5+Lsxdnet/Asiu3aMeDYC18H+svahMWcPnrZ+3KNxPa3P6wJYFOFZbGCSwg2zEMtVQ6M987LUJsPqgKQ8qs1O3s1R05rWGnN1JCCBKgaNwk5k0HkvkgNb+oGIEAkEc9uv3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8GXakVW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8GXakVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718587642; x=1750123642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrXuJLEfRxg5esabaA6yjKO0hRRImkBLHfYnuoYucNY=;
  b=O8GXakVWcCxir8xu6bHJLhk4qsUbLeoJR0ESHDbHwNuZvqOLOZmkbRjv
   9VWOBlggc5JW4F8D0vYZrVgokXGS76oH5Z4NoFNA0MKw0xPIrZugbOPec
   joADZAEq+7+Nf0uUe8lY3X4F3toMurH9Q0mZPV3lwN7MfiPZ3n5sfy97V
   MB7jSUx6Kh6IAcLTrOWQFzxZon5H/9Y8D11WBjPL6Wcgv3HI3lofn5frF
   HZB6SeNOoT/dU7JjEns/WFwR2p1+v1tKRU2275/uCG+paravT8hacCsPa
   /zkZfA9kQs38PR7Fv1HwwExC+wUKCsynqCVnpwyH/3qyEBnQDdNVE/UVN
   w==;
X-CSE-ConnectionGUID: ylgjkcUQRa+IGogSmINewA==
X-CSE-MsgGUID: Q4SHObwTStmJ/U11oGsnAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26823461"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26823461"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 18:27:22 -0700
X-CSE-ConnectionGUID: o28hvfRXR8CJv4YlakT+9Q==
X-CSE-MsgGUID: NLyvh/lHQ8C8Lc3bzOKuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41526895"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jun 2024 18:27:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ19S-0003bx-0M;
	Mon, 17 Jun 2024 01:27:18 +0000
Date: Mon, 17 Jun 2024 09:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 10/10] include/linux/ktime.h:97:undefined reference
 to `__cmpxchg_called_with_bad_pointer'
Message-ID: <202406170902.SWu5FPNp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   e065024d98fb20ab5427053b3829c6a819534922
commit: e065024d98fb20ab5427053b3829c6a819534922 [10/10] fs: add percpu counters to count fine vs. coarse timestamps
config: sh-polaris_defconfig (https://download.01.org/0day-ci/archive/20240617/202406170902.SWu5FPNp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170902.SWu5FPNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170902.SWu5FPNp-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/inode.o: in function `ktime_compare':
>> include/linux/ktime.h:97:(.text+0x1244): undefined reference to `__cmpxchg_called_with_bad_pointer'


vim +97 include/linux/ktime.h

97fc79f97b1111 Thomas Gleixner 2006-01-09   82  
398f382c0a5bd6 Daniel Borkmann 2012-10-28   83  /**
398f382c0a5bd6 Daniel Borkmann 2012-10-28   84   * ktime_compare - Compares two ktime_t variables for less, greater or equal
398f382c0a5bd6 Daniel Borkmann 2012-10-28   85   * @cmp1:	comparable1
398f382c0a5bd6 Daniel Borkmann 2012-10-28   86   * @cmp2:	comparable2
398f382c0a5bd6 Daniel Borkmann 2012-10-28   87   *
36019265cf81cd Yacine Belkadi  2013-07-24   88   * Return: ...
398f382c0a5bd6 Daniel Borkmann 2012-10-28   89   *   cmp1  < cmp2: return <0
398f382c0a5bd6 Daniel Borkmann 2012-10-28   90   *   cmp1 == cmp2: return 0
398f382c0a5bd6 Daniel Borkmann 2012-10-28   91   *   cmp1  > cmp2: return >0
398f382c0a5bd6 Daniel Borkmann 2012-10-28   92   */
398f382c0a5bd6 Daniel Borkmann 2012-10-28   93  static inline int ktime_compare(const ktime_t cmp1, const ktime_t cmp2)
398f382c0a5bd6 Daniel Borkmann 2012-10-28   94  {
2456e855354415 Thomas Gleixner 2016-12-25   95  	if (cmp1 < cmp2)
398f382c0a5bd6 Daniel Borkmann 2012-10-28   96  		return -1;
2456e855354415 Thomas Gleixner 2016-12-25  @97  	if (cmp1 > cmp2)
398f382c0a5bd6 Daniel Borkmann 2012-10-28   98  		return 1;
398f382c0a5bd6 Daniel Borkmann 2012-10-28   99  	return 0;
398f382c0a5bd6 Daniel Borkmann 2012-10-28  100  }
398f382c0a5bd6 Daniel Borkmann 2012-10-28  101  

:::::: The code at line 97 was first introduced by commit
:::::: 2456e855354415bfaeb7badaa14e11b3e02c8466 ktime: Get rid of the union

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
