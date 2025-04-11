Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6533A2980BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360550; cv=none; b=kt0lrWRy2W5djx0Wvig02UbC/zTniDlJ7LTIwDaqYSkRTyi2277VY5pFyd2343xdokmi3qM4KE3O70OPIDJVh5KY6+9pBfN5KXPutgb4iKyTqEAajoVhbqym2kGyY9ByAfSf+IsVRqklE98LKXj2c/OyPsasiOrzuydKOWpIKqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360550; c=relaxed/simple;
	bh=Eadcx4K+SsAUyjlF8+nEgRcc57JUhMmddp9bctt373c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4iw9Zl2i++8QLV5vIw4duPFvng2HOMfh+nOpRCY+/71cs2mqMHibfDegU6W/a7RHcVEQB6t97s/QiAXVRL0rdyfsYgZA9HIKKAiPWwWgldgsCIBWe0clWracXNwh5aAjVbtYF/16s+CKCqtgTnlud9SLxGFzLCM5rbX7xGdBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JB5RcDv4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JB5RcDv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744360548; x=1775896548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eadcx4K+SsAUyjlF8+nEgRcc57JUhMmddp9bctt373c=;
  b=JB5RcDv4QptYVzVmD88n7rfvUMwTESn65dkvOcefxF+HfTHV5l67ZLkc
   ymW826LcqTOFhH9Q1IJmPqM8uUT70i+CTH0AbUe1oLTZlm/OuLtvTyIeo
   GicmTYq2O4U22ypymBIpYEQtgZiljREVcc4UNJDVedFJfNTQTL9jVgJsg
   N2v1kUmcjbIOavOmOmO47vPospN6juujsZZKPPY/ElU4FjfXUMVI+vsIa
   hE4szIXBIx/iA2wwe+M21Ocg1uiGl2wx7EhGtTrqoaPwVw3XxKWYb4KZK
   6qJw/4fjfPsRyKXgYzrNuKj9ZdzmruzP+Zqu/mdID4UHKugZQfVplUdWx
   A==;
X-CSE-ConnectionGUID: r/lmmynoTCmrqT3pT2FnZg==
X-CSE-MsgGUID: hyyallysTS+2DGRRy+0N/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45996180"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45996180"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 01:35:47 -0700
X-CSE-ConnectionGUID: E9/Bj0QnQJaovpN6fiSFQw==
X-CSE-MsgGUID: 17mtILQQQHqEpXVgb5Xo4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129980390"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2025 01:35:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u39rU-000Aya-2g;
	Fri, 11 Apr 2025 08:35:44 +0000
Date: Fri, 11 Apr 2025 16:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9]
 include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of
 type 'long long unsigned int', but argument 4 has type 'long unsigned int'
Message-ID: <202504111642.jl7pjXlF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chench,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   3f289cd2c7119736d845477dac96f23814d0144f
commit: 38d334cd4bdc6f3ac60b1e1a7e8671d6918f6618 [9/9] anolis: crypto: tdm: Add Hygon TDM driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250411/202504111642.jl7pjXlF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111642.jl7pjXlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111642.jl7pjXlF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/tdm_hygon.c: In function 'list_enqueue':
   drivers/crypto/ccp/tdm_hygon.c:85:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      85 |         int ret = 0;
         |             ^~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/crypto/ccp/tdm_hygon.c:10:
   drivers/crypto/ccp/tdm_hygon.c: In function 'tdm_verify_phy_addr_valid':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:343:16: note: in expansion of macro 'KERN_ERR'
     343 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/crypto/ccp/tdm_hygon.c:387:25: note: in expansion of macro 'pr_err'
     387 |                         pr_err("phy_addr: 0x%llx, length: 0x%llx beyond max_pfn: 0x%llx\n",
         |                         ^~~~~~
   drivers/crypto/ccp/tdm_hygon.c: In function 'psp_create_measure_task':
   drivers/crypto/ccp/tdm_hygon.c:575:27: warning: variable 'head' set but not used [-Wunused-but-set-variable]
     575 |         struct list_head *head = NULL;
         |                           ^~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
