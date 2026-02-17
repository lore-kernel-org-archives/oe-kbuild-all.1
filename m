Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A625A62E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293009; cv=none; b=TJyM47T5yH4qYFz+xweXK66Ak+CEWP1Vku45jC7TXi+I1aVY9d83yJHL12EPmhE2SZm0aInhcayl9yJSqaUk5I/pj2f4foSygENsOvuOP7z1s9BG1BXEXR8yESPJILeEfzIG2uSCZ0qIPNYllalYGzkc9UNzKmpbZ+0kaD10gj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293009; c=relaxed/simple;
	bh=KbP3xkgShNLEQpDb9ldgAfV+Re2x5oka3HPel0XuM2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KMY22zi7tGHi0EiWp3yb/ZRfb+hJIUxBXUCaZeBNB5ADgnCqvsfKPTDrWWAqrMU4NO+yzZf/j5gy2fjMpGIizTLiugzz3zscWJ4l+Bdk3j3G3tqZgcqlxiIOOC/QebzKTrSlrlU4wVxG5/H8yWMXsGQJ8oWFLTtf2nxUsy/IY0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnDaNwQf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnDaNwQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771293009; x=1802829009;
  h=date:from:to:cc:subject:message-id;
  bh=KbP3xkgShNLEQpDb9ldgAfV+Re2x5oka3HPel0XuM2U=;
  b=GnDaNwQfjbpchzpwXDb3RuzuSK1q4giKtzPeeL681NOTFt9hHQL+ugZe
   1AqptcHXy8bCet94Y4YDSnbkYZnogeenZQ8cd0Qp1h04OwIFwGv13ORRx
   q4LnyeYuMfpKQN9SSwjm9YRvsDkH6+CdfDVSghqa1X/VG0ROAvKZlCl6a
   unzH4pxm6qpMb53I0yr2OBn8OuRuIx/O47LjYTdKwK1LVsEiglExmyCXJ
   5Nr9hEQRgiQ/y6mjpeYt9cOtoEKX/QKZLwvHeb7A7iwOSAT5KL2GWKeXh
   7zGorcbNE7bb0abfQXPa9dA38LvPeI3QVOwV9UPBpsghdZ+3M3lE5/dbv
   g==;
X-CSE-ConnectionGUID: CeJ5Hm+XQ2OCnas7X+T9fQ==
X-CSE-MsgGUID: GZdJNbeyTOSbwwkxtAc4aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82996451"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82996451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 17:50:04 -0800
X-CSE-ConnectionGUID: JXQZ/rRnRY6NfKJI1Kmg5A==
X-CSE-MsgGUID: joV5w4n+TyCr9hGWqdxvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217714771"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 17:50:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsADw-000000010U2-3Vmb;
	Tue, 17 Feb 2026 01:50:00 +0000
Date: Tue, 17 Feb 2026 09:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: drivers/gpu/drm/xe/xe_eu_stall.c:123:11: sparse: sparse:
 symbol 'eu_stall_sampling_rates' was not declared. Should it be static?
Message-ID: <202602170958.bPmOaHqK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: cd5bbb2532f276626d1416b237676772bb61f11e drm/xe/uapi: Add a device query to get EU stall sampling information
date:   12 months ago
config: csky-randconfig-r134-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170958.bPmOaHqK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170958.bPmOaHqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170958.bPmOaHqK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_eu_stall.c:123:11: sparse: sparse: symbol 'eu_stall_sampling_rates' was not declared. Should it be static?
   drivers/gpu/drm/xe/xe_eu_stall.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:111:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void const [noderef] __user *from @@
   include/linux/uaccess.h:111:38: sparse:     expected void const *from
   include/linux/uaccess.h:111:38: sparse:     got void const [noderef] __user *from
   include/linux/uaccess.h:111:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void const [noderef] __user *from @@
   include/linux/uaccess.h:111:38: sparse:     expected void const *from
   include/linux/uaccess.h:111:38: sparse:     got void const [noderef] __user *from

vim +/eu_stall_sampling_rates +123 drivers/gpu/drm/xe/xe_eu_stall.c

   122	
 > 123	const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
