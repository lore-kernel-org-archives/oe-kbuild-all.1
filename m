Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39C2AE94
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728977980; cv=none; b=Y6EsSl1AVHVhMgpahcvpTSVVhk00EgJk5erRWZq6rZVeXTOo5jp1s5jaSR0ZSFAUTI5UE0LET5vwAOxazK3ba9035Bp/o1SaWbLgfifxrHbc+Ny0yLr9/6dvwCKp1K5vO19s01oqDYwvGjtwmMjdYAzyI7XIavUo+vL77eKJqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728977980; c=relaxed/simple;
	bh=gV7SPWINPZb+zCqpaYtLVn1YRVJessWM66kyxq8qwEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WM6pbQtn/+7wllu3UDWfw54wlel0AqPPcJPP+yyYwx1c5wMYpxjar13kEfRv56q248ILpB227gYI6AsDK3aEmeOYv38PS31DTSjpeUFWkXYFj+Sz7oTqWNk/MOBWayiFkTzF1tm3rudfGRL6RLnQlr5UQ/Tn/mx1eKnc9vg3VWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebnxi308; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebnxi308"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728977978; x=1760513978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gV7SPWINPZb+zCqpaYtLVn1YRVJessWM66kyxq8qwEg=;
  b=ebnxi3085ERcBylWO86QPere2lyfzn9Fep5YgH/+AJzW+BF+ZiVl2Ti2
   0oNMkVyEEEv2o61HR5DvX4IS677WoyOr451zVKgGUmkbMtf58bdNEqeqw
   MEdRkyZprQO+KzNQjm17ZiZfDNSyA/nRKuHNZ1oMCL/aAf0qZf7O6akR2
   f2+uPf2Qqi3VuKkmJXqSuAo5ebgQ7XRqKenYG1xUikzzJluzGd1IrGSF7
   ORDauN51p7BCkEU3w6yNDrflLUeRzfaIazZgj7Jsl/aj/HZhe29BxUa2c
   iEkSpfCznUl1gDy09EHDMu9eNQwz6t0yMpGR6Zjv/UrDBf98xbqzeZnlv
   A==;
X-CSE-ConnectionGUID: Oa8Thb1/TKqjyx3o9e+Heg==
X-CSE-MsgGUID: 36yIT1emSY2i+zsXdZchqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="38929539"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="38929539"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 00:39:37 -0700
X-CSE-ConnectionGUID: /oNbIZaXTUWz6l1LqEVWzw==
X-CSE-MsgGUID: UJNYtGH5RxC34jzo3qM/NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="81787050"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2024 00:39:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0c9W-000Hlz-0v;
	Tue, 15 Oct 2024 07:39:34 +0000
Date: Tue, 15 Oct 2024 15:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-mapping-includes 1/1]
 arch/powerpc/platforms/pseries/svm.c:40:5: warning: no previous prototype
 for 'set_memory_encrypted'
Message-ID: <202410151554.3tx9sqTg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-mapping-includes
head:   25ad82fc5f00839074ac2f433dd151b6d80f75bd
commit: 25ad82fc5f00839074ac2f433dd151b6d80f75bd [1/1] dma-mapping.h: drop unneeded includes
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20241015/202410151554.3tx9sqTg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151554.3tx9sqTg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151554.3tx9sqTg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/svm.c:40:5: warning: no previous prototype for 'set_memory_encrypted' [-Wmissing-prototypes]
      40 | int set_memory_encrypted(unsigned long addr, int numpages)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/pseries/svm.c:53:5: warning: no previous prototype for 'set_memory_decrypted' [-Wmissing-prototypes]
      53 | int set_memory_decrypted(unsigned long addr, int numpages)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/set_memory_encrypted +40 arch/powerpc/platforms/pseries/svm.c

2efbc58f157a39 Anshuman Khandual 2019-08-19  39  
2efbc58f157a39 Anshuman Khandual 2019-08-19 @40  int set_memory_encrypted(unsigned long addr, int numpages)
2efbc58f157a39 Anshuman Khandual 2019-08-19  41  {
e9d1d2bb75b2d5 Tom Lendacky      2021-09-08  42  	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
a449ffaf9181b5 Will Deacon       2021-07-30  43  		return 0;
a449ffaf9181b5 Will Deacon       2021-07-30  44  
2efbc58f157a39 Anshuman Khandual 2019-08-19  45  	if (!PAGE_ALIGNED(addr))
2efbc58f157a39 Anshuman Khandual 2019-08-19  46  		return -EINVAL;
2efbc58f157a39 Anshuman Khandual 2019-08-19  47  
2efbc58f157a39 Anshuman Khandual 2019-08-19  48  	uv_unshare_page(PHYS_PFN(__pa(addr)), numpages);
2efbc58f157a39 Anshuman Khandual 2019-08-19  49  
2efbc58f157a39 Anshuman Khandual 2019-08-19  50  	return 0;
2efbc58f157a39 Anshuman Khandual 2019-08-19  51  }
2efbc58f157a39 Anshuman Khandual 2019-08-19  52  
2efbc58f157a39 Anshuman Khandual 2019-08-19 @53  int set_memory_decrypted(unsigned long addr, int numpages)
2efbc58f157a39 Anshuman Khandual 2019-08-19  54  {
e9d1d2bb75b2d5 Tom Lendacky      2021-09-08  55  	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
a449ffaf9181b5 Will Deacon       2021-07-30  56  		return 0;
a449ffaf9181b5 Will Deacon       2021-07-30  57  
2efbc58f157a39 Anshuman Khandual 2019-08-19  58  	if (!PAGE_ALIGNED(addr))
2efbc58f157a39 Anshuman Khandual 2019-08-19  59  		return -EINVAL;
2efbc58f157a39 Anshuman Khandual 2019-08-19  60  
2efbc58f157a39 Anshuman Khandual 2019-08-19  61  	uv_share_page(PHYS_PFN(__pa(addr)), numpages);
2efbc58f157a39 Anshuman Khandual 2019-08-19  62  
2efbc58f157a39 Anshuman Khandual 2019-08-19  63  	return 0;
2efbc58f157a39 Anshuman Khandual 2019-08-19  64  }
2efbc58f157a39 Anshuman Khandual 2019-08-19  65  

:::::: The code at line 40 was first introduced by commit
:::::: 2efbc58f157a39ad9e9199b92d9c47736023a2fe powerpc/pseries/svm: Force SWIOTLB for secure guests

:::::: TO: Anshuman Khandual <khandual@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
