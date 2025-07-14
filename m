Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08997257AF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504805; cv=none; b=aV57q/NRH7n1hQS46fiVFm6LaIsr916e1V2RmxujasD9ilturerIbvbhPQJrtjOb/tGOMjqI2yr+HraAX5YynvpbBCcaH29xA1EvzbQTIOarrIORRNcmEj/TQ44he+WDim0KE1iRVtm+q1DXdnZ0o7Xp7PB/iYYBNginu9dJJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504805; c=relaxed/simple;
	bh=FUSEldgjRKxrtwmVnbDWvOpVW1uGD9C6/BCr7aGjWZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbdGm6rLbiIEWeq4T5srXxO9jRMN/lKeJupicNRe2rrdXqcS3B21kzj0WVdqrpYyXslkiBbuGP+ZCTeEjPePotmFZyRkRg2sEp4e4IufTZv3RRBotowQLozcV5mmphMrDddNYfLwroG/+RQDME7eOOUgjYT3+HmrQlDa64UZ6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLzPrUFm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLzPrUFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752504802; x=1784040802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUSEldgjRKxrtwmVnbDWvOpVW1uGD9C6/BCr7aGjWZk=;
  b=kLzPrUFmYhFnaej//lZGcxKExd4Z/owmWQ2OktAnA6WgRnr8fdGUl62p
   Rz/RyfAehyEkoscRRvP33x1yk+hrvQZQwY7CEQgjrVjbpkXopfeGoV7g8
   FCEItJSum4W5PHCv4kuf6k2zIIgO4ON4x1k/9T55EnQhe/qiGAnT7FKY0
   p4WNXmC2HLWCC8shYsa94AF+V6mmpO0Lw7f99q8aeEX0J96C6bkZ6ItEr
   6t8nAf7n7KKmHAtfhjv9D7P5oF+J7LAUwoB8dQVgIGDM91URng4G5KgRl
   KZw8dBHnH7mve2Q6RrwlsW2WkKgCoTvYVuJS5Koxbq8Pz1cIJOb6ovN6x
   A==;
X-CSE-ConnectionGUID: 13owdtwgSySqWP6T5g5Bhw==
X-CSE-MsgGUID: HI2a00yVT6qz6ZjkdespnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65399616"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="65399616"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 07:53:21 -0700
X-CSE-ConnectionGUID: WaNC1ftcQ66UXi6rlA/fbA==
X-CSE-MsgGUID: g2uyV+N8SF2l9IZtCZyp6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="156750456"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jul 2025 07:53:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubKYP-000918-26;
	Mon, 14 Jul 2025 14:53:17 +0000
Date: Mon, 14 Jul 2025 22:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arc/include/asm/io.h:139: Error: inappropriate arguments for
 opcode 'stw'
Message-ID: <202507142219.ROyOoLsc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Serge,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: f6bb3e9d98c2e8d70587d5ddaf9426ef30d7865c net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
date:   1 year ago
config: arc-axs103_smp_defconfig (https://download.01.org/0day-ci/archive/20250714/202507142219.ROyOoLsc-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142219.ROyOoLsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142219.ROyOoLsc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arc/include/asm/io.h: Assembler messages:
>> arch/arc/include/asm/io.h:139: Error: inappropriate arguments for opcode 'stw'
>> arch/arc/include/asm/io.h:139: Error: inappropriate arguments for opcode 'stw'
>> arch/arc/include/asm/io.h:139: Error: inappropriate arguments for opcode 'stw'


vim +/stw +139 arch/arc/include/asm/io.h

1162b0701b14ba Vineet Gupta 2013-01-18  135  
1162b0701b14ba Vineet Gupta 2013-01-18  136  #define __raw_writew __raw_writew
1162b0701b14ba Vineet Gupta 2013-01-18  137  static inline void __raw_writew(u16 s, volatile void __iomem *addr)
1162b0701b14ba Vineet Gupta 2013-01-18  138  {
1162b0701b14ba Vineet Gupta 2013-01-18 @139  	__asm__ __volatile__(
1162b0701b14ba Vineet Gupta 2013-01-18  140  	"	stw%U1 %0, %1	\n"
1162b0701b14ba Vineet Gupta 2013-01-18  141  	:
1162b0701b14ba Vineet Gupta 2013-01-18  142  	: "r" (s), "m" (*(volatile u16 __force *)addr)
1162b0701b14ba Vineet Gupta 2013-01-18  143  	: "memory");
1162b0701b14ba Vineet Gupta 2013-01-18  144  

:::::: The code at line 139 was first introduced by commit
:::::: 1162b0701b14ba112d4e3fe5c27c694caf983539 ARC: I/O and DMA Mappings

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
