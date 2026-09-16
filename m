Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB43C5522
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 05:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537261; cv=none; b=caX79V5gO8XFYiCqXIDc/9Bo8NhZ8lPaBzPVlt+5OUBChY9GLGhyxdDbV69AOSQ/qtOYHAX+6hhjYEWsqjb5Qlbyt160DJ0DrhtpD5lWjVXvqg+Xg80rm0rUJChuyyFirX4cqwOLYQSZaJnkBaZ67rBCBUQQobb9clQ7gxDHa8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537261; c=relaxed/simple;
	bh=09ovjqp8MapiCQOdFhCkYY2NA1o4Hr3P8iXjA9SYNrE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QSbDgrsdrgLbJ3m4f+aD0fdiUfyn+pc2uYMp98EjNFKg/pdxgx16jTuRMBbn5hD56fPx08sZ9PX27rL1+BEH3UT9VcciYfCJVfyw7x2mfS6qHKToUrq7MypYkxCoonrBW4CQNwa4cFeTmLadZ1CQQlU35+LYp3H5isJm0S9J1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBUXlF4t; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBUXlF4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789537260; x=1821073260;
  h=date:from:to:cc:subject:message-id;
  bh=09ovjqp8MapiCQOdFhCkYY2NA1o4Hr3P8iXjA9SYNrE=;
  b=QBUXlF4tDQFxPwaw0ZFTakc1z2hJjzKC5136hr8rYuEfxVxFbZjxZzsh
   XTPCXE+1NUl4wKeIqwpFxuesKCjWOhnLDDBLPWNp8Kz4j0lADZJuEPiWS
   WhLd9u1d4mgMUD2odoGKeV3RP0Gc7LzIBywNavBfAqOdItaqIdczp82PM
   UOQzZj35r+9N3xSxQzv+9vq5TrAomRfhn3GVGm943EQy6DsdXXC3IG5lt
   M9MXL1v0BiAS4/Q+FMVTqcvYm9TPY9TpLfS+veFSnar60HQDO7QkWQwGS
   acjBR2PaldIKZvv3tHLa7ZeuCINKiviQi9tBoGogR8P+sppl+uPHCSDK3
   A==;
X-CSE-ConnectionGUID: ixiVoky/RbS81bN2TEqtXg==
X-CSE-MsgGUID: 0BZ1BozwRWKm/hufNTAm0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92415728"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92415728"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:40:57 -0700
X-CSE-ConnectionGUID: iAiNq4zHS6mE/Y1vBSZcjg==
X-CSE-MsgGUID: r4YUm88HRZGE7eHqxvBarg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277355928"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2026 22:40:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6iO5-000000005Xz-2tGR;
	Wed, 16 Sep 2026 05:40:53 +0000
Date: Wed, 16 Sep 2026 13:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 62/67] Warning: drivers/cram/cram.c:591 function parameter 'acr' not
 described in 'cram_balloon_inflate'
Message-ID: <202609161343.IxTVO2fq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

First bad commit (maybe != root cause):

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: caa42061601a1b867acfeb2aaa83f5f33bf90810 [62/67] cram: compressed-RAM private-node read-only tier
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260916/202609161343.IxTVO2fq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161343.IxTVO2fq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161343.IxTVO2fq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cram/cram.c:591 function parameter 'acr' not described in 'cram_balloon_inflate'
>> Warning: drivers/cram/cram.c:847 function parameter 'adistance' not described in 'cram_register'
>> Warning: drivers/cram/cram.c:591 function parameter 'acr' not described in 'cram_balloon_inflate'
>> Warning: drivers/cram/cram.c:847 function parameter 'adistance' not described in 'cram_register'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
