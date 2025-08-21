Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76352335C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 00:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735770; cv=none; b=RyuqnkBMEh+X1iBYKqNr3q+VhXov2hTajh5bb32BAV8dULX6L715p6fD66LE66XUImJigvLbLkrfK7dAJQDpOeaacvDeXBhSoBkg6/Rgipq8YNYFoL0zqjGlJkv+5yweZQnrcSM4UDM5zG11IQyZbs9LCf44iiBIi6TnkHPP6uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735770; c=relaxed/simple;
	bh=LpOcXy5DrjzHodiT3Hx8CosWS3R/K12lpjNRrUSGGtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSRlzIJq9e0qX1I2cWT3/ndCHk78GNnQx18fnuvLCX/r2OIxfWQKmap4FS36QeYPZnern5HjNqqMFgq0mOJR6FdzJQ5HQ7PLe5IIMkmiw1ZU1RFjak4D+OQPpmzHZXjCKhxBbEKNE8PrRtl3lKP0frqcKaby1E9XhWmIJvfdfUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIjYfV/Y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIjYfV/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755735769; x=1787271769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LpOcXy5DrjzHodiT3Hx8CosWS3R/K12lpjNRrUSGGtg=;
  b=TIjYfV/YgKBsJo4CZyOY42qWDEMjUfL2Xrs6XbsivadiYPd5rGZUkibO
   ut8XW7a6wJr6eCEH5J3fxVPkh4n9+GmUc42rDiQUKNhBKz/h77XPCmym8
   ci2zplO3/QDI6W5B0UDGslZiMBr5JPh3kAAHhaSzehWt6DkG2XMBjdBVt
   nuJ+X0TDAEmQ7P74XSIFzgcNEJi8IAgLXLdsSZyE2vSH5lTydxLUqcoHb
   rO5Etp8RcUUatwuORSqxsQL6lsQLfkrrqoK3GtOqBgwyOjvM++Z+xA7vo
   5DR0yIgflZMQzf03g4otcZbSEYxryF7vzK/E86aAfe1HgdmKUYYxST07L
   g==;
X-CSE-ConnectionGUID: 0KHlIxH7TJOariNOUuN8AQ==
X-CSE-MsgGUID: Fno2Nwi7RAKOfLOF3WguPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57873884"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57873884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:22:48 -0700
X-CSE-ConnectionGUID: D47DEIQkQru8R4bA6tSFUQ==
X-CSE-MsgGUID: cT2KMNpAT9+BOhWJ15B1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="169057024"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 20 Aug 2025 17:22:46 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uot4m-0001dP-1M;
	Thu, 21 Aug 2025 00:22:44 +0000
Date: Thu, 21 Aug 2025 02:22:19 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuiqing <zhoushuiqing2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3135/3135] security/integrity/ima/ima.h:381:51:
 warning: 'struct ima_digest' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202508210200.kPc9kAup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   28d3b936dc6be28156ddfb85879ccdf7b3cf2ded
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [3135/3135] ima: Add macros to isolate the IMA digest list
config: x86_64-buildonly-randconfig-2002-20250820 (https://download.01.org/0day-ci/archive/20250821/202508210200.kPc9kAup-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210200.kPc9kAup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210200.kPc9kAup-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_init.c:19:
>> security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared inside parameter list will not be visible outside of this definition or declaration
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^~~~~~~~~~
--
   In file included from security/integrity/ima/ima_asymmetric_keys.c:13:
>> security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared inside parameter list will not be visible outside of this definition or declaration
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^~~~~~~~~~
   security/integrity/ima/ima_asymmetric_keys.c:27:6: warning: no previous prototype for 'ima_post_key_create_or_update' [-Wmissing-prototypes]
      27 | void ima_post_key_create_or_update(struct key *keyring, struct key *key,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from security/integrity/ima/ima_main.c:30:
>> security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared inside parameter list will not be visible outside of this definition or declaration
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^~~~~~~~~~
   security/integrity/ima/ima_main.c: In function 'process_measurement':
   security/integrity/ima/ima_main.c:433:30: error: too few arguments to function 'ima_appraise_measurement'
     433 |                         rc = ima_appraise_measurement(func, iint, file,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima.h:373:19: note: declared here
     373 | static inline int ima_appraise_measurement(enum ima_hooks func,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +381 security/integrity/ima/ima.h

273df864cf7466 Nayna Jain            2019-10-30  372  
4ad87a3d7444de Mimi Zohar            2016-01-14  373  static inline int ima_appraise_measurement(enum ima_hooks func,
d79d72e02485c0 Mimi Zohar            2012-12-03  374  					   struct integrity_iint_cache *iint,
2fe5d6def1672a Mimi Zohar            2012-02-13  375  					   struct file *file,
d3634d0f426bde Dmitry Kasatkin       2013-04-25  376  					   const unsigned char *filename,
d3634d0f426bde Dmitry Kasatkin       2013-04-25  377  					   struct evm_ima_xattr_data *xattr_value,
39b07096364a42 Thiago Jung Bauermann 2019-06-27  378  					   int xattr_len,
e94df9b790f7ed Zhou Shuiqing         2023-09-06  379  #ifndef CONFIG_IMA_DIGEST_LIST
a44c2ae6cac55b Roberto Sassu         2021-03-03  380  					   const struct modsig *modsig,
a44c2ae6cac55b Roberto Sassu         2021-03-03 @381  					   struct ima_digest *found_digest)
e94df9b790f7ed Zhou Shuiqing         2023-09-06  382  #else
e94df9b790f7ed Zhou Shuiqing         2023-09-06  383  					   const struct modsig *modsig)
e94df9b790f7ed Zhou Shuiqing         2023-09-06  384  #endif
2fe5d6def1672a Mimi Zohar            2012-02-13  385  {
2fe5d6def1672a Mimi Zohar            2012-02-13  386  	return INTEGRITY_UNKNOWN;
2fe5d6def1672a Mimi Zohar            2012-02-13  387  }
2fe5d6def1672a Mimi Zohar            2012-02-13  388  

:::::: The code at line 381 was first introduced by commit
:::::: a44c2ae6cac55bdcc0d33f62600233ea0f3f6688 ima: Add support for appraisal with digest lists

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
