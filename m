Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1002D73446
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732893017; cv=none; b=VeEEFxOGHWxk5ca6wEVL1vF5VDe/r9mPTVMDwZMBfX6p+052ssG1ecQrzmLg/ZaFRLWskumtT7UOZtDzED+idvpg9qu5Ch8mcA7bUFF3oOvzgKpNhGHgqQXzrqjWeylO5i8F/D0fQ/KorxHgcpAFyJkQ2hJbIGxmHkE2RL7vGR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732893017; c=relaxed/simple;
	bh=LwouH8p2MehD8JJMYvxK38XSBQl5245GpoOEslQ7ruc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aI2Fmg4zL3VpP79xX0wa+ajPtFsKeku/V1g8GMhTNIUtIIj9k6BNsN32cfmlQfhMZJgQfAt/p7162X+UvvP4/eb/8lSWWrhnucb2CuuM5sZauIo6x1Vgu8rUtHEqPXqnzmSMbR55l60eThTdZtrYUuqL9WVnCi5MvbgKzbWgfBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjHIVSyL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjHIVSyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732893015; x=1764429015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LwouH8p2MehD8JJMYvxK38XSBQl5245GpoOEslQ7ruc=;
  b=TjHIVSyLkIWGHBYC0DCOncPz7ya/cOF8ONYJoDHiIsrDpTTxWZGZs2ik
   wV0Dhs6N6r8ibiS/D9Wfu1DW0RyTEiNNKmYXs1bbY2tEC110U5R+OmWuO
   0fa+Mpf9DIh9Q/QydcOxwWJudR/KAg+yVLdnLbVUGPD7oTbsG6o94lgro
   U09ljsTcNrfpPR8d+qL1NPqBTm5MfAO/DBPzxlPcdH158tQPt8pzitWzq
   RsbZb2RT6cBkNE0Ap0fD0zKjxviWkbKq8FWBr2H1GjBILtFWVQIdbuh/I
   qLok6Z4GsErQ34JoiaKeEJ6fUsZK+K+q7bai5L8RPuuw5KcPXTKx35KJk
   A==;
X-CSE-ConnectionGUID: LE/bStqdS1Skn4AvMLhTOA==
X-CSE-MsgGUID: aTgUWwrjS9qcFRnK7gd9zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32877044"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="32877044"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 07:10:14 -0800
X-CSE-ConnectionGUID: 6hRK7IUZSwm/ZD0q/YRw8w==
X-CSE-MsgGUID: A0xIVJ0MSMqBaSt0eZxrow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="123476173"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Nov 2024 07:10:12 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH2dF-0000RB-32;
	Fri, 29 Nov 2024 15:10:09 +0000
Date: Fri, 29 Nov 2024 23:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.pidfs.file_handle 3/10]
 include/linux/compiler_attributes.h:214:41: warning: attribute 'fallthrough'
 not preceding a case label or default label
Message-ID: <202411292302.0pUcnXME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.pidfs.file_handle
head:   28fe9a5f28db692c91dd904de7c54105bf8130d7
commit: 94c9a56ad3521a28177610c63298d66de634cb9d [3/10] pidfs: support FS_IOC_GETVERSION
config: sh-sh03_defconfig (https://download.01.org/0day-ci/archive/20241129/202411292302.0pUcnXME-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411292302.0pUcnXME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411292302.0pUcnXME-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/pidfs.c: In function 'pidfd_ioctl':
   fs/pidfs.c:268:9: error: duplicate case value
     268 |         case FS_IOC_GETVERSION: {
         |         ^~~~
   fs/pidfs.c:266:9: note: previously used here
     266 |         case FS_IOC32_GETVERSION:
         |         ^~~~
   In file included from include/linux/compiler_types.h:89,
                    from <command-line>:
>> include/linux/compiler_attributes.h:214:41: warning: attribute 'fallthrough' not preceding a case label or default label
     214 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   fs/pidfs.c:267:17: note: in expansion of macro 'fallthrough'
     267 |                 fallthrough;
         |                 ^~~~~~~~~~~


vim +/fallthrough +214 include/linux/compiler_attributes.h

294f69e662d157 Joe Perches   2019-10-05  201  
294f69e662d157 Joe Perches   2019-10-05  202  /*
294f69e662d157 Joe Perches   2019-10-05  203   * Add the pseudo keyword 'fallthrough' so case statement blocks
294f69e662d157 Joe Perches   2019-10-05  204   * must end with any of these keywords:
294f69e662d157 Joe Perches   2019-10-05  205   *   break;
294f69e662d157 Joe Perches   2019-10-05  206   *   fallthrough;
ca0760e7d79e2b Wei Ming Chen 2021-05-06  207   *   continue;
294f69e662d157 Joe Perches   2019-10-05  208   *   goto <label>;
294f69e662d157 Joe Perches   2019-10-05  209   *   return [expression];
294f69e662d157 Joe Perches   2019-10-05  210   *
294f69e662d157 Joe Perches   2019-10-05  211   *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#Statement-Attributes
294f69e662d157 Joe Perches   2019-10-05  212   */
294f69e662d157 Joe Perches   2019-10-05  213  #if __has_attribute(__fallthrough__)
294f69e662d157 Joe Perches   2019-10-05 @214  # define fallthrough                    __attribute__((__fallthrough__))
294f69e662d157 Joe Perches   2019-10-05  215  #else
294f69e662d157 Joe Perches   2019-10-05  216  # define fallthrough                    do {} while (0)  /* fallthrough */
a3f8a30f3f0079 Miguel Ojeda  2018-08-30  217  #endif
a3f8a30f3f0079 Miguel Ojeda  2018-08-30  218  

:::::: The code at line 214 was first introduced by commit
:::::: 294f69e662d1570703e9b56e95be37a9fd3afba5 compiler_attributes.h: Add 'fallthrough' pseudo keyword for switch/case use

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
