Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81313B5B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721758131; cv=none; b=ehrG8YAzZavj3n2O3MZOum8ffLyDHmRLWVNq9GVg+rFAdajwCPsDboh5ArXW0Cnmpu46D2C/Lp0Gc9VWRz5xCkMEpR5K8Go0xsyn5oKLA9k4X75kTSUvqr7HDMWXka8avJH7aiNw7vu6OuSleQSbIOP2Nd1L0JaxdNXzxpAC6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721758131; c=relaxed/simple;
	bh=QSk4jbmtxQ6gnme1U0wjthaWb3Pgs5Rax5Y3smVQJRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDEbM7QzeFZBaytmm3YlpyBTe/PFcdaLOo0gMXu9/d7r8zqySqtkPdQWpJ88Arnc4ol93LceYRg7OZdT7z8MQzgK84Div7LI36FFSMdrylCL6hwJqSjCEN5EULtlAlToGqL1vDLM+YWrfv88cVEXZAJSG+GWW5qRR38oOvh9AA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3AJRnAM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3AJRnAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721758129; x=1753294129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QSk4jbmtxQ6gnme1U0wjthaWb3Pgs5Rax5Y3smVQJRE=;
  b=O3AJRnAMbEOVmXaGUX9NgH+BR1TcG+Q5YVQmrbO/Bi+0pIdN0KTFkwjx
   oYPH8QxitVDZwvBnu7DJ5bYg9B76AJ72y7jzoyp1fGANuK+qD2MC8kdMm
   Z84f/ylIpqyW+MQiIJVulXwRALXE9lAeRea6g5OLeHYlrE/agdOHiUcWj
   IfY3QXCnRSAFdObXz6/aUC8duJbD0KeCFf+8gL96dtYQpw4L5TKk/Wkpr
   8WPsih6gydPB93Pbo1AsRseg5Rb66ixm1UlkFJUz2rwj8LG85DyKqVfqp
   juGHuo8MLh86R9XOR4qh1pxaw9CaALB4P6ju2/vx/BXHmnBBj/NW1kGtW
   w==;
X-CSE-ConnectionGUID: 0JLrW44wTDeaeSP8kV/q/A==
X-CSE-MsgGUID: 5u9bwAjhSdO0PmFIv5L9fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="41927776"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="41927776"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 11:08:48 -0700
X-CSE-ConnectionGUID: 4fyCI1joRhK/a8Y1EQLgCQ==
X-CSE-MsgGUID: JmbTOj5GTa6Z/t0JH3qTmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="57150378"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jul 2024 11:08:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWJwK-000mEa-2W;
	Tue, 23 Jul 2024 18:08:44 +0000
Date: Wed, 24 Jul 2024 02:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [akpm-mm:mm-unstable 17/30] mm/vma_internal.h:46:10: fatal error:
 asm/page_types.h: No such file or directory
Message-ID: <202407240258.i8Noapxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   cecb3db438d76f7c1005fd52689809696a330474
commit: b102945dd5b200efff9e8458946006770a513710 [17/30] mm: move internal core VMA manipulation functions to own file
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240724/202407240258.i8Noapxf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240258.i8Noapxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240258.i8Noapxf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vma.c:7:
>> mm/vma_internal.h:46:10: fatal error: asm/page_types.h: No such file or directory
      46 | #include <asm/page_types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +46 mm/vma_internal.h

    44	
    45	#include <asm/current.h>
  > 46	#include <asm/page_types.h>
    47	#include <asm/pgtable_types.h>
    48	#include <asm/tlb.h>
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
