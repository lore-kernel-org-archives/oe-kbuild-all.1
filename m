Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F99810E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737206535; cv=none; b=dLF1YjDaoTXp2KsmcROdODksAipNAP0OfoK/ULTlaitt9WKb0bz9J6hT81T7dqNODjb+m5wL/zWTyDcJWlPpAVNeuIdlq0u3K51qhOmw97z563pWny6DDuqrDjGrBitcbnY+g1elajnQyiwRQ9POuR6wq5C9ojy6YFUO7F6Liqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737206535; c=relaxed/simple;
	bh=ICLVWsoGpyXQB+irSVwlYd//NnfUE2ysJYuuSohRO1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Px5FKMbCutsVt9YbJs0LEdtCOtvMGwtxXQmkleqLBB0vi7HwS/GrggOyKe1o4zW3CHzyChYB0DuIODLdOjXFEwNaXXWM2B4xGFXU3WA191UsDfwDPMvMCs3I3iMdcCn4Z2+TzvgxTztcRHpaAxW3zNyiBGLCQZN79U3V8wl/ZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbLs79DA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbLs79DA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737206533; x=1768742533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ICLVWsoGpyXQB+irSVwlYd//NnfUE2ysJYuuSohRO1I=;
  b=CbLs79DAVFclXhafOseoelokt6w/7KoT8WX5oqa01ZfVidEFEWc0P6b8
   Zky2QVhsVsRRgNASo9e94NUbMNxpwZGrSkQoGgI4n9VL+MIrobNFdmPHT
   LotH8sFBHlX9K6kGhOC6GemB3+4IM++JceSYaByMxPzjZQ21VZkLxmYVv
   PqN0nI/FW0/1/SVgW9n62cA+NyMdUaOI3782BG87HzqAWyqhX31gBKSsW
   XprQ+U9k4IFXJAS+e8LUZILbqCuzk+oFBqINVqrRHGJo7/zZaT7dv06JE
   C4faaKkYRtfN5QDTc/hyYEvqJtefIGL2jOrfipszwJXk6zZR7kW8C8nK+
   A==;
X-CSE-ConnectionGUID: GD3uLkHLRt25MnMltghvLg==
X-CSE-MsgGUID: rX5zpoUnSnqv+QvZXJ+Btw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48220021"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="48220021"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:22:13 -0800
X-CSE-ConnectionGUID: 2+3B2rj/TUWdm/m28D8WlA==
X-CSE-MsgGUID: qa+gJEAxQbmZqMb9CQeP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129330548"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jan 2025 05:22:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ8m9-000USx-2S;
	Sat, 18 Jan 2025 13:22:09 +0000
Date: Sat, 18 Jan 2025 21:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
Message-ID: <202501182157.eICoOWw0-lkp@intel.com>
References: <20250117163001.2326672-7-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117163001.2326672-7-tabba@google.com>

Hi Fuad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20250118-003538
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/20250117163001.2326672-7-tabba%40google.com
patch subject: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put() of guestmem pages
config: arm-randconfig-001-20250118 (https://download.01.org/0day-ci/archive/20250118/202501182157.eICoOWw0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182157.eICoOWw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182157.eICoOWw0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:40,
                    from mm/swap.c:40:
>> include/uapi/linux/kvm.h:15:10: fatal error: asm/kvm.h: No such file or directory
      15 | #include <asm/kvm.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +15 include/uapi/linux/kvm.h

6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   4  
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   5  /*
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   6   * Userspace interface for /dev/kvm - kernel based virtual machine
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   7   *
dea8caee7b6971 include/linux/kvm.h      Rusty Russell          2007-07-17   8   * Note: you must update KVM_API_VERSION if you change this interface.
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   9   */
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  10  
fb1070d18edb37 include/uapi/linux/kvm.h Joe Richey             2021-05-21  11  #include <linux/const.h>
00bfddaf7f68a6 include/linux/kvm.h      Jaswinder Singh Rajput 2009-01-15  12  #include <linux/types.h>
97646202bc3f19 include/linux/kvm.h      Christian Borntraeger  2008-03-12  13  #include <linux/compiler.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  14  #include <linux/ioctl.h>
f6a40e3bdf5fe0 include/linux/kvm.h      Jerone Young           2007-11-19 @15  #include <asm/kvm.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  16  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
