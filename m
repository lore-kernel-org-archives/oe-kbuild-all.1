Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772312868A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 19:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765482650; cv=none; b=UzcETBfOFxMV2dAko7a1Ua9hVJBbVzFdpuaEpGpFLWg6goKbvnpcGO5nitP6kxKEIBc75J5YImcpOaBEfL0YQYpK2nhXzNvrkCzEt2SwxcogIeohFqdFHVReElvNkzCjHhjGQrLejxI+tj7X5tnd7w2QpRKl8sUj7oAM8Rr8f1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765482650; c=relaxed/simple;
	bh=h98nDTBwLWOQxUX4rIYi0XylQMBoOGf9BLwzRLg4sHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvbUtKHmzJVkZWb8WeUc84YihoycPHVZ7ynUzPkt576hGvNa55axEEUGROgDpMNgsGjEtWDHz0iwmKebSTTmFwu/AT542LgNkDqOBC/4PfZAErsR04sHzC5WOcqJUoXy5stxANG86VZc34YanDkumN8gN5WLIuf9D43RGc6Jf7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwwuGliz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwwuGliz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765482648; x=1797018648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h98nDTBwLWOQxUX4rIYi0XylQMBoOGf9BLwzRLg4sHQ=;
  b=fwwuGlizB7jktDujzfmgvw+/62h3xXCRcbN0gS+C9T9De4fUVhnfDlfX
   xZsC+e0qqRRToLw0oLBg2Jxu5NW4EY51fV2gJg9OtLqklYyZKHBmUD/wV
   4UsMUN+Pyitlm82O1TI+HkfLb/wHcWWFRYD/3TiFS51CbYMHt/Y1Bdb/j
   jbbz6kIEjSUQDHEEC/vOlEJchnN5MVMC8KEaAATzOiufPi3lFmSO8/B1m
   1JMKlqY9PYAaziuCA9ftDxAVvxCoRstXB5qvEkTzKpsIBb3AhIYikQLXz
   M+zr5FiS5bK7pWnd3niVbYyAr12y++KD95/TmkRiUxamSJf0cXsAqkUDK
   A==;
X-CSE-ConnectionGUID: rukPbPhDSZutEAsUwzrRFQ==
X-CSE-MsgGUID: ftgpBihyS/GS3sInENXiJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67516513"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67516513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 11:50:47 -0800
X-CSE-ConnectionGUID: Utkf77Q9TKSaueRphHE9iw==
X-CSE-MsgGUID: y440hin5Qx271vfEpRMh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201360420"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 11:50:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTmgT-0000000051p-1R39;
	Thu, 11 Dec 2025 19:50:41 +0000
Date: Fri, 12 Dec 2025 03:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Richter <rrichter@amd.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gregory Price <gourry@gourry.net>,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH v8 12/13] cxl: Check if ULLONG_MAX was returned from
 translation functions
Message-ID: <202512120346.aT9GKk20-lkp@intel.com>
References: <20251209180659.208842-13-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209180659.208842-13-rrichter@amd.com>

Hi Robert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea5514e300568cbe8f19431c3e424d4791db8291]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Richter/cxl-region-Rename-misleading-variable-name-hpa-to-hpa_range/20251210-021858
base:   ea5514e300568cbe8f19431c3e424d4791db8291
patch link:    https://lore.kernel.org/r/20251209180659.208842-13-rrichter%40amd.com
patch subject: [PATCH v8 12/13] cxl: Check if ULLONG_MAX was returned from translation functions
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512120346.aT9GKk20-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120346.aT9GKk20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120346.aT9GKk20-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/string.h:13,
                    from include/linux/seq_file.h:6,
                    from drivers/cxl/core/hdm.c:3:
   drivers/cxl/core/hdm.c: In function 'cxl_dpa_resource_start':
>> include/vdso/limits.h:16:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      16 | #define ULLONG_MAX      (~0ULL)
         |                         ^
   drivers/cxl/core/hdm.c:533:32: note: in expansion of macro 'ULLONG_MAX'
     533 |         resource_size_t base = ULLONG_MAX;
         |                                ^~~~~~~~~~


vim +16 include/vdso/limits.h

3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   4  
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   5  #define USHRT_MAX	((unsigned short)~0U)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   6  #define SHRT_MAX	((short)(USHRT_MAX >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   7  #define SHRT_MIN	((short)(-SHRT_MAX - 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   8  #define INT_MAX		((int)(~0U >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   9  #define INT_MIN		(-INT_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  10  #define UINT_MAX	(~0U)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  11  #define LONG_MAX	((long)(~0UL >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  12  #define LONG_MIN	(-LONG_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  13  #define ULONG_MAX	(~0UL)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  14  #define LLONG_MAX	((long long)(~0ULL >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  15  #define LLONG_MIN	(-LLONG_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20 @16  #define ULLONG_MAX	(~0ULL)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  17  #define UINTPTR_MAX	ULONG_MAX
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
