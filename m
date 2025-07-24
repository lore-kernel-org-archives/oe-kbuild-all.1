Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF426C3A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366534; cv=none; b=Ja/mu1G3rPb+VqO405pmRmNkzMbrEDU5Eav8n3Gv3PoIZdEU4usCm+AxZ1XB8nC3KoKYylJGO/Xa+XKm0ovFs0F73CbDYw763ZRA5gr07Cg8w9hPjX2HDxiYz5f7wz0BbRaIqnfZImAGWGEvQdfNrVu0dJSKSK5cHot7+td3kyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366534; c=relaxed/simple;
	bh=WZcyrgry5S1vq+cTIQbg7pHE7rLoyMN5oTD0QSHgtDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drXhHT8J8aIYxXgtBogSz9LeyQjq/RnFn6B76iG7xP0iBF/hcr0zbuU6SUYSQ/xEVd7XyknZFOUvEj77v/pogIZFz2ItcUkDtMMd6WaUi2EhxQajVfvw3X4E/zsvNTrj31eln+bLUkenTlUeHcG9WZhPh0O6KahfqJ/NkZ4sA8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZ6pdbpX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZ6pdbpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753366533; x=1784902533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZcyrgry5S1vq+cTIQbg7pHE7rLoyMN5oTD0QSHgtDQ=;
  b=SZ6pdbpX/BpH48hNJwI+HaKgylwC0caXhIRpnea/7q/glsM24ZYs/itR
   UtBgQWiMBBoHCO0fTcr3LyzxmpI7nyXweiHwUDGLr8dNFhWVwwTSHZfyH
   +WjvvUmS5tRk7XBagj9VHbyLVZBnGpXXE6jJ9Zl9iGG817nummvKtx41s
   BSlcXH76JuQ262s1lNlbDAl+PETcNQv2nJfEgAc5DfZFZKq90yWQMXy/a
   dOPUaszpr785BAaiPBADuTATdbAFWU4ECJWYxNY/TGBFmgpxZ+K8JIM9z
   W2BogpmenxB/iMUhwtxSqnaIuxgEYsaoxJaZ9qTkiPcgHs+0My7Ru6iwT
   g==;
X-CSE-ConnectionGUID: QZKcCnpfRJSjt3UdvbKVSQ==
X-CSE-MsgGUID: QkwLP52SRaK8Z3wdguG01A==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55773472"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="55773472"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 07:15:32 -0700
X-CSE-ConnectionGUID: fJOkMcAXRk+Lh7x8OQER3g==
X-CSE-MsgGUID: WxQ9DmC8SDeJYQov6cM7/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="160997125"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jul 2025 07:15:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uewjI-000KW7-2m;
	Thu, 24 Jul 2025 14:15:28 +0000
Date: Thu, 24 Jul 2025 22:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [linux-next:master 11714/12139] kismet: WARNING: unmet direct
 dependencies detected for MFD_AT91_USART when selected by SERIAL_ATMEL
Message-ID: <202507242212.lrePIIjT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
commit: ef37a1e2485724f5287db1584d8aba48e8ba3f41 [11714/12139] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
config: arm-kismet-CONFIG_MFD_AT91_USART-CONFIG_SERIAL_ATMEL-0-0 (https://download.01.org/0day-ci/archive/20250724/202507242212.lrePIIjT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250724/202507242212.lrePIIjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507242212.lrePIIjT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_AT91_USART when selected by SERIAL_ATMEL
   WARNING: unmet direct dependencies detected for MFD_AT91_USART
     Depends on [n]: HAS_IOMEM [=y] && (ARCH_MICROCHIP || COMPILE_TEST [=n])
     Selected by [y]:
     - SERIAL_ATMEL [=y] && TTY [=y] && HAS_IOMEM [=y] && COMMON_CLK [=y] && (ARCH_AT91 [=y] || ARCH_LAN969X || COMPILE_TEST [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
