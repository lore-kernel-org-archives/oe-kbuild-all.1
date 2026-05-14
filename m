Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A12E389E07
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 18:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782162; cv=none; b=VOfLoEcmTofJmqhAxlbkIG+U1eQX5ccjSiAm7/syfMWI73EZieltVq62pPY4xMQuzTSggPaIClWQnSCadV1cGM9Be5ogklTtDQul0kAFuM+YzuoI0znXVzIPk0VYS6tybkbz7LtIm1kQwOQ8o+RQvRseWtvUu0oUR6du+7qVdLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782162; c=relaxed/simple;
	bh=rbSKM37u0zRXPYi5/fg/r5zklwf9wbrLlHx97TTSgGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pe7rggpge7Lr/kgGHvfGEWPW54P9yHfLRBA09MHxw0YN3TBDwbVo6neUKs3w+IW73YceBmqeyM8mRp1cZWt95tc5T5LU+IQfKdTp9N4DOnUz+gCeA92pHlpctXDDCVmlZqs0ypLd7U/0p7UoJi6OERgcq2TM216uvNucj9eb6ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAVvHtBL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAVvHtBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778782160; x=1810318160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rbSKM37u0zRXPYi5/fg/r5zklwf9wbrLlHx97TTSgGo=;
  b=kAVvHtBLh56x423O+2Zl7qT//GOaJdSQfQAvbaQydm6w1LCEIHZfXEl8
   3XmLjiNSVur/c+ISlFoSaycCyr0wtBchh0EjD1JN1KlBRj4BJcS6UgkTm
   ULhs6c3o2x9APJAlOsl963uPk31LgcMnS5lsHHRd+q+AbOwx/HUuLr3Tw
   x1s7I3lqt4AW71Wo9pK2x1TqbL8i/SHLgHmrc1EZN/J72RbrGMKXJPoiT
   VSihOVwxI+OnbAr0ZQaBP/pcc6Ru06kvG16mARLf4VXoQs2QqcTQfLesl
   AKwn4MCzC5UnSb540ZSFeqJFpMt2ZcEKGzM6CIEPCuwu9g1C4OuWrHAcQ
   w==;
X-CSE-ConnectionGUID: qAVNfRHETo66mIX8LQAeKQ==
X-CSE-MsgGUID: ML9g73xwRLuOZiFdx40rPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79905523"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79905523"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 11:09:20 -0700
X-CSE-ConnectionGUID: WSdGSAIwQk6nUDuFec/zdg==
X-CSE-MsgGUID: quE3Cu9yTUqFddmt8EaDnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="261979420"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2026 11:09:17 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNaUk-000000006uB-2Qcf;
	Thu, 14 May 2026 18:09:14 +0000
Date: Fri, 15 May 2026 02:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>, Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>
Subject: Re: [PATCH] x86/entry: Read CR2 in asm entry stub to redcue NMI
 clobbering window
Message-ID: <202605150207.pvBEOHK3-lkp@intel.com>
References: <20260513121259.0aae7adc@fangorn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513121259.0aae7adc@fangorn>

Hi Rik,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on tip/x86/asm tip/x86/core linus/master v7.1-rc3 next-20260508]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/x86-entry-Read-CR2-in-asm-entry-stub-to-redcue-NMI-clobbering-window/20260514-162554
base:   tip/master
patch link:    https://lore.kernel.org/r/20260513121259.0aae7adc%40fangorn
patch subject: [PATCH] x86/entry: Read CR2 in asm entry stub to redcue NMI clobbering window
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260515/202605150207.pvBEOHK3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150207.pvBEOHK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150207.pvBEOHK3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/include/asm/idtentry.h: Assembler messages:
>> arch/x86/include/asm/idtentry.h:627: Error: no such instruction: `idtentry_pf 14 asm_exc_page_fault exc_page_fault'


vim +627 arch/x86/include/asm/idtentry.h

   623	
   624	/* Raw exception entries which need extra work */
   625	DECLARE_IDTENTRY_RAW(X86_TRAP_UD,		exc_invalid_op);
   626	DECLARE_IDTENTRY_RAW(X86_TRAP_BP,		exc_int3);
 > 627	DECLARE_IDTENTRY_PF(X86_TRAP_PF,	exc_page_fault);
   628	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
