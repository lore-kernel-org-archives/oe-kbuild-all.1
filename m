Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9F3191F98
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766318524; cv=none; b=mTsgnBt6dla8eXPZc6enaIT3rgwJ/ogkefSsVA4kA5/DwLMIw2d1qWfF4roZfS9MIElJ+sxHl0m/K4svaUMubva+CTs10NZHs2oTL8EUS8FwzN0Aa3MimLmNWNOiCayOhueEUq2AKgS/4nqRavp7BAsg5vsUi9aY6ufV1JrH7NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766318524; c=relaxed/simple;
	bh=kTXzW/JfQ8OqpK93DNnsofKk4FNJsXZB3PcdIGKJ55o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQim7jA+GuFrIlFObz4ZneqG/sExmLH+cJqUzGXKqmFi4cm95eTBQ+rwvIPX/zl2StptEZ8OSPH1DKPv3ueHA8E30MeuSIQbBTQUjvHFpuPCEWKdeJhtP10y73PBl90a73+Pv8eq1tbb/hDojtfTQvKxVr82SDAWjjKkCBTn+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRrry2a5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRrry2a5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766318520; x=1797854520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTXzW/JfQ8OqpK93DNnsofKk4FNJsXZB3PcdIGKJ55o=;
  b=KRrry2a5NPdIsqenM5JZfzEZnzsl7IhNtvYHYZwKPL3gPJl7srAu8Zt+
   XDkVnJ8jr9BBob116kCU697Whle+wKRBDex4iO3yK8m0L7FchDJo7Jn+x
   gOsCiEhuiN2O46KZq28PGqdlxD8IXwIV1r1lGuH/Uau3EKm58NV5x7VHj
   SiwCwXEh5h0Nvzr2odY2MnT272DMivHWpF55LN641RGotMzMAveQHsPDy
   mhC43Gh4e61z3DETiF2POITAd6/MGKbrs++YFzjLaY3kVwWQqCYd6YYDw
   Kcj6pT3y7RKtt6fSG14Zms8yWntkp5n88Uf+nCoenYC+lcwZF+F4izqyT
   g==;
X-CSE-ConnectionGUID: 5rlOCg+yQkysFpbC5/cYjg==
X-CSE-MsgGUID: XWjn+6ZfTbK0PFUMkoTr2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71837311"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71837311"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:02:00 -0800
X-CSE-ConnectionGUID: zBCAnGpNSQWxlKkbnWmItQ==
X-CSE-MsgGUID: MToqv7m8SHqWC99zsLNtuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198441188"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 04:01:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXI8K-0000000051w-2vX9;
	Sun, 21 Dec 2025 12:01:56 +0000
Date: Sun, 21 Dec 2025 13:01:25 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 26/26] kismet: WARNING: unmet direct
 dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
Message-ID: <202512211358.nCDgB47K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a9d28381f95a89bdcdd37365e033274ba5247458
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [26/26] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211358.nCDgB47K-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211358.nCDgB47K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211358.nCDgB47K-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
