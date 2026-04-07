Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82694374E64
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534068; cv=none; b=NB3m+swat76e9+ypPF0I7jRrCEypog7Jyzge5aLQ8f0ZQkLfiXVMBPxQ9izwm9QDtJW3Ecjkvduq5BrDSlcoh8fNl5en1bl2y/xTZ2df18L/aKO/JxglA/gar+Jv4nYqfGW7B3EQJIoUlEJnXPQOBjlacLyL+XU5GcR2H3BI/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534068; c=relaxed/simple;
	bh=SQcE6YL8e17KZXaaT7npK5huvAhO1AwqKGHBzzs1lJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=axZkO6eaTmFctN9jj7OHexKXgdTDpOkTyfSfv2kRrMStK9hSEgb79dFhvpPXN8YxFGJRg0vyWEr8BQe/XTj92fw2gwyO6fQhz02yRl5Y7CRWi/fiY3746oCr/ilpfHTAb3riTMyOnw7hnQoQf0agSWyCzR+PEeD3veGgEvTLFzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfzgX0sO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfzgX0sO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534066; x=1807070066;
  h=date:from:to:cc:subject:message-id;
  bh=SQcE6YL8e17KZXaaT7npK5huvAhO1AwqKGHBzzs1lJc=;
  b=IfzgX0sOq1ukD5WEAVDbPGBi6uDw4mCia81ZYI2GCY/f0d2FaUXJKLs0
   8eh0qzxTkza8oH1lwzUUrAyTHF7bGffGxX3BCecitEsGbT/n2Dh83S+Bb
   HORYc7TjUO/yyVtjjC0AiUkAOukzPA7iZREDnpLIXDzBJN5XC+wUdNzqD
   9qDs8uSaUVuT9O1nhSQ77naGRyB2wHTQ8U4h6n7JJMWesRA4ex5VwoIYz
   6n7OixV17Vfs4Jkg+TmEZaapv5i0zw+AyESszxCa430+0hfcnx/LpOpX1
   byaLSiGKSy4eQa18AWfjKXK37r4r5p/w1lgk7cHqk3Jtgpy4MvgftjrcI
   w==;
X-CSE-ConnectionGUID: JeMhmK5UT6mrLrKOJmdE1A==
X-CSE-MsgGUID: O58OwKHCSyqdfubwKmJq/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87875487"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87875487"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:54:26 -0700
X-CSE-ConnectionGUID: QtddGfN7RxiXmXj0vQBIzg==
X-CSE-MsgGUID: qNETiob2R+G7WkKgU1AOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232090840"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:54:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xWA-00000000044-0pEB;
	Tue, 07 Apr 2026 03:54:22 +0000
Date: Tue, 07 Apr 2026 11:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:dylan/sframe-v3-with-v3 3/8] aarch64-linux-ld:
 warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being
 placed in section `.eh_frame'
Message-ID: <202604041220.yRIdTbJd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git dylan/sframe-v3-with-v3
head:   d9360fb2f6860d7f37e29ddfd9a44fff555fd54c
commit: 897b6e722feabc4b8d53f0cc30277113c4397d1a [3/8] arm64: entry: add unwind info for various kernel entries
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260404/202604041220.yRIdTbJd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041220.yRIdTbJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041220.yRIdTbJd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> aarch64-linux-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'
>> aarch64-linux-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'
>> aarch64-linux-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
