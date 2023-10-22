Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD881D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8tE/4We"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697963511; x=1729499511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rI1tEnp3+eXUPM8uYuLLat6xdQhLX+pBV/ujJr5EbEs=;
  b=b8tE/4WeSW7aYH0Oz79cMrADTxTOm3UvDX3c8Lj1HIRF2Yn/9QnEf0bv
   NjHRiI3Wv8+SVeKT47gb+G3fnqu60zhiee+akkaXYSk3HwxmoDF7lPsQV
   UIDN5nDAPVuoHh8DlKJVcVnfS8Y9MZJDW1bUUwB3U54vw7NoBGr460oEx
   CMBgeKn/uPo/dt9c/9FTaEg+NPP1zndZqcN4nWvrkuyA6SeXzQsZn3/5r
   orC2xgmE0QTNrw27/N2lFFDJOOYe3U679JzJLjZDk0klejvWm/GElhVS5
   hz+z5pmX/EcwuukqZeWG213igWj8zmxxQQdrxllrY3YtyfwByLT3R8MCY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383890147"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383890147"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 01:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="734369411"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="734369411"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2023 01:31:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quTs8-0005k2-31;
	Sun, 22 Oct 2023 08:31:44 +0000
Date: Sun, 22 Oct 2023 16:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchehab-experimental:master 25/178] checkpatch: WARNING: Missing a
 blank line after declarations
Message-ID: <202310221605.Szs5fcRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/mchehab/experimental.git master
head:   94e27fbeca27d8c772fc2bc807730aaee5886055
commit: 0ab13674a9bd10514486cf1670d71dbd8afec421 [25/178] media: pci: mgb4: Added Digiteq Automotive MGB4 driver
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221605.Szs5fcRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221605.Szs5fcRm-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#3369: FILE: drivers/media/pci/mgb4/mgb4_trigger.c:93:
+		u32 data;
+		s64 ts __aligned(8);

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#3369: FILE: drivers/media/pci/mgb4/mgb4_trigger.c:93:
+		s64 ts __aligned(8);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
