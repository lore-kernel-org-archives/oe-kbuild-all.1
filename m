Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15ED50254D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632553; cv=none; b=dtQ7ThDPm9Vzm0Jyp/laYtPchGdPjA967TRbytbmg/iI5KvBgLt8hbHpNjFGt59UXD3Drt98m0AxCiuAR/zbgLkdVNuVSOGSYjroVNSWvCVGYuMaZwQcCXhZ0Irxf5/N64tjo76lFgioBjLlP4jvFCd0FnO6TJYcon+i6zkXifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632553; c=relaxed/simple;
	bh=l+x5EGdr6xdltmuEqahT381Wzz1Nfo9mldBmWIqQmQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iW8UHbCNVkEqCnJqyS8cnBRoGqFTyJ6eiXfSPtg92D2hf3a7AlSXrMCLX9xE4VuGFtvv5VfUUud0qdS73wBBNct2j7sNikEltXDVX/vUEpCNsUXnm68NMRrTU+wJJMmsNL3ZD+hZwhwSrkOCtgBlb1b89bITQWRNnOqV4NIYdzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QG2WdUsM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QG2WdUsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790632547; x=1822168547;
  h=date:from:to:cc:subject:message-id;
  bh=l+x5EGdr6xdltmuEqahT381Wzz1Nfo9mldBmWIqQmQY=;
  b=QG2WdUsM4IGM3yQQXVjMwqe4FaQo2su4si+18KcCD1crqUkms3uCKt4w
   I51+TWVMVoqtSAK6MeJZTGqICtIGyvHBgUL028JX1VZgslAiUplP9dp31
   mhrDZh+qpn3kEmK+akLyRb6jC+QOtE2fOcyQzMnCqseqJXzfWKyBVLjMo
   gFmG3hNHJK42y3kAM5N+6eOl3V+HYbg1/h+ID16mJWz5aavTusCwe5PKK
   hzRbrbtFJorANFWhMtiKTpdVxg4unX+9csMgy1iLAhiziOqhvhkolN7hN
   6KILFor0LzjiNyJUZAXJG18tq9pZOkyKTbn9p73TIYUkfRdOlw0z3Be7q
   g==;
X-CSE-ConnectionGUID: NA3Q9+VcQWylb2KaoF3i4Q==
X-CSE-MsgGUID: rvQV1Z/0Q1i3z6mHtheVvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90395806"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90395806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:55:44 -0700
X-CSE-ConnectionGUID: lQcbEw/+QiqJj4cj8X+qxA==
X-CSE-MsgGUID: GUmDzMa6RO+J5tn4YhEK+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="279893644"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2026 14:55:42 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJJx-0000000018h-32i4;
	Mon, 28 Sep 2026 21:55:37 +0000
Date: Mon, 28 Sep 2026 23:55:25 +0200
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>
Subject: FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or
 directory
Message-ID: <202609282308.BVuIaLpQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ihor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: 522397d05e7d4a7c30b91841492360336b24f833 resolve_btfids: Change in-place update with raw binary output
date:   9 months ago
config: nios2-randconfig-r2308-20260928 (https://download.01.org/0day-ci/archive/20260928/202609282308.BVuIaLpQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609282308.BVuIaLpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609282308.BVuIaLpQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   btf_encoder__encode_cu: error encoding base_type (core_id 31): -1
   Error while encoding BTF.
>> FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
