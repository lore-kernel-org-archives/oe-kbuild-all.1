Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1F13FE4A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725679887; cv=none; b=DGNzlzGZJI/zIat8IG6bkNCDaIKnQfcqsl+q7mwWMmB4Og59nJFzUNSOo2zIV7u8JkJPYBs8porp4Qc4tg2GvtORMf3zvnXkNuVuxZqBUl8XXcOgRBjB6RHmojsbEngSGwidIEv3BPn4fPrsqnmtUSh50Ok1XscVAIcOyL2QR6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725679887; c=relaxed/simple;
	bh=hEGaHKODjVXh1NimtLs72WsXNCmMTIIkMZXiMa9laZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5IHuT5E3UU09XN/q8H2EqLujSYz60US9jxAi7qlaziLSsrfs/jyKLQ62naF5yvrF0NU8oYqIC12nAodbsz2BsgDCKeGifRiMbmpvjiVdhat0tvAd771J1oOuFukukk+Xx1NAgcDHkFGTXH5tsQigRSYdd3ym+6ZKTnkFYqAKmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OArpqpUw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OArpqpUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725679883; x=1757215883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hEGaHKODjVXh1NimtLs72WsXNCmMTIIkMZXiMa9laZQ=;
  b=OArpqpUwU2d8iflGywQ2NpjdqcW1awU534SOLnLOrEUygdswOfgkHwoo
   GMGyj6VvVj2+X6PkdUY/R18knOy1/Ak9kmiUH3Ao8k48Y4Z7bzZDLgXux
   M+LlKHajnpK7B1Hqug0qv5d+UVCC1JzaCYTrbbTl6ELiJR2iYuBv3CQcz
   tix5KlagjfckzZ/GZEtzSrI3kI/ysE6wpAECsBVo6rLrGT5TRlSoUjflz
   chUTJ8M2uDaZ3XIW6mvgrZdOxVgCa6C7rvZR5tptWpusoAyZhPBLbF47z
   oNGr5Q7nb0yRUq06TkWm6/sI7g9vVafk+XK0VoGf6Us0x9U8SCnw8KGDF
   Q==;
X-CSE-ConnectionGUID: mMI8xjTmRqWeFq0/hzvM6Q==
X-CSE-MsgGUID: pVK7LQmjTiK7YrZSvBn4SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35115593"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="35115593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 20:31:17 -0700
X-CSE-ConnectionGUID: YcjMdzw1SKGwwAHhN3ztFg==
X-CSE-MsgGUID: aDYgvrRLQsGKPCVLdQexNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70928207"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2024 20:31:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smmAJ-000C5q-0J;
	Sat, 07 Sep 2024 03:31:11 +0000
Date: Sat, 7 Sep 2024 11:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: KobaK <kobak@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	James Morse <james.morse@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3] acpi/prmt: find block with specific type
Message-ID: <202409071110.LWdX8txQ-lkp@intel.com>
References: <20240905124950.512973-1-kobak@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905124950.512973-1-kobak@nvidia.com>

Hi KobaK,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/KobaK/acpi-prmt-find-block-with-specific-type/20240905-205316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240905124950.512973-1-kobak%40nvidia.com
patch subject: [PATCH V3] acpi/prmt: find block with specific type
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240907/202409071110.LWdX8txQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071110.LWdX8txQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071110.LWdX8txQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from drivers/acpi/prmt.c:17:
   drivers/acpi/prmt.c: In function 'acpi_parse_prmt':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 2 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/acpi/prmt.c:161:25: note: in expansion of macro 'pr_warn'
     161 |                         pr_warn(
         |                         ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects a matching 'long long unsigned int' argument [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/acpi/prmt.c:161:25: note: in expansion of macro 'pr_warn'
     161 |                         pr_warn(
         |                         ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
