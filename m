Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540AB23EAB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 01:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760666248; cv=none; b=sia5UioEvg6tSRHIFwAZ3BLip4kXuvd8J8fvPKVfNZr3+xssT+SO+AkrQRr85wE+VXlGccad4qpph0ZwbYKYdCCGh+1MzUjGXROdJDkFGG4sB/e2OiByW2dBQDHrBEibaEvA+LSc4I108+EWMbgbHY0p79W1JpV1mKI8tC7quCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760666248; c=relaxed/simple;
	bh=T8h6YduwkkHzUvUi/8cRy2yXCAE/dXO2A2ylTiKBUD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUUdHVlUmmtGutyHVysZlw6TGIP2nzeEzTmtQmWvTuyFqru4u5mR7jdQxDQ7Ne5QvwG6qsFo2ynnc9Tr8+vn0+Zai7mrO1PqvkXpoyuzzLFSL/zvM7K+1km5QKP+5xo4OPeYkHLkWUKuPi7IyKSOgpaEUIHAG7+AezrqhGRUlho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5fOn5C1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5fOn5C1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760666246; x=1792202246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8h6YduwkkHzUvUi/8cRy2yXCAE/dXO2A2ylTiKBUD4=;
  b=G5fOn5C1BTFF0HiJSPmGxrtBbnGGXcE4HCxSGAG/Enla3xTdLtVkscR3
   ZTMa/BU8zHlIPApneTHv8AmaOVrNoOsTVDmE5YAcBimI6TQXLkj+MSLQx
   YuDlDrgkt8idV7hrIZUEiZq85qt3gXcTzX8ri7SKkeLDEmv0wvrnULSET
   04tejo/X2fFheLPr83c6apGa4Qe5YnP+M/fbFevUPOXA0q9sJOPJBU4Bz
   c0lmFGa5LfF09RW/495IodQXySCkhWTyHiP4Lmny85ympXqT6cJwUjODV
   daBMKaQmHDFEV1r5nqfdHPPfC6eOKmdGQcN3grpu7Ai9Ndd8iVl9+P/2a
   Q==;
X-CSE-ConnectionGUID: T8anXSB8Ss2gTDA1R4uWXg==
X-CSE-MsgGUID: dI962YznQE2s9eQB1j5T5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73474676"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="73474676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 18:57:26 -0700
X-CSE-ConnectionGUID: PN64Bz29S0S36wTw3iNPhw==
X-CSE-MsgGUID: WJQ0aPC6SB6degi4CLhbDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187007960"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2025 18:57:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Zic-0005Qr-2T;
	Fri, 17 Oct 2025 01:57:22 +0000
Date: Fri, 17 Oct 2025 09:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: [sudeep-holla:acpi_scmi_telemetry 5/15]
 ./usr/include/linux/scmi.h:43:1: error: C++ style comments are not allowed
 in ISO C90
Message-ID: <202510170945.VTop3FXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git acpi_scmi_telemetry
head:   872204541d0c298cab365d5dcd343d9cdb749d31
commit: 0720599b99004ad0ec5e0839fcbefe4bdca6b1af [5/15] uapi: Add ARM SCMI definitions
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251017/202510170945.VTop3FXw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170945.VTop3FXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170945.VTop3FXw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/scmi.h:43:1: error: C++ style comments are not allowed in ISO C90
      43 | ///TODO more flags
         | ^
   ./usr/include/linux/scmi.h:43:1: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
