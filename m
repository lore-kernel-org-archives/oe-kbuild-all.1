Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5013B274FDF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 20:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778357730; cv=none; b=tnv6KV3zS0U62m+qgnrsAXqSdOtLY1CZM4oDVQJIcCjUpW5vJ0XeFq9q9bL6mAOSRJdg7s1QS9u8ipRNmEQMalvHip9X34FLLTIZXubWffPrQ25iE5SHwcIjicYKqg6wiZP67surNq0Eh5hZYj/IjUkHbhj6OGEkEvlRbtXPjmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778357730; c=relaxed/simple;
	bh=CGqdFpxc3Agn2wrRFQNhYMTUaSMEM3WMFEDnWX5de/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gy5NUY2Q700K21tz18BfVbgkY/sEQXwKRKJvmJSPfF/ukz4dd2sc4FC7pEaBiqjTUvdFH0se2F99FsKVd1WC86fkZDZCyZESB1VzYkYpjK5koh/fZQGHt0seosXikOxYPdE1RXgsztt1iXXfhRM7m/+m4rEbI2caheJIXyW53T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WX1q4GMa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WX1q4GMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778357727; x=1809893727;
  h=date:from:to:cc:subject:message-id;
  bh=CGqdFpxc3Agn2wrRFQNhYMTUaSMEM3WMFEDnWX5de/E=;
  b=WX1q4GMaQahrX3NhegGgjW80ovkX+4KJJdieQAMqfb1YWk+aARvH4kBv
   4FlEZsovUNhN+bKTDhRTxwwFMZwGMQHceXtwvc8X7Dm9PPfUWya20F4ME
   DMjAmCbtUzM8GqkkDMYE2rVIY6tHXGJztrNEyq/6zWP/K4AsrkaALigDm
   A91Q9/6ByjQHalAPM+vcucle4fHnQnX9tUMw1pX1Gnnka89cerbjjjD9a
   lLS0BAAXRy8x4njMhirRnMnSIsEDCObUpg/6HaH7I99420gu6VnXfBE0V
   /uaU/RiH5tpdmKcQhA9Oi5XoGi5fcdnJAGt3SnPfENUE+XLgSz2CvEpvB
   A==;
X-CSE-ConnectionGUID: RODPArQdSvKjWc8DLfrUpA==
X-CSE-MsgGUID: uiu7eSGbTRSW/0Qf7GVtOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79486460"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79486460"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 13:15:27 -0700
X-CSE-ConnectionGUID: oCu8NPDrSMOEExZPq7Oo8g==
X-CSE-MsgGUID: vqCJ9rSbToKS9LjANbuoGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="237300198"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2026 13:15:26 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLo54-000000001Nh-3sa3;
	Sat, 09 May 2026 20:15:22 +0000
Date: Sun, 10 May 2026 04:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
 linux-doc@vger.kernel.org
Subject: [asahilinux:bits/090-spi-hid 12/19] Warning:
 drivers/hid/hid-magicmouse.c:589 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202605100448.8h4RezL1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: 2a467e61d288146e8b5e748c8cef4979c399cedc [12/19] HID: magicmouse: Add MTP multi-touch device support
config: s390-randconfig-001-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100448.8h4RezL1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100448.8h4RezL1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100448.8h4RezL1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/hid-magicmouse.c:589 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * vendor trackpad report
   Warning: drivers/hid/hid-magicmouse.c:603 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * standard HID mouse report

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
