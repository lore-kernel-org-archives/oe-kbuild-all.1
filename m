Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A6A14A62A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407101; cv=none; b=eT5g6i2JGku5r4TXY6oB3CaoAEOh6lq4pb0XqUWAfuIJG+gkp8670snKljbtoukRp7JaRmt5aiIFLZ/T9ZNcmME8uQgamtT68eObmKAUcIDduYttAi6txevuXBfPF73LNNrD+9NFiPxBSgWB6mEZB8I1t6FURe69K+4NnGUvlBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407101; c=relaxed/simple;
	bh=UMLz8w+eT2PbXxNS+lLRt4zBr8dMwAeB96ANlU8pwgc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0ejC/jfgegg8Y90eKaeBB3uxBiZp7fmXlQYiLsWMV8Dgtgz4NtuykBWDmyXtdvPv7LMaJwXH4sKoLyDV4VJ7zUTuaxS1CvufVp5VN9zxfBdJcjlQdPmGGiQY4Obhn58a0sIAlowtZNMv9zObt9Jv7dML8nWDmKnME6JXdUN3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqVfPog4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqVfPog4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740407100; x=1771943100;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UMLz8w+eT2PbXxNS+lLRt4zBr8dMwAeB96ANlU8pwgc=;
  b=hqVfPog4mWngcQMPaxve2nGQf0/k7Ix1Xm79QsSrNDsrIJdGPtc6gnHL
   qH/fQIh/9YXqY6G7tEbLVnijI6NjiKtpfI9tzTTgbz5PjU1jIRiMdaDOP
   U0lXu8WwXvklcRM+iWQq/FCG4kr5maA0eav9XAzSAf9RezJc0qvLyLEy9
   vPTKvaB95QfDADbQv/Quo6xcPTUTblSMlqy5TLRtKwruxYEtI99+Calmy
   xu/byTPDg5xIRFvypD+6KcPrRylH2UEyZ3ROleCwL5lzcG91QxAMaLWZG
   9gTTr6pzW/eyiLsJ5mKSE+FCLmHIS1o4yVkVTvNc7NIO997pjzMY+IvBE
   g==;
X-CSE-ConnectionGUID: KUqVnM64TMa1vtEOcs0/bA==
X-CSE-MsgGUID: WXVa588GR/WpH/V+tuohwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44816174"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="44816174"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 06:24:47 -0800
X-CSE-ConnectionGUID: XPMUhS4kR9Cd/ikAvVAJGA==
X-CSE-MsgGUID: BucjZozHRyC6H0HaPCLuhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153273719"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2025 06:24:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmZO0-0008SX-0N
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 14:24:44 +0000
Date: Mon, 24 Feb 2025 22:24:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] arch/powerpc/lib/sstep.c:245:1: warning:
 'inline' is not at beginning of declaration
Message-ID: <202502242225.SPcLAffN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: e0a0986b446553c6a69fe1bb36250224646b264f [1/1] powerpc: Make load/store emulation use larger memory accesses
config: powerpc-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250224/202502242225.SPcLAffN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242225.SPcLAffN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502242225.SPcLAffN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/lib/sstep.c:245:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    static int nokprobe_inline copy_mem_in(u8 *dest, unsigned long ea, int nb)
    ^~~~~~
   arch/powerpc/lib/sstep.c:344:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    static int nokprobe_inline copy_mem_out(u8 *dest, unsigned long ea, int nb)
    ^~~~~~


vim +/inline +245 arch/powerpc/lib/sstep.c

   240	
   241	/*
   242	 * Copy from userspace to a buffer, using the largest possible
   243	 * aligned accesses, up to sizeof(long).
   244	 */
 > 245	static int nokprobe_inline copy_mem_in(u8 *dest, unsigned long ea, int nb)
   246	{
   247		int err = 0;
   248		int c;
   249	
   250		for (; nb > 0; nb -= c) {
   251			c = max_align(ea);
   252			if (c > nb)
   253				c = max_align(nb);
   254			switch (c) {
   255			case 1:
   256				err = __get_user(*dest, (unsigned char __user *) ea);
   257				break;
   258			case 2:
   259				err = __get_user(*(u16 *)dest,
   260						 (unsigned short __user *) ea);
   261				break;
   262			case 4:
   263				err = __get_user(*(u32 *)dest,
   264						 (unsigned int __user *) ea);
   265				break;
   266	#ifdef __powerpc64__
   267			case 8:
   268				err = __get_user(*(unsigned long *)dest,
   269						 (unsigned long __user *) ea);
   270				break;
   271	#endif
   272			}
   273			if (err)
   274				return err;
   275			dest += c;
   276			ea += c;
   277		}
   278		return 0;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
