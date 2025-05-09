Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35D2FB2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 04:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746763526; cv=none; b=bADWlOFoZvNV2DSFShEzhshI3wDIVkgpALncIKXqfw86zBootx9mUZYYZKpLtLHhArrz5If5Lqels3e8D2Fwa/gqiHJtz/y0QNocpgOw2dNk6BnE3R54GFBHNsfDIzbBD9/wG/jKDtpQG6mNF0uq4M9YjlX+RjpbcrLgYdzQnNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746763526; c=relaxed/simple;
	bh=Jsl2tzX90OD0kcAVU9KYY+pivFFA8MPKP1tFFI8+tiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnRKVSM3OgkQL2OuPglxSTSAukV34VRlxcvoCAjepM8f/FXekgyvNe18xRW1G0cShTUpv5s8NS3fdn4I6+TRdb3Gbd7NSM2nsA/2ucBCUmEuwAhFDC8i4/FIfPRaZOjhUNJJw3dhBGos+/RaBIneqM+avL+aC6JarG+IgwKCvH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOsTJMku; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOsTJMku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746763524; x=1778299524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jsl2tzX90OD0kcAVU9KYY+pivFFA8MPKP1tFFI8+tiE=;
  b=nOsTJMkuH9DSUtnmz+86+1EF+9Iwk+eMbfuICvpyA13aCnxrZaP5X8Zy
   qkLViuxNTtjXCdsn1+KiHowJWXl4oMmNknVsjB4UsWczsR5tJCknkLEhn
   p+N5aeTaYu9HIckSIMWRM5rDl5b2sJlH8rVrNzqO0FaCYfyMIXn1njgln
   JQavkfLmxGXtvnEemiafwVkRD81QwdW+qxTBhfSHOxXln07Y/cW8+B5p5
   PYssQnAsGNZlO6PeOcAc1wbGHF2UWcYO2gpAdXTcJfZ8zsXSjB+9UKPoD
   /8Z6HQu9VufsRIT7FnmRmsOuZ8mZ828v6+c13BbWzRNggmw0t4fO58M7Z
   Q==;
X-CSE-ConnectionGUID: wH4vTv/nRxCootWnxy3tNg==
X-CSE-MsgGUID: YyXrml0ySZ+Pnk9qTo9YzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66110948"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="66110948"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 21:05:23 -0700
X-CSE-ConnectionGUID: 25vJ59ktTyWnH4icfGp2Ng==
X-CSE-MsgGUID: LTiFe6VjQ8iokQLml2MtoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141456006"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 May 2025 21:05:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDEz9-000BeR-0W;
	Fri, 09 May 2025 04:05:19 +0000
Date: Fri, 9 May 2025 12:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Sandeen <sandeen@redhat.com>
Subject: [jaegeuk-f2fs:dev-test 186/188] include/linux/kern_levels.h:5:25:
 warning: format '%zu' expects argument of type 'size_t', but argument 5 has
 type 'long unsigned int'
Message-ID: <202505091124.QBOZcpKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   33605141d92b1eb2a5e625a79abe35856a588662
commit: 00ed768afb17ecfb7633466256f9f16514e8b421 [186/188] f2fs: separate the options parsing and options checking
config: i386-buildonly-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091124.QBOZcpKf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091124.QBOZcpKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091124.QBOZcpKf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/f2fs/super.c:8:
   fs/f2fs/super.c: In function 'handle_mount_opt':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:1883:33: note: in expansion of macro 'KERN_ERR'
    1883 |         f2fs_printk(sbi, false, KERN_ERR fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~
   fs/f2fs/super.c:766:25: note: in expansion of macro 'f2fs_err'
     766 |                         f2fs_err(NULL, "inline xattr size is out of range: %zu ~ %zu",
         |                         ^~~~~~~~


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
