Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52E5286881
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 16:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429750; cv=none; b=BWZkDXdptbI9LEA28vEIKoi9deM0LD8wq9FaN+CabKpLdM/dg0tAqv6pV8bzuGNdwG/siHrV0rLKZEmlyePkO9quL2TcCQdcnrRO4ZKz6GMn99VFm1xigiFqBuIfEk8+FqyYQEd1ifumFvdZXLMuzWBwUW+lM717fMEolfHQrMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429750; c=relaxed/simple;
	bh=HupmRejFkybmBtAWAKmjljvXHZ0NmF6l1vTvqbQNWUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDD23vDGg/dWvlllqqh1kRvPpClUF5YSYdiU5FF3/FffJJ2TC5gD+VCgWWfnT7Tl5RexLiKYAoV2kUL2+zqYqErKRrzQQGJIevYP9dLu4CqKSZz+p2HO8bznPZXWuFuyxx+YhUcu1+iGCKZTzuP9h2O6yaZU3YArXdp1TJEfYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHkgG9Vs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHkgG9Vs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778429749; x=1809965749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HupmRejFkybmBtAWAKmjljvXHZ0NmF6l1vTvqbQNWUU=;
  b=oHkgG9VswzzsoLjfwbkXHlYdwXglXkf/YrTf82wZx6SpZjGjv8jQvhGW
   /RyRnu+k5SFBenekX5C2/HQcwWC4KLXhk03nOAorhXQrS2+NTfAsoKSXC
   fVD1GmqCnLTJWLQMi2Ow/4BtlmpQ4jU0IrOXWpu1VxTqN5i/4ix6ePSWl
   qj6GBTLhKaQIjWNz9HqQ9IYIGUjwYLSoMaxgXdHyL6ZUIQF0HXG5MengV
   jPtN8FIbXy2n72AHxM4cn7+GMVzjHAMqu0mJdg3rsionnyV2OzGF/2Mxw
   mgL+7icrb3bBVtJN03IgUXhhyos61bR4nT5TYXZiWONEyUY2KImnYboda
   g==;
X-CSE-ConnectionGUID: v/AbAQ+qRomyxb7zD+pM5g==
X-CSE-MsgGUID: B13G8AsNS4SYFkTSG357Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79232019"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79232019"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 09:15:48 -0700
X-CSE-ConnectionGUID: yDlc9PidRvSc3mLRG0+kKA==
X-CSE-MsgGUID: bv+ywnRdSTCR/UJPZGPiiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="237339824"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2026 09:15:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM6oi-000000007kb-0mLS;
	Sun, 10 May 2026 16:15:44 +0000
Date: Sun, 10 May 2026 18:15:21 +0200
From: kernel test robot <lkp@intel.com>
To: Gaurav Batra <gbatra@linux.ibm.com>, maddy@linux.ibm.com
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	sbhat@linux.ibm.com, vaibhav@linux.ibm.com, ritesh.list@gmail.com,
	Gaurav Batra <gbatra@linux.ibm.com>,
	Brian King <brking@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries/iommu: export DMA window data to user
 space
Message-ID: <202605101820.ZpQl79bh-lkp@intel.com>
References: <20260507180646.40356-1-gbatra@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507180646.40356-1-gbatra@linux.ibm.com>

Hi Gaurav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 192c0159402e6bfbe13de6f8379546943297783d]

url:    https://github.com/intel-lab-lkp/linux/commits/Gaurav-Batra/powerpc-pseries-iommu-export-DMA-window-data-to-user-space/20260510-175116
base:   192c0159402e6bfbe13de6f8379546943297783d
patch link:    https://lore.kernel.org/r/20260507180646.40356-1-gbatra%40linux.ibm.com
patch subject: [PATCH v2] powerpc/pseries/iommu: export DMA window data to user space
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260510/202605101820.ZpQl79bh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101820.ZpQl79bh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:462: ./include/uapi/linux/landlock.h:153: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:462: ./include/uapi/linux/landlock.h:176: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/arch/powerpc/dma_window_attributes.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
