Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADE3155335
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 01:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750125512; cv=none; b=uv9ISLiIo5WAwKLqYytVYwFuM9qmFWcp0ACGhUkQ8K6GDQve3aRprfXTuI5mxq+eS+QpJFDjOUrzeLuQBxht93pZxyT/hLAnYsNXrAm11dNevVh+vv/IpUPsNogG10HEk6qf3R9lRCCU2lJznC7rxvzZXOTZ5SPMp9KX/OZYuN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750125512; c=relaxed/simple;
	bh=b9B5iZZh1RRMXRDdv5OkTIpxM4z1zzE2Qs6RJLP+c4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STyK4LkGFF47sP692uqEmw+/kRlDO3Ux8bjYQX5q8oXcxNirsfqwFbKyICH/rObWgUUY4VYw96j4EqmHNdwd4Jzah0yo/+M3Y9fYzAq2NE7pWOoeriEpS6CoPUc+ivPGiQFqntmWg5ddtWvrW4WjFG9+3h8r2wIK7KBgw7Njn9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kx/Od1Ut; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kx/Od1Ut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750125511; x=1781661511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9B5iZZh1RRMXRDdv5OkTIpxM4z1zzE2Qs6RJLP+c4c=;
  b=kx/Od1Utxkzu61W+FVwpVTmxLfMUo3Piybo/SgDr3RbE7BKrncKGgy/W
   L8/xi+xCUofSQMLf1u2UzYjY4mLKu/HQywnX8n+/MRhLzNCdyRrEcsWSp
   o11v1rP4Rz9rSKJMXOtBilm6NOUBXgMeSc4v5FcdgqFReT/tjjQSWeYlP
   EfdHnjDgx5UpbEbChPnu2aD2yPn9es8DUzjQM2S0/A++IzDWrCcHkd8vm
   xmEklW50JLRVSUm+8aPz+cPNt8DC4dZneQXi4EH06vrlsHp6XdbFTJXBT
   Dnr1P2vwlwrSmAK0kz+zFeKCkUE9EBqiG7GNUCAvDwryQ1uzuQ5UFMvc6
   A==;
X-CSE-ConnectionGUID: 4/8rGg0GTJ6bkyLL9IdJGw==
X-CSE-MsgGUID: uSFblTmsTTSzuD8cGGf7AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63635663"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63635663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:58:30 -0700
X-CSE-ConnectionGUID: 75E4KUTHTZqXwE8gW4YMHQ==
X-CSE-MsgGUID: DCvwaia8Smuz46hEP5MwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="152479046"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2025 18:58:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRLak-000FVK-0n;
	Tue, 17 Jun 2025 01:58:26 +0000
Date: Tue, 17 Jun 2025 09:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/14] kismet: WARNING: unmet direct dependencies
 detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
Message-ID: <202506170917.2r2wGfhC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   c0b8c6b8045a76e54fd4593f5fb10d664cfdd567
commit: c19a59419df8d5af5c8ca7c54c94143e3584a04d [11/14] m68k: implement a builtin devicetree for nonmmu
config: m68k-kismet-CONFIG_OF_EARLY_FLATTREE-CONFIG_BUILTIN_DTB-0-0 (https://download.01.org/0day-ci/archive/20250617/202506170917.2r2wGfhC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506170917.2r2wGfhC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170917.2r2wGfhC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
   WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE
     Depends on [n]: OF [=n]
     Selected by [y]:
     - BUILTIN_DTB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
