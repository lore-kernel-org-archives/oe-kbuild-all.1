Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B251DD533
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730155778; cv=none; b=Ns9iJXCFvAXaDM1UvWw4PD9L3jxMMH+8kOIeoChZPVfAZcDE89jf+Ou8OLwRMGUhTK+HxU0HchkU69iUmt3i6vweFfgqGUEEtZzvt91d3J9zILqkFDZuN7Nug4HpCkIuzFYuUaUteDPje1uKtNFhhDOy8SIhT3PBqNo6hpRXCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730155778; c=relaxed/simple;
	bh=uQcJxA2Kuaqp5tS1q09l4d7QGD7xr5pc3tQTvCoPkNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bTJ6axA3VK7BLRtbTS1AeuIaoABii0r89o5dtHBxR9g0kZjDlHPzDwyWQJStialzw7Joi64cjtRnVJ6bkVweLzFv1ipy64T/u8/OxUeYCM2h8ZHoaswaXZf82mmrVbdwPh1oR/kZu6FkPbh8yPVX5gE9O8flSfrziP2COxs+loo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHREuCnI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHREuCnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730155776; x=1761691776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQcJxA2Kuaqp5tS1q09l4d7QGD7xr5pc3tQTvCoPkNI=;
  b=ZHREuCnIfJN3GWTCbpjWlRf/LSKASD7Cg7aZupbte/yLgaJflelo3ORO
   qv9A4Re0M3EqC5U1cO+77TVzTTXKrMgFK5PTf692ydxtWXnMZ3ynmhiSZ
   lj3FmPC17pJSQ7PH/gm2P9Euk9N6WbrmzIEoqoxSScfPoRZpjG1KoyKC/
   nuRItzIA3PKgXtjuGaZDz/+aXboPuD1gYJvyu8opcYNSwZXZwA/5IHvVl
   GN8I8GpDCB/AJF+GbVa7V+V42YkLakE/Em+KyjjBducMS3zUDgAlpn6kQ
   x1yW3GVImCOM/7LJPxYaJo9AxSLpC+RBJSloWfre1o/M6Tky89USC06Ov
   w==;
X-CSE-ConnectionGUID: ++YeLGPHQ1WAnILv5HqTFw==
X-CSE-MsgGUID: tVEJ+hjuSTakGckl+7Eg+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41170673"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="41170673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 15:49:30 -0700
X-CSE-ConnectionGUID: 5gK8fiQrRu+zzUHyqjxpNw==
X-CSE-MsgGUID: w2M1KQyHS4S2SDvPpvv+ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="86318941"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 15:49:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5YYB-000cyc-0f;
	Mon, 28 Oct 2024 22:49:27 +0000
Date: Tue, 29 Oct 2024 06:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lujunhua <lujunhua7@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6858/15358]
 drivers/char/ipmi/ipmi_bt_sm.c:194:11: error: call to undeclared function
 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202410290657.8iWV8CTG-lkp@intel.com>
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
head:   27e5d43e49e85d816bd05ffe8672ceea631a07e4
commit: 6449ff7a5a2b148bc0a60efb3f0d723aaeceaae6 [6858/15358] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-randconfig-002-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290657.8iWV8CTG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290657.8iWV8CTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290657.8iWV8CTG-lkp@intel.com/

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
