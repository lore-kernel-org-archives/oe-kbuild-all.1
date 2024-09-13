Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5C1B12F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 03:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726199143; cv=none; b=frPaY+etE1OX6h/Ei9fTkfaIxrFoLXHCVnypBN8ebr8R3yCumKJoAxlIk4Zgw+eTDjwW2SgtEf3pLxIfh0ElvlkRI+pXW/F1STvwY8pM5HaoGfYt1a7C/EVkzewjptSABzxrrfn/VsL4R4TeDi6jBilfxcNO47RIcntJN2xUOfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726199143; c=relaxed/simple;
	bh=8yAgBAvBCQm9sOnQ6ccHw3KiQz9jzleR013szOuc37k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7zpE1LBVH37jU6Y4mgXnLVuDd+doHzl3UAncsv0aZgCG4ubHL6V2ZkddFHFQAUWEqSKIjqRSduP2PLAFZB42ftFAhy5ZgiXUYJOe66avwrnoPl7LtTgiJfZyKFx+4bfX9Qf8Lkabz2965DpPAcJC2AF/ps4c2AqJ6/xv40fyuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gn5u1bQ2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gn5u1bQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726199141; x=1757735141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8yAgBAvBCQm9sOnQ6ccHw3KiQz9jzleR013szOuc37k=;
  b=Gn5u1bQ2sMY6RpHX0M3DIrzITJQ+nWGcxtXwQflyGG+ROhLCoPRlIfGq
   U0FlgDdCrggLpVc4F59KAgVEoKMC7WHaoelEi/fTsQZQ4aGjlRXEvuV/A
   wMFJBdZlwOScGJy2OB9hXGxBg0MXTUa3WUs/lOGurxJtPUZFSnNjT0j/b
   VGCcu+Y08byBmEHx0ruuKP76KMFzaOXaR7d9CEQcIYZcXAfC3yPpuE4zl
   QO5vyvpEaHSnRfJqB7hIJSeIXnwgiwA+6NGoGBo/zEOrgeMdCVhmgWb22
   0EpcOw7RPFCNxv1k/xgcpkF0FcUU+EZA8EJzvxVy8phs3ooNBcU9dV8Ks
   g==;
X-CSE-ConnectionGUID: 52iosI09R1eTB2Xsy5ztmQ==
X-CSE-MsgGUID: PsDBbH11TBOnEp1Driu9vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36465826"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="36465826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 20:45:41 -0700
X-CSE-ConnectionGUID: gFcV9NOMSqCYquCroG1BuA==
X-CSE-MsgGUID: vzmcTH3KRqKn4MHTg4Ynlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="72726583"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2024 20:45:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soxFS-0005yO-0w;
	Fri, 13 Sep 2024 03:45:30 +0000
Date: Fri, 13 Sep 2024 11:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lujunhua <lujunhua7@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6858/13930]
 drivers/char/ipmi/ipmi_bt_sm.c:194:11: error: call to undeclared function
 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202409131136.eKUhVyYX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Devyn,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   13706c950ff941dc015e16f76812077f9861e378
commit: 6449ff7a5a2b148bc0a60efb3f0d723aaeceaae6 [6858/13930] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-randconfig-002-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131136.eKUhVyYX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131136.eKUhVyYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131136.eKUhVyYX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/ipmi/ipmi_bt_sm.c:194:11: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     194 |         status = acpi_evaluate_integer(handle, "SATN", NULL, &tmp);
         |                  ^
   drivers/char/ipmi/ipmi_bt_sm.c:194:11: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
     550 |                             acpi_evaluate_object(acpi_handle object,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   1 error generated.


vim +/acpi_evaluate_integer +194 drivers/char/ipmi/ipmi_bt_sm.c

   177	
   178	#ifdef CONFIG_HISILICON_ERRATUM_162102203
   179	/*
   180	 * To confirm whether the SMS_ATN flag needs to be stored and get
   181	 * quirk through the method reported by the BIOS. Because in special
   182	 * cases SMS_ATN flag bits may be lost before being processed.
   183	 */
   184	static bool get_sms_atn_quirk(struct si_sm_io *io)
   185	{
   186		acpi_handle handle;
   187		acpi_status status;
   188		unsigned long long tmp;
   189	
   190		handle = ACPI_HANDLE(io->dev);
   191		if (!handle)
   192			return false;
   193	
 > 194		status = acpi_evaluate_integer(handle, "SATN", NULL, &tmp);
   195		if (ACPI_FAILURE(status))
   196			return false;
   197		else if (tmp != 1)
   198			return false;
   199	
   200		return true;
   201	}
   202	#endif
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
