Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324AB1C286
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 21:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713820245; cv=none; b=bEZGrLmjbX2CeJ5oKNlpnPgExzdD0la101iXBVq0C+Yes3TlwnHxipuYMAcUBH0p1gD2lV1ftkdKfJsCxVDSaaojcEocO9u4BhhjQhQYecpv4ZpIZzk7X4izNapr9RSwxgmV/77ZEWACYy+bcPYFdd+2kjFEfRd2UhZ4mgHyYcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713820245; c=relaxed/simple;
	bh=+vksRgfSh5CNd+5SBjqhprZgf6ZJX+zj4NuX/F561hM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bfq21P9u0+x1v/5HriZNjCdIRHdgCpyNfLxxCH09sy1WMCfpVLPlqd3DaIQfIzVqTMJ81LGia5OhM6o60uOrEdDKFLfohZ0sxYBTHAtY393i+CfE/1FNv/Aztr8SVybi6GJ0hj2G11+7m8m5wLuleh6ZwnTv8DI42nEJ7T51jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckpjMO2S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckpjMO2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713820243; x=1745356243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vksRgfSh5CNd+5SBjqhprZgf6ZJX+zj4NuX/F561hM=;
  b=ckpjMO2SPs04XF8+eEJgKUrkyDfxXNYN0zW4atLP/9u4Njr6wIBY3FQK
   /egj9wHcmfahZtNVQF1QlKICWCXnIptinVbg87aijSSFKonMlDldJL+Oh
   RrOcQK6tHK1qgOsX4OVnYb8QoBk6obBFu6H7o2dtL1qIE1DCa2c35QEFn
   yTkP3+aAa84qSYXAo0GcC8B2nqEjdqF3Fqsv3lz1zV8C6yCoUJsf1GK/3
   byd3rRhDQQraqORANGfBT5AaYepCSKedtnGmFMrWQCkD0836Pvn2x0S8f
   APrDqnupbDItUMyLtViXF33pPTy0TxZC3vRYXM2zG9l0AAJUMPWiW8wEU
   A==;
X-CSE-ConnectionGUID: ZQYtLP8eT7qss1Eu62qvBA==
X-CSE-MsgGUID: brFT1BWFTAKLQHeEq951fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19990415"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="19990415"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 14:10:42 -0700
X-CSE-ConnectionGUID: 3yQ7pXv5TMqjhQ080phwnA==
X-CSE-MsgGUID: 41GyBAlSQ4+Nean6iELS4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24116987"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2024 14:10:41 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz0vu-0000G0-0t;
	Mon, 22 Apr 2024 21:10:38 +0000
Date: Tue, 23 Apr 2024 05:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, shiyongbang <shiyongbang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24732/30000]
 drivers/char/ipmi/ipmi_bt_sm.c:194:18: error: implicit declaration of
 function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'?
Message-ID: <202404230552.HyMsovr7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b05f2de3edcf4fc1b98ced476a06a62b961d3cce
commit: c1d32ce403f2c2b53138bfdba94c67cad8d137fd [24732/30000] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-randconfig-002-20240423 (https://download.01.org/0day-ci/archive/20240423/202404230552.HyMsovr7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404230552.HyMsovr7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230552.HyMsovr7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/ipmi/ipmi_bt_sm.c: In function 'get_sms_atn_quirk':
>> drivers/char/ipmi/ipmi_bt_sm.c:194:18: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
     194 |         status = acpi_evaluate_integer(handle, "SATN", NULL, &tmp);
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  acpi_evaluate_object
   cc1: some warnings being treated as errors


vim +194 drivers/char/ipmi/ipmi_bt_sm.c

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
