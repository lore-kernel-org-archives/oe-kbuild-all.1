Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E8B32D7F1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772382023; cv=none; b=G2+9jRe1E1PTbe7FoDXEYix+9srR1oxwOx7IxinbT5USyWYpyTgXAUaZY1kpkDPZ71IOX4M/Gy//UBUjJg9octjKqiIkKNyTHjVWFt9KzvT2aaE3AuLtUMr1iheXoXGri/JGrcx5S7lHLCw+dhbnJgI1+LpjrlKfH0YEtQCrmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772382023; c=relaxed/simple;
	bh=sjP0SLJkNkzabuYuA+thBFEMpGQOl4l4c3hNqrcAbaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k2fpMxogloBRL7pPXDHuXtphWxyoKB5/OnjhNtgtRpDBHFhrMfZ4y9VqX3HvLy/5GP0X6+MQniKw7Es0V2rLrk4QFAe37gz4/EqCRcYjYoxAl6zVhCCUXPKEN5sGf9jXCmTkRCR9ag3BenwkqT2aE1wQZMq6WOY+CF0b3+pvsL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/LcvTZe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/LcvTZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772382020; x=1803918020;
  h=date:from:to:cc:subject:message-id;
  bh=sjP0SLJkNkzabuYuA+thBFEMpGQOl4l4c3hNqrcAbaU=;
  b=B/LcvTZeC3ydZi1uswD2b3SwTU9BMeRt0nEBL1gqvY+3MjNPIQvsRzmr
   VV316/JqXRzIWTpUCdLR3kQyCU6AXicMfF4QFpK4K9ry+qmi9wvehIBbR
   LJSEPZsKbhA1hB8VwB4Q5o56yInRFdyJm8sYcqBJCdp1SO9WKfO630FF2
   03pzwDOjGW0Duj2tmgouuBMJ8f3US8C54+bo+P96qtx2qjyvsLOPsNh3y
   3+7MbUvnya6gqtvSJKlXgKQ5J76bTxZS+QhnhR8yqKEzUDqe7IkstKMg+
   +7YnKJHGmHVRT6gyoebkw1Df7lBEXYvr7GAA2JsLsnAH+uNsGuuzCvZrt
   A==;
X-CSE-ConnectionGUID: jATv92qnSjKsvuEggNAcxw==
X-CSE-MsgGUID: vx2FJ2yDTiCIFYUJQQlJ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73446009"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="73446009"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 08:20:20 -0800
X-CSE-ConnectionGUID: qVIn61V7TsymiIqtfD0BQg==
X-CSE-MsgGUID: RKPW3M15QAqiUsZB0Sh5hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="217419416"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2026 08:20:18 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwjWh-000000001a9-0nsM;
	Sun, 01 Mar 2026 16:20:15 +0000
Date: Mon, 02 Mar 2026 00:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [linux-next:master 2659/2910]
 drivers/hid/hid-lenovo-go-s.c:37: multiple definition of `drvdata';
 drivers/hid/hid-lenovo-go.o:drivers/hid/hid-lenovo-go.c:93: first defined
 here
Message-ID: <202603020036.8Pg1dCMY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: 4325fdab5dbbfd467df6797e018c9dd0e5c3ae75 [2659/2910] HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver
config: loongarch-randconfig-r053-20260301 (https://download.01.org/0day-ci/archive/20260302/202603020036.8Pg1dCMY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603020036.8Pg1dCMY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603020036.8Pg1dCMY-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/hid/hid-lenovo-go-s.o: in function `.LANCHOR2':
>> drivers/hid/hid-lenovo-go-s.c:37: multiple definition of `drvdata'; drivers/hid/hid-lenovo-go.o:drivers/hid/hid-lenovo-go.c:93: first defined here


vim +37 drivers/hid/hid-lenovo-go-s.c

    31	
    32	struct hid_gos_cfg {
    33		struct delayed_work gos_cfg_setup;
    34		struct completion send_cmd_complete;
    35		struct hid_device *hdev;
    36		struct mutex cfg_mutex; /*ensure single synchronous output report*/
  > 37	} drvdata;
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
