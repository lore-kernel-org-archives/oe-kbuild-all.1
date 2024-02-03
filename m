Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283644F215
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706966211; cv=none; b=hcLuDjZzcUXpoLEUC5z/kkGLPZ6wjmth+OS7IdMdsUAQk3jeJwCJVcCQFmjcaNroPaVdN6OXW4reaqUzCevEFb8bymLVJTOljCGUw8CPwPjvz7LQTyfl5RR3dsaNLj06bClJ+PGfiHab8XPuGbnBDzMhopVDlyfCJw096jLr53Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706966211; c=relaxed/simple;
	bh=4+zMKxvYaiaxOW0B3LJoq39gR4Zfnm5GTXLb8V0K1bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYhBm17HTpmVV9i4LTl3JNnTFKNLjKO/xM/u6VL3yAF17FA9xFVv2GZIMOjhUJ3djznA1Ro/zwXYIwfbOEj5t6e+8zLL5H7zqLFRUttY6KvA7JpJ0U9YeSHSsIxd5XYdIFgu/Kmo6VYFrA3BrcssuTGM04UNa23xwk0JwGIbH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzbusSPI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzbusSPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706966210; x=1738502210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4+zMKxvYaiaxOW0B3LJoq39gR4Zfnm5GTXLb8V0K1bQ=;
  b=hzbusSPIxZUKvsA1JzjQEVemMmZlVQ5iNnSp8YiOhzeEPL8M8k7XHFEk
   Cscn9QXkepbDzI5VCFRKlN7fxixWSyU7lufOxMIwXh8FXoH1KwhWEHmSn
   Ju4Cekqs+8PigXsYbHTzg4eVMDrG5fSCSiIAKHI3Pqu0RaD0UQqUjyWDE
   kCIVbVIcUyGcAc5QbBY13UEGf5SnpoYreEiF0Zbx7MUXS7qQL8VyQ/Vxv
   GxD2w9vrnz+Hi0iQ2ptd456w/1Z5Fhs6s2lHTCR3pkglTPu1uP7WRNafe
   YE8eaF3yUlsTBtc/YTnnn7RpRgRx40pGDwcPPrQRRH7M3v0o2iXvG8wxI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17728808"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="17728808"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 05:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4932024"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2024 05:16:46 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWFsx-00055a-0l;
	Sat, 03 Feb 2024 13:16:43 +0000
Date: Sat, 3 Feb 2024 21:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Oleg Nesterov <oleg@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH 3/3] mm/memory: Use exception ip to search exception
 tables
Message-ID: <202402032150.DmM8VjRz-lkp@intel.com>
References: <20240201-exception_ip-v1-3-aa26ab3ee0b5@flygoat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201-exception_ip-v1-3-aa26ab3ee0b5@flygoat.com>

Hi Jiaxun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 06f658aadff0e483ee4f807b0b46c9e5cba62bfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiaxun-Yang/ptrace-Introduce-exception_ip-arch-hook/20240201-234906
base:   06f658aadff0e483ee4f807b0b46c9e5cba62bfa
patch link:    https://lore.kernel.org/r/20240201-exception_ip-v1-3-aa26ab3ee0b5%40flygoat.com
patch subject: [PATCH 3/3] mm/memory: Use exception ip to search exception tables
config: i386-buildonly-randconfig-002-20240203 (https://download.01.org/0day-ci/archive/20240203/202402032150.DmM8VjRz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032150.DmM8VjRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032150.DmM8VjRz-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'get_mmap_lock_carefully':
>> mm/memory.c:5484:22: error: implicit declaration of function 'exception_ip' [-Werror=implicit-function-declaration]
      unsigned long ip = exception_ip(regs);
                         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/exception_ip +5484 mm/memory.c

  5477	
  5478	static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
  5479	{
  5480		if (likely(mmap_read_trylock(mm)))
  5481			return true;
  5482	
  5483		if (regs && !user_mode(regs)) {
> 5484			unsigned long ip = exception_ip(regs);
  5485			if (!search_exception_tables(ip))
  5486				return false;
  5487		}
  5488	
  5489		return !mmap_read_lock_killable(mm);
  5490	}
  5491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
