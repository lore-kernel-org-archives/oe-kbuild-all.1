Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486348;
	b=KZ23rrkJNF/8t9VMAifJNhs+BOlRJ64VwsM1PMJyE/kVKFu8VApjchOLVtK0LcwVxwrs
	 EIPK14W8B/Jq+6QVTfFEn21sruJOvzYPiUJ9h+Pgzt0ih3YIv08+Hxi3c0lcrd8gYjSZ7
	 f2VJRvgtNJQoJo3sz9uUCiNlG19cnvyHEuXS0urmrpzJukA1E4Oorts29Lvys2cDwDsA7
	 c6bY61Aqs64Em6GC5CGeQmFpoa9rqfHVQR/C4MLQCNCnmw9Aev3LdIkkow5+6RkYP6Drc
	 8odvyWaMwvzyiWo5Y0XLVTnshUyRlXpPCDlT6BnzDx/ukfuQbU1XOXVpfwDu2QsNTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486348;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ViU6kRaAFXffKiHW3H+X2VfX9pw1Zk+FqSACRnPiyrM=;
	b=IjD2xbDhPcpJHs5RKRggzEiiNt8H+mvgNdMYVM3AfX6UuwGIjclIMga45+J4b5uZx50/
	 IYdwqgQ8BxkOxku6yTnit54FnJLuYJnhU6xOuZrElKhjFlza+h9IZ2rrOqb96p0chVMGO
	 4JUUAdifXI40IgLuXkewli0jtsQS3dJBxbR96ZcZHe4A+hO+g1uGzJkMvoDJqJKzMeQYE
	 URPVeWbLw5h8pV6c8VU2xXqlOaq1h83/mbtkDpeBGmH4ZK2qc0EQdhVVqB/rgWi8XK9lR
	 wAED1ER0LZg6XJTutqbBkg2rJGuHOlNhP/dh0k3RcNragqg/cvpqi5PaiHY6YpidAvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NqzpmMQp;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8A606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 12:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NqzpmMQp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794486348; x=1826022348;
  h=date:from:to:cc:subject:message-id;
  bh=vIG4ptk0olby314s6v92W79Xg20Bf/ne9DJGCCAatqo=;
  b=NqzpmMQpTxUu33cCf4w4kKrxsOZF6rMv0fxLHtDC1LFdGpg3+cG+oD+V
   M7Qb/2wvaWWM5i8zVwccWQ+KL0eV2Ja1C6t57hBHRX19qiScMigQEBeKo
   jIlDY1OOzQ3VdxY9Lmt7+bX7DxzJQXHo9zr4tuCdEGqhSChwjB2xBjQT6
   DxBkqhJY3w1/xUMJ7TlOSBWSUQkrCuESaep9qNHHFJliS/K89gVfCOcqt
   UdBIgVH2onux3sBYBmr2yXGdkopfwupD/ipHlnq3aOP7tMPLiOmPBS1Ff
   sGsbNo+1xuPtu6X+g2zmnZ0bLdI6BHR5qq3+p9dIbUX1rDvUxr6l/OqiG
   Q==;
X-CSE-ConnectionGUID: qr6zYbUAQjGA1ztCUgn4Xw==
X-CSE-MsgGUID: /0l9eQdGSTmzxZHg2vGGSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3313895"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3313895"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 04:25:48 -0800
X-CSE-ConnectionGUID: izyAB2wuR8C62CVHmM8aTw==
X-CSE-MsgGUID: znm41O8vQZibHKPugtFAAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8598649"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Nov 2026 04:25:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRTs7-000000000sN-42g1;
	Thu, 12 Nov 2026 12:25:43 +0000
Date: Thu, 12 Nov 2026 13:25:26 +0100
From: kernel test robot <lkp@intel.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org
Subject: [tytso-ext4:pu 12/50] ERROR: modpost: fs/ext4/ext4-test.ko:
 symbol '__aeabi_uldivmod' undefined!
Message-ID: <202611121359.SOSwSLzQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   246d715a48c25a74ac372dda5e10d8f69f89b50a
commit: 55ba50484d288a857206a349339301641aa5c050 [12/50] ext4: add KUnit tests for fs/ext4/balloc.c
config: arm-randconfig-2000-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121359.SOSwSLzQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611121359.SOSwSLzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611121359.SOSwSLzQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/ext4/ext4-test.ko: symbol '__aeabi_uldivmod' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
