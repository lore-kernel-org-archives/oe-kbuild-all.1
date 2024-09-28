Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E01803E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 01:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727485736; cv=none; b=RBoNxzk4rpOJJUl4naacRAQ9YuBlsbOS8XM3n1oNSf0pHhCHaB2cLx5cT+ygLK+fMZMLPp3L9f8ua6hagrAtTCtPjBcXYxK5c6o7vbyNvxJk4ioqh61+4HkGYIJc8Uc/vcHaZt+aX5Tgbx4M5xELUvMIWWI4AAi33F13rknw3Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727485736; c=relaxed/simple;
	bh=0l68hqZIMfSRI6FwewYlmbuezmIgQFG1fgSkFvmMpXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVxmdzPzMg/1dvvl71xwl7sMf5LB403lAL8QdQz5K1WFz3RmHqmN12+MkWpllB7CequKQrR6uwXWsSefRcDoFexcXGXXafcQ0T+lMH4232/4Z7W1JRUyofjjGJ8l9G+ydWCUhPPowrXoU4AE+FJ3oFF6dhvNmDVCDdgyS2xx8A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaySU74O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaySU74O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727485735; x=1759021735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0l68hqZIMfSRI6FwewYlmbuezmIgQFG1fgSkFvmMpXA=;
  b=aaySU74OfMupDS5UvaPjiSo2quQD+PXhgTBJLPNkekvjrbio2J3cwNtf
   /Bs8x0lweeFap8gsByuY4FQa4rZvetLojeer6j1q94onDCoXdgRsFSxwL
   jDz2pgZuqi2SuOmbFoeUBO4ViqBZiQqsUyEWHhUAm2XfHG9OtyJNkcsq3
   aFPFUahYl4k9A1/XieTTtNS+Q3BZmPqWqCVlUpYQIDqI9V/rWYI3+2sUM
   rOAyXDEIN4/tl8JG4aJ9YnlwPt/f+5cbtpT/pQk3/eAFhNcgu+7+MATKC
   A+0FzLjTcRK9hIQgfOCqSFRaNH8/+qcmanumzyKKlS23GHvEMY31QEUtc
   A==;
X-CSE-ConnectionGUID: hxvlh3uRRO2Vr/l8IqIqrQ==
X-CSE-MsgGUID: UA17j7ZySRWHzOD1rS3xFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37317529"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37317529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 18:08:54 -0700
X-CSE-ConnectionGUID: jHpG30+IQ2OnqMS7gUUMWg==
X-CSE-MsgGUID: YrkUP0JaR1CC4x6bNp1ODQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72858177"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2024 18:08:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suLx5-000Mnc-1V;
	Sat, 28 Sep 2024 01:08:51 +0000
Date: Sat, 28 Sep 2024 09:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/6] acpi/hmat / cxl: Add extended linear cache
 support for CXL
Message-ID: <202409280852.v8yfHiUg-lkp@intel.com>
References: <20240927142108.1156362-4-dave.jiang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927142108.1156362-4-dave.jiang@intel.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus tip/x86/core tip/x86/mm v6.11]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge cxl/next linus/master cxl/pending next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/ACPICA-actbl1-h-Add-extended-linear-address-mode-to-MSCIS/20240927-222421
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240927142108.1156362-4-dave.jiang%40intel.com
patch subject: [RFC PATCH 3/6] acpi/hmat / cxl: Add extended linear cache support for CXL
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409280852.v8yfHiUg-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280852.v8yfHiUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280852.v8yfHiUg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/acpi.c: In function 'cxl_acpi_get_extended_linear_cache_size':
>> drivers/cxl/core/acpi.c:10:16: error: implicit declaration of function 'hmat_get_extended_linear_cache_size'; did you mean 'cxl_acpi_get_extended_linear_cache_size'? [-Wimplicit-function-declaration]
      10 |         return hmat_get_extended_linear_cache_size(backing_res, nid, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                cxl_acpi_get_extended_linear_cache_size


vim +10 drivers/cxl/core/acpi.c

     6	
     7	int cxl_acpi_get_extended_linear_cache_size(struct resource *backing_res,
     8						    int nid, resource_size_t *size)
     9	{
  > 10		return hmat_get_extended_linear_cache_size(backing_res, nid, size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
