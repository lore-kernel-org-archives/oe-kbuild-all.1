Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4D2337BBD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782944410; cv=none; b=k9Z3ZU3XuJTtt+Lb5slvSfSwt3lP8zZoNZRGrjWIKvhWV6u6NZq2LghiAXK/Ms4wK5tG4Icj8vGsBYIKSHz0ynpaccZN5xTP53UllWaKd8tLFL9ZeGoifgINtTPm/n7GjfcFAecmDsnwznY1hKebIT2GchUB0FYK5pnK6jZVPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782944410; c=relaxed/simple;
	bh=BJArs17w4NWKh2rZbhy90geVAhvS7W3hVIsGetBTXeg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B78BU6oxmlGXEjx+VBFiCyz9UA6gI7zcLRfF1dwbn5khsDGzbqOWfkvPnh4d0gwK9si4I7TgcdYuQkz1PgVxyVkdcdPcMFY8Mk1DSqb7nhr4Z5gx+cM0cUyd1O9DTa3h8JK/5Yknkzqesy/0PHtDm+479ctH/3HlN61MFEXXLU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVcF0VUk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVcF0VUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782944408; x=1814480408;
  h=date:from:to:cc:subject:message-id;
  bh=BJArs17w4NWKh2rZbhy90geVAhvS7W3hVIsGetBTXeg=;
  b=iVcF0VUksaF8r3daFvTWV6WUs70cGEypWYowiUoh++X+y2ZYWgM/UFJu
   v8Sy7cXNUSqz54vMZ2uYjXaRWznWJ+lkjk7CAWllACGTyMTWsXyF0CGTi
   wUganslMI1UVOFozoUxdwGZSWvfEuPu/ZnJjVRhoXSVYh2nhZNHNgyxYN
   3QLBCfAyM4rUwCanHoR3XsGle5wnM7KJ3AxwqWu4//i+HVVUpipHWHm5M
   vVoKqa9B43SodXHNo8SNcjleLem4SkGHJP/XofcwRDktiLT3V3faxjg8k
   6gt3qaNC3rhytcuQ3qkbBdRJqZlbM4vJA5WbfQGw6rGJdrchGPA/4552R
   g==;
X-CSE-ConnectionGUID: OEqfa7yYQKmoSE/EmUeJRg==
X-CSE-MsgGUID: CwQlKI1CTIqZ0aXlR5F7kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94847748"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94847748"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:20:08 -0700
X-CSE-ConnectionGUID: Y624VhPFRpCw9WNJ/CpfHQ==
X-CSE-MsgGUID: g85dT6DSTRO6E9r2ROFGoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="248232906"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jul 2026 15:20:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf3Ho-000000009g3-32In;
	Wed, 01 Jul 2026 22:20:04 +0000
Date: Thu, 02 Jul 2026 06:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 11/13] rsrc.c:undefined reference
 to `__udivdi3'
Message-ID: <202607020605.ZadD5Lau-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: 83df08bcb3ef8910445506a7f1e4214a12c4ead6 [11/13] io_uring: add IORING_REGISTER_BUFFERS_ALLOC_FOR_FILE (opcode 38)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607020605.ZadD5Lau-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020605.ZadD5Lau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020605.ZadD5Lau-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: io_uring/rsrc.o: in function `io_register_buffers_alloc_for_file':
>> rsrc.c:(.text+0x658e): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
