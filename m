Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0122F743
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396065; cv=none; b=KKKyljqdCnnL9wAzTmKhi4c7gEzfM3hJQCwMkm1AxwtYUCMPPB+lJNXZfypKYJbnLxFCdA9bx+ffxf1BF0DJb0lI7TVIiuf7dAfEsKxgYOth/rDsP/k0Go9iQbAmvxlQvAC4A3CZcWFYsgatMvbeV7Pvb4yskSg3XSV9l/3i2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396065; c=relaxed/simple;
	bh=YmE7pTIWSrIaL52wscruuQijm6J53UfirV4ZwY/otfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qehfyjZXjKB2LtzRlUEUcHnWXKdbfKU1HL9dtRpyT6lhpqwwEoAghfL2UEynDEZi2WrJIRaRdk0UhHZgXtnn2d4VW4WI4XaMNk+ViA1eCSvm0MFDqWgKb2tFY3q5dL4hnQqOqsDQoR6dn8yfYwCtsjzfYNkOYvTYFKIqQ0zqT5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJMuWqjm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJMuWqjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747396063; x=1778932063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmE7pTIWSrIaL52wscruuQijm6J53UfirV4ZwY/otfg=;
  b=RJMuWqjmvF0dlcc09yod3KdD/RyrZnGNnct71fMB34yZSI4YeD20eb+X
   GDMtW0tnoa/M9J9nq5T4ekjES0wnOmoTxMQjSxDO1CNVhO+xL2pO3q0cY
   zr40gC7Oqq3thtsvZM2FD+MIFB98lmpbJ3MdfTbXsvGqjMTVZPr2UzPnS
   aH7QStbIKqQoi1mmnudMU2d+vrynsR2nJ3IsA+0fXuee3pIjErbQTZ1jQ
   QJqfA31yLXlrB0iUya6tlqLQ1yQXnjTk6jbPF65S+DwvBvqeHFdkw35A4
   jURj5ogAmB4cRTMhmCx5iFBdMLHIMz2Rn1m50mMVJ83Xq5VyY1zeXqAAG
   A==;
X-CSE-ConnectionGUID: G/Hj/7fDRJS65fY+ozzwtg==
X-CSE-MsgGUID: rhyJvlYrT4CU52N9VN89BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49291968"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49291968"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 04:47:42 -0700
X-CSE-ConnectionGUID: yWsYvzMcSPKyFM31a4YbFw==
X-CSE-MsgGUID: 3tI6PKGtST6bilQrMfcSpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="143443859"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2025 04:47:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFtXK-000JIt-1v;
	Fri, 16 May 2025 11:47:34 +0000
Date: Fri, 16 May 2025 19:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 5/5]
 include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of
 type 'long long unsigned int', but argument 4 has type 'long unsigned int'
Message-ID: <202505162133.XQMOpTSj-lkp@intel.com>
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
head:   bfc84bc1ba93833ad3fd1e370a33e511711611a6
commit: 38d334cd4bdc6f3ac60b1e1a7e8671d6918f6618 [5/5] anolis: crypto: tdm: Add Hygon TDM driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250516/202505162133.XQMOpTSj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505162133.XQMOpTSj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505162133.XQMOpTSj-lkp@intel.com/

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

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
