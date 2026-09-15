Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903C828033B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 02:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440877; cv=none; b=c868rlKP6iowrg8P+BSXvAZVRjyOSpoUFS5+v/DRAYV4B4tswXBJfYkwqHgQvReZhrReXA025ZAhlrwUDXAui5nGKMLmEBU3whNQlrwGknaNlVqMExRGAMRaT0ojfeH52agyXWstLe4kKWFSTajfwU6mFv017Q7pJvym+aiysH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440877; c=relaxed/simple;
	bh=JjzyLZ342E7meiR+yXY3phbi+ld2J3zA+8ltmqbXYOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pRFp4BFonZIMhAuGXfR6nB0Jo8+ikuC+ET9M+Tw39IqdnDlttK6UZi5DoQP+zCXsGn+QKdYFTdymLbmgYqwFnq15O5pCoAzgNysiukkqe6ljdy5lAj2HZOAqVdFm4Kj2Kv9BX63/7vTgLmJUK/b7z4+4dxtNLBhS5ajzU+u/ZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i82275bM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i82275bM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789440875; x=1820976875;
  h=date:from:to:cc:subject:message-id;
  bh=JjzyLZ342E7meiR+yXY3phbi+ld2J3zA+8ltmqbXYOQ=;
  b=i82275bMgDF7gbuCeTW64O9Zz0kfKb0gO69VFr2zZbaQ+nI7/c9Rw2YF
   Pl3GeFTSY4yg2OkiOkAGWpFtNtzSX4dMwQjaU03JjMsGHZg/qIQMoSPab
   FNHGgN7s3J6Hct4OK5LMkpZFp7JpQcrGurKZ7InNfVSovsahBSFdnBvcK
   i/IVNbv+Z9TUJGaQh2vrntf65/OjftBYQ803Kp74bqH++wp1uXjrVu6+l
   kA0p3m0ABwY21KbJzvYR0XXP0StC5RIHtxHk1AZYqekU/4ele3gc7h0jE
   YElTESFGhxyTvhaup/s0BXPlT9xEHJTqh3RjQQ++ZuYbsd0DwuSQ8QdOG
   g==;
X-CSE-ConnectionGUID: +P4OThycTPynWYonFSQ9MQ==
X-CSE-MsgGUID: /I5Wi7X0RfGgCjOY0ep8PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89639300"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89639300"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 19:54:35 -0700
X-CSE-ConnectionGUID: uHdo3FBvQFCQ9CayfZx6cA==
X-CSE-MsgGUID: XTul5aEnQnaSG9SyA8gULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269135209"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 19:54:33 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6JJW-000000000Tf-3ebS;
	Tue, 15 Sep 2026 02:54:30 +0000
Date: Tue, 15 Sep 2026 04:54:12 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 5/67] Warning: mm/balloon.c:116 function parameter 'allocatable_only' not
 described in '__balloon_page_list_dequeue'
Message-ID: <202609150435.m71Y43mY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: bffbc25036a9d12170b0fac9418be694af8622b5 [5/67] mm, virtio-balloon: don't deflate into a withdrawn zone on OOM
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260915/202609150435.m71Y43mY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150435.m71Y43mY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150435.m71Y43mY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/balloon.c:116 function parameter 'allocatable_only' not described in '__balloon_page_list_dequeue'
>> Warning: mm/balloon.c:116 expecting prototype for balloon_page_list_dequeue(). Prototype was for __balloon_page_list_dequeue() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
