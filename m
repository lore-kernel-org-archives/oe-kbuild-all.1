Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4023A2AEEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728538192; cv=none; b=ttq4znt+BRX6kx33uYyKd15xCPM9bCPZhTqwLy1wPEI6+G36MC4lgy+xQ2vRpoOHhLuYX8FpXddTgD9W2e4AU9PQ1p64zhPq0eDJ/DQEPz9tA3EomPPZEFbE7uEtFL9I9lhUFBsa9nT78mOdjwQdaJ4K6RIboNNUH30NDHSakxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728538192; c=relaxed/simple;
	bh=9aGixLCisCy12jhlFQKr8+VbOjUYT/7B1W0gCgUf8JE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhrqLR/JWN3Q3/TIlVwxWYQuHBSx7RKNi3InHHv258PC4Jnj67Q9HvJGIFbJ/Dv1JA4E0dEZmUlbtFUel+sGhZO3Lc228E8nJ2hDQVorNLeHYNRyr19A3mwmNSNMFlsn5xGRvvtTtV4ck0Sata+/gy96TnkKwn0gCpOv2cQUPMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMN0AwmC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMN0AwmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728538190; x=1760074190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9aGixLCisCy12jhlFQKr8+VbOjUYT/7B1W0gCgUf8JE=;
  b=gMN0AwmCLlV4R4coxKIoLDuYMfthvjD+qT2PlbYBGua0p4HiUUixXJRl
   vzyVJb4zj3ViRqYtmt3elgquT973Ol7lFu3J60N/92594fj8gLiddLjbQ
   ID+M96bNG0hWmKOVMZSjB1HIYvFLc5xFcYLd1pl1riaynj+PKs0SXK+Gw
   WdqzyLs8/xuOl8Rapr31KdeCkVL5AA6jxhyxxVJSdo7M9jOUQ8aJ6AJ0s
   xh26hr5QbJFWMpEB7jSaqL9GH/t9qec2ffyQ6dGt7Jfolq0AFqTszMszN
   dby6aAYjn8nRGY760oTu3yZtznfS/NInGYZLgoTcYNoFwC/NiMOla5qfr
   g==;
X-CSE-ConnectionGUID: oHc6QymgQ0uwMPcPwJrN3A==
X-CSE-MsgGUID: zcFx60cqTFi+/nWZyveZiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28032486"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="28032486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 22:29:50 -0700
X-CSE-ConnectionGUID: 5Ufmk0WbRMSS2NNE+urcvg==
X-CSE-MsgGUID: rcvCKyMfROWj1mNRXFX0/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76133425"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2024 22:29:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sylkA-000AE9-2W;
	Thu, 10 Oct 2024 05:29:46 +0000
Date: Thu, 10 Oct 2024 13:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lujunhua <lujunhua7@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6858/14336]
 drivers/char/ipmi/ipmi_bt_sm.c:194:11: error: call to undeclared function
 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202410101323.VsBPpYrP-lkp@intel.com>
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
head:   5cfda5c5e5fbd3cbd5845d1ba3ebb1ccd52c05a9
commit: 6449ff7a5a2b148bc0a60efb3f0d723aaeceaae6 [6858/14336] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-randconfig-002-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101323.VsBPpYrP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101323.VsBPpYrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101323.VsBPpYrP-lkp@intel.com/

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
