Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178CA1272AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706634429; cv=none; b=FguFyNeqUb7vsrnOfjberUPPI7nUeRIfWBUT/5AMIr5xy3CoZpSxI07BtmIGAN6VfKJbkNdea3FdMxt+Lr0WI0eoLWWl5bDwyzxib49BL+yUffsNI8+bu92vE+Cbe6vgqYzON2NUK/1TWNM0hExo76oSFgTiCyEWFXcUsq3GFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706634429; c=relaxed/simple;
	bh=tOTHQZwTtqJBifSl2n2c199BE2VYM5eEXSndxpdtKjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RVj3YktnYOVoyphgSwZYvu2dwiF3rr9jaffFaIt0KycV1AemRWOF1a7m7rVeAukkoit4aWxo8bkyXEP8LZ4XmOnpEmA48pTmq33yYXLB/WgucM4sxDpV0bIOhVDk/PmsJZQOp+fB7OA8rDMjJ8SenzFBr7LskZD5i2Q/UKl+bik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEovrWum; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEovrWum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706634427; x=1738170427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tOTHQZwTtqJBifSl2n2c199BE2VYM5eEXSndxpdtKjM=;
  b=TEovrWumqfbBOQkJxA8Gj+ouX8f1cNgc9WcQ1n8W9EcEZGp7whnSqQs0
   Tx+G+K3p66NKQmOkrz/LMBMuy2fKZ1eyBj5BD/eqKuTJ8Z/VcOPpG4IKl
   6Sxzjin/QajLKmweOU54MQC/+0fjDjLOhEVL6aFbpr0997YZ7JKUrRYby
   93SXBD7Eg2UabrlwjxInWZ9NNidG8Qp4acGzLKL3HZizwhFOBTA4j+i5B
   JotlJbr/pjjlQw6ca0lWXj0H2e/wd5I8PBVG20x/pizdwHFo8B3fn2s38
   QHjswk78rKKJbiWeIB0cMeUf9rQV9AGe6QXaepf60unMFjIM+49/AoXoA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10009538"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10009538"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 09:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3750193"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jan 2024 09:07:04 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUrZd-0000bU-2P;
	Tue, 30 Jan 2024 17:07:01 +0000
Date: Wed, 31 Jan 2024 01:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [palmer:fixes 1/1] arch/riscv/mm/tlbflush.c:207:6: error:
 redefinition of 'local_flush_tlb_kernel_range'
Message-ID: <202401310055.wBrlZfRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git fixes
head:   eb70c97995147c7febb0f3ad67ca6210d19f5724
commit: eb70c97995147c7febb0f3ad67ca6210d19f5724 [1/1] riscv: mm: execute local TLB flush after populating vmemmap
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240131/202401310055.wBrlZfRE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310055.wBrlZfRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310055.wBrlZfRE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/mm/tlbflush.c:207:6: error: redefinition of 'local_flush_tlb_kernel_range'
     207 | void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/mm/tlbflush.c:69:6: note: previous definition of 'local_flush_tlb_kernel_range' with type 'void(long unsigned int,  long unsigned int)'
      69 | void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/local_flush_tlb_kernel_range +207 arch/riscv/mm/tlbflush.c

   205	
   206	/* Flush a range of kernel pages without broadcasting */
 > 207	void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
   208	{
   209		local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
