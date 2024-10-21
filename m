Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD3DDCD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729474053; cv=none; b=lxwUfchrW1S01tho5eAVLpy8hH1SCBG1vKC09EvMNkQiNydShQ8fU3Kf8/XRzVWXWpkdSBl+8A9HHGUocVfrM0SPPV3xvqg71fpjjvJECuL77NCX3rnjsRZpUYfDhJLOFa8Tqg/QnTrnud7scVJWswX7BwBPWRcaIExn/DQSMsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729474053; c=relaxed/simple;
	bh=iuRsj7XgHmzp2FVddyR0K11IsMYxt311bo3MVuJbmqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tQQMUm9UmFN6H44CUXIyGI6fBPfULRcq74J3xQwQf2yFaW/M+uORNtZ37Dxw/glewyaTAEtDSqo37uLtPRjfW259pVizWJC+8cbWx2VgquZ6RKi3pBlEVMPet3E9qcOFAN29ZSABt+HrJkO3umE/rRFLy02DE0jbjaXvmLgzDOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fy/VWFWC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fy/VWFWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729474051; x=1761010051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iuRsj7XgHmzp2FVddyR0K11IsMYxt311bo3MVuJbmqI=;
  b=Fy/VWFWCHNWrcjfjvJDe+v3LZduf1dn+82lLCmyuirLokIhyhYavPV1j
   vLhA206Qff+wR9OUEZkUbyCUkD9MTa/7KctLBsveLV+kxVn7EPTIrH8tN
   LoGvuo0zb8ahS9lpJefhDyATRmPRXTkwVFygyZsKsM6QhZVtZpvIgmqrV
   fa07rjDwYfpgmplLbyHl4+hmFTt8jWySyYdvF0GqqmpThKHPtDP4/AU/L
   +iC4pSKpt65sHjr26is8v6cTHq22VQIkUpuSMsx4xXatnn8Uwu+wcfbSS
   KINmwYZ+rJvDSNo3+cWrz0A2SkM3yeBBfawE1mhnS0Uh74nSG9My+GIJ9
   w==;
X-CSE-ConnectionGUID: N5ZH9+qdRpmP3a+5xxeeGw==
X-CSE-MsgGUID: 3pTHRP35QoOmL7dy/TDOxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28821161"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="28821161"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 18:27:30 -0700
X-CSE-ConnectionGUID: QakP0pKZQMS0DWz0fk78ww==
X-CSE-MsgGUID: 3FWacGkVQ6u71kcH4/uYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79310456"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2024 18:27:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2hCg-000Qzd-1V;
	Mon, 21 Oct 2024 01:27:26 +0000
Date: Mon, 21 Oct 2024 09:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, Ariel Miculas <amiculas@cisco.com>
Subject: drivers/video/fbdev/sis/sisfb.o: warning: objtool:
 SiS_GetCRT2Ptr+0x1ad: stack state mismatch: cfa1=4+8 cfa2=5+16
Message-ID: <202410210904.7M708stV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Breno,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d7f513ae7b108f953cceec8bc96d2e5e83c3ccd0
commit: aefb2f2e619b6c334bcb31de830aa00ba0b11129 x86/bugs: Rename CONFIG_RETPOLINE            => CONFIG_MITIGATION_RETPOLINE
date:   10 months ago
config: x86_64-randconfig-102-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210904.7M708stV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210904.7M708stV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210904.7M708stV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/sis/sisfb.o: warning: objtool: SiS_GetCRT2Ptr+0x1ad: stack state mismatch: cfa1=4+8 cfa2=5+16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
