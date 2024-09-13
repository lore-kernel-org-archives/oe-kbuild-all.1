Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7421013BC35
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726266932; cv=none; b=IqDuwVaHsANdD8If08KZiVGiX21zuAXqJJ0NgK+y3TlL0VdkVRYEAxOaYsSOw6iE+IAXGarzTv+j1qu5bNZ3xHdRMnLccpHJCHQcdt6fGuf3Ygga9n3jPdmw+/tQkFV+nYQ5NVzNp6O3pDcQRLoQVBwv2OVjo4xeLFgHYnKtRSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726266932; c=relaxed/simple;
	bh=Ge6yTFRvt3d4VLnWrP6/b+ZWS2FxRR8rnXxFE6InbQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC64Ar0qE8PVcMAjFcvilGd976/Opl7K7Nt+qWXu4cq5F8INWiChC4A2qsWUtX9RAHdAZYIyJC31O4Pj9yRBB0YsylUVYIUV+iIz6vCKHjPkuCRuUR6YzTGU+9mGftI2wtBvNfUfaRFD1PnwTMC/mY69ge36hVbHWwgScbk6W8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkYjKDN2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkYjKDN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726266930; x=1757802930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ge6yTFRvt3d4VLnWrP6/b+ZWS2FxRR8rnXxFE6InbQg=;
  b=LkYjKDN2kEGdWWYqovl23F1SS2KWi26vsWwyRP6VVeuE2VAJWULuIble
   brB0TZru2LlmH0zy6FXlzHXdLUVoppV2mtrm/KX4SZGESlAp3Mwx5EShr
   pnlI4d7esbdcNFrTlBeUmn4DOpo3Gp3iGkmJCOMclBujMHGCC9vtO7nb7
   TH7PRQuP/QbB5bw9c+lAsKEIXHhsDJuVieNWoA2glTd/hssDtKt+hkGoz
   egKq4yGn+oBFxqq/EQ6CPbVZU8uo/soD3/NfPCgP6jf703YsspdfdE2Mi
   ySSBZVJlsmWpyZab8cXzthtRpgnDnqOXIbJaLNeao1GZiSoO6PRhC/YwS
   Q==;
X-CSE-ConnectionGUID: 87EBwnujSiGeUdBtLiL56A==
X-CSE-MsgGUID: K3xrMZvOSHOf+bMOCH8Dzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25010316"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25010316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 15:35:30 -0700
X-CSE-ConnectionGUID: fBcLijFOTRaA+60vVMLNHA==
X-CSE-MsgGUID: ROjJuQCCROmRILa822mSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="105668565"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2024 15:35:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spEsw-00076I-1U;
	Fri, 13 Sep 2024 22:35:26 +0000
Date: Sat, 14 Sep 2024 06:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 23/39] mm: hugetlb: Expose HugeTLB functions for
 promoting/demoting pages
Message-ID: <202409140603.8rjS3Sn1-lkp@intel.com>
References: <226a836ca381824cfe17ed42be5cbf9972b09ab1.1726009989.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226a836ca381824cfe17ed42be5cbf9972b09ab1.1726009989.git.ackerleytng@google.com>

Hi Ackerley,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on linus/master v6.11-rc7]
[cannot apply to akpm-mm/mm-everything kvm/linux-next next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ackerley-Tng/mm-hugetlb-Simplify-logic-in-dequeue_hugetlb_folio_vma/20240911-074716
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/226a836ca381824cfe17ed42be5cbf9972b09ab1.1726009989.git.ackerleytng%40google.com
patch subject: [RFC PATCH 23/39] mm: hugetlb: Expose HugeTLB functions for promoting/demoting pages
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409140603.8rjS3Sn1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140603.8rjS3Sn1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140603.8rjS3Sn1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:37:
>> include/linux/hugetlb.h:305:6: warning: no previous prototype for 'prep_compound_gigantic_folio' [-Wmissing-prototypes]
     305 | bool prep_compound_gigantic_folio(struct folio *folio, unsigned int order)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/migrate.h:8,
                    from mm/hugetlb.c:33:
>> include/linux/hugetlb.h:305:6: warning: no previous prototype for 'prep_compound_gigantic_folio' [-Wmissing-prototypes]
     305 | bool prep_compound_gigantic_folio(struct folio *folio, unsigned int order)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:2120:6: error: redefinition of 'prep_compound_gigantic_folio'
    2120 | bool prep_compound_gigantic_folio(struct folio *folio, unsigned int order)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h:305:6: note: previous definition of 'prep_compound_gigantic_folio' with type 'bool(struct folio *, unsigned int)' {aka '_Bool(struct folio *, unsigned int)'}
     305 | bool prep_compound_gigantic_folio(struct folio *folio, unsigned int order)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: In function 'alloc_hugetlb_folio':
   mm/hugetlb.c:3267:15: error: implicit declaration of function 'policy_node_nodemask'; did you mean 'policy_mbind_nodemask'? [-Werror=implicit-function-declaration]
    3267 |         nid = policy_node_nodemask(mpol, gfp, ilx, &nodemask);
         |               ^~~~~~~~~~~~~~~~~~~~
         |               policy_mbind_nodemask
   cc1: some warnings being treated as errors


vim +/prep_compound_gigantic_folio +305 include/linux/hugetlb.h

   300	
   301	#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
   302	bool prep_compound_gigantic_folio(struct folio *folio, unsigned int order);
   303	void destroy_compound_gigantic_folio(struct folio *folio, unsigned int order);
   304	#else
 > 305	bool prep_compound_gigantic_folio(struct folio *folio, unsigned int order)
   306	{
   307		return false;
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
