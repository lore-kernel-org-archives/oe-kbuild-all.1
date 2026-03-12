Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D130737C93A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 06:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297177; cv=none; b=XiQx7xdqcwQOpthzVs4ktWSx+YDaATj6SiFHQ0reNs/qYZLbllhtS3CYaqEZ6zTiyRnQmPT1sFE8+xYjY9bseC+ZQrtsbhs5nnTQPmnjb+D4q8p5bUXhFtwrRCuC3kFgij5J2Y82sX9XiSvy5qTEKsCidtYNP7/u8ni0KymtCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297177; c=relaxed/simple;
	bh=dQ8ZA0NsqwXIQvqzFgrydJ2qRLtDTv6qJi75XqX6azs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Aslu3TPIk+MkRgSmrUP915rqlfFykyloEEh2yxgKtVo9rwKSsAoLEpGdsC8PE4aff08guVUW1LBJMDCdAXrzDggrH45yhvKazCdFcFapxq9metuCb01E3hHgtgyw08VxfEXoV9Y6r9EC0jKalkEqWFYHBYDh0KjYKXg9TFpqOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkQDBrym; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkQDBrym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773297176; x=1804833176;
  h=date:from:to:cc:subject:message-id;
  bh=dQ8ZA0NsqwXIQvqzFgrydJ2qRLtDTv6qJi75XqX6azs=;
  b=jkQDBrymAH99C3X6bHviwUK+Ld+hzfZtb2dX/frzxNJbypMao0fvOX8U
   IKldkF5jzStjRKlXMo2GBpDaeCgfyXbWGgqKn04Mq2i2WPyMqeYBKm0ys
   GP3kGyLWJkdBLUmyhSS6TUTZSeNZ0B2W4ip6Inb3okwrnzK9u/8F3V5gn
   pen5mXBUXkMTVIHNJsir8u5wye26MnsuIEjkg4XMHFw2mBVO/lzV/3dnl
   HS0HVjjw8O0rI50o+VEda11w19IklEGkqtQKBWku7mQwky0lniH+UITHD
   +4D3GMjpHgGPMBTb8Zr/eBbVjmbiqXMBclO4hNSODWLedEppb0fk5rbkF
   A==;
X-CSE-ConnectionGUID: 69iaD3/GRhih4glWfMRU1A==
X-CSE-MsgGUID: CZfyb98YR+OpI9S1D2//gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78230251"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="78230251"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 23:32:47 -0700
X-CSE-ConnectionGUID: A6PH2ZghTemNgYsb9vlwrQ==
X-CSE-MsgGUID: 0fpeflsxQfWpcSrEhPtw0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="220774445"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2026 23:32:46 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Zb9-000000002A5-0rmv;
	Thu, 12 Mar 2026 06:32:43 +0000
Date: Thu, 12 Mar 2026 14:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:testing/v7.0-rc3 2/2] /tmp/ccCYaVud.s:269: Error:
 selected processor does not support system register name 'pan'
Message-ID: <202603121442.7F7WznTP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git testing/v7.0-rc3
head:   661b491963fb7aa62905612f758376933435bba9
commit: 2df151af23926ce5e8053052b5ff6b8455b4cdc6 [2/2] HACK: arm64: Check CPU state at task-switch time
config: arm64-randconfig-003-20260311 (https://download.01.org/0day-ci/archive/20260312/202603121442.7F7WznTP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121442.7F7WznTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121442.7F7WznTP-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccCYaVud.s: Assembler messages:
>> /tmp/ccCYaVud.s:269: Error: selected processor does not support system register name 'pan'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
