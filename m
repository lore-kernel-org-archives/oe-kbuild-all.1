Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCEC334691
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 01:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760664388; cv=none; b=W3ekumR/xDDRElbdHnQuGhqZ2Rw1Twt35o0UWncy4WuwtpiQTTcoN1ThZ7K2LB/4id5UCwCfdqAlqGOX8uzmMmEX5HOnW6k9P1McSP0Ye0mneIRu/hJhGnIs4zBVQV4RpjA6FQTd+9JPW2RIndxu68DDr8DXZic+kUhD6OrgFgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760664388; c=relaxed/simple;
	bh=8yqxrPMDUDIopjMpMaVfn56rVVvt//g54hut99p+kBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bve0K9s9wBxKTxGE9D9fSjUxatnP9YDDv2TiabQr+hhkTtOLIJwB6r8amimvTaYpDTufdAhLviR8ijbjifizEG1ouKQ2sfM/B0O5X7xyPqPb5+eNtBM6tUu6qOoaqM1h74goakT4V/ub1IjqmJ/tBFE3fvWl9ECASboUEAicm+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6yDQAsB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6yDQAsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760664386; x=1792200386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8yqxrPMDUDIopjMpMaVfn56rVVvt//g54hut99p+kBE=;
  b=b6yDQAsB5i6/Cz6bB2BRyaNKpKSg/Kc/4h38zVcuQeYTuTQD3+4GnSNl
   Jn3z4l3/ZcGQP4Fu1Z2L4iSt/Q4B18L4g9iXVmE+XWKWxS/FVThWVjzLx
   TMe9kuFGMrw3G9QLfvQKXsdTwDY3XQcxR1b78pcljb47J7k0eJkJYlWjU
   KMk5583SPM6risrdlYw2DJ21hjuRcQ+8fEYUR+2QOu+x9Ngr2exEC1OWe
   W/9yyCbpc4lNdVQoPL4dk9xRrf2nzxT5mCsoYAXYhXege26Qz4sKsSgtG
   ajm5sSO3dwGPTsE5XWbOqUErvDZQUuPlCo3FFxznq77D0shi+EnYHSTM3
   A==;
X-CSE-ConnectionGUID: rVmUvdqPTHamlvnUBw33jA==
X-CSE-MsgGUID: jTv5fUeBSFqEdIkEYUkALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66517228"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66517228"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 18:26:25 -0700
X-CSE-ConnectionGUID: Team0iFbSKqfERnQjCcG/Q==
X-CSE-MsgGUID: 0W2mbKcvRo6bgWR+5Q+jtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="181742346"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2025 18:26:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ZEZ-0005P1-2Q;
	Fri, 17 Oct 2025 01:26:19 +0000
Date: Fri, 17 Oct 2025 09:25:53 +0800
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
Subject: Re: [PATCH v6 3/5] printk: nbcon: Allow KDB to acquire the NBCON
 context
Message-ID: <202510170949.NTx9lt0p-lkp@intel.com>
References: <20251016-nbcon-kgdboc-v6-3-866aac60a80e@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-3-866aac60a80e@suse.com>

Hi Marcos,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-3-866aac60a80e%40suse.com
patch subject: [PATCH v6 3/5] printk: nbcon: Allow KDB to acquire the NBCON context
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251017/202510170949.NTx9lt0p-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170949.NTx9lt0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170949.NTx9lt0p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kallsyms.c:19:
   include/linux/kdb.h: In function 'kdb_printf_on_this_cpu':
>> include/linux/kdb.h:229:63: error: expected ';' before '}' token
     229 | static inline bool kdb_printf_on_this_cpu(void) { return false };
         |                                                               ^~
         |                                                               ;


vim +229 include/linux/kdb.h

   228	
 > 229	static inline bool kdb_printf_on_this_cpu(void) { return false };
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
