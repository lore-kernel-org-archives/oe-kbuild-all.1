Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30D1CA9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 01:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736903606; cv=none; b=QcHdOrsstcK9lnx2PfyIwyDoUPpmziH0ybFAdgEdpJhwf+cF6QDKPHmP9h43EBarqJDTDMuM+39QMNW6eGvccRRp1z2BciHNtwFAigpW5EI0rg1DZaKsbByMNF7xOQXI6xA3zM7mas/1gkXyF1qe6R81CT9oAiGQ60Y42X1XY6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736903606; c=relaxed/simple;
	bh=V8DVwwBLDXjjq5J98OFDLWkSGVDH5LC/i4bbofPdpDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=et7/FAxpn+axXV6CFRYmLI0rikTMsnBXxhtesWpi87MmqFRjgSqG7BiKGB8KGrKkmqhjleJm5gGRIevvxMQWEL+LDFrj8cAUXaL3MSQqB+mjHEPIbysYlhIp8veVGpFUq6R6BsCHw6pEnEvQYvRo+qjPdDENXvbeY2GdJwEZxNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMzXMDuX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMzXMDuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736903606; x=1768439606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8DVwwBLDXjjq5J98OFDLWkSGVDH5LC/i4bbofPdpDg=;
  b=PMzXMDuXdkm7TlLK0mSJgbRi6/mzXF4Qw4cGshnwMCioLB8EggQMtjZN
   rDUqAVHI9ENGAe6dic2XvHSDbdFSDbKjH+jcKSDXDk8eH0NJBrnu0kBc6
   e9Osbv9sxdbgJNwytxoyBOFyuss1gWRDbSHlvFXUpHo/d2Dj0tbp2Nrdl
   5CILhcW9UHGuoEvYPtDUAeL41C/2qevndV+dNT+yklLfwW1jKmmmjavRR
   y3sehh5mZMHqDuIvD62HcHlB2nzinz2ZVrFjGOVMSXPwcWKE5P/mAqzil
   wbonwFdxKbEgh+/FHdpXrNXGyyiDUT2MxfSkptab9F87fZBGvY3pQfhUn
   Q==;
X-CSE-ConnectionGUID: IQ/do8NlSNiE6EDXWfDxpA==
X-CSE-MsgGUID: 6h7ztbheQDmqzHpklZY7dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36919846"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="36919846"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:13:25 -0800
X-CSE-ConnectionGUID: BSFYo/ThSq+C/cFZgpYMsA==
X-CSE-MsgGUID: H2s0sLjKRMSP+q5pUjbcsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="105058160"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2025 17:13:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXryC-000PFt-2j;
	Wed, 15 Jan 2025 01:13:20 +0000
Date: Wed, 15 Jan 2025 09:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>, Kees Cook <kees@kernel.org>
Subject: main.c:(.text.unlikely+0x18): relocation truncated to fit:
 R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined in .text section
 in ../lib/gcc/arc-elf/12.3.0/arc700/libgcc.a(_millicodethunk_st.o)
Message-ID: <202501150901.smVPJkgd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7f5b6a8ec18e3add4c74682f60b90c31bdf849f2
commit: 0043ecea2399ffc8bfd99ed9dbbe766e7c79293c vmlinux.lds.h: Adjust symbol ordering in text output section
date:   7 weeks ago
config: arc-randconfig-r006-20230901 (https://download.01.org/0day-ci/archive/20250115/202501150901.smVPJkgd-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150901.smVPJkgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150901.smVPJkgd-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `run_init_process':
>> main.c:(.text.unlikely+0x18): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined in .text section in ../lib/gcc/arc-elf/12.3.0/arc700/libgcc.a(_millicodethunk_st.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
