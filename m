Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929041DF248
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765306514; cv=none; b=XLQBG4llKz4W1Adj6APk+6qWnZG2bmPPr8vHJ0m1egWd3EccfwnDMGJrrRg7iC1BCDleZC1wFUxy1BPRyaOwJu6D+agrUef8j9VZw15+Cif2KHB6KhBsiAl4HdISlnVHepGDrqFt/Y07Zx+WYDmJTehA+AJlwALhYjisH336e4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765306514; c=relaxed/simple;
	bh=RkKCqfLMVbGFhdeAjPf+2TAhdWpzc+UAqIMqbybfF8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XWzjg9UqZvyC4ns1/YLAOm05+KwFmmyXxBWQgt/Cj54+laN2rSspeWR3lNqYYvgImGhAIadXRSxqoczBseaotsObazwFJm3TsilSq2N101gt/IkR4eehW/dq/3Wvr1OHWIM6PMLLiUaJmUTb8cOFTc0idum8z1MJOEMYchoqGU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3ifPisT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3ifPisT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765306512; x=1796842512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RkKCqfLMVbGFhdeAjPf+2TAhdWpzc+UAqIMqbybfF8c=;
  b=X3ifPisTu6eTVBSHGMr6Fw1+VcbB4Ey9NbTdgpU0Ai2z2ORB8Yjd1cgI
   5g35SHrJufyAE4CSh0T985Og5KX3klZNS1l6hlBJXDlmP4u1Qo7gMfJ6k
   y4yHBZIf7A0LK8L0DUkew7ZELfb1VkveBnveqf60x3WuURd3NYvtjoHAh
   02oRgtrGGRXKpfdFpeIORRLk21STdTrDEnJ9rabkQ7X10SOHALaO1B4F/
   2k3hCpiaOQE/JTOB0RI8JH40eYbC1D5x93/BOPLGO5eTukXDib6YfyPNv
   paOEgojpwmnEg3rR13Lq+gKkynbldAOuPzpn5vZ+HSqdpc1ri+zihJUgz
   Q==;
X-CSE-ConnectionGUID: wRa1+9RFT56Uq6r2BUADwg==
X-CSE-MsgGUID: j31F9WYjRM+Xk/6h6RSTYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67309125"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67309125"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 10:55:12 -0800
X-CSE-ConnectionGUID: Y4zOu+zXSKuimhMZK3gY0w==
X-CSE-MsgGUID: /7cBYYa+S1GuxDVKDvRGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="200779405"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2025 10:55:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT2rc-000000000LR-0hi9;
	Tue, 09 Dec 2025 18:55:08 +0000
Date: Tue, 9 Dec 2025 19:54:18 +0100
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for SERIAL_8250
 when selected by ECONET
Message-ID: <202512091957.qV3yVelE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   7 months ago
config: mips-kismet-CONFIG_SERIAL_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091957.qV3yVelE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091957.qV3yVelE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091957.qV3yVelE-lkp@intel.com/

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
