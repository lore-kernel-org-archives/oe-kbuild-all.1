Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0770B3D9680
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 02:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700086; cv=none; b=TfmXQnyGO1uSlCmSfgJHjCWVpkp6k3itGicmvB/8l4Drgu0ub41F5jmdPg9K+pisLhlVyxcO6Hz7CUfHo+9N6iWtM009BZxVc5xHUyuLDDTIHYvSV2rKhp2NRmqUP3fSYwV4UM6paBVf44fLY2DmeXKMmMi+D5Uujc4UNWsXsTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700086; c=relaxed/simple;
	bh=Z8ozqusZk17HjQmWAcx89RnvlLeDZDi78logoGTcMi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r5NA9TKE+5Z1wy6vmkcgkOh11YWVzEDbHUjepF6G/jhjJF+0fXVP37vOw5zYuZldiKict7QJzzRe+NgqOKuRhidDP9LmdOTJbq7OPE/EMqN3Z8LfLhuuMyHmK0A/6+ddWOGajWnf3uBVGA5MtKLNu1uH4yzY5hiG9gQP8jL5Ahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZesFAuP; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZesFAuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789700080; x=1821236080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8ozqusZk17HjQmWAcx89RnvlLeDZDi78logoGTcMi8=;
  b=DZesFAuP/xYbHYI7L5zw6St/aJ5L7Z1pHzkRIGU4ancE4K/1PNYrSJQl
   aWcEfZAUlq/SfmHLBfyqXSznHVlyHsHBWwOh/espdY9dc47GdkQ+mePX0
   Fi56KrrbTePOuDbwpDulh8XnbNt2S8rhGx1FiGjKTQ55i4bE6kEs33Rvm
   2RK+CMDULCXMh80rhMicU9E3qu36VwgYgejMEnfNYjq3FCq6AMCs3m9ix
   gmZxiYtC2AwrlBzFTYbn8VDfTfaXrodtXXMOEeNmHSXWDbF8JDL/IELN9
   RfNy8Lrec/NmjJ7ivZ2FxoETV8dag6yaY52A8zwaw9PwOqHY77qMDMP2h
   A==;
X-CSE-ConnectionGUID: 1N+QtIl7SA6e25hmsLk82w==
X-CSE-MsgGUID: /PXszjJNRXifiEdnvVh5/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="682667"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="682667"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 19:54:36 -0700
X-CSE-ConnectionGUID: TNZBcP34SgmZ8PRXSFQuqA==
X-CSE-MsgGUID: j7Os3K/WQiqOswe8btBgWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276123285"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2026 19:54:34 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7OkC-000000000wm-1x1x;
	Fri, 18 Sep 2026 02:54:32 +0000
Date: Fri, 18 Sep 2026 04:54:08 +0200
From: kernel test robot <lkp@intel.com>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 35/41]
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:49:23: warning:
 variable 'authlen' is uninitialized when used here
Message-ID: <202609180411.0EXbMCVf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   6dd5dfdc96dd33a94f3bf2135d2dcb14f3661d1e
commit: 5714a846afa8d7b8363aa134d4acbd129f68d049 [35/41] platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth token
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260918/202609180411.0EXbMCVf-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180411.0EXbMCVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180411.0EXbMCVf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:49:23: warning: variable 'authlen' is uninitialized when used here [-Wuninitialized]
      49 |         size = sizeof(u16) + authlen * sizeof(u16);
         |                              ^~~~~~~
   drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:44:22: note: initialize the variable 'authlen' to silence this warning
      44 |         size_t size, authlen;
         |                             ^
         |                              = 0
   1 warning generated.


vim +/authlen +49 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c

b2715aa2e1352c Jorge Lopez 2023-06-08  33  
b2715aa2e1352c Jorge Lopez 2023-06-08  34  /**
b2715aa2e1352c Jorge Lopez 2023-06-08  35   * hp_calculate_security_buffer() - determines size of security buffer
b2715aa2e1352c Jorge Lopez 2023-06-08  36   * for authentication scheme
b2715aa2e1352c Jorge Lopez 2023-06-08  37   *
b2715aa2e1352c Jorge Lopez 2023-06-08  38   * @authentication: the authentication content
b2715aa2e1352c Jorge Lopez 2023-06-08  39   *
b2715aa2e1352c Jorge Lopez 2023-06-08  40   * Currently only supported type is Admin password
b2715aa2e1352c Jorge Lopez 2023-06-08  41   */
b2715aa2e1352c Jorge Lopez 2023-06-08  42  size_t hp_calculate_security_buffer(const char *authentication)
b2715aa2e1352c Jorge Lopez 2023-06-08  43  {
b2715aa2e1352c Jorge Lopez 2023-06-08  44  	size_t size, authlen;
b2715aa2e1352c Jorge Lopez 2023-06-08  45  
b2715aa2e1352c Jorge Lopez 2023-06-08  46  	if (!authentication)
b2715aa2e1352c Jorge Lopez 2023-06-08  47  		return sizeof(u16) * 2;
b2715aa2e1352c Jorge Lopez 2023-06-08  48  
b2715aa2e1352c Jorge Lopez 2023-06-08 @49  	size = sizeof(u16) + authlen * sizeof(u16);
b2715aa2e1352c Jorge Lopez 2023-06-08  50  	if (!strstarts(authentication, BEAM_PREFIX))
b2715aa2e1352c Jorge Lopez 2023-06-08  51  		size += strlen(UTF_PREFIX) * sizeof(u16);
b2715aa2e1352c Jorge Lopez 2023-06-08  52  
b2715aa2e1352c Jorge Lopez 2023-06-08  53  	return size;
b2715aa2e1352c Jorge Lopez 2023-06-08  54  }
b2715aa2e1352c Jorge Lopez 2023-06-08  55  

:::::: The code at line 49 was first introduced by commit
:::::: b2715aa2e1352c0060b9dcba57a2e465bbfbcd68 platform/x86: hp-bioscfg: spmobj-attributes

:::::: TO: Jorge Lopez <jorge.lopez2@hp.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
