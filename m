Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFB0770E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700252; cv=none; b=md2KgTLaHvut5nLLCs022EhtFnnTJSUpw/NYDzhsv0u3qA5yQhQiAm8WPvYDP9/cy3e7N37oD1BGiE3Svpw4BslOOGluFe2UzO5RwkQQFS+Z65v4ZDKgXfOFAXIG8PF8kWWi4EgENsuGS1Ou8Wq1LiOh9V/Fqzg9ZGdZIr/8nCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700252; c=relaxed/simple;
	bh=XPHWc6mcqrIoWuBeIiXbP/1Ix0ComqH4JrNPkmq0UN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCH12vYJRMe3JuTHZj++DPsPa9olB2t5A5cEvGwM66Kz0w5iOoJKZnXDtq62ib51DR0KEnVkuQ24YEWioXJ75zL9ntk0+rDEHyF/bypQbqjhTSNhkIIoNPx+Hh7dSdfmziQg3HOtNrIrwr4Fb30OCJM+37ZpUw+0mvaRo1uOweY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Irb2dkqn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Irb2dkqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746700251; x=1778236251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XPHWc6mcqrIoWuBeIiXbP/1Ix0ComqH4JrNPkmq0UN0=;
  b=Irb2dkqnYJ/6l0zuQUdK19IsCsuY80EflfWEqvtXjlj9fLR6GEkZ+Atr
   Gll2FYRmEBCITyaqxsORk9EW4sqCBaetwVoGQANG5MtYPDPGxyCivpJIx
   /JYKorR/o3CEfTtpSkUPpSDdJtxQCciwF01UXVJd06/kzi0/i3xW7jnyE
   QTf0EUbvdGCLOVpMkPIt9re65MNTrb6J4FotI6HCsEWq1NwqvrFpOdJs6
   D1AzHaNv0FTzNUMJBem6nZ7xCi9hi/bwUME5dNdDa26dUAKllWBRJbehe
   n4jXUeiHrq9UyGsh9zCxagIpa6RCnXQS5Dz+KDZbuigs31GI0aeP7zdlL
   Q==;
X-CSE-ConnectionGUID: RDvRf+0qTcmHfz6GCLXncA==
X-CSE-MsgGUID: 3Fz79k5WTP6jU6Wz92klOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58677336"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="58677336"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:30:47 -0700
X-CSE-ConnectionGUID: o0qt0odCTPmMjbbRQ8FSeA==
X-CSE-MsgGUID: i7QPPxTxTkmxJ0w6SvOjgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="159562103"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 03:30:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCyWZ-000As1-0J;
	Thu, 08 May 2025 10:30:43 +0000
Date: Thu, 8 May 2025 18:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v1 03/11] bpf: Add function to extract program
 source info
Message-ID: <202505081842.Tgphc4hq-lkp@intel.com>
References: <20250507171720.1958296-4-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507171720.1958296-4-memxor@gmail.com>

Hi Kumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 43745d11bfd9683abdf08ad7a5cc403d6a9ffd15]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/bpf-Introduce-bpf_dynptr_from_mem_slice/20250508-012020
base:   43745d11bfd9683abdf08ad7a5cc403d6a9ffd15
patch link:    https://lore.kernel.org/r/20250507171720.1958296-4-memxor%40gmail.com
patch subject: [PATCH bpf-next v1 03/11] bpf: Add function to extract program source info
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250508/202505081842.Tgphc4hq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081842.Tgphc4hq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081842.Tgphc4hq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from include/linux/filter.h:9,
                    from kernel/bpf/core.c:21:
   In function 'kbasename',
       inlined from 'bpf_prog_get_file_line' at kernel/bpf/core.c:3240:11:
>> include/linux/string.h:387:28: warning: argument 1 null where non-null expected [-Wnonnull]
     387 |         const char *tail = strrchr(path, '/');
         |                            ^~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c: In function 'bpf_prog_get_file_line':
   include/linux/string.h:183:15: note: in a call to function 'strrchr' declared 'nonnull'
     183 | extern char * strrchr(const char *,int);
         |               ^~~~~~~


vim +387 include/linux/string.h

639b9e34f15e4b Akinobu Mita    2012-07-30  379  
b18888ab256f05 Andy Shevchenko 2012-12-17  380  /**
b18888ab256f05 Andy Shevchenko 2012-12-17  381   * kbasename - return the last part of a pathname.
b18888ab256f05 Andy Shevchenko 2012-12-17  382   *
b18888ab256f05 Andy Shevchenko 2012-12-17  383   * @path: path to extract the filename from.
b18888ab256f05 Andy Shevchenko 2012-12-17  384   */
b18888ab256f05 Andy Shevchenko 2012-12-17  385  static inline const char *kbasename(const char *path)
b18888ab256f05 Andy Shevchenko 2012-12-17  386  {
b18888ab256f05 Andy Shevchenko 2012-12-17 @387  	const char *tail = strrchr(path, '/');
b18888ab256f05 Andy Shevchenko 2012-12-17  388  	return tail ? tail + 1 : path;
b18888ab256f05 Andy Shevchenko 2012-12-17  389  }
b18888ab256f05 Andy Shevchenko 2012-12-17  390  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
