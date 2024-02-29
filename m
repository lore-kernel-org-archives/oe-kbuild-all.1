Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D676421350
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 00:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709168009; cv=none; b=in3TrwJb3a0m2sx/aYPdf8+r4qjfGXyMo0q38EkGqM5+7qmktvqbbWv9MJ69kA8aRblQj9x1BJPvl15AF+SMqIXKoliBfwOfVITi/dHTfG/i8II3Kqq1EyZVYhrOxWaJV+4e4rKRZ/Zl9Ondq/bI+IBlLAKKWyQoCtxYeGX2hVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709168009; c=relaxed/simple;
	bh=GZ6/K3soNquxS65lu5RJtrESy2ITkAQ8xwiS+nmifcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNkgpoTzbyxauWy+uChRVIqD2ZNuGV2VYyXecuu5CjyezrFdMc9ON+Z3F9i4Sjvxx7ePaW5GaewvBtJ0QthV8xDW1RltRIG1C0KgGJY+Q/Yp+dVFakhpm28SkzR8rq+M3YDxipaGqLV3z6xOthg9Xe7NCG9e8A9qOlwhzKeVLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MS35ttCv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MS35ttCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709168008; x=1740704008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZ6/K3soNquxS65lu5RJtrESy2ITkAQ8xwiS+nmifcI=;
  b=MS35ttCvDMMoKe5qaHOcK4VPDpJ0rezXi1D2cY524xsnvv3q+J9iovl/
   v9Y6Yq0Jv+ZeKEx8R4SplNOTSXBUCQYC0267dhc6YSLWTZnvfR/o9JWM3
   ozW9OY+ikUCKuApMoqJpX2/O5OttoNy03xc3hPOmpENhl/0JJuQs/97nA
   c+VdY6qGgC4QoH5ctWXBtPr0Yoqp54TXFCYYgFsD8pnE7Wm0h3wtvE/QB
   Tp/35z2xIPsI2Oy42oSsXgeYtwewMGF60as1hOQputUetFT6d7q2xXNm5
   tzffzS8+jY6M6jMFQZ++/4PQKmZNKpA8Uxjrz8P0tOxWgNl3BTh1XRpDd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14174607"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="14174607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:53:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="12203525"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Feb 2024 16:53:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfUfp-000CW5-0S;
	Thu, 29 Feb 2024 00:53:21 +0000
Date: Thu, 29 Feb 2024 08:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data4' from
 `drivers/mtd/nand/raw/diskonchip.o' being placed in section
 `.bss..Lubsan_data4'
Message-ID: <202402290803.JP5EWtl4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   805d849d7c3cc1f38efefd48b2480d62b7b5dcb7
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
date:   1 year, 1 month ago
config: powerpc-randconfig-r025-20220324 (https://download.01.org/0day-ci/archive/20240229/202402290803.JP5EWtl4-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290803.JP5EWtl4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290803.JP5EWtl4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data4' from `drivers/mtd/nand/raw/diskonchip.o' being placed in section `.bss..Lubsan_data4'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data4' from `drivers/mtd/nand/raw/diskonchip.o' being placed in section `.bss..Lubsan_data4'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data4' from `drivers/mtd/nand/raw/diskonchip.o' being placed in section `.bss..Lubsan_data4'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data4' from `drivers/mtd/nand/raw/diskonchip.o' being placed in section `.bss..Lubsan_data4'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
