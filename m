Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB2518028
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707906472; cv=none; b=rPHKwMZmNQ3Pdu6FelOYBAaNLalYiqtwelEUWB5ORV1vpBnsNg1sIDUcZHCcP8nZ0AmbroT/fcoTRo852jOMgMEX42nG9QeEdbfk48jyDRA3ZyEUpsbI8GzA0+SBiMyjFZb2R4nKXC4nOX5H5mXjofuf043AeYAM3iT62LMksxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707906472; c=relaxed/simple;
	bh=zbIWzkXTYZWpzUdpSXPx9xSy94j7EPhhAgBf8uj1gg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUFo1rNeEbkicN3iK1DIUSbmTyEcLoZIouQc4jVmRXJLF+lVFcMQoY4o66MmjvOWISENFJZ9ckotp9KNMbe2rgfX7tbAi1CNAAOMWFR0BKm2OyH9Qsp9biW1lFPZc3bcmg2MPSdbmMoBE6ZZx2A11+5NjSAjBlYuCvCwKNlnnQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fW119Jbq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW119Jbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707906470; x=1739442470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zbIWzkXTYZWpzUdpSXPx9xSy94j7EPhhAgBf8uj1gg4=;
  b=fW119JbqoFOZfmNAG9Ztjl7WbGTgIb84NYTbx94Ufpl+bV7R56PSyCQX
   4/QMw083gl7zTkP3SdDXi686kq5IQlWrByxNaDFw6bL8McXxNFu8eK7/p
   u56YH7Db6IhxBAipW8p7ueoFC/TSFtW+BzSZzGlDKIdXepr89FiJTOfxp
   g7FUmUESxWZPRxCGUVdzaAvh+vpHP8Z/QH6hUnKCpghnoeRfa40w5AcUH
   JPurVW94n48079SGks34O16sI53ww1s6sJHG5ztsKrf4fxkIWMT6ALdUR
   bwTTH0BxJJC5ypYz8fWLdKmTvaoEPglA1JnuQldneaO8biim8cxsksObr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2066829"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2066829"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 02:27:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7754709"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Feb 2024 02:27:47 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raCUS-0008fy-1z;
	Wed, 14 Feb 2024 10:27:44 +0000
Date: Wed, 14 Feb 2024 18:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>, rostedt@goodmis.org,
	mhiramat@kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mathieu.desnoyers@efficios.com,
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH v17 2/6] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202402141856.fVl4pCHi-lkp@intel.com>
References: <20240213114945.3528801-3-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213114945.3528801-3-vdonnefort@google.com>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on ca185770db914869ff9fe773bac5e0e5e4165b83]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Zero-ring-buffer-sub-buffers/20240213-195302
base:   ca185770db914869ff9fe773bac5e0e5e4165b83
patch link:    https://lore.kernel.org/r/20240213114945.3528801-3-vdonnefort%40google.com
patch subject: [PATCH v17 2/6] ring-buffer: Introducing ring-buffer mapping functions
config: x86_64-randconfig-161-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141856.fVl4pCHi-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141856.fVl4pCHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141856.fVl4pCHi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:61,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/interrupt.h:8,
                    from include/linux/trace_recursion.h:5,
                    from kernel/trace/ring_buffer.c:7:
   kernel/trace/ring_buffer.c: In function '__rb_inc_dec_mapped':
>> include/linux/lockdep.h:234:52: error: invalid type argument of '->' (have 'struct mutex')
     234 | #define lockdep_is_held(lock)  lock_is_held(&(lock)->dep_map)
         |                                                    ^~
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     123 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/lockdep.h:267:2: note: in expansion of macro 'lockdep_assert'
     267 |  lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |  ^~~~~~~~~~~~~~
   include/linux/lockdep.h:267:17: note: in expansion of macro 'lockdep_is_held'
     267 |  lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                 ^~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:6185:2: note: in expansion of macro 'lockdep_assert_held'
    6185 |  lockdep_assert_held(cpu_buffer->mapping_lock);
         |  ^~~~~~~~~~~~~~~~~~~


vim +234 include/linux/lockdep.h

f607c668577481 Peter Zijlstra 2009-07-20  233  
f8319483f57f1c Peter Zijlstra 2016-11-30 @234  #define lockdep_is_held(lock)		lock_is_held(&(lock)->dep_map)
f8319483f57f1c Peter Zijlstra 2016-11-30  235  #define lockdep_is_held_type(lock, r)	lock_is_held_type(&(lock)->dep_map, (r))
f607c668577481 Peter Zijlstra 2009-07-20  236  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
