Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE827FB25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733339; cv=none; b=hyaPBtJujNTe2ViZHANuf658MdQVAppoN8j+nJ090xPcXY5yYp25QhyFSTrmo3zWSLADItCtcuYbFrUC4sXZViOLwhU8MKfPbkQ4R/VzcmqnAQ0eT6nTlpNwrgzFHymwFw0FNqLggy43bLC+HdA2BDJ4m19a7JTgE/aQ6GzXhXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733339; c=relaxed/simple;
	bh=FSVZXCUup0TVBH+E9Kic+gVqsPkVqzF6m8kInkWC9JE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZLjliyHxlODS1aX0JXzRK5qV4cC6NmkugUs12/mDK9kvWv/qo6PUvCdqd0tgX7kKaUWLAi2bFJstxoP8f3SgGjay/VF/ZPkrpjCU6ddGp0wdQTPYXFMUsqCocDi34tpcN5zvNVU47tHreyDhC2/N/Xj5bghi7ZF8h4iV8w6EmMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPU9hS53; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPU9hS53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770733338; x=1802269338;
  h=date:from:to:cc:subject:message-id;
  bh=FSVZXCUup0TVBH+E9Kic+gVqsPkVqzF6m8kInkWC9JE=;
  b=TPU9hS53F/ecZhmjH+GYYvwBWdg0fCOCHzQI6d0TMoOYh9rJ9qwsTDeI
   IF83omEQR/Bv1PzmeyeLQsYmiZ1pQfFiEo49+/YjS5BDGemnN1mzEchHi
   oG/1Xa++jabVC0Mw9jvM2ZPE4MAGLI+x+MLBrpB4BNNQXAT8Y6ZXVcjPD
   6bEtd9LM4sc8/3Y+jLKY4H6na09a/7vhQ8351kekp1oKsaBCbtUfevTYx
   z5k3FU32onWgzbzuaflX+YanQkgmPS0Rz87hlmB8WjIdj64ICQ6K7OMqe
   Dtbw8L82yidmquimNNqjwol0v54U536+bgE1Hd+I+QrNLW08OF8tF2mCq
   Q==;
X-CSE-ConnectionGUID: Th5k3LwCQEqs9IMCH8+I8Q==
X-CSE-MsgGUID: MzU6n+GSQYaE0CJ484DL7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71073436"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71073436"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:22:18 -0800
X-CSE-ConnectionGUID: j9rmDqExT8mlPHy67LHJkw==
X-CSE-MsgGUID: 2fO2iT0ASJeIpQOvV58kww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211762462"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Feb 2026 06:22:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpod3-000000000qr-3WlS;
	Tue, 10 Feb 2026 14:22:13 +0000
Date: Tue, 10 Feb 2026 15:21:51 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 7/15] <stdin>:1636:2: warning:
 #warning syscall container_fork not implemented
Message-ID: <202602101523.uguRdmGU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   ac4ec62cd4decf787406c1407f18ade110d80c5a
commit: 564ba8a51314749947e05785d02b2ec40f73f571 [7/15] containers: Add container_fork
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260210/202602101523.uguRdmGU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101523.uguRdmGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101523.uguRdmGU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: #warning syscall container_create not implemented [-Wcpp]
   <stdin>:1630:2: warning: #warning syscall container_wait not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall container_kill not implemented [-Wcpp]
>> <stdin>:1636:2: warning: #warning syscall container_fork not implemented [-Wcpp]
   <stdin>:1639:2: warning: #warning syscall container_socket not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
