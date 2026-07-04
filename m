Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C651E1AC45D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783171835; cv=none; b=P5YtK5xYJhEfDoEdRJYp96kgmGyPxX8zbud2ePLpSuXVevBSNawsqxpc7gp4gQiotZcVa5BAN5MX0+xy773lISFgpsoEZlGyeyiU8bePkDAfp0LWyoJrpU7jsbxsFjKth0itncfBJPgi7Ra58tzvX7dE4KkFWmyz74Z1ICAF+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783171835; c=relaxed/simple;
	bh=OL4wrOse30GLuEHrGDRai/RilhLSeSLAp4OzaIk6Q9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kUv40hTqH8AsgzS//Stgn7Bx7lwleNgVG0FjJ832GAlmEALx5WOcrdUdOqkfsDdAC+L8S5+3WYiWJRb8w2N1Ir69mAaoCyXz0ywpAdN1eshZ49gbMTPBca6GJdmOeKO7Y64D6e3p5jZ/xL7/ZDnlaWkN7ge46E14/+poGzWoE5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGgNr12+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGgNr12+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783171833; x=1814707833;
  h=date:from:to:cc:subject:message-id;
  bh=OL4wrOse30GLuEHrGDRai/RilhLSeSLAp4OzaIk6Q9o=;
  b=YGgNr12+oQeJ3mD0oGgSrHqh3KfOw8JQaeLXL4qb290TxdQ/zImbRa+2
   TmK3jgOEIKBVGvbc6KxwFSauXVM6RM7+mnixJ9rUJRJz8m8CS06lLsV3P
   Rrj1x4KlTZcezfdk2pgKXg3yt87EUjMDBummJ9+vm8DCBk9C7jpaii1Zq
   4GCkrM6wvaM1IRV68568ND9UqRIwXNzHSEBqX5nH+8LK2QzL1euq3Yg0e
   mbTBqRUU/VaDkplZ2SFMAr2M2KT4En4tthB+eEQpd7Pkw4VfeJNmkhM1Y
   pWupsfDUj361W+Z7aeUzULrVDOSZnAe79puJVB9BBHjZ+SZBoWv4HyBZw
   w==;
X-CSE-ConnectionGUID: SGj367t6Q5qAqnbNRGvAUQ==
X-CSE-MsgGUID: 46R2+BfwShGs2V8BHOUf6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="86430947"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="86430947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 06:30:32 -0700
X-CSE-ConnectionGUID: SFttR4Q1SoaiQzrOlCcZbg==
X-CSE-MsgGUID: BBC8n6J+Sd+xE/lgC75aBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="251576720"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2026 06:30:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg0Rr-00000000D4x-3Zr3;
	Sat, 04 Jul 2026 13:30:25 +0000
Date: Sat, 04 Jul 2026 21:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 121/121]
 usr/include/linux/videodev2.h:2550:41: error: field 'timestamp' has
 incomplete type
Message-ID: <202607042147.8wRzB1Ya-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: ebd1e440443121d18f730ab2aeea5586a754f36f [121/121] media: uapi: qcom-camss-stats-params
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260704/202607042147.8wRzB1Ya-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607042147.8wRzB1Ya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607042147.8wRzB1Ya-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/media/qcom/camss/camss-stats-params.h:102,
                    from <command-line>:
>> usr/include/linux/videodev2.h:2550:41: error: field 'timestamp' has incomplete type
    2550 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
