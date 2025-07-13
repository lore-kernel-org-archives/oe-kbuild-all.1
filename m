Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE27619CD01
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Jul 2025 07:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752390316; cv=none; b=Kv3cItHymuP2eHlL85hT9AFFGybLsUbqZ7XFug5wcra4/p5+hdyZM0Dt2tpx7NrJtVZB/g1xv4Ky2QxGN6uE7sS+6iwZiMbtV78YaUQ9ZumORsKTQwBGlOUwAz6MWUFHNvDKXuPR3TzsrX26F2/JPa8HwX2yHleT6bZiBbuS+wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752390316; c=relaxed/simple;
	bh=RArTnJrt8VJQG3QSG45MaPNRWBWIjFC9FCCPu+ERj00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQT2Q/S3ism6dyRojrMF1dbfSK2AmU8a03+5yrZgfI0F7YC+Iy3YB1v8O/4gGUWrj1Y5bIrMKmOLx/Jygy2bh3vUaH6Ktp41BBD/TgnkXL4TFvhJWdGtkHJCUACd5Ck9p3K1Wge1iHnOk8YAaQMFm655sCiN1PBhJBj8H2zyjpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IG5uEemI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IG5uEemI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752390315; x=1783926315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RArTnJrt8VJQG3QSG45MaPNRWBWIjFC9FCCPu+ERj00=;
  b=IG5uEemI4bYJl/GuqFUtlZIWxz0PKXFUssNbP6884mBnAU9kBN8UZOZJ
   26dgYOzggYEZEeoR2YJ/CJ5ViyGjd6Udhd1stygYSMOzkJa1TLDM42kIG
   p2yqZiXt3vnKKzemlNHOGorLbyRjuVF+BUEYWqZ9urd/fZwZ9KoQqpvU4
   C0PCs9yUv6bUg28P5NC5MiNAQfyV0ygbzs28mNMCWfhm5r/1QBVI6KUGI
   MTX+jD85sMO1D26P9doCT3iiektkF37PVJC/zLFTXhhDGPwOO6KmeUtVP
   aBDOok12P9T9ZxR1zGLnnnjVmw2ZCs1009oMfAhik8hIjplBXvR0Ggfyd
   w==;
X-CSE-ConnectionGUID: PY6kaOiSRkmjQVgn5HQe1A==
X-CSE-MsgGUID: EGlklVy6TY6gqm3bb0uK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54751991"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="54751991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 00:05:15 -0700
X-CSE-ConnectionGUID: 9PqlDzgJTIyYHfwDA6bkWg==
X-CSE-MsgGUID: ZrtAll11TdCOw4h+icgJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="180368227"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2025 00:05:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaqlp-0007xP-0p;
	Sun, 13 Jul 2025 07:05:09 +0000
Date: Sun, 13 Jul 2025 15:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net,
	Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: Re: [PATCH 1/2] printk: nbcon: Export console_is_usage and other
 nbcon symbols
Message-ID: <202507131412.Lfp8uefP-lkp@intel.com>
References: <20250713-nbcon-kgdboc-v1-1-51eccd9247a8@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-nbcon-kgdboc-v1-1-51eccd9247a8@suse.com>

Hi Marcos,

kernel test robot noticed the following build errors:

[auto build test ERROR on d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usage-and-other-nbcon-symbols/20250713-131106
base:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
patch link:    https://lore.kernel.org/r/20250713-nbcon-kgdboc-v1-1-51eccd9247a8%40suse.com
patch subject: [PATCH 1/2] printk: nbcon: Export console_is_usage and other nbcon symbols
config: i386-buildonly-randconfig-004-20250713 (https://download.01.org/0day-ci/archive/20250713/202507131412.Lfp8uefP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131412.Lfp8uefP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131412.Lfp8uefP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/panic.c:32:
   include/linux/console.h: In function 'nbcon_context_try_acquire':
>> include/linux/console.h:653:53: warning: no return statement in function returning non-void [-Wreturn-type]
     653 | static inline bool nbcon_context_try_acquire(struct nbcon_context *ctxt) { }
         |                                                     ^~~~~~~~~~~~~
--
   In file included from kernel/printk/printk.c:26:
   include/linux/console.h: In function 'nbcon_context_try_acquire':
>> include/linux/console.h:653:53: warning: no return statement in function returning non-void [-Wreturn-type]
     653 | static inline bool nbcon_context_try_acquire(struct nbcon_context *ctxt) { }
         |                                                     ^~~~~~~~~~~~~
   In file included from kernel/printk/printk.c:62:
   kernel/printk/internal.h: At top level:
>> kernel/printk/internal.h:165:20: error: redefinition of 'console_is_usable'
     165 | static inline bool console_is_usable(struct console *con, short flags,
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/console.h:661:20: note: previous definition of 'console_is_usable' with type 'bool(struct console *, short int,  bool)' {aka '_Bool(struct console *, short int,  _Bool)'}
     661 | static inline bool console_is_usable(struct console *con, short flags,
         |                    ^~~~~~~~~~~~~~~~~


vim +/console_is_usable +165 kernel/printk/internal.h

6b93bb41f6eaa1 Thomas Gleixner 2023-09-16  164  
6cb58cfebb2932 John Ogness     2024-09-04 @165  static inline bool console_is_usable(struct console *con, short flags,
6cb58cfebb2932 John Ogness     2024-09-04  166  				     bool use_atomic) { return false; }
864c25c83d834b John Ogness     2024-08-20  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
