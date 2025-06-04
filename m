Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F041C5D62
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 13:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043074; cv=none; b=s9ymAUjizfnHtiHovegureylHnp6SQZTAQM/GVjeySfvtx0cP+BDJ4XJ9U61R5igDgvYhFR2eTsP5hv33YewolfmH1lj9JvHoGFr39kTd9/Kf8IasIWLfbEA+0U6aHuK77BYGThElBC2O0aqv+pLZ8OIP8q7jf/o3okiM1OP4Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043074; c=relaxed/simple;
	bh=I0/X15fsPCbB4IC8stqcrtJK0qLeVcj1Ba8WEoCxTUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2di8VhYwuhXRK4n1C2nEouIk6BaHsh7u50NNPhmGI6YDHWI2A2boQ8HFSasq8IxHRrpfQvuMexP+txDKUqMzpnClwC2NxMF2P0p3rcPvUHWsBvU+hSSgtFo+WYuDlZ4sTW9I4QGOHiRlKPDWqRbKHouAdSNCEO141tJl/+bu/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyS/FvEW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyS/FvEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749043073; x=1780579073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0/X15fsPCbB4IC8stqcrtJK0qLeVcj1Ba8WEoCxTUg=;
  b=EyS/FvEWaWlbLc10ks6LjlokM5wr7+YBqEK9GYUMFKwavszzHkghhTsw
   n2FaUrZqPitGml0/j+6dNug+mk7tT+UGZA24CnCyma3shiqTTN9REJ9/x
   VRHlgSKj91Y57j9y52MqGsLcQ5ic9IrLQdVGKfUM87EQ3N0uKVqqdiTag
   XErT3/TNOrauSctVj+Wwaa4aJBl7UJDSWfWeUXXwP6zKT04HFMcp31dtW
   Ofsgfgy6xaopyyiPNuew1ZDx0B1JwEwmrJnjijVGnPq0q0YxH69jHsV3m
   5UXH52EITCo9X6DnkW1aYXJyfiWN+Hg2A0x3UjDJ93/DDXqTL76DtEJh5
   A==;
X-CSE-ConnectionGUID: mSPavyCfQBKLoXfdmuSopw==
X-CSE-MsgGUID: wwtfzBtJQiin5PIfjp+Nhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61388748"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="61388748"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 06:17:52 -0700
X-CSE-ConnectionGUID: hJxiEA7GTy2QA9RL9b2s+g==
X-CSE-MsgGUID: Vq3epDYRSy+9YAq+aMUnAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="149979534"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jun 2025 06:17:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMo05-00039N-0o;
	Wed, 04 Jun 2025 13:17:49 +0000
Date: Wed, 4 Jun 2025 21:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 41/43] mm/zblock.h:24:2: warning: #warning This
 PAGE_SIZE is not quite supported yet
Message-ID: <202506042117.iH6LE0pc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   80bb0b2983e95be26d929303d589276875c8900a
commit: bffdb7003af983450573b7d818160cf1dc1f0fef [41/43] mm-zblock-avoid-failing-the-build-fix
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250604/202506042117.iH6LE0pc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042117.iH6LE0pc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042117.iH6LE0pc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zblock.c:28:
>> mm/zblock.h:24:2: warning: #warning This PAGE_SIZE is not quite supported yet [-Wcpp]
      24 | #warning This PAGE_SIZE is not quite supported yet
         |  ^~~~~~~


vim +24 mm/zblock.h

    16	
    17	#if PAGE_SIZE == 0x1000
    18	/* max 128 slots per block, max table size 32 */
    19	#define SLOT_BITS 7
    20	#elif PAGE_SIZE == 0x4000
    21	/* max 256 slots per block, max table size 64 */
    22	#define SLOT_BITS 8
    23	#else
  > 24	#warning This PAGE_SIZE is not quite supported yet
    25	#define SLOT_BITS 8
    26	#endif
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
