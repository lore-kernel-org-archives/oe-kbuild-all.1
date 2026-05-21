Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB85272621
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779393754; cv=none; b=D46p/nHbx+bibhtLcOouHCSjPTw1AxSuq6ZMEtKD5w4b4myVppz9lvySs8NAsnJVGQR04arYpCEw8YqclaRibyRd8ktwfot8Sl317ZZwpT9qPpOdLqsxav4reTKwzlazRqVL5eNek1vaTQdBSDpCGOqjTEbKAXfpQi7nuQ0PcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779393754; c=relaxed/simple;
	bh=iSx+iIx0fsFuIu1G0jOZLU8OZcmZzeLuxHxK0G52UoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJddGwQeMOZe/KPrbhi3KP9cNfz+zKO2+dIIxCEKmZikc+uDmuJ6BtHtOC7Q3Ni0EQ+R3Txh/w+ZJnNz4O+QebsrPkKgY3xjhEYfeDyTsjnDP4VrkqwCQrrUoVizzRhTQwYewUlSpKW8tMDIXChVOBiOB1CFt5QxaK93/U+H80k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSqR6BnD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSqR6BnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779393751; x=1810929751;
  h=date:from:to:cc:subject:message-id;
  bh=iSx+iIx0fsFuIu1G0jOZLU8OZcmZzeLuxHxK0G52UoM=;
  b=eSqR6BnDzBYmi5EAUTJcaZ19E/f8HruhGMMlrJxLonWZKhVRhu/iJ9uH
   etwp1JR/j8PnZ9YLlFyMRSIN8XUcL0sb4aQTn0f9ZXoaJ6gK2yuc2F7mV
   dJ4s6Inu7KQfzT4r+tKuIvLf/Lrfd2EgUSCsMPKtzmdOJJkF6NFzkb2KD
   HOUjT9NtJATLW7GSpGRacS1ReTY6sPEmHeSspWZNlVWkd9W/6L+XsyO4H
   75MwR+jtnXVDEJG2cFTVe1pVthrfgdfT2rLNm+QmZOXYA8G2eSezVOF4J
   Kq16KWlA8nXhKWLYKrmsGty99wPZJGfrMoxBbb/FVq+b1KtIovsaZ+qx6
   w==;
X-CSE-ConnectionGUID: w3BlfwkWQDqTA8WOB+Pptw==
X-CSE-MsgGUID: IIWDtXsIRmCxpLtV4crkIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90618831"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="90618831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 13:02:31 -0700
X-CSE-ConnectionGUID: nh41LBp9T7Kuj67gJZgXSg==
X-CSE-MsgGUID: CGZ7hn0nQliAbHK9Ku5K6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="234295878"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2026 13:02:28 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ9b6-0000000015V-2F1u;
	Thu, 21 May 2026 20:02:24 +0000
Date: Fri, 22 May 2026 04:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sohil Mehta <sohil.mehta@intel.com>
Subject: lib/crypto/mips/poly1305-core.S:95: Error: opcode not
 supported on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
Message-ID: <202605220318.kfz8bhPO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   758c807bb943138f887d42d986b645e12446ba9c
commit: 7e54e993ab8c98d912f54ad6f46bfcc9dcd65368 lib/crypto: mips: Move arch/mips/lib/crypto/ into lib/crypto/
date:   11 months ago
config: mips-randconfig-r072-20260522 (https://download.01.org/0day-ci/archive/20260522/202605220318.kfz8bhPO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220318.kfz8bhPO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7e54e993ab8c ("lib/crypto: mips: Move arch/mips/lib/crypto/ into lib/crypto/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220318.kfz8bhPO-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/crypto/mips/poly1305-core.S: Assembler messages:
>> lib/crypto/mips/poly1305-core.S:95: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
   lib/crypto/mips/poly1305-core.S:96: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $9,4+3($5)'
   lib/crypto/mips/poly1305-core.S:97: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $10,8+3($5)'
   lib/crypto/mips/poly1305-core.S:98: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $11,12+3($5)'
>> lib/crypto/mips/poly1305-core.S:99: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $8,0+0($5)'
   lib/crypto/mips/poly1305-core.S:100: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $9,4+0($5)'
   lib/crypto/mips/poly1305-core.S:101: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $10,8+0($5)'
   lib/crypto/mips/poly1305-core.S:102: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $11,12+0($5)'
   lib/crypto/mips/poly1305-core.S:265: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
   lib/crypto/mips/poly1305-core.S:266: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $9,4+3($5)'
   lib/crypto/mips/poly1305-core.S:267: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $10,8+3($5)'
   lib/crypto/mips/poly1305-core.S:268: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $11,12+3($5)'
   lib/crypto/mips/poly1305-core.S:269: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $8,0+0($5)'
   lib/crypto/mips/poly1305-core.S:270: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $9,4+0($5)'
   lib/crypto/mips/poly1305-core.S:271: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $10,8+0($5)'
   lib/crypto/mips/poly1305-core.S:272: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwr $11,12+0($5)'
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
