Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BACBA36
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753203796; cv=none; b=iZanL5yaVbjqFObkPBfsW3fjvBxKx5FeCnAhB2r9fwlb1ZVa62q+QDNyt8dgRY1Thctwyew3brTydw2mxfJoljFVNfIbIRkCrz4E36Ffy3xEhww0GzlY5CwfPnn0E1TdcohxQhKifrx02A3DRXj+kjjqGaNqKk/crLrt0n5fuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753203796; c=relaxed/simple;
	bh=DGv36IC4PSIZR6KSCoxWIa0wCsWicOlPjYzdxu/lAdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXlkId3ZEapcpSgJqo73ORY48Xf2Y7aIQUXGVsEM4ZCOaB7BUmY/8KIhJumrfnDsSOtbAa6BNgbS+VuxHksre4ouw7qROMJwcoMPEht6ZLOC0Vmowa9P9TWqAxUz5bYUj2NnQGxlnNRld2gk5qoBcSZK5tQhrvDR/g12wVC6Wws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S96urrTq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S96urrTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753203795; x=1784739795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGv36IC4PSIZR6KSCoxWIa0wCsWicOlPjYzdxu/lAdk=;
  b=S96urrTqysi8dmUnhVhJ3cDuoVkC2WjvhJ0h1uvhGxu8vzn+Dt/dKuxL
   M1QnpiaYQvxDxVYLOoH3d/ch/FOm6J6V1YEKdUNRm5qHPpoTArP9M0Rs9
   ae7B2SDA0SKxawWw0QuBEZGmCNtZMAKw2n62Q1dzZCQilRMtUQ32iljxD
   /eSLkNW22vPBid9ICVn38DmC3faC4h5YIyWVnm5pJbbnzzMCdgSZvMQmk
   xCpTH5csCuZDd4JGCYvIZc0VHg9ItaMWOsszCBn1OaYTkScgRYdhJToqi
   WVDgIGfoOUArACB1nzmM9uZWzt5l6Th3Lm43PzxOBQaSnFx6MnZrHZP1C
   A==;
X-CSE-ConnectionGUID: VnQe8D/VSPWbOnQzXioVwg==
X-CSE-MsgGUID: bkJ2WYITS5mTBrVarkXcXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59286108"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="59286108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 10:03:14 -0700
X-CSE-ConnectionGUID: d/jiPIV2RMGaVWF06Z3IQg==
X-CSE-MsgGUID: liY9b0YiQQ+IXOewCi7Zcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="163436846"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jul 2025 10:03:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueGOV-000IZL-1B;
	Tue, 22 Jul 2025 17:03:11 +0000
Date: Wed, 23 Jul 2025 01:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20250722-iommu-hacks 4/10] ERROR: modpost: "__aeabi_ldivmod"
 [drivers/dma/dmatest.ko] undefined!
Message-ID: <202507230038.Q13HmHxA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250722-iommu-hacks
head:   6cb9b4fe133575635935efb6cddb19272b481b63
commit: 23e8b826db1f4a2feafbcfd50b700ffad327af73 [4/10] dmatest: add IOVA tests
config: arm-randconfig-003-20250722 (https://download.01.org/0day-ci/archive/20250723/202507230038.Q13HmHxA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230038.Q13HmHxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230038.Q13HmHxA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_ldivmod" [drivers/dma/dmatest.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
