Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3092063A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 04:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710651435; cv=none; b=cL1fPtTekZIOqAochxoSaVkYaZVAMPjAchEBwc2fzdz7KvfXDAzNjM1DWnx35iHscCuwTXgsCqnPYTOwAh43VPQs55Ao+jVF5s8rgMwpkMy6eTlc0hyeKLG+NRJJj6WhU/gQyMq0l7CvC5Ph2WPEx4fIRgj0XV+oViN7l2sC154=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710651435; c=relaxed/simple;
	bh=uKwV+fnhqTVNbhGeOp8jEqMcqGw4V2ue5FHGvSIEJLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISS9CmrIHAp7Vl9XIkbktmG1HyaH9AAgq9tLJg+OmvCoBh/NSN8NBa6JM58SOta3mBCVX+gpEy/XZONO07p8/pAXpzuj123i0u+yDv2aOdMRZIK9R9K+5dVs7evCcE0Nmz23IcQGhRGSVQ6JRlyHKuTEJP/+dqjEg8jHWh3tj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ak1dNNsv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ak1dNNsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710651433; x=1742187433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uKwV+fnhqTVNbhGeOp8jEqMcqGw4V2ue5FHGvSIEJLc=;
  b=ak1dNNsvqjRm2z/0GkX5lxBO/zVkfqjM447TBRb0lQwyTPTHFrI4b2Ps
   EGNH8vS9fU/bkowUU852zoM3d5oIO98tvncYu6XZ5RIQcNJ8ukxEHUJo9
   geBJngB6Xcurlp8u1SrMBnA+yvU3KfWMHkkVZ8BymO0wDuqYe5ZHZj3CP
   JVaqajoNZWDC/XdTIEBQSANIiuhgS8wGuhvmuQh4p8fWIbcbkp/ApTcQy
   sOtP8J11Enz1oTmZaYCo2UG//tzKEJGz/hzqPG5eo5DwCWllbO3SouFg0
   yUp0bKniwTJn2wdmuCUH5vkBa9/UaNyEsu5+DlbP1REMrXqEtqPq5TdsE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="5617898"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="5617898"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 21:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13076842"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Mar 2024 21:57:11 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlia5-000G17-0J;
	Sun, 17 Mar 2024 04:57:09 +0000
Date: Sun, 17 Mar 2024 12:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v15 17/21] fsverity: consume builtin signature via
 LSM hook
Message-ID: <202403171232.26URKXJ6-lkp@intel.com>
References: <1710560151-28904-18-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1710560151-28904-18-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master next-20240315]
[cannot apply to device-mapper-dm/for-next lwn/docs-next v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20240316-114235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/1710560151-28904-18-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v15 17/21] fsverity: consume builtin signature via LSM hook
config: i386-buildonly-randconfig-006-20240316 (https://download.01.org/0day-ci/archive/20240317/202403171232.26URKXJ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171232.26URKXJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171232.26URKXJ6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/verity/open.c:11:
   include/linux/security.h:1029:68: error: unknown type name 'type'; did you mean 'typeof'?
    1029 |                                               enum lsm_intgr_type, type,
         |                                                                    ^~~~
         |                                                                    typeof
   include/linux/security.h:1519:67: error: unknown type name 'type'; did you mean 'typeof'?
    1519 |                                              enum lsm_intgr_type, type,
         |                                                                   ^~~~
         |                                                                   typeof
   fs/verity/open.c: In function 'fsverity_inode_setintegrity':
>> fs/verity/open.c:180:16: error: implicit declaration of function 'security_inode_setintegrity'; did you mean 'fsverity_inode_setintegrity'? [-Werror=implicit-function-declaration]
     180 |         return security_inode_setintegrity(inode, LSM_INTGR_FSV_SIG,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                fsverity_inode_setintegrity
   cc1: some warnings being treated as errors


vim +180 fs/verity/open.c

   175	
   176	#ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
   177	static int fsverity_inode_setintegrity(struct inode *inode,
   178					       const struct fsverity_descriptor *desc)
   179	{
 > 180		return security_inode_setintegrity(inode, LSM_INTGR_FSV_SIG,
   181						   desc->signature,
   182						   le32_to_cpu(desc->sig_size));
   183	}
   184	#else
   185	static inline int fsverity_inode_setintegrity(struct inode *inode,
   186						      const struct fsverity_descriptor *desc)
   187	{
   188		return 0;
   189	}
   190	#endif /* CONFIG_FS_VERITY_BUILTIN_SIGNATURES */
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
