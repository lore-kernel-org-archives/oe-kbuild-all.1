Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838472192F4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 23:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751413826; cv=none; b=lD4Bqnw+XmwvaDPGlkXA/VM3SMnwNsdUAyNcQkQPAYivWxFeICRaQS9XrP8e2Lkb0Da1+RYt21Ui0Wc7e2nmMZusmxvSRNT6+36RqA9572q0qIr6NrsF2ghWEb9ov+yD1U+zqzjoO9cL1vpmS+0dTHP6Oorh7/7L9rnidVzD0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751413826; c=relaxed/simple;
	bh=vEmI+3e4otyTIV4MW5bsHtTUE+hSpnKJ0yNOf1M+uLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiAQfmyI7UI993W7x9Xi6UwGgFaBcqLu4yX1q9kyGlHbXVeg/zQe/j6+0tZZR0b/opKvRUxd14ei5QPD8wBA6fcUEIQWGm/aW1lw6MScSKWvm5IcrchBLD13IQOE/dc/77nPnzNZs1c0A5xgrCzq1VP9oHAEGDWAjUyTX9vlHEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVVBvp99; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVVBvp99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751413824; x=1782949824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vEmI+3e4otyTIV4MW5bsHtTUE+hSpnKJ0yNOf1M+uLQ=;
  b=mVVBvp991oUDZPhANwL+AiUV7mkw/ed5a9iMMS06LC/B7bw07mznfzXZ
   Kcqt8R1TND+O6m065ozTZzsNfkaVMC8VWZLmWWfuXokWzCMdk+Plvy5qH
   0ILxH79alSOXq1lU1iVEZxeuYrOrLcxseKnK8UiW4rw1wE24wInYZk1cv
   Ix+90jdMqCg73lK+D0m5+JKQQZQ9pIfl/GF7Yv3EVZrzPqpN1icvNuGWQ
   pnw08sPScAznzzWlvqyrGGmkPBD+6Ro/8tkdG5RWDFLl2CjItQa+eEoFQ
   4MzDNlNqMTsZf854GODfrAt5Fs2zERp5M4FPpdBeQMYZX+TcLGnC6Hjq/
   g==;
X-CSE-ConnectionGUID: lHgR7kVQQ7uHzvLB+F/ikQ==
X-CSE-MsgGUID: QUJVT1yUSZKJDHKVkoKFww==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64745391"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="64745391"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 16:50:24 -0700
X-CSE-ConnectionGUID: LXneMHXuQQa8XKipxfQLOw==
X-CSE-MsgGUID: 1FoZk84MQWy+lzlFRK4foQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="153375860"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2025 16:50:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWkk0-000anC-1X;
	Tue, 01 Jul 2025 23:50:20 +0000
Date: Wed, 2 Jul 2025 07:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for SERIAL_8250
 when selected by ECONET
Message-ID: <202507020730.rBEjwuJQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66701750d5565c574af42bef0b789ce0203e3071
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 mips: econet: Fix incorrect Kconfig dependencies
date:   5 weeks ago
config: mips-kismet-CONFIG_SERIAL_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250702/202507020730.rBEjwuJQ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250702/202507020730.rBEjwuJQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020730.rBEjwuJQ-lkp@intel.com/

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
