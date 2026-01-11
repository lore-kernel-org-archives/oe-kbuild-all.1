Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E69272816
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 22:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768168943; cv=none; b=iszr0e9CKAq1lAirRw2mUrNIObqN1RllywCpjEjjykkXT+n2cWPfseojZcONsZ0jJZUYszjAXsxPc4ToM89qSWAf3OyHwWOanvNGY4zmNJ9+UPjtDwk7VhB6TYPPuxkHIefY5JXTVqc4w3T8+qg09L4HXwRN6u/n6qGgRGht8kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768168943; c=relaxed/simple;
	bh=qmV+pZpUfF5LT40wOJC8W8vtnDo2at053zxLuFcDWjU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IxpdpGRnzeaG+z6FYZIiFtI1TRsLVCZ7YzCu37mwoFq+BpwsoTedA3yrtZqgBrSX8gicfZf9NjW3CymoIoBOvcHXqplIUeHQVdO9P5rZwQepIo1qF5ptGAcC1O1XhDeY4F21b9XMJiVlrhXwR5tO6hycuhYrtmCNfkXJTjsmT1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YM4MruhH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YM4MruhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768168941; x=1799704941;
  h=date:from:to:cc:subject:message-id;
  bh=qmV+pZpUfF5LT40wOJC8W8vtnDo2at053zxLuFcDWjU=;
  b=YM4MruhHodpLNmzhtRld8cYyQWlSVhOlfRypj6jWe2qJklgtc2OqPuy0
   RLWAZnYpg0nao+4Q8yygeLL9at2U5hywwNi3ovGEXRriDUDOQwHYiN9W0
   poVDEkANmaZLtYSZVjqy4v/iH43XgkcTBEAZCi6GFNLzdLTxocffzViPn
   6CswuszUlG0h9WOlwKJ0WwZTXYYVvRc/OUAxDATlOPFdGwncFCHMGiVGA
   mDJeXazZHo8DC15mcGqTZbU3iTh+aMQ79fAIcq/b8oasrI2qUT4KAsqfj
   GxliY+gE2SCUx89gdAdJzYnRtMSgxS9U/ads4BmbHlB4IQul1eXX2C+PR
   Q==;
X-CSE-ConnectionGUID: 3jSxti0yTgWGThtOvrq95A==
X-CSE-MsgGUID: S4sffye8RQqL8PFLTouwKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69350849"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69350849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 14:02:21 -0800
X-CSE-ConnectionGUID: f5cGKFN9Qj+HUcnitZ23UQ==
X-CSE-MsgGUID: 1fBOiVDwQ6SrXf5Cv/NY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="241469285"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2026 14:02:19 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf3Vp-000000000VB-0mv5;
	Sun, 11 Jan 2026 22:02:17 +0000
Date: Sun, 11 Jan 2026 23:01:28 +0100
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SERIAL_8250 when selected by ECONET
Message-ID: <202601112358.oFPnPFca-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   8 months ago
config: mips-kismet-CONFIG_SERIAL_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112358.oFPnPFca-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112358.oFPnPFca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112358.oFPnPFca-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_8250
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
