Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C790182D0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 06:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350005; cv=none; b=LvBfQwflJZ2BCODR39Ki0qXIDctyXP3n9Mh+CjzmbiNkOhoA+kCMPVZnFZ8MdW/8ss+TkrxaYDiDDqE/Rru1b+1SbygnFSZrmrKNytiwa1gRlMgt7VlWdhQdEZCkXXFyTkyKyUwI9cUoIbbMzoB5yVp+leaBuuoJJ6OipheZHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350005; c=relaxed/simple;
	bh=qjZHybll0tDgSjAtCF1R41FdiY+OvgyIcbGmmuTUx/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CUdlRbmFWwdlsmqm+M2HMLovj2p2AKRH03C1Wu44JcYOGVydZ08KAHtjekTNyB5jVhyMVgI8/c2oiONmYwGsCJ17FZiwpFPyNQzU2b0Q8UJzI2nSJk43jPWKKVz50PY5OBElYvMxlet2czDhKH5pKSymD2khADH2KUy5R+XjDpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxxSiBnx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxxSiBnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751350004; x=1782886004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qjZHybll0tDgSjAtCF1R41FdiY+OvgyIcbGmmuTUx/A=;
  b=CxxSiBnxmqvFgSIL2yBRK5T+Cjk/w7k4vRj9E6BZrChZMsVYjxOaZeWN
   3l8+j5MCPGlWlnkSHBNwcE/GqgLhuD2wgZpwMxCQrZMJV/U1+/Jb4zniu
   cHlvMq3gxm/iMUD7sRxslaXhsCqcse9aranNRSdlGsSgQYJqJaooIP8g9
   FQpviy/PxO/rF4JWnVrhYC+TQz3Fts6b2NyoyIMC0Ifb6hCm/J6MFOKm3
   5cUxjeD/1R3OZkouOICK7UxLODI5cRwyvXEaz7XsM0OC1jRtAZV1fgJp0
   YiGYf5MUeEstDlbsUjLvdZ9/82Nj3UITvwnDyBsMvZxG8KKI7wdK8+LWc
   g==;
X-CSE-ConnectionGUID: mpF5YVspQWW83zxXb5k6qw==
X-CSE-MsgGUID: e0h/xG/nTR6qQmm5QVpAJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52825995"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52825995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 23:06:43 -0700
X-CSE-ConnectionGUID: A7/o+hBdQ32zsCnOlFqKqA==
X-CSE-MsgGUID: e5mgkymeSValvaK39SFvfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="157706170"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jun 2025 23:06:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWU8e-000Zm4-1U;
	Tue, 01 Jul 2025 06:06:40 +0000
Date: Tue, 1 Jul 2025 14:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2989/2989] arch/x86/lib/copy_highpages.o:
 warning: objtool: sysctl_hugepage_nocache_copy()+0x130: unreachable
 instruction
Message-ID: <202507011409.e2CKDnmq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kemeng,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0655af1b703c5ae3de3a1ba80e5e31690ccfae93
commit: 50d5bf1b6da9f74bf93f9dec601c09d45d6d8406 [2989/2989] x86: hugepage: use nt copy hugepage to AEP in x86
config: x86_64-buildonly-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250701/202507011409.e2CKDnmq-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011409.e2CKDnmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011409.e2CKDnmq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/copy_highpages.o: warning: objtool: sysctl_hugepage_nocache_copy()+0x130: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
