Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3D33F8DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 17:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029297; cv=none; b=lXlGe817nRJLBIkHcqD7DeLRFlQdJqWDlQtoq1z9hKiEcl8s61Xwf4P+0RGkNnPzBdXHimqNH70gYIcNA8wwfPY6PboZmBTpaQoB/9/99N4o2EfJKFWqZLaJ5JcN8dxxxIdnnQhfuD6unOIKXiKPqXefdYp/B7ugSrauhumLD5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029297; c=relaxed/simple;
	bh=IjUiLe8Dj7/AnoPLf5w9mmlh3+z3jQs8+sZB+aRnm74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=le0j1PlkapUzgOEoPxHcM6XmEDDyCgPYcIaeJAdi6c6Drk8G1gmtxIgmmUqEZUTr2rKn4ZPunIvK46fE1G27VU6v0HouV0gksnDsp5hBa8USkkIh3X+hzPBnJXlK4cqHL2hXjgVbVTtiyCpsQ8ocaugRwcmW7LWoYnjW+Ika8lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVz7OHGI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVz7OHGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774029295; x=1805565295;
  h=date:from:to:cc:subject:message-id;
  bh=IjUiLe8Dj7/AnoPLf5w9mmlh3+z3jQs8+sZB+aRnm74=;
  b=SVz7OHGIXUwaRLs9nO4Zs7N7+AgwMJmyu7S/lXjQ0EtbA0+jrV3Xd75f
   yvbQbOQyw7+81tQ7phdXSmvgS4LJcfiBN2DCpb/2DpEAk8dfKUprKdAKX
   sMFer1kF4QMcAPb5k3euhDg5dLd+D1DdCOIiBSoU8mlgGgerni6oY4fY2
   HrljBeWw0KDmLTh7fRaUkfZCk6sp1sIqjjj0My3z9LjsSSykMiaAOkPsR
   xCztujHXIgJ3OvPWlIaHtf4QuANLaQOM5lXmZyXNStNEQJfzCXOTJ1tmL
   BwrVnG31C5AKRvex2Vk9+rAyfBW1tLPzuhBZPmKOr4nIOWcGiGX1PRhEN
   Q==;
X-CSE-ConnectionGUID: 4hxNA5JRQ/OHZShNOlSMzQ==
X-CSE-MsgGUID: 3TAVvxd/Rru5KBhGgnnGFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77728717"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="77728717"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 10:54:55 -0700
X-CSE-ConnectionGUID: HMxAtweMS1WbUN9F74mm0A==
X-CSE-MsgGUID: nvZUkPxCSqGe+PfHDn/nPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220685029"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2026 10:54:52 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3e3d-0000000003i-2hhD;
	Fri, 20 Mar 2026 17:54:49 +0000
Date: Sat, 21 Mar 2026 01:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sohil Mehta <sohil.mehta@intel.com>
Subject: lib/crypto/mips/poly1305-core.S:95: Error: opcode not
 supported on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
Message-ID: <202603210105.sdD4rsTq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e4f8f1a3d081e834be5fd0a62bdb2554fadd307
commit: 7e54e993ab8c98d912f54ad6f46bfcc9dcd65368 lib/crypto: mips: Move arch/mips/lib/crypto/ into lib/crypto/
date:   9 months ago
config: mips-randconfig-r131-20260320 (https://download.01.org/0day-ci/archive/20260321/202603210105.sdD4rsTq-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210105.sdD4rsTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210105.sdD4rsTq-lkp@intel.com/

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
