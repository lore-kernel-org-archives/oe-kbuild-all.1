Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63311758C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 05:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714455434; cv=none; b=NVy2d13JvJLA7rR1Tr+NCJuoHP/Q/dHpXCGJ/lSHl4v0z2j4SgcZU+GGeQL4+N56cLMVjujQUX4G0HHB9iDNMTZ9L1wZ+eZ2YqbcxG14yfKkkrGrC9uz7K6cQ5QbVl/MwA6mQpoVIfChkYPenW9dy7M01ND4XCAzWHlnEGH2QrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714455434; c=relaxed/simple;
	bh=YnAmHf1PMUi2DGPvfy7euBQ07pR8XRT17aG2D93o6j0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AA9mIqoK7USmV9ErEvetPZp32woT3oWSQ1xwV5At0zCNcPhZU1yK24c39+pynXHb2fZ6BsHgtzXP+d1SKSbxkgGt2Yk1nGgLbYCLY3Tl1NvZPz3VunvYnbId3lVKvRFTXAANi9mAxN8wV8SoX9xYfZovrUcqpm4aNuAxH6wzXY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYtqQ3bY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYtqQ3bY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714455433; x=1745991433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YnAmHf1PMUi2DGPvfy7euBQ07pR8XRT17aG2D93o6j0=;
  b=RYtqQ3bYu9PRnZkE0Dq4yGz0HxLemW2TnUCH2rixn1LWrl1WtuVzH/6H
   aZPb9ypB3dNgWHMCzge8Y92UnQthgsb+cs+0h7YeckiWLSxNyayzQk7Ri
   dcEG2iGLo1A8OSPwQaNg/Z3y4hLirW+VSQCW0VzQW0whMudC/olewZjzU
   ydXvYvvdt+r7kxgn84839f7JVgV7XX+ZCCd8vXKvF38GKJoBgUMrfyoQT
   XZiu+QswMHppvcbxZ9bkTR5URr8/jhsvULv44jZj2lM/wSNNZ2oDHWgt0
   GnX3DS2ckv7PUWUZxBoSr+bZdW2qn2cjEqXOhL/LFU/XEv/VaX8kJOvY6
   Q==;
X-CSE-ConnectionGUID: Bs7nuTrUTWatgZNyYqQlyQ==
X-CSE-MsgGUID: mEhBtsbkTau+PbvRBkwqCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10004686"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10004686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 22:37:12 -0700
X-CSE-ConnectionGUID: eNsUUeg7RqeeL2lbZbY3sg==
X-CSE-MsgGUID: vOKX6DkHRwOBIaz5gHyl4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26843829"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2024 22:37:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1gAu-0007mE-2k;
	Tue, 30 Apr 2024 05:37:08 +0000
Date: Tue, 30 Apr 2024 13:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lujunhua <lujunhua7@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6858/7643] drivers/char/ipmi/ipmi_bt_sm.c:194:11:
 error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202404301314.Y3h2lmDN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3fd472966bcc21f40dc20bb47c7ad18392fbec05
commit: 6449ff7a5a2b148bc0a60efb3f0d723aaeceaae6 [6858/7643] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-randconfig-r053-20240430 (https://download.01.org/0day-ci/archive/20240430/202404301314.Y3h2lmDN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301314.Y3h2lmDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301314.Y3h2lmDN-lkp@intel.com/

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
