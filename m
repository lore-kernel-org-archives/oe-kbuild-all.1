Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174DD134BD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744476279; cv=none; b=rTmpd+RQJqG69uma3XJmFnOuk4Zc0PCD6Z6tdqgykcMtZTvMpbYJ/pH12Fit0TBdDuyYqW8ISEvFCLYX2TeYp3opXM/N53GpmdCsCx5rv45rUvkOMiC8e9bzBMmSUYNhKqPP5i2FuP8sJ6gp0l5Fyqw1H6Vg2noSJvaymzFl29w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744476279; c=relaxed/simple;
	bh=HKdzY+KbLP1SlsTA6PpNYIdhi2KIJTctC5v0xwv+rhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E5dn+zf9hjPnym/zvPcCITULZn58m6Y0wGchP//Uz+QSQadXeD775/bv7P+JSP1QOBM1QxK8F8jQqa/PEDqWLKVkap15J+MxVp3m7i4l3qF9qOjnLVRzHSkoSOWVE5j00bpgfANH6vKIbYB0TKlg/RFkMBpIHYmfTXb/smsU8to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcwjhMgJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcwjhMgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744476277; x=1776012277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKdzY+KbLP1SlsTA6PpNYIdhi2KIJTctC5v0xwv+rhE=;
  b=OcwjhMgJ3S1P1Zo3HRnNX+XkgBtZPSh1DzXGBmlXlx2HLzT6saqbgbkc
   U0viNT0rjShXNB6cvjBmD5Gnft3XKWzHFHGT1LmVB27P4uA4YsvwoCk3n
   uPyWXsI/7I7uG0eZrDUpFd7mHhBhpB6J5R/NtNPxg0l8nDcYJsJM+p5W1
   BO3n00lkrrdus+wd6YG/n0RIsUerpyj/wuIh7O6jl7FmMkFCV8OuxGGRW
   jT2DFX05I/R5f9Qs2Zklw/iz+Ig/4dBigqrN1vXAZmL7bA2c+jA6RcF8o
   1iGD7UyFDBHIgKdBlzHfvAzwri5KcK4jZ5etiUJsAs8Ptzl5mLDhWl6st
   w==;
X-CSE-ConnectionGUID: ti2JeIhjRbqZxgWnK1N0Pw==
X-CSE-MsgGUID: fPjqEiPoS9qak0WawHSvmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="33619780"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="33619780"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 09:44:36 -0700
X-CSE-ConnectionGUID: OTlVE/QjQteXiVJT3VbAYg==
X-CSE-MsgGUID: zZD77YliQiqM5kHXaVnXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="130013273"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Apr 2025 09:44:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3dy5-000ByE-29;
	Sat, 12 Apr 2025 16:44:33 +0000
Date: Sun, 13 Apr 2025 00:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 4/6] vmlinux.o: warning: objtool:
 hv_pg_hypercall+0x37: sibling call from callable instruction with modified
 stack frame
Message-ID: <202504130003.59euOoYj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e
commit: c8efbca9f0d4d811af848bcec92a9f9ba4b98301 [4/6] x86,hyperv: Clean up hv_do_hypercall()
config: x86_64-buildonly-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250413/202504130003.59euOoYj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130003.59euOoYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130003.59euOoYj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: hv_pg_hypercall+0x37: sibling call from callable instruction with modified stack frame
   vmlinux.o: error: objtool: static_call: can't find static_call_key symbol: __SCK____hv_hypercall

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
