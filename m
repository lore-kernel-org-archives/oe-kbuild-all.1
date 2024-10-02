Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0F33EC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727851681; cv=none; b=bd48rDqeEGC5jpAOxePOTbUw0WMi+R58HjosLVbqcuMa99FqBbncAPlW6htCUv1O1+vGrMo+ZM3pCWngnTsS0YGulMZM8HC+XClZ7XkYMqgnACbHDC50HqT3NK0XBnvz1ExmkQv4CTz6fxurPxJs2rGYJeHFqLvTKr46Mru3yVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727851681; c=relaxed/simple;
	bh=of0wEEiEZlixKsGIKMO0VaJnN1uJfE/RBmJZ9XeR2DI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LB0EVuX9QhWdEJuEN/KZc6TswOHTjHgDUzvu01ay0fVPbuLndycP+X+x726mSzMPDO9Kar2+r8d+5+p8ziLOoJ6q+Xpvar5LFPtsBmL+Wcl3Hm1voNUmJGivearccXtWbuXmHRPH8YDumEq0Ps30akjd6JalhMlkX+K37jytFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwZt/GPm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwZt/GPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727851679; x=1759387679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=of0wEEiEZlixKsGIKMO0VaJnN1uJfE/RBmJZ9XeR2DI=;
  b=FwZt/GPmmYPx22qGhos3GIRItgJCoQy5LgZ1dXBVWNIo9Ycnt030QcND
   WY/sN9mbOPyMWhKOpJmd3cXgO6b/2wk+hDQ587e86RPuWYip2iLW786J7
   74vduAjVBATdpkCuoqA2l8JMRDCOSqsrlQlH9SSQP+gRSHvOPUhyb9wxa
   w8kyPk3pWHZzIEiEWIK1roxZvU+6lA3cHozpS0ndlhKwyF+PexO1MMIr5
   3mdnmrW+aCw+auj7/tVst+/NMSDDldrdNTmLYVfW0cBU8kjaVLnEdVDqG
   agQimrGd+XE0fA9y6GlKYzShPhOiuN7oXOLPvufLApxXvOv8YIssOs2zt
   w==;
X-CSE-ConnectionGUID: xbZoHxeYSC6eMl2iYOq8mA==
X-CSE-MsgGUID: HbAYvVSWTeC0WwvkGoXIcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14632362"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="14632362"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 23:47:58 -0700
X-CSE-ConnectionGUID: 5zXFn/IOT+ysrJL0yCRJyA==
X-CSE-MsgGUID: NLknDQQvQ1Gg7dD77RdiwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="104714442"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2024 23:47:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svt9P-000Rdn-0d;
	Wed, 02 Oct 2024 06:47:55 +0000
Date: Wed, 2 Oct 2024 14:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-9p 65/65] lib/dynamic_debug.c:1172:27: warning:
 'ddebug_classmap_typenames' defined but not used
Message-ID: <202410021432.1hDRePpo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-9p
head:   4737e39b87dcdb3be9f9f5cdba373db19d0f6b38
commit: 4737e39b87dcdb3be9f9f5cdba373db19d0f6b38 [65/65] dyndbg: improve vpr_cm_info msg format
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241002/202410021432.1hDRePpo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021432.1hDRePpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021432.1hDRePpo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1172:27: warning: 'ddebug_classmap_typenames' defined but not used [-Wunused-const-variable=]
    1172 | static const char * const ddebug_classmap_typenames[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ddebug_classmap_typenames +1172 lib/dynamic_debug.c

239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1171  
5a2bcb9426eeee Jim Cromie         2022-12-21 @1172  static const char * const ddebug_classmap_typenames[] = {
5a2bcb9426eeee Jim Cromie         2022-12-21  1173  	"DISJOINT_BITS", "LEVEL_NUM"
5a2bcb9426eeee Jim Cromie         2022-12-21  1174  };
5a2bcb9426eeee Jim Cromie         2022-12-21  1175  

:::::: The code at line 1172 was first introduced by commit
:::::: 5a2bcb9426eeee4ac3000fdd8f774fb82fc4989c dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
