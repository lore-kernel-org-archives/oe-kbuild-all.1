Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E01DE2A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755946985; cv=none; b=uReV9tQimk7CgFFHv2vlH7BEIJPDsK8l+r7iKXmG1996U33xJc/2aSr3yvGUVTljGhd+veLc8n4hz1dCNioXbPx0613NoHsVRGOkr4GRG7Z+Jo1+dwqREZ/dCi9Q3xXgZPdehN8dN1+/uJDfGWH1uh9df/oFR7We1K6kvL4sQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755946985; c=relaxed/simple;
	bh=e9psdPo9h96ebAI3qRwD62+FOZYxF7oX0eXJbHz+n20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exptoB5tmzsCvsSKbRPoP7QDI6cnGy5KE1Hl1vMBK4RiQzHusrdyQvW1Det4pwEqM/L1cW4f3Wpogtfe+JDbKw16ZMqT3njAjT37I9BN/wrty4VNr4jOQm19Ih/ESpwG/HeUF4h+8zZ2OIWACSQ+BWVgdPlUIxLtd7/glF5Ctpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMFYG2Cw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMFYG2Cw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755946983; x=1787482983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=e9psdPo9h96ebAI3qRwD62+FOZYxF7oX0eXJbHz+n20=;
  b=HMFYG2CwJy202bKVKtd7skCCqgfpWZFAuIG8XihtzShAW6iMWleR2+Vq
   0vJC+C9gQIRBmDNzWWLP954ajSKZmQX2KaM69bnj4wYWm7XzH6kVKjfzZ
   nm10dbjnq+O69DUUGUV5CosBJotJWHA0H8FWVE1WWelxASdKWGdciB7So
   nNABEr9N9RaEXdhauZgczGsJGSWaAvAlggtVXSOXG53gLr3y1uUoJe0am
   kMU1OfZ+44xClKWfEurKFiH808huMZkUONRRcmNeVy3saqh5jYCpZVKxD
   BQChJVnAGNpYuO1i4R7MG4nULdfrhCuXstAGQEIclhJ8Bi6xgKEFcM9Om
   g==;
X-CSE-ConnectionGUID: qa3k1OaxRdejFrEpHL704A==
X-CSE-MsgGUID: W4vepvsJRduSufOYQG57Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58332599"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58332599"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 04:03:03 -0700
X-CSE-ConnectionGUID: 3SOUM+UGRsiceXCCSSdWOA==
X-CSE-MsgGUID: 0hLEFP/SSXeunyS3XSiZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168121476"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Aug 2025 04:03:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upm1T-000MGX-05;
	Sat, 23 Aug 2025 11:02:59 +0000
Date: Sat, 23 Aug 2025 19:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/2] fs: Add O_DENY_WRITE
Message-ID: <202508231845.DezhAKqJ-lkp@intel.com>
References: <20250822170800.2116980-2-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822170800.2116980-2-mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/fs-Add-O_DENY_WRITE/20250823-011253
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250822170800.2116980-2-mic%40digikod.net
patch subject: [RFC PATCH v1 1/2] fs: Add O_DENY_WRITE
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20250823/202508231845.DezhAKqJ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231845.DezhAKqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231845.DezhAKqJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/fcntl.c: In function 'fcntl_init':
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_363' declared with attribute error: BUILD_BUG_ON failed: 21 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC)
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/fcntl.c:1183:9: note: in expansion of macro 'BUILD_BUG_ON'
    1183 |         BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_363 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
