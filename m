Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541EB3D38D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710326631; cv=none; b=H0dy4qtC2B+O8z9xcfYfNLo2EoWw87/LuOj9LU/gvPiTEFYEZt/+hz8LVz08N0Ii/YVVTUmEXWr4KyQZRAxQqpKgDBbUPHwP3IkUKNr7dOjmA1+7+Gsdd+pEsLXIWhuOniSKlbXzy7oAxXziXzdTHWjAxciUovh3NPBmCPYPiRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710326631; c=relaxed/simple;
	bh=gEppbyG4qtw7JZw3iiLeNi9lT7CPEASQXeZKWF8MCfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rth9DFeToysPiAyWbrwVjpKjpyKMaWIzGWDcNTFAomvPl7iennngV09oT/j4O+D/WKwEcBEAMiOrpUKr7fd4CnrjraPmakS+ycWeZhYWG8ueaiBw5IMtNJW/20A29DsM6EmNlu0NizWskNZYQoSc3qGi0ag1iYDisgJEv1bAFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGdUulE3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGdUulE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710326629; x=1741862629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gEppbyG4qtw7JZw3iiLeNi9lT7CPEASQXeZKWF8MCfI=;
  b=HGdUulE3Ch1t0V4kfZmL24pdyE2hwoK11+RrKt9Fv2sphJMkWiV+gKrU
   /rdnLUHq5X/31N0O3LyD3O/tSFs+6EvmjpRZB1luF+ZWAMbNyd0DRqw0D
   ek+r/NqQUINzmUyk9S2YGjkclA2Jqkrldep/ZyMtodu80fDWSza3gGVHp
   Dv5PVI1V7DgVYa6huid2S18yH6rPv2IX7b6o+qu2fH+u5I3cjEKGaV7Dh
   MzVtdOCK4VxF/m36pCBac5aJDK8pkZXCce/YoZAlQS5D/jvTNN6Cx/CR/
   ZbkPwF6g1F/IktH1TMiqx9B/6CpVgGRUG7AH1HzUy1PJg3yulmqPRiJeW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5252032"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5252032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 03:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="16452335"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2024 03:43:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkM5G-000CHf-2Z;
	Wed, 13 Mar 2024 10:43:42 +0000
Date: Wed, 13 Mar 2024 18:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>,
	herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ruud.Derwig@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
Subject: Re: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202403131810.zpesoKjk-lkp@intel.com>
References: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.8 next-20240313]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-driver-to-Linux-kernel/20240305-193337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240305112831.3380896-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
config: csky-allyesconfig (https://download.01.org/0day-ci/archive/20240313/202403131810.zpesoKjk-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131810.zpesoKjk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131810.zpesoKjk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/dwc-spacc/spacc_core.c:2835:56: warning: 'reg_names' defined but not used [-Wunused-const-variable=]
    2835 | static const struct { unsigned int addr; char *name; } reg_names[] = {
         |                                                        ^~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:984:26: warning: 'names' defined but not used [-Wunused-const-variable=]
     984 | static const char *const names[] = {
         |                          ^~~~~
   In file included from <command-line>:
   In function 'spacc_sg_chain',
       inlined from 'fixup_sg' at drivers/crypto/dwc-spacc/spacc_core.c:1115:4,
       inlined from 'spacc_sgs_to_ddt' at drivers/crypto/dwc-spacc/spacc_core.c:1144:16:
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_252' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_DEBUG_SG)
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:416:25: note: in definition of macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:1082:9: note: in expansion of macro 'BUILD_BUG_ON'
    1082 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_DEBUG_SG));
         |         ^~~~~~~~~~~~
   In function 'spacc_sg_chain',
       inlined from 'fixup_sg' at drivers/crypto/dwc-spacc/spacc_core.c:1115:4,
       inlined from 'spacc_sg_to_ddt' at drivers/crypto/dwc-spacc/spacc_core.c:1252:15:
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_252' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_DEBUG_SG)
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:416:25: note: in definition of macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:1082:9: note: in expansion of macro 'BUILD_BUG_ON'
    1082 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_DEBUG_SG));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_252 +435 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  421  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  425  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  427   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  428   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  429   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  430   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  431   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  432   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  433   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  434  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @435  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  436  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
