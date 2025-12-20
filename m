Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C601ACED5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766250047; cv=none; b=Sfr2cd8htdDZ7v/ZVpct7wiYdJGc5ULSq6/rrVeHw5LYCK1ZLXoW/MkQk/v653HzM97yPf1Aw36DGijzd1mpXC25zvd+NzocDgsTU92bcpbZd9wLYb4DhrzWCIpVwofsB8HGjLdmWAhPEojJ5JYmU7127ymNCOv2EUJme/XgTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766250047; c=relaxed/simple;
	bh=uG+ZlNyPcDNpM37zMidZFjApRPxRBj57KuLP+QQ8xYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMuK+om5wXF/qWCx07eKTLJpxShI6pDgg4R/0vV641SNFxWCRxJVaNQ3bMZ2xA+9dO6yt7LNMXBkPItIcMH275gl6t5E4iVBohL308Y00SPvtsi30LWYsk0I+RZ/ZjRDExlJOu1wJRuPHwTm/CcE6k5iNZzT98JnqnLTWsfl5aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEfWzIwG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEfWzIwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766250046; x=1797786046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uG+ZlNyPcDNpM37zMidZFjApRPxRBj57KuLP+QQ8xYw=;
  b=NEfWzIwGfSaEEKafldYcZvHHQSFRk64th/4B4tIZ4QLZySwsRr4oJy12
   shHBMeoJ+ijEd/buzjzxN5wj6wBrBn83609GZ+eSAF5MOLkqo5Q4Hmj/1
   5Mj4JId78FEuTGoLc5fOjU+8FAyHAIjka+i/cdO574JBavpMZdGb65wOQ
   qTHP3hPYs8DOGThhoEkozczz77ewey/8UKdZABIAVunSffsYtFbqfzl1I
   9Es3EqWCMwF4lH5nOI6E7u+N8MKUC8w+YOhMHPCX0clFQi0XDXcpImZZV
   gP/nHghcL0XFzdJVQlXW5YOXIvlmPgiI4UNeVwzZgGMCyZGQ5qZDvn/Qy
   Q==;
X-CSE-ConnectionGUID: OWS1zBMMS4erGvgB38X+eQ==
X-CSE-MsgGUID: 3d/qPHcIQXKlMv5ewEcaIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67930360"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67930360"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:00:46 -0800
X-CSE-ConnectionGUID: euV65+TrQ2ycJUwrAZer+A==
X-CSE-MsgGUID: RhfY9v3pQ0aeCsa27mYgCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199043652"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 09:00:44 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0Jt-000000004iC-3l1R;
	Sat, 20 Dec 2025 17:00:41 +0000
Date: Sat, 20 Dec 2025 18:00:31 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for ARM_SPE_MEM_SAMPLING when selected by MEM_SAMPLING
Message-ID: <202512201803.CVVuzZto-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: cc5f4f44852f9eb4feb22a40cbb4e3d1b10c36a0 [1/1] mm_monitor/mm_spe: Add PMU based memory sampling abstract layer
config: arm64-kismet-CONFIG_ARM_SPE_MEM_SAMPLING-CONFIG_MEM_SAMPLING-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201803.CVVuzZto-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201803.CVVuzZto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201803.CVVuzZto-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARM_SPE_MEM_SAMPLING when selected by MEM_SAMPLING
   WARNING: unmet direct dependencies detected for CRYPTO_DRBG_CTR
     Depends on [n]: CRYPTO [=y] && CRYPTO_DRBG_MENU [=n]
     Selected by [y]:
     - CRYPTO_DEV_HISI_TRNG [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && ACPI [=y]
   
   WARNING: unmet direct dependencies detected for ARM_SPE_MEM_SAMPLING
     Depends on [n]: ARM_SPE_PMU [=n]
     Selected by [y]:
     - MEM_SAMPLING [=y] && ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
