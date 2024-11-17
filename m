Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3651401C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731868569; cv=none; b=jBkaOFGna/aIZv4T5YFF0NzXzOA6HQnb2ssm2NJoU/UNrJb0u/j2Eim0NjDPSRWdtDQdaEkOy7ZeHZ82PbVbrdG+jtJMVCVO4jELfFCns3XXgk/ceGhs1OiNjs+XOwyQXlxXK7Yly6LDGz/OT8x/DwG7zGqueoSS5Jhzd37NwKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731868569; c=relaxed/simple;
	bh=m2WcfOFRUgPtDBscxEPkW0Qk7LrRl99Qp+j/xCgOxSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XmIu3jbc7JPo+qWGIBIKcCdyCAjOPKA/S9EGFIMLraIFTfROWrSM2M60LbaCif+YaaQmQp24oxNorbGr67W9nSKFCjWtt8mYZN3AYXwlORL9zud5BxlcpKU0V42E/Ywae7uOZeZjlazzZu0FIY1tTNHrCtNFxB3wcvtPEW5dcyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQ+fLuao; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQ+fLuao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731868567; x=1763404567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m2WcfOFRUgPtDBscxEPkW0Qk7LrRl99Qp+j/xCgOxSI=;
  b=TQ+fLuaoXcqNAanEAEHMpdJh8EjXfDxsGMLqSUd15j4ri4orXPquYB2a
   KPDz/TgT8Iv3zk9LtaXtFdlypy9lY0IcON1bsZqHXiS3nCxEheb4PRneZ
   pQJtN8nwwir54w/Vpgkp964ij0GGVu7g0ftRCJM9pTESqj5i0WBWQDuwq
   ZZA6Y8ULuJ1teqErRGIPk/poOwz+53Qo9jK6el838IrBMgMRcWEy0tr+l
   HdgVsFBj1CnZE+RngfbEM6h/Tbnj0C3MXtHTQmHFiRQ+3W2K1bDexT1pR
   dqVRSeZyjelLiuObToQErx0tsY6HqMEPGi27+zJj/lNwN1Qfl/ihzGEAj
   g==;
X-CSE-ConnectionGUID: yzYmsBmCRXSNB2owFz5RLw==
X-CSE-MsgGUID: I54LcJ1bQju/RHhMfOKWXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49255288"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="49255288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 10:36:06 -0800
X-CSE-ConnectionGUID: n52ATTvqQoCl0W0xULYwoQ==
X-CSE-MsgGUID: Ibz6PV6+Qqul/2pmmX8Jzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94064868"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Nov 2024 10:36:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCk7v-0001zj-1Y;
	Sun, 17 Nov 2024 18:36:03 +0000
Date: Mon, 18 Nov 2024 02:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lujunhua <lujunhua7@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] drivers/char/ipmi/ipmi_bt_sm.c:194:11:
 error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202411180216.cVGR9zgK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 6449ff7a5a2b148bc0a60efb3f0d723aaeceaae6 [1474/1474] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180216.cVGR9zgK-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180216.cVGR9zgK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180216.cVGR9zgK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/ipmi/ipmi_bt_sm.c:194:11: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           status = acpi_evaluate_integer(handle, "SATN", NULL, &tmp);
                    ^
   drivers/char/ipmi/ipmi_bt_sm.c:194:11: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
                               acpi_evaluate_object(acpi_handle object,
                               ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
           static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
                              ^
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
