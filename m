Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365F647A73
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 01:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733362470; cv=none; b=EgVn2pPkTPw3GqFEvobBB9hcwCkBtrIdu4IPbR2t87+dxO+GjfSD873iVGMrsPgIkAcyOchWIF3eb+bkey0PpAmtRHJL+2elpzLsu+MPcEs04fj1yArRfYmhnZw+BgiDvucDnJNwIisOJb8BQATVPEOMb/EMXaUJcR4BFD1kuNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733362470; c=relaxed/simple;
	bh=c/cCV1lttffHtjgjeLQhINBBfps8//UF44vy9BB7Zsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZeyxuxRqVDqxTkWHD+7uJoihYj8ynTlzgrNoFllhG+7i4ijar8b+AFAXlP3qdPfXnLUMa93zHC3qJYobOseDCxqAsm5w5JOJ7gDCsaTHjXtb+Sn8KX+lgeCvM1T1v1sbvHw/Dpo9w3+F3aq4qNiz7INCLVZmdKlzRMBfDE3N/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aidXyv+h; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aidXyv+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733362468; x=1764898468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c/cCV1lttffHtjgjeLQhINBBfps8//UF44vy9BB7Zsg=;
  b=aidXyv+h5JPNA4pXIA37mexwIntFwM2KOVCQMQhPAfRBUOKRCgZLUoIa
   oAr7eMCvaJ2TnfjzBqam2KdwGXjgNsuzFjMzl5Wv2GLzsDqLvPdrmK57M
   8p5ezOsMagCMIFWCbkT9TNUscxG+6nLOnn+Wt3LA/xM/DvM2HUQ4U6/ZN
   p97UFtpkbGYD3YMuch85/9DKUbvNN6If8JcWJK4EKONCMPw4fhDmFV58a
   j2QCDK4KTDjG9kgXd7284YkgHg3oYnQTj3q7dD4wbxh9R5xZmCCTUvIfk
   uFhyq9sSvpp01wDdH51efcqPCzqMzxc7wAa+QCa5DQ+i36iBuoYx3tolh
   Q==;
X-CSE-ConnectionGUID: yLCF9rkrQTukTxGIeRf86w==
X-CSE-MsgGUID: x26N9ez1Qp+ynz7i3wlZ1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37432771"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="37432771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 17:34:28 -0800
X-CSE-ConnectionGUID: kgQwxoq7QS6fjggVHDPBOw==
X-CSE-MsgGUID: aFCZQYzGTMSQP4IhEcJgKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94775227"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 17:34:27 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ0kz-0003en-19;
	Thu, 05 Dec 2024 01:34:18 +0000
Date: Thu, 5 Dec 2024 09:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] acpi/hmat / cxl: Add extended linear cache support
 for CXL
Message-ID: <202412050940.jAddHkxV-lkp@intel.com>
References: <20241204224827.2097263-3-dave.jiang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204224827.2097263-3-dave.jiang@intel.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge cxl/next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus tip/x86/mm linus/master cxl/pending v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/acpi-numa-Add-support-to-enumerate-and-store-extended-linear-address-mode/20241205-064921
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20241204224827.2097263-3-dave.jiang%40intel.com
patch subject: [PATCH 2/4] acpi/hmat / cxl: Add extended linear cache support for CXL
config: i386-buildonly-randconfig-004 (https://download.01.org/0day-ci/archive/20241205/202412050940.jAddHkxV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050940.jAddHkxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050940.jAddHkxV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sysctl.c:54:
>> include/linux/acpi.h:1105:19: error: redefinition of 'hmat_get_extended_linear_cache_size'
    1105 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:448:19: note: previous definition of 'hmat_get_extended_linear_cache_size' with type 'int(struct resource *, int,  resource_size_t *)' {aka 'int(struct resource *, int,  unsigned int *)'}
     448 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hmat_get_extended_linear_cache_size +1105 include/linux/acpi.h

  1100	
  1101	#ifdef CONFIG_ACPI_HMAT
  1102	int hmat_get_extended_linear_cache_size(struct resource *backing_res, int nid,
  1103						resource_size_t *size);
  1104	#else
> 1105	static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
  1106							      int nid, resource_size_t *size)
  1107	{
  1108		return -EOPNOTSUPP;
  1109	}
  1110	#endif
  1111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
