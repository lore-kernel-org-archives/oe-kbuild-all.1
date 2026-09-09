Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972947A873
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960727; cv=none; b=D8TR66dCGko7eXYaTfoaZajGIhw5QMgxVvRXzpY5t61rqbMeyD4efVShD3wAx+0fzF2GLpWuykyNgctxtPu0BgW7v0r5bsTeFrgTF1w3OV4WJpzHGdGiJg+edjZyhPbRwHDjhQYSp8Y5It952jLKmtEDGdngOmtSQ4tY42z1Ppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960727; c=relaxed/simple;
	bh=9HvmKMQaUzD8Mpcw6od+VVjuxta/B2wlXAgovJERvbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X3ag9WCq8nLoRiISBZwuY40vd5qAFQp3Mfi3KzQq7yYviFEdYc+4217zr7ZOD9ywuFC3qd/Yaq75bDIYm5OBlO29HtZdBEgJPieyort8bKSY1C8EHmwD6pspsrr+T6DotHD6D5ARZRCUCbHKwnQTzNMozjjDT43zorNgwsIv/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c02t3J2X; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c02t3J2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788960725; x=1820496725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9HvmKMQaUzD8Mpcw6od+VVjuxta/B2wlXAgovJERvbE=;
  b=c02t3J2XNqOdbQPsAizqmbNXSGxFUGkb8aLGfLUuZMtNjRQ0BEkC/6Nd
   nwDAx06A6NoFAtRlcncv5XUAROt6oEfyfDppHeE4k3BvSTzhAJntkSkSq
   KQAO3lgVZVxPAJi6ilWeOjdUT4eINRYyI4yRWmfn9xOAZLb0LUn1vHt1+
   Baj6mnQ/HdqHgbKPT1r4MrDEN41ITbRi/3xmqe9yhsHnguVaFfmLacq4L
   eZ4s7rulGClWCdFp6Alk4FNDu6RaN7LLwwyoQuzPFtRLqP0RAbevmcb9Y
   KOrs5PfSnmEywJMjuEGVwZH4Y6L/WRRDJA8Ja5Ob5jwCunqIi1et823L/
   Q==;
X-CSE-ConnectionGUID: x8C5XpSYS+y6TCV6cItd5A==
X-CSE-MsgGUID: /sQCtPUbS6ObKgI1fuOeYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99981390"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99981390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:32:04 -0700
X-CSE-ConnectionGUID: IJYowlVPQk2p0mdqoPEbvg==
X-CSE-MsgGUID: LPz6gfZ+RSaxc+6xzYz1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="270840563"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2026 06:32:02 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4IPA-000000000OS-1QkW;
	Wed, 09 Sep 2026 13:32:00 +0000
Date: Wed, 09 Sep 2026 21:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-merge-v8-all 228/234] ERROR: modpost: "__udivdi3"
 [lib/test_bonsai_tree.ko] undefined!
Message-ID: <202609092106.NvoylOeD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-merge-v8-all
head:   15fc7b4f50950618237402fdf3a05eb0caaff2cc
commit: 6befb245966f5aba1109cfd718a7cf4dd7f13375 [228/234] lib/test_bonsai_tree: Add benchmark for Bonsai vs Maple vs Binary Search
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260909/202609092106.NvoylOeD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609092106.NvoylOeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609092106.NvoylOeD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [lib/test_bonsai_tree.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
