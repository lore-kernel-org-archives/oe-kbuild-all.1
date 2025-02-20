Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE58F7D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 06:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740033056; cv=none; b=TQbMif48+vNtM5a2hAhcaeNHlE7Z/CRnK39M8aaL1ariVDHItIpNkXuKQ33wYfZoFqaJz1jqN1v1um1e4XBukBvA2NAhKgypJP3OCI5x7XGvo/clSkj29XdRztJelJySv3tvfggXwQkcL6tWRUPbi5fAVq2FcQjHIRAHR/9/D/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740033056; c=relaxed/simple;
	bh=S5CUxeZpcWEYIAUUVZ0+g64oDmWilgCokA4bYfqduZc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXZpMhr3HeJ5DiHwlHBwu84ctXLtdREZH9RGWd38SpaPGQlFxWdt8sEQXw2jPFkGPtiG8Z0yVdfZZY2xe06zrM9rItPbMt1oetNksTJT+PQhy4OtvQVgBjiq6zYRl9TDyMU73ePotfUfLTkFBJIZgDP4X0OE3cjgzdea7h3jx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gws58L1y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gws58L1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740033055; x=1771569055;
  h=date:from:cc:subject:message-id:mime-version;
  bh=S5CUxeZpcWEYIAUUVZ0+g64oDmWilgCokA4bYfqduZc=;
  b=gws58L1yWdbdfY6x7ilu7/eFi8zJW5YhZC3w1ZiwSqzO941+muRugcav
   NKANlDkwjJxDo3lVUzkiSYzgvcdsCvda46OlFqvldC8ZsYg4X5lSXJPs1
   scXeA7432z5YRnfM7wCxv8cUGEVlUDf8jislzgaO6v1WUlc0Ja/2RSB6m
   4jb8GM06G6ToZFpNHGnAP1tQM1Wp/tIMReusIYkuje+4G/GKUlerRM0hZ
   Arf8h7ouET0nOBPVffhZtVexaw4BM2D20ZygwR0rdT7hsiuh1z8G4qajb
   wK2tlktlzd/YgpZS28tYUzvByS20tks4kmthY1rn7ZxMX16yoYR9RyScX
   A==;
X-CSE-ConnectionGUID: 2RUSUQx6SSaQ2Ye5BE5vew==
X-CSE-MsgGUID: n6DJROKGRg6L1cAjWO+Y3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="58205792"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="58205792"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 22:30:54 -0800
X-CSE-ConnectionGUID: t0YscbAORkylyhY2V8pBPw==
X-CSE-MsgGUID: Yvp0ciTIRpCRHKBaDGb/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115435008"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2025 22:30:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl03a-0003vl-1n
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Feb 2025 06:29:32 +0000
Date: Thu, 20 Feb 2025 14:25:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] net/ipv4/raw.c:829: Error: unrecognized opcode
 `csrs sstatus,a1', extension `zicsr' required
Message-ID: <202502201409.JN33jGES-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: d18ebc274ca78f61094fba39ec9f206d46be5a85 [1/1] riscv: support trap-based WARN()
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20250220/202502201409.JN33jGES-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201409.JN33jGES-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201409.JN33jGES-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/raw.c: Assembler messages:
   net/ipv4/raw.c:921: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/ipv4/raw.c:921: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   net/ipv4/raw.c:910: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/ipv4/raw.c:910: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
>> net/ipv4/raw.c:829: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
>> net/ipv4/raw.c:829: Error: unrecognized opcode `csrc sstatus,a1', extension `zicsr' required
   net/ipv4/raw.c:837: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/ipv4/raw.c:837: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required


vim +829 net/ipv4/raw.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  824  
^1da177e4c3f41 Linus Torvalds 2005-04-16  825  static int raw_geticmpfilter(struct sock *sk, char __user *optval, int __user *optlen)
^1da177e4c3f41 Linus Torvalds 2005-04-16  826  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  827  	int len, ret = -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  828  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @829  	if (get_user(len, optlen))
^1da177e4c3f41 Linus Torvalds 2005-04-16  830  		goto out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  831  	ret = -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  832  	if (len < 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  833  		goto out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  834  	if (len > sizeof(struct icmp_filter))
^1da177e4c3f41 Linus Torvalds 2005-04-16  835  		len = sizeof(struct icmp_filter);
^1da177e4c3f41 Linus Torvalds 2005-04-16  836  	ret = -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  837  	if (put_user(len, optlen) ||
^1da177e4c3f41 Linus Torvalds 2005-04-16  838  	    copy_to_user(optval, &raw_sk(sk)->filter, len))
^1da177e4c3f41 Linus Torvalds 2005-04-16  839  		goto out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  840  	ret = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  841  out:	return ret;
^1da177e4c3f41 Linus Torvalds 2005-04-16  842  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  843  

:::::: The code at line 829 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
