Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D448F16132F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732739483; cv=none; b=urdfXnbsC9k32fPR5zpr/mhXsFDKty99BqVsiPBE0AxdSrG3DVeiIh1d/3calnLUQqA0m+nWPXa1sAIwwukSAzgSGrzDH63LY7AcoFasl0bztbe0YibSRzlntkNqwA3GiCNRDDbsQ6ai56c1YcO6vrMTiEvWXSVYmSRjvokkGU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732739483; c=relaxed/simple;
	bh=Mjp7Aavmw3SxBHdc8n4uNYKR/41GMkBTB20HbFNgEuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zx9fNxjY+L/f+jpnTx7xJjGo1w1z22vcuec97WEh8fMld/GQBlRBlMLsoxItrPf+deU3dAwWAcRhdn73qR1cz8SIKEzIZGOR6hYMRoyg0MkK6YvP1lxleYHfgQT1CGL8x9MGqFIjMG/KBeguJmUo6I0SbZfhb4LE32huIJV6/+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrg+AXPG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrg+AXPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732739480; x=1764275480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mjp7Aavmw3SxBHdc8n4uNYKR/41GMkBTB20HbFNgEuU=;
  b=mrg+AXPGEJdCfxsfS0sR11NqZF8ppp2LwX3jG8ehvoOXebj+APnjLNZY
   PxhwUzo6jc86VhC531RyDNwlv/APAbLIuqb8mxWLaaEfN7LWUHz72JnkR
   y0WX/idSY3wzQiLszO68H3aAQZa4Ic8DK7nDHEysxJ9eneQKgUtU+65hP
   LFuQy0B5RL7G6s3LdqfxXi6S0IWU5lpQhOnZTTiIGMoqTFpl4Xz/Z/5JI
   f1LraIzxekbWxMcSQV8FUkpR2GRWrU5cS5mCEa0pT3eDbLfcohfQYeqef
   hy3iv7mgijipTFDRfUdVFgSby1ITFlOmSBVvyYBQodFyHNz0McDpk0tF9
   w==;
X-CSE-ConnectionGUID: VKYsxGzsTpiB+FyDjLB1yg==
X-CSE-MsgGUID: zzPUkrAWT6q3fdefClHXWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="55455871"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="55455871"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 12:31:20 -0800
X-CSE-ConnectionGUID: n+uCq92mSYmUFJfc2RvnEA==
X-CSE-MsgGUID: oxsnYT9yTKGUWZ0K5vNYhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92440052"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2024 12:31:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGOgu-0008LD-2k;
	Wed, 27 Nov 2024 20:31:16 +0000
Date: Thu, 28 Nov 2024 04:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lujunhua <lujunhua7@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] drivers/char/ipmi/ipmi_bt_sm.c:194:11:
 error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202411280421.tIaYIeEQ-lkp@intel.com>
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
head:   4a0359af8c9d84ec3320a8a18f41c7fddf1f7a23
commit: 6449ff7a5a2b148bc0a60efb3f0d723aaeceaae6 [1540/1540] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-randconfig-003-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280421.tIaYIeEQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280421.tIaYIeEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280421.tIaYIeEQ-lkp@intel.com/

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
