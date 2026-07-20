Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357C3F58DC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 12:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548879; cv=none; b=CKq5g5hP68HRDpjxK+ouVvg6/JkvzmpQqUGxoglnhzUemaMjYclhLZSg0wfXf5lRgJ1csveA//yytjlqdwwjHIyhfV2MxB8q+UraxKjd3NodmfK55VeUrZQJF2b7BzK97vdr+64q6zRhEfGocc9Q0ER+aGwmTNF42nqeAHxWQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548879; c=relaxed/simple;
	bh=JQrsL4X+ycOFM8NjjHdIOjKTbIqNEUICRlvpmEIgQf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S2RCVbf6t5NX8j8b0BWpIDev4aOud8kZb5hMGXqrl8l73oCNWS1R65PARBFqhWn2cGuUeBIkncKPn5Y7QWiyRfQQSylKcZ+/8drZDpH6LtTYKKhJKk8u59nbvBr8vL8mQMiri4rMwZtsLVnS7QcG2t18egaLJD2CyJPt0P7SyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwXex8HU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwXex8HU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784548875; x=1816084875;
  h=date:from:to:cc:subject:message-id;
  bh=JQrsL4X+ycOFM8NjjHdIOjKTbIqNEUICRlvpmEIgQf4=;
  b=FwXex8HUICv+G2Gn3OB1qpO+7M1d9V+BUz+sHV2yTyTn0LMbugFpElX0
   DT5mi5zh0BmkWkjLdX7fLTq05fmYjBc8j+7htf4fQpxtp3f6dRuYqxm4H
   hgDGCQBSv0lO9z1tdwlTSJXAlmHD0d/nnSAMZKUCzdxCwd4CYN6q5tdri
   5GAHGcmb+PCuT+zWiNaVnGGtD4iQGzVgN9TJK86MwuSUisbhHwuOTwFVM
   o+N/r1w20jjB4mfqleU8Y3KSsubwz9o+tEBt3tfPWGsinuzV28E6JFtzY
   BDCPFlcQjRY6idn1joFULGHcmbE8nwN2+F8VSYG6J9o7zSA32PgD8mKwf
   w==;
X-CSE-ConnectionGUID: U5mawUiOSP6nz1kv7k3ecg==
X-CSE-MsgGUID: zfM6M9ISTIyeOZ3LuikeDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102677244"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="102677244"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 05:01:13 -0700
X-CSE-ConnectionGUID: /D4aNk+uTT+5gPjT4jFyXQ==
X-CSE-MsgGUID: NgTqwC6bQE+anhXMfzFgLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="251095921"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jul 2026 05:01:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlmgH-00000000WDt-0PQy;
	Mon, 20 Jul 2026 12:01:09 +0000
Date: Mon, 20 Jul 2026 19:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sohil Mehta <sohil.mehta@intel.com>
Subject: lib/crypto/mips/poly1305-core.S:95: Error: opcode not
 supported on this processor: mips64r6 (mips64r6) `lwl $8,0+0($5)'
Message-ID: <202607201949.ou0mo3hg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 7e54e993ab8c98d912f54ad6f46bfcc9dcd65368 lib/crypto: mips: Move arch/mips/lib/crypto/ into lib/crypto/
date:   1 year, 1 month ago
config: mips-randconfig-r064-20260720 (https://download.01.org/0day-ci/archive/20260720/202607201949.ou0mo3hg-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260720/202607201949.ou0mo3hg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7e54e993ab8c ("lib/crypto: mips: Move arch/mips/lib/crypto/ into lib/crypto/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607201949.ou0mo3hg-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/crypto/mips/poly1305-core.S: Assembler messages:
>> lib/crypto/mips/poly1305-core.S:95: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $8,0+0($5)'
   lib/crypto/mips/poly1305-core.S:96: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $9,4+0($5)'
   lib/crypto/mips/poly1305-core.S:97: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $10,8+0($5)'
   lib/crypto/mips/poly1305-core.S:98: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $11,12+0($5)'
>> lib/crypto/mips/poly1305-core.S:99: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $8,0+3($5)'
   lib/crypto/mips/poly1305-core.S:100: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $9,4+3($5)'
   lib/crypto/mips/poly1305-core.S:101: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $10,8+3($5)'
   lib/crypto/mips/poly1305-core.S:102: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $11,12+3($5)'
   lib/crypto/mips/poly1305-core.S:265: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $8,0+0($5)'
   lib/crypto/mips/poly1305-core.S:266: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $9,4+0($5)'
   lib/crypto/mips/poly1305-core.S:267: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $10,8+0($5)'
   lib/crypto/mips/poly1305-core.S:268: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $11,12+0($5)'
   lib/crypto/mips/poly1305-core.S:269: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $8,0+3($5)'
   lib/crypto/mips/poly1305-core.S:270: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $9,4+3($5)'
   lib/crypto/mips/poly1305-core.S:271: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $10,8+3($5)'
   lib/crypto/mips/poly1305-core.S:272: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $11,12+3($5)'
>> lib/crypto/mips/poly1305-core.S:395: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $17,$8'
>> lib/crypto/mips/poly1305-core.S:396: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $12'
>> lib/crypto/mips/poly1305-core.S:397: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $13'
   lib/crypto/mips/poly1305-core.S:402: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $23,$9'
   lib/crypto/mips/poly1305-core.S:403: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:404: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $2'
   lib/crypto/mips/poly1305-core.S:410: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $22,$10'
   lib/crypto/mips/poly1305-core.S:411: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:412: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $24'
   lib/crypto/mips/poly1305-core.S:415: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $21,$11'
   lib/crypto/mips/poly1305-core.S:419: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:420: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $2'
   lib/crypto/mips/poly1305-core.S:423: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $18,$8'
   lib/crypto/mips/poly1305-core.S:428: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:429: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $14'
   lib/crypto/mips/poly1305-core.S:432: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $17,$9'
   lib/crypto/mips/poly1305-core.S:436: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:437: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $2'
   lib/crypto/mips/poly1305-core.S:440: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $23,$10'
   lib/crypto/mips/poly1305-core.S:443: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:444: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $24'
   lib/crypto/mips/poly1305-core.S:447: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $22,$11'
   lib/crypto/mips/poly1305-core.S:451: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:452: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $2'
   lib/crypto/mips/poly1305-core.S:455: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $21,$16'
   lib/crypto/mips/poly1305-core.S:459: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:462: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $19,$8'
   lib/crypto/mips/poly1305-core.S:467: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:468: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $15'
   lib/crypto/mips/poly1305-core.S:471: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $18,$9'
   lib/crypto/mips/poly1305-core.S:474: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:475: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $24'
   lib/crypto/mips/poly1305-core.S:478: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $17,$10'
   lib/crypto/mips/poly1305-core.S:481: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:482: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $2'
   lib/crypto/mips/poly1305-core.S:485: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $23,$11'
   lib/crypto/mips/poly1305-core.S:489: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:490: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $24'
   lib/crypto/mips/poly1305-core.S:493: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $22,$16'
   lib/crypto/mips/poly1305-core.S:497: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:500: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $20,$8'
   lib/crypto/mips/poly1305-core.S:505: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:506: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $24'
   lib/crypto/mips/poly1305-core.S:509: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $19,$9'
   lib/crypto/mips/poly1305-core.S:512: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:513: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $2'
   lib/crypto/mips/poly1305-core.S:516: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $17,$11'
   lib/crypto/mips/poly1305-core.S:519: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:520: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $11'
   lib/crypto/mips/poly1305-core.S:523: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $18,$10'
   lib/crypto/mips/poly1305-core.S:527: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $1'
   lib/crypto/mips/poly1305-core.S:528: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mfhi $2'
   lib/crypto/mips/poly1305-core.S:531: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $23,$16'
   lib/crypto/mips/poly1305-core.S:535: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $7'
   lib/crypto/mips/poly1305-core.S:538: Error: opcode not supported on this processor: mips64r6 (mips64r6) `multu $17,$16'
   lib/crypto/mips/poly1305-core.S:543: Error: opcode not supported on this processor: mips64r6 (mips64r6) `mflo $16'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
