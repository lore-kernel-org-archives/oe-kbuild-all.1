Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF59C79F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765570649; cv=none; b=CR7MTerpyzdIyNMzFuZF0soZeerqC+bN3C9qUE6H8nhtWg7xb6yQcoxkSn1drZd/NYu0D2Ts5G1yoUMSJmeEpcJo08F2KFjGOy9EqRA1ktpZXjKt68EmgPKLNEdVWUmL75rh0rKYK03cZqe7uOWHBKlhoAkZCu1GIvmGKq6SY4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765570649; c=relaxed/simple;
	bh=1nb3FzCRD6yAKODUXgSIWjy8wpqQD/IrCqNzF4rZYNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PKH/+FFF4JEcqeamKQLpFjRlaRAPK1mTY8WRAkYqMxP1uz45aUqRcuMNHeTLVROh/kama17Iy/TWTqsgWlZKYhbwqiYu2YLE/R31ht4CLEiVrN6qShGVvoAJJWztVW1tEQSx/wgUCm3ksAxubzFz2fPUVvnYeTKYqYbeEXdCX9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MuvpDhbO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MuvpDhbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765570648; x=1797106648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1nb3FzCRD6yAKODUXgSIWjy8wpqQD/IrCqNzF4rZYNM=;
  b=MuvpDhbOpxlxmp900Jx3aLj7vkOaaS0IKXkg+Vps6aeXsQFMZKzHw+09
   Yzq8oWnhli0Nas78q2HXYzPqo9quLCw5gBBA1+dJfrS5vz1DiosQ8/G2f
   cRGYN3wq6cleVZVgFPzj4e10uh0LTHvZIHnbxB2YGcOCSbX66choMQt3h
   3RIA+PcKXBqZtzy+DVGiUueX0MeWcXhyUnch3NpTAPsKiq4IJDc7JYQmb
   w2x5BSUUaZXvZoRTMFK1/p1uPKUPpwgUSuoHEuWyzpZ7OxtpX/sUkupMm
   +e9bqQ1sxgNq7ruDbwhaBioEwXyg4Q2O3OJLFRKZgiu33Fepqu2dglIEt
   A==;
X-CSE-ConnectionGUID: /q+qdYWiTYOcVUhDJANbWA==
X-CSE-MsgGUID: R4aVD/f0Txm53z2dqYQstw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67521818"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67521818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:17:27 -0800
X-CSE-ConnectionGUID: uYq/d+GPQfySuTkASDuOaA==
X-CSE-MsgGUID: FZeCOywjT4emKgpyqglrZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201660470"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 12:17:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9Zs-000000006ZF-01mk;
	Fri, 12 Dec 2025 20:17:24 +0000
Date: Sat, 13 Dec 2025 04:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 9/29] Warning:
 drivers/tty/serial/8250/8250_bcm2835aux.c:46 struct member 'uport' not
 described in 'bcm2835aux_data'
Message-ID: <202512130415.AEb1Df4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   0f1d0ac3a485c45230619e28ef5e86b75c96b114
commit: bfe0c759ccc0d64ade08d2f0434bd081a99f43cf [9/29] serial8250 port operations work on struct uart_8250_port
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512130415.AEb1Df4I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130415.AEb1Df4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130415.AEb1Df4I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tty/serial/8250/8250_bcm2835aux.c:46 struct member 'uport' not described in 'bcm2835aux_data'
>> Warning: drivers/tty/serial/8250/8250_bcm2835aux.c:46 struct member 'uport' not described in 'bcm2835aux_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
