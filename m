Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418291DF26E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 22:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577977; cv=none; b=MP2AMtAJqG5VqUm/dhSNuquQGUhW43Z0Th/R5VW8xs2GJZhA8aMtGilHhgkku7OdqSUXqgxzbI+DppjtdqrMT68BLQ4uHKAmJTlSryyoW4wa0QQKQXAHmZKMGOMPyAbYfKiQTjT0z5370YUO4vRs2B3D7ireQq42ZlimcCd8kcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577977; c=relaxed/simple;
	bh=eXrVdS2oku6therFEZqYQ/cmwxBpBAgMtd/m8Jn44FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmxXJPJGr2m2OS36sSL4XMR8CcWNKLnrLqI5ni8igIBRsIw4pF5QwVdFLxuXGNo+Vo+ldeyZ44hlHP9vdHOlVN1ywdDybo7x7DtxJksSRZad27BhHLTLCRfyV4GGnYh5AXQv8Yly8oVopvr1+CxwzOL/kYPZ9fwLj0hnpnvVSbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DklaIphI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DklaIphI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765577975; x=1797113975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eXrVdS2oku6therFEZqYQ/cmwxBpBAgMtd/m8Jn44FQ=;
  b=DklaIphIxihLoMH6kbr6HnLw6xYp/cCyZpadb7ONJYUF2M/MC4w/cNsU
   RkuaeVtfGZ6Zd7wg7+gLGm6zGoAqwJkggCzeOwIjDJUMjVuVq9EjK7hx5
   d8ILW3QnjErg8xWFvbP+KiZpjPjdFWr8MuyAWoNiqTpWQRodvpqkqNRd+
   xVHLv66NcfQ186hUxZLXdb0DzBZ5tzkKNpSNA4XFpqZjITmg6mZskx8sb
   yaKXhJDi7fXKLHPGvqTXfa1TGc1R/FU8F6/j9SDaK9P4DOkhOj70vuLAH
   fE3P4a7uzOeAOilZ8IfYAOmoloPTygExXuIoCJTk+CMHrTvdBPCGMux52
   A==;
X-CSE-ConnectionGUID: Gd+DY6blSz25mC7jjJm55Q==
X-CSE-MsgGUID: Pfnh8oXVRQmzSj5OR+2aiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77901760"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="77901760"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:19:35 -0800
X-CSE-ConnectionGUID: dqfkujwDS2ehgj0o5BTfnQ==
X-CSE-MsgGUID: Wc2NkeUuSE+wqn7prKWyrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="198016226"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 14:19:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBU3-000000006gl-1QC6;
	Fri, 12 Dec 2025 22:19:31 +0000
Date: Sat, 13 Dec 2025 06:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 ip22zilog_probe+0x120 (section: .text) -> ip22zilog_prepare (section:
 .init.text)
Message-ID: <202512130606.UpIxNGru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 3fc36ae6abd263a5cbf93b2f5539eccc1fc753f7 tty: serial: ip22zilog: Use platform device for probing
date:   4 months ago
config: mips-randconfig-r054-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130606.UpIxNGru-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130606.UpIxNGru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130606.UpIxNGru-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: ip22zilog_probe+0x120 (section: .text) -> ip22zilog_prepare (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ip22zilog_probe+0x14c (section: .text) -> ip22zilog_prepare (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: indy_sc_init+0x1c (section: .text.unlikely.) -> indy_sc_probe (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
