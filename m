Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA4353800
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709892591; cv=none; b=Dxey4G3WCnUjoVbDYLNHWiFqFTFf607n0+l/TaBFmsGxv++iSzrZrblVcZ+oiuSIt4yNWdsNcCZImKz+jkpxsYr9xEYozAxFjspergrHxvi4BuVpFUiqVddWsQyY3dtkbkK7xwUIDTFbNtxOi2/5UP9v/cEWij5hIK8sgYzoIns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709892591; c=relaxed/simple;
	bh=nAIkqz6hyOEEuhRh0VwEKzj7T6tYGJ06ilsNU8EA45U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oe3JCSp0xg8HJ2iHgof7Z/ZjqscauqNgeCbM85ciEEWYN28PIdirB2SWbzY4M4RJhlLXS1BkqiV4PmahjFgLGzAp2cR4hGIMTt8oHST5L1BCXX8MTjTX2AaFwPnKg2PMYAToXhO4V/dQN5Yud/HSjlPXHP8nybOysku5x+arc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8y3ABAc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8y3ABAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709892589; x=1741428589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nAIkqz6hyOEEuhRh0VwEKzj7T6tYGJ06ilsNU8EA45U=;
  b=E8y3ABAcX/tTj920sw7LGUVRJWlDEemhzsN9eSGAz0Lxi97eWdyPq3IA
   vGRUgJ7pdkAVGyKFFvSCg5PffNnkIfqRwnI5TfXS0vsOv78NcrsdnKESC
   uI1dUZgu8Vh+tVNauIGvM/5Y8kvGYD5kY0cudS0FPaglYECTEr43TR8jT
   wciFzdDQM72WGAG/+18ceXz80/cvCnNWQI67jZA4mNuVTEAkr+RObxAGe
   SSR2mdAUG4oaD9UDF544swkP4QFFDtwqsZ7JZWvgn5bmgwcNCdgvvjIK+
   tvdYkAydTZ2ui68plJyHUyL4RqfwQo9WEjqVHKcHlcgpBEeNY9fQvNXqp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4465444"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4465444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 02:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="14900034"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Mar 2024 02:09:46 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riXAe-0006Gn-0Y;
	Fri, 08 Mar 2024 10:09:44 +0000
Date: Fri, 8 Mar 2024 18:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27126/27434]
 drivers/char/ipmi/ipmi_bt_sm.c:194:18: error: implicit declaration of
 function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'?
Message-ID: <202403081834.kBRyky9A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: a94b531128c4a67e550d063930f7044eb3837687 [27126/27434] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403081834.kBRyky9A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081834.kBRyky9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081834.kBRyky9A-lkp@intel.com/

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
