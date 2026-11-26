Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709712;
	b=fDeGJ18tGkUHdwXBaLEyE+3+0HjWYW7ZikXWtzuE3L3vZYXCOPScSsKuajGjnUSDzM7C
	 6p3/EvWMLrF5ISpvjt9vfkj1dVlcKRloSqKImjj6p9g/TGvneJ0/lhUVF9BSPDJY63hZW
	 vc/G2BiXAVrqq/5jiXt0vDf0ORMD4bhAlLvTC/2tvIRprjfB+7PqPjQ9iW+Ud0DLnFWnW
	 88czKZAFDiSk8ZQOgAinQlVpEiXmNVl8yBrFjG2cPs++gE8acTH8oT6jEqywdqOkGsvw+
	 BtKuJAI69ar7WhFQhpgvVT8oFF3BUDPj5kJU+TBVSDuhegByzkT/ztoLDRmojDV8zVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709712;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PcKo2kVjFeogWNNj5epZrpaQS92KJBRSATnC++pwXO4=;
	b=jJrNz79Hz1H3I7gv1K1BLbCzePeldl4Rbb8WxCkIYL3/tvyflWtVBtfWQaryEo1rvplF
	 /MDvRYhEVkzmCBMTa1/+83khso1tvDmyoii3xG+D9iX+ULfxbjqkQo+GBMObFfKmOkMXp
	 YtU1OH26F1WJirEz8jb6R0K2EK3/UrsmzlClX2PTNdKw2V7QkDsmvwcyp2W+opHsxJ0G1
	 DC/Li+lT/JdvDOZmXb03JwS2feZadoKxCPTOa+3RDnKkuRrWv2hv9Lpy+QrbIftJwuzjv
	 Sz/X0J0dmT8qPgdTtUj9Y8GhN5wsEpVC0OkCUdRLyhtMDlGyFbVHkrpalmbB2c4URmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DpyGih6v;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3148E606A6AA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 16:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3148E606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DpyGih6v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795709710; x=1827245710;
  h=date:from:to:cc:subject:message-id;
  bh=xifJypi8lRa/01FufU3pfQ/Nel+DinT1EBmoT4LaVGw=;
  b=DpyGih6vSaq3s8hZXzAHKKUaXi6R7tRknj+7uEBU55JFtdSvhm/mO8iP
   fBvmINgsYw1ew+FkCykR/d87TYN4y5T4c8SvSeqrpeKJLjs2h/xzOR7Lr
   DFrl2Zets/KYJtCqQuZ330tM2CMtGmeI28FWUd4BSsrSrEemcphCg62Cw
   HOf41z1rI6Ywusm4VnQWSf6RqN/tVj8HxhT0eDT6iHuC6Lf4Li/E+T49t
   ywbE9xZ4aQ3qKDM5O5zYdVMWojUBh2hD+vFOZBkoSvOu7y56s7VTv3wK2
   J1fuezrAaDPNl2BjL/2iPR2Ph6N4VUjyTWlU4FLEbloN3ziHwDSkeNbRF
   w==;
X-CSE-ConnectionGUID: 25ThtNFETB2q/i7CHj9/AQ==
X-CSE-MsgGUID: CFr1N6WoQvib8WZKoxizEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4635645"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4635645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 08:15:10 -0800
X-CSE-ConnectionGUID: oFSMvvzqQISiZIgwSdKlQg==
X-CSE-MsgGUID: 9tLTmiMAT5ajmTD+ff55yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12541349"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2026 08:15:08 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWc7m-0000000006g-2s0U;
	Thu, 26 Nov 2026 16:15:06 +0000
Date: Thu, 26 Nov 2026 17:14:46 +0100
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:generic-set-memory/rfc-v2 55/62]
 include/linux/pageattr.h:123 cpa_is_direct_map() warn: always true condition
 '(addr >= 0) => (0-u64max >= 0)'
Message-ID: <20261126170844.sSPTztuV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git generic-set-memory/rfc-v2
head:   dbcbe2371dba9ad17ac00779ddff74cbef500a77
commit: 287ccf3401cb64154113c9776b79576a93d0c398 [55/62] s390: use the generic CPA core
config: s390-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126170844.sSPTztuV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126170844.sSPTztuV-lkp@intel.com/

smatch warnings:
include/linux/pageattr.h:123 cpa_is_direct_map() warn: always true condition '(addr >= 0) => (0-u64max >= 0)'
mm/pageattr.c:373 split_large_page() warn: missing error code 'ret'
include/linux/pageattr.h:123 cpa_is_direct_map() warn: always true condition '(addr >= 0) => (0-u64max >= 0)'

vim +123 include/linux/pageattr.h

ebb5b588a1dc24 Mike Rapoport (Microsoft  2026-11-17  119) 
69fb36148a23dd Mike Rapoport (Microsoft  2026-11-11  120) #ifndef cpa_is_direct_map
69fb36148a23dd Mike Rapoport (Microsoft  2026-11-11  121) static inline bool cpa_is_direct_map(unsigned long addr)
69fb36148a23dd Mike Rapoport (Microsoft  2026-11-11  122) {
69fb36148a23dd Mike Rapoport (Microsoft  2026-11-11 @123) 	return addr >= PAGE_OFFSET && addr < (unsigned long)high_memory;
69fb36148a23dd Mike Rapoport (Microsoft  2026-11-11  124) }
69fb36148a23dd Mike Rapoport (Microsoft  2026-11-11  125) #endif
69fb36148a23dd Mike Rapoport (Microsoft  2026-11-11  126) 

:::::: The code at line 123 was first introduced by commit
:::::: 69fb36148a23dd4d96dddd6ad37e429e68364cbe x86/mm/pat, mm: pull CPA core to mm/

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
