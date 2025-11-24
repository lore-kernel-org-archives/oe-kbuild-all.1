Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D672F747D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 23:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764027832; cv=none; b=Ef5BJmMOT8FBcIgYhADlVi/pRmWMfcPcw8Phw/yTHvik3bhRLaf0LaJE1oZQyxSTS3eRePGkldrj1NJw/kXWtgaygDloY0F7RtNw+2ZM7ypZlj2lbxhUhHFmN4hy5FSFxcM20EepXI6vjI/eMzJqTlG4fccyfrZSTtODFaj05zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764027832; c=relaxed/simple;
	bh=YrWfnZe2MPZnWLoIh8rERcUnyO9mqwiEoI+7VQUvgaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EXC6gccvL9VrOb/mlgHLveJTDxi2U/SQ1nbXoCOzkFjSVcGbnZyVBKgG458+PX89bzcJV/HCDX7g2yjnro9ik3g29hyHcxh3b8ubQVnP6XxVJYy3XeJVtJ/VfZwTpkPsUfb7pHrVzOrLXIDNONh0I8fKIHCH0TIpPAaR0zr4r8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SThSYGrv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SThSYGrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764027831; x=1795563831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YrWfnZe2MPZnWLoIh8rERcUnyO9mqwiEoI+7VQUvgaI=;
  b=SThSYGrvUabsAhUacsbCi82sHJ6+pNEwrby0/0pxSWTf6r/AKcRK1OOh
   Hp36DA0azEweaZwJimqRnD7ApJW0gZcOYbWzG3WDXhpTdeLbBe8VzGnwS
   rbvVvvDOqbMzqFM9X2GtyOSh6dfmeHPMg6+lcS+faFKfvujWCcZCV8lWi
   c9662z6pfUmIwbTvao7rJBIIAMWU/r3k3gLwsWh6MAKzmdjCDXL7WbXNJ
   4mYqrCYx61jALc270MH3yngk7Rl44oj8FFSCZtuniH+BpbiGqL/34zmFR
   lJlOC/OQuOiXcKgiVN50iHCtXWL/Uc7gN78KVJWLAY1NiwF1tV4LXLURJ
   w==;
X-CSE-ConnectionGUID: fdH3Sr7ISlOhNNH2U5lQ/g==
X-CSE-MsgGUID: ykyKz7UtQ6uexyt3SVBdUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83656674"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="83656674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 15:43:50 -0800
X-CSE-ConnectionGUID: /oW5RhYbRj6XpepS+d2rUQ==
X-CSE-MsgGUID: 6mxuaXEQSby26DxFhDeiZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192365847"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2025 15:43:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNgDf-000000001DB-3xiU;
	Mon, 24 Nov 2025 23:43:43 +0000
Date: Tue, 25 Nov 2025 07:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/feat_xnx 58/69]
 arch/arm64/kvm/at.c:1661:22: error: expected string literal before
 '__LSE_PREAMBLE'
Message-ID: <202511250700.kAutzJFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/feat_xnx
head:   b11e3a28eae505407614e967167e0ffb62262ef0
commit: cdb7d03d475199ccc94a87254a91566c05038446 [58/69] KVM: arm64: Add helper for swapping guest descriptor
config: arm64-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511250700.kAutzJFm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250700.kAutzJFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250700.kAutzJFm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/at.c: In function '__lse_swap_desc':
>> arch/arm64/kvm/at.c:1661:22: error: expected string literal before '__LSE_PREAMBLE'
    1661 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~


vim +/__LSE_PREAMBLE +1661 arch/arm64/kvm/at.c

  1653	
  1654	static int __lse_swap_desc(u64 __user *ptep, u64 old, u64 new)
  1655	{
  1656		u64 tmp = old;
  1657		int ret = 0;
  1658	
  1659		uaccess_enable_privileged();
  1660	
> 1661		asm volatile(__LSE_PREAMBLE
  1662			     "1: cas	%[old], %[new], %[addr]\n"
  1663			     "2:\n"
  1664			     _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w[ret])
  1665			     : [old] "+r" (old), [addr] "+Q" (*ptep), [ret] "+r" (ret)
  1666			     : [new] "r" (new)
  1667			     : "memory");
  1668	
  1669		uaccess_disable_privileged();
  1670	
  1671		if (ret)
  1672			return ret;
  1673		if (tmp != old)
  1674			return -EAGAIN;
  1675	
  1676		return ret;
  1677	}
  1678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
