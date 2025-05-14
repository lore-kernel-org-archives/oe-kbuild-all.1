Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4381805B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 01:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747184791; cv=none; b=ntaW7ZUn6j7WL4UbOTpYLws9GaC2TCdtK4lp75ewnhw199Me+q0hf2Cdlbut3CS27kUgGVXW3U1Lhj+vRsJ6Z31F1BL50TImhMn19E7JSXY7gHhWHzVGgku2GTv5NZPeMDEIhaYDigtUVpcSa/sRz1yHxFH7cxyUlr+zySK5HG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747184791; c=relaxed/simple;
	bh=lsqExCccNrScSCbpqG6xp4yP3vOl0kY4547tX0MVGSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdM+UHow5sJ3z52IxzMwiGyDsuyLIdfV6/IDlq1+Lxcyfw29rkq/DYzbI0CjYx0KkCAbFkhRaY8AZGGjO2bJMwM6lYSAyLKwHuRl1GbfdUNhZW/JbuJ7mwASOB7jcLF9rYTnJJcjXeTPvVYHkQKNqAv+lOyGHEsxLsVkXwnJj4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhamXvHe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhamXvHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747184790; x=1778720790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lsqExCccNrScSCbpqG6xp4yP3vOl0kY4547tX0MVGSY=;
  b=AhamXvHeuksvaxa7a4bNk1Vhflfi6Ex9YNaDzDL72PbAJZoWA8afrHP2
   BAKyy71CqNscNWuGY9UsqcZgDTxWMFlvC3HpbqVtgTbpzKBlnZsZHUmAr
   jerafXAyBe6qxE3j7Me8m5QG/TgsvAiVl3JGRsVn229fS0qVrx/AC9iqh
   iiRSYINXnwEZGcAQoGqG8yaozaYyYabe5Nl2FWFi/14rYGcU4E6z8Fs8X
   zhRBRAFFawNSPm7sdTXuM2ZibXBoH+s3YS0tmTLVqoIJ+A0kbDM110UE1
   KChaBo9sreXgxk9yE69XwgxIHXB74btTr4mIJSE5VFd5i2juxxD3zgGkM
   w==;
X-CSE-ConnectionGUID: NwpN+R2mTneIYryfWuUaIg==
X-CSE-MsgGUID: NV1Y5ZdMT+au+XJm+13Snw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48170802"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48170802"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 18:06:27 -0700
X-CSE-ConnectionGUID: yPdlKkYwQgqc1ow4nJKDAw==
X-CSE-MsgGUID: ysVTzKOUQ3GXlPaYBK4mLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="138378167"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2025 18:06:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF0Zi-000GYb-2a;
	Wed, 14 May 2025 01:06:22 +0000
Date: Wed, 14 May 2025 09:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>
Subject: [akpm-mm:mm-new 320/331] arch/s390/kvm/gaccess.c:321:2: error:
 expected identifier
Message-ID: <202505140943.IgHDa9s7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   24e96425873f27730d30dcfc639a3995e312e6f2
commit: cd07d277e6acce78e103478ea19a452bcf31013e [320/331] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
config: s390-randconfig-r062-20250514 (https://download.01.org/0day-ci/archive/20250514/202505140943.IgHDa9s7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140943.IgHDa9s7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140943.IgHDa9s7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kvm/gaccess.c:321:2: error: expected identifier
     321 |         PROT_NONE,
         |         ^
   include/uapi/asm-generic/mman-common.h:16:19: note: expanded from macro 'PROT_NONE'
      16 | #define PROT_NONE       0x0             /* page can not be accessed */
         |                         ^
>> arch/s390/kvm/gaccess.c:344:8: error: duplicate case value: '0' and 'PROT_TYPE_LA' both equal '0'
     344 |                 case PROT_TYPE_LA:
         |                      ^
   arch/s390/kvm/gaccess.c:337:8: note: previous case defined here
     337 |                 case PROT_NONE:
         |                      ^
   include/uapi/asm-generic/mman-common.h:16:19: note: expanded from macro 'PROT_NONE'
      16 | #define PROT_NONE       0x0             /* page can not be accessed */
         |                         ^
   2 errors generated.


vim +321 arch/s390/kvm/gaccess.c

664b4973537068 Alexander Yarygin        2015-03-09  313  
d03193de30e6d9 David Hildenbrand        2016-05-31  314  enum prot_type {
d03193de30e6d9 David Hildenbrand        2016-05-31  315  	PROT_TYPE_LA   = 0,
d03193de30e6d9 David Hildenbrand        2016-05-31  316  	PROT_TYPE_KEYC = 1,
d03193de30e6d9 David Hildenbrand        2016-05-31  317  	PROT_TYPE_ALC  = 2,
d03193de30e6d9 David Hildenbrand        2016-05-31  318  	PROT_TYPE_DAT  = 3,
6ae1574c2a24ee Christian Borntraeger    2017-06-07  319  	PROT_TYPE_IEP  = 4,
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  320  	/* Dummy value for passing an initialized value when code != PGM_PROTECTION */
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25 @321  	PROT_NONE,
d03193de30e6d9 David Hildenbrand        2016-05-31  322  };
d03193de30e6d9 David Hildenbrand        2016-05-31  323  
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  324  static int trans_exc_ending(struct kvm_vcpu *vcpu, int code, unsigned long gva, u8 ar,
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  325  			    enum gacc_mode mode, enum prot_type prot, bool terminate)
d03193de30e6d9 David Hildenbrand        2016-05-31  326  {
d03193de30e6d9 David Hildenbrand        2016-05-31  327  	struct kvm_s390_pgm_info *pgm = &vcpu->arch.pgm;
44ae766353af6e Heiko Carstens           2023-10-12  328  	union teid *teid;
d03193de30e6d9 David Hildenbrand        2016-05-31  329  
d03193de30e6d9 David Hildenbrand        2016-05-31  330  	memset(pgm, 0, sizeof(*pgm));
d03193de30e6d9 David Hildenbrand        2016-05-31  331  	pgm->code = code;
44ae766353af6e Heiko Carstens           2023-10-12  332  	teid = (union teid *)&pgm->trans_exc_code;
d03193de30e6d9 David Hildenbrand        2016-05-31  333  
d03193de30e6d9 David Hildenbrand        2016-05-31  334  	switch (code) {
c14b88d76624e0 Janosch Frank            2016-07-29  335  	case PGM_PROTECTION:
c14b88d76624e0 Janosch Frank            2016-07-29  336  		switch (prot) {
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  337  		case PROT_NONE:
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  338  			/* We should never get here, acts like termination */
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  339  			WARN_ON_ONCE(1);
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  340  			break;
6ae1574c2a24ee Christian Borntraeger    2017-06-07  341  		case PROT_TYPE_IEP:
44ae766353af6e Heiko Carstens           2023-10-12  342  			teid->b61 = 1;
3b684a420bd8a2 Joe Perches              2020-03-10  343  			fallthrough;
a679c547d19ded Christian Borntraeger    2016-12-15 @344  		case PROT_TYPE_LA:
44ae766353af6e Heiko Carstens           2023-10-12  345  			teid->b56 = 1;
a679c547d19ded Christian Borntraeger    2016-12-15  346  			break;
a679c547d19ded Christian Borntraeger    2016-12-15  347  		case PROT_TYPE_KEYC:
44ae766353af6e Heiko Carstens           2023-10-12  348  			teid->b60 = 1;
a679c547d19ded Christian Borntraeger    2016-12-15  349  			break;
c14b88d76624e0 Janosch Frank            2016-07-29  350  		case PROT_TYPE_ALC:
44ae766353af6e Heiko Carstens           2023-10-12  351  			teid->b60 = 1;
3b684a420bd8a2 Joe Perches              2020-03-10  352  			fallthrough;
c14b88d76624e0 Janosch Frank            2016-07-29  353  		case PROT_TYPE_DAT:
44ae766353af6e Heiko Carstens           2023-10-12  354  			teid->b61 = 1;
c14b88d76624e0 Janosch Frank            2016-07-29  355  			break;
c14b88d76624e0 Janosch Frank            2016-07-29  356  		}
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  357  		if (terminate) {
44ae766353af6e Heiko Carstens           2023-10-12  358  			teid->b56 = 0;
44ae766353af6e Heiko Carstens           2023-10-12  359  			teid->b60 = 0;
44ae766353af6e Heiko Carstens           2023-10-12  360  			teid->b61 = 0;
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  361  		}
3b684a420bd8a2 Joe Perches              2020-03-10  362  		fallthrough;
d03193de30e6d9 David Hildenbrand        2016-05-31  363  	case PGM_ASCE_TYPE:
d03193de30e6d9 David Hildenbrand        2016-05-31  364  	case PGM_PAGE_TRANSLATION:
d03193de30e6d9 David Hildenbrand        2016-05-31  365  	case PGM_REGION_FIRST_TRANS:
d03193de30e6d9 David Hildenbrand        2016-05-31  366  	case PGM_REGION_SECOND_TRANS:
d03193de30e6d9 David Hildenbrand        2016-05-31  367  	case PGM_REGION_THIRD_TRANS:
d03193de30e6d9 David Hildenbrand        2016-05-31  368  	case PGM_SEGMENT_TRANSLATION:
d03193de30e6d9 David Hildenbrand        2016-05-31  369  		/*
d03193de30e6d9 David Hildenbrand        2016-05-31  370  		 * op_access_id only applies to MOVE_PAGE -> set bit 61
d03193de30e6d9 David Hildenbrand        2016-05-31  371  		 * exc_access_id has to be set to 0 for some instructions. Both
c14b88d76624e0 Janosch Frank            2016-07-29  372  		 * cases have to be handled by the caller.
d03193de30e6d9 David Hildenbrand        2016-05-31  373  		 */
44ae766353af6e Heiko Carstens           2023-10-12  374  		teid->addr = gva >> PAGE_SHIFT;
44ae766353af6e Heiko Carstens           2023-10-12  375  		teid->fsi = mode == GACC_STORE ? TEID_FSI_STORE : TEID_FSI_FETCH;
44ae766353af6e Heiko Carstens           2023-10-12  376  		teid->as = psw_bits(vcpu->arch.sie_block->gpsw).as;
3b684a420bd8a2 Joe Perches              2020-03-10  377  		fallthrough;
d03193de30e6d9 David Hildenbrand        2016-05-31  378  	case PGM_ALEN_TRANSLATION:
d03193de30e6d9 David Hildenbrand        2016-05-31  379  	case PGM_ALE_SEQUENCE:
d03193de30e6d9 David Hildenbrand        2016-05-31  380  	case PGM_ASTE_VALIDITY:
d03193de30e6d9 David Hildenbrand        2016-05-31  381  	case PGM_ASTE_SEQUENCE:
d03193de30e6d9 David Hildenbrand        2016-05-31  382  	case PGM_EXTENDED_AUTHORITY:
c14b88d76624e0 Janosch Frank            2016-07-29  383  		/*
c14b88d76624e0 Janosch Frank            2016-07-29  384  		 * We can always store exc_access_id, as it is
c14b88d76624e0 Janosch Frank            2016-07-29  385  		 * undefined for non-ar cases. It is undefined for
c14b88d76624e0 Janosch Frank            2016-07-29  386  		 * most DAT protection exceptions.
c14b88d76624e0 Janosch Frank            2016-07-29  387  		 */
d03193de30e6d9 David Hildenbrand        2016-05-31  388  		pgm->exc_access_id = ar;
d03193de30e6d9 David Hildenbrand        2016-05-31  389  		break;
d03193de30e6d9 David Hildenbrand        2016-05-31  390  	}
d03193de30e6d9 David Hildenbrand        2016-05-31  391  	return code;
d03193de30e6d9 David Hildenbrand        2016-05-31  392  }
d03193de30e6d9 David Hildenbrand        2016-05-31  393  

:::::: The code at line 321 was first introduced by commit
:::::: b3cefd6bf16e7234ffbd4209f6083060f4e35f59 KVM: s390: Pass initialized arg even if unused

:::::: TO: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
:::::: CC: Janosch Frank <frankja@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
