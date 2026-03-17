Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06B26FD9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779444; cv=none; b=WtxlCmUFsRUVvVpF89sDi7zTQU6IL3PXBSyqYf5kqDGiozB7DDx8UqVUv6JdwnAjHEfnUup+rASZ/aCt2G8h4yjp62qGmhaSaKfcr720EYSPmtQ22WXbiHvDV3bq7u8/mhqNxKPwx6IklMN1Bd79m/H26AK2N4BCwamHQA5f/fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779444; c=relaxed/simple;
	bh=MhC4nHJIEvfBKUDW53c0T6HQn8FwHKw7ipa5CI7EAV0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XeKjMxLqe3arkQkw2NS7V4v5fVYvxb1WpEwsAigMkd4+oL5lFK/ZpylNWeFAWU7Mw+n80CC7jBM8p5T+hZdQnb32OMt+q+3/mpiPG71Xs+LpPWtYdzZQBohmoGXYkiH6xROtXk3QoZzFqYYhvM0sdpf5/sxjym9tymmGIcMuuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQScRQqr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQScRQqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773779443; x=1805315443;
  h=date:from:to:cc:subject:message-id;
  bh=MhC4nHJIEvfBKUDW53c0T6HQn8FwHKw7ipa5CI7EAV0=;
  b=hQScRQqrAHDrPXibnY9vxU/22tKRqx5KlHt09tgSSegooFXoQfGzitBR
   HeOo51cNsQcFyucO344l/Xj4avLy6Kl9/q/tpvMwsNjZJ4RnZ11TyY1Er
   Msru64cZQm4yhdOJDaS1CNhs0kEFtmvWc8x7jqP65cweTRSWLELBK8CY/
   JfiTdhyO9/Vl/3nA5wobj1NfJVtYLZIqPV3MhtkOhiM46EvSSDZlVIUIv
   TSvocw6JMOeglhwmMaLUS/2yYwuRWcECQwPCRzmtrWvpPUCuGp3uJdPEj
   ZLlTYth7aPb7Ma/PnBsmnlNqNAaX/B9YiDyrHbETpjit1FCiAasiGpwgV
   Q==;
X-CSE-ConnectionGUID: WwNWl0XcRPWHpnO1JrhrDQ==
X-CSE-MsgGUID: Wi2ooInXSPS8Kdj91ZGTFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92396292"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92396292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 13:30:42 -0700
X-CSE-ConnectionGUID: BtIcovIhRl6v2S7keUUp6Q==
X-CSE-MsgGUID: m4ujW94KTqWsmo/JWiuu4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226848894"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 13:30:40 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2b3l-000000001xR-2NtK;
	Tue, 17 Mar 2026 20:30:37 +0000
Date: Wed, 18 Mar 2026 04:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-linus-next:linus-next 24/43]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:111:22: warning:
 'kvm_gmem_get_folio_noalloc' defined but not used
Message-ID: <202603180446.dkWedwkx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   e9cdadb8e756233fae78095f72ff1f40f138def1
commit: 2268a4ea672795a572dbbd7187117546ff262562 [24/43] Merge branch 'mm-next' into all-next
config: x86_64-randconfig-014-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180446.dkWedwkx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180446.dkWedwkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180446.dkWedwkx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:111:22: warning: 'kvm_gmem_get_folio_noalloc' defined but not used [-Wunused-function]
     111 | static struct folio *kvm_gmem_get_folio_noalloc(struct inode *inode, pgoff_t pgoff)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_gmem_get_folio_noalloc +111 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

3bb2531e20bff9 Paolo Bonzini   2024-05-07  110  
0ad31a420d0638 Nikita Kalyazin 2026-03-06 @111  static struct folio *kvm_gmem_get_folio_noalloc(struct inode *inode, pgoff_t pgoff)
0ad31a420d0638 Nikita Kalyazin 2026-03-06  112  {
0ad31a420d0638 Nikita Kalyazin 2026-03-06  113  	return __filemap_get_folio(inode->i_mapping, pgoff,
0ad31a420d0638 Nikita Kalyazin 2026-03-06  114  				   FGP_LOCK | FGP_ACCESSED, 0);
0ad31a420d0638 Nikita Kalyazin 2026-03-06  115  }
0ad31a420d0638 Nikita Kalyazin 2026-03-06  116  

:::::: The code at line 111 was first introduced by commit
:::::: 0ad31a420d063897026ee2e71e1461069951ac72 KVM: guest_memfd: implement userfaultfd operations

:::::: TO: Nikita Kalyazin <kalyazin@amazon.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
