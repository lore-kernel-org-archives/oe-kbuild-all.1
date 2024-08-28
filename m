Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144EF4962B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724812775; cv=none; b=U9XCWTkNy2nuh8xfLu4M0rvTU7Cegxu0lVbLfWZ592upXdVC9Bx49m/8QEHr5WMVkSzDjU/AahOmPKU+Z9EOCNDMXF4PFYJ4U1DJKgCpC+fs+1pulECcYr9tM39BOmNFyj7Lj7/XApyYmUT9Mj17M+QT8Vl/D0S8SFE+kMWAxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724812775; c=relaxed/simple;
	bh=rI6dYsM6ufh9wjtjBjKcBBwt1Gx6CeKYBLy3QIwl3ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J2HjRJ52YojvSEevgKwb9ctUNJHKri+EyLU6biCwdq0wffnJHK+4w/HwFuEfp7tMOUUnxAPcRMxDUeNOYWOp0dtlrMYSHw0S7XUKuXkoKB9PRz1Ky5L38eeh13ZT/8HgpBgsKal8hAnYHNL5d4+9tTvaVNOGJSCb7RnHp1kgX6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/TDIEV+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/TDIEV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724812775; x=1756348775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rI6dYsM6ufh9wjtjBjKcBBwt1Gx6CeKYBLy3QIwl3ng=;
  b=L/TDIEV+kHTB4QmJDQ956FILP54qQa63k2H07w2IKl5JHLuy5Tw9Zlx+
   PKoDlgBg/xh+LSOJQKVKutRxOEAO/d1mKuVgCfUelUG7b8A7J38L7acVz
   wuheTSOcaXb0PjXm2hB/FODozYlCtCVtFy3fSDVPLVp1CcnI4fZhTPpGm
   pF8E7E3RZY9XpUxlqmSWxnAgc0rfTTozDsUZu8h25wQrJ0NdMIJVxxXCd
   OygRB6IXXmLhDGmE7CqApHfwoqUjQKXrdYW5Rm7nojeJP1HoyAaRPboBX
   IQeEO48nB/msB1J7sDpCfNisw/7Ng0DD54MZ+8NgzG4ktsJvlRudmaWGM
   Q==;
X-CSE-ConnectionGUID: vTSFI6pGSIi/E+4WSYvIBg==
X-CSE-MsgGUID: Hy6f5hnCQfqQzf4wk9ETAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34696136"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="34696136"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 19:39:32 -0700
X-CSE-ConnectionGUID: cNF2ufx5Q4KF6/0s60hPJQ==
X-CSE-MsgGUID: G38uKfYZRHS8RyH5PMliGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67433425"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 19:39:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj8am-000KMU-0o;
	Wed, 28 Aug 2024 02:39:28 +0000
Date: Wed, 28 Aug 2024 10:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lujunhua <lujunhua7@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6858/13744]
 drivers/char/ipmi/ipmi_bt_sm.c:194:11: error: implicit declaration of
 function 'acpi_evaluate_integer' is invalid in C99
Message-ID: <202408281024.R754Msvr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e65c0786c5c765daf978c13bfe587f5426745bc7
commit: 6449ff7a5a2b148bc0a60efb3f0d723aaeceaae6 [6858/13744] ipmi: Errata workaround to prevent SMS message processing timeout
config: arm64-randconfig-003-20240827 (https://download.01.org/0day-ci/archive/20240828/202408281024.R754Msvr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281024.R754Msvr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281024.R754Msvr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/ipmi/ipmi_bt_sm.c:194:11: error: implicit declaration of function 'acpi_evaluate_integer' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
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
