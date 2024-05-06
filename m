Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5B14262C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714994366; cv=none; b=RAcWknJaW753D22FU947pTNA3SCbxZ1iGdhMliNcUOV1VLGA61ULrdj/1CkZHYqhnyN96tFN/0fV4wuuwa5uOI5/KU/SQfx2GEATjfK+8ZvibWkmFc6ubzgDStjbLir6kq9ERFqXlmhVsnnOwsjn6XGokWPr3iNYTJjZx+jwhmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714994366; c=relaxed/simple;
	bh=ZT7F+NLZuu26Pm0lGFhdcCp6qqpkQrtV8HtuqLe4B3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oj5XwaNgbGRow3DVer03OoiJYnJm6JMwcNgURz3RH02iXrq+J6Q0S9i1aPqHA8mjD821PXJtUwcw4wXTzId075bdeJaQKJpr8yk/sz6dm9/thqSE/uL4VnRaTO0dMeFAxbHLwP3IczB81gzZhKNqHSZRr91xr5L2wgxQEa40lM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6bENOqV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6bENOqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714994365; x=1746530365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZT7F+NLZuu26Pm0lGFhdcCp6qqpkQrtV8HtuqLe4B3E=;
  b=M6bENOqV+jnQ06NhnUhwjpZdYwGIAS8XFVA2uP46l6oZNIAFbgZaSTo5
   DUXAiuRgNtXLX73zvGXGCe5BggCRwh4NW9G/mAcG2bE+KuM3mgnVr02bJ
   UpFjI75D11V2h8KdzPvhDme4tMO0U7AC/0xcrV9YewnaFErirhiJ2vnpH
   uAwPjnbthsrO2hBzwQUTqcG7d3EffvbhO3naeSH59H1qBbTCt39WG+Lg1
   5UMguKAAlW05dzRGwZyV46OIUwuldRJkboglvOCKAmbgedwPvfMl67d17
   ZzhS+5yZXsD3Trq8c6bOZvywGdlY/sFqtuuJ7LJrxPLcKwKEO0qf8Ac6/
   A==;
X-CSE-ConnectionGUID: xhEJemMnShe5SbCP1WF+ZQ==
X-CSE-MsgGUID: vNN2X/7pQsKOcnYHPuWyTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14549384"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="14549384"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 04:19:24 -0700
X-CSE-ConnectionGUID: Q3Ufra/DQbCMcg9TXY/EFQ==
X-CSE-MsgGUID: RHx0pR9+QY2itOr6yFxGtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="32803311"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2024 04:19:22 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3wNL-0000dX-08;
	Mon, 06 May 2024 11:19:19 +0000
Date: Mon, 6 May 2024 19:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6486/6511] arch/x86/kvm/svm/sev.c:2198:6: warning:
 no previous prototype for 'sev_install_hooks'
Message-ID: <202405061949.KDw1368n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   956b826d8edba65d77aaf96288bc9ec825dde69d
commit: fe2fcb68d587062952e8cb2b6c14d55ab127f686 [6486/6511] KVM: x86: Support VM_ATTESTATION hypercall
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240506/202405061949.KDw1368n-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061949.KDw1368n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061949.KDw1368n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/sev.c:2198:6: warning: no previous prototype for 'sev_install_hooks' [-Wmissing-prototypes]
    2198 | void sev_install_hooks(void)
         |      ^~~~~~~~~~~~~~~~~
--
>> arch/x86/kvm/svm/csv.c:30:5: warning: no previous prototype for 'csv_vm_attestation' [-Wmissing-prototypes]
      30 | int csv_vm_attestation(struct kvm *kvm, unsigned long gpa, unsigned long len)
         |     ^~~~~~~~~~~~~~~~~~


vim +/sev_install_hooks +2198 arch/x86/kvm/svm/sev.c

  2195	
  2196	#ifdef CONFIG_HYGON_CSV
  2197	/* Code to set all of the function and vaiable pointers */
> 2198	void sev_install_hooks(void)
  2199	{
  2200		hygon_kvm_hooks.sev_issue_cmd = sev_issue_cmd;
  2201		hygon_kvm_hooks.get_num_contig_pages = get_num_contig_pages;
  2202		hygon_kvm_hooks.sev_pin_memory = sev_pin_memory;
  2203		hygon_kvm_hooks.sev_unpin_memory = sev_unpin_memory;
  2204	
  2205		hygon_kvm_hooks.sev_hooks_installed = true;
  2206	}
  2207	#endif
  2208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
