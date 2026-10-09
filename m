Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116CD2EBBAF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526849; cv=none; b=NS3QgNGCOrQ9OTPkQSPuHWROmsC2kgJYenB7TExpagr0pza0Rv7ThgY/5YCoFYICimR/Wmz29ecToEsohxq0y/pEbGyu+Vb8E0utxVWPW157j6zidD5U3hys1juCt+jk6idFvuhbIPRaeZ+TOe0RPVHaudhNHSYRsk+J0JrQDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526849; c=relaxed/simple;
	bh=6DIwufBcM7mlwGDIvScB65coFSXFA48VUG4dwO2qRvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d8LwJutfGdm1FD/wCI33RtVAm/Vupa8h4QMO9Q1VGKbjgicun5khb50aBaf/SRygMkoXToWKzsFvDOuM8bv6R0AyQsN09lrP0Fz1tll6zAbcqA9HIGvR/CDfqjUalF+oNdVbWo+837/Ddb6LkyEYtFbJVFWwjm9z9XUMXhx1LyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmo4ISdD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmo4ISdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791526848; x=1823062848;
  h=date:from:to:cc:subject:message-id;
  bh=6DIwufBcM7mlwGDIvScB65coFSXFA48VUG4dwO2qRvc=;
  b=fmo4ISdDZS6iLYmgzd9brYvcUM0nH8jSo4R54E8pdZaAws6t8GsE1InS
   wi23tylXjHm7tW97H+lVGUEByBGRw7IgDMPP40nDz0FNCL6JClD5MIO8Q
   HVM/j8EcFSoF+Bsom36fv21CljPobCDivNWyVVC2vuYMUhHau4WK8+gcf
   785wHVIxN/NqI9Cq5JsPrb9pi9ceASJua2hPVzK/OIKmTNI32bCG5t8lO
   AkGtGthiB1csF9NDFDDHdRmwRaY4koH589smjB98o6fYqpb/X9re/vbY+
   gw/UNEtRoCIR0hr7rHAws6316VaeQ8oGvgluRCGU5kOs7X2sekPlnpaQe
   w==;
X-CSE-ConnectionGUID: PFWAOBD2QWOzVkPlmfzbBA==
X-CSE-MsgGUID: 8vA0pxfqS7Cagxsxd9eAWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="312415"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="312415"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:20:48 -0700
X-CSE-ConnectionGUID: bbWZWxP+RN2dPLznYIdIUw==
X-CSE-MsgGUID: Fqog/cFkSJWuG+/ayT8MZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="327916"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2026 23:20:46 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF3yG-000000006nr-0yKq;
	Fri, 09 Oct 2026 06:20:44 +0000
Date: Fri, 09 Oct 2026 08:19:53 +0200
From: kernel test robot <lkp@intel.com>
To: Matt Turner <mattst88@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Magnus Lindholm <linmag7@gmail.com>
Subject: [lindholm-alpha:for-next 9/35] undefined reference to
 `__ashlti3'
Message-ID: <202610090831.DSxrGQRc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git for-next
head:   496e328c6107ebdcd0a0d70eae52595b64b52a57
commit: fd04433a5bf398d9a19f30e0dea80e5a339a5e19 [9/35] alpha: select ARCH_SUPPORTS_INT128
config: alpha-randconfig-r2309-20261009 (https://download.01.org/0day-ci/archive/20261009/202610090831.DSxrGQRc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090831.DSxrGQRc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
>> (.text+0x1c0): undefined reference to `__ashlti3'
>> alpha-linux-ld: (.text+0x1e0): undefined reference to `__ashlti3'
>> alpha-linux-ld: (.text+0x1f8): undefined reference to `__ashrti3'
   alpha-linux-ld: (.text+0x200): undefined reference to `__ashrti3'
   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_safe':
>> (.text+0x2ac): undefined reference to `__lshrti3'
>> alpha-linux-ld: (.text+0x2bc): undefined reference to `__lshrti3'
   alpha-linux-ld: kernel/time/clocksource.o: in function `cycles_to_nsec_safe':
   (.text+0x1e8): undefined reference to `__lshrti3'
   alpha-linux-ld: (.text+0x1fc): undefined reference to `__lshrti3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
