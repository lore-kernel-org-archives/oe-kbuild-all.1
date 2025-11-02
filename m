Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3172270810
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 02:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762051143; cv=none; b=oaK8l23gkAWDULPzFBU2CGGgz7+OTZ6qxbnKZ0gquxOeVRVXnhoR3QavX+2O70aiV7EXvl4nWne1JtoKLMypuIlgYnstSieSUCDDKr8NwADiOcy8YwGCJ5Tl2siaNx78lExs5gRSppA0tlI01/6p71Bx+XED2qVCmjZNXhlKXnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762051143; c=relaxed/simple;
	bh=pkglFaBSwaNsLHyOTZC+8c9cH+H9AT1LDkH1WVDCnHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3XeeoXHL8nw9VsMtIKOYmBHryl7ecfcwQJPi2h2+/C4ZqMw5SmfQHczYenuBJuSTRxEBKdkuj3zZdbBllBoUinH2rY8sH2lkghPXutvnoZvhrBcOIPXUkPvX7dGO5pOcUxEOUBY5MY1BmnAf2aSjUuBlrFbAf9yJc123yt61ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1y8FAiD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1y8FAiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762051142; x=1793587142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pkglFaBSwaNsLHyOTZC+8c9cH+H9AT1LDkH1WVDCnHE=;
  b=P1y8FAiDm5vrnKlJU7I9qjAzopnSsXsMMPw5Z3jB/978J7Tqfvtxyl/1
   KZZ3vV6+99IocLY2c8cvDAZLQD9zE9gkQHtDKEMqhh1XRwRKOlAPun52Q
   bxuDXhpTr92Q0Hx69cvPM/4zQ7Ta8cEuiiA2mAV3CGLG3ib9mjTb/yONw
   OXgf+aPCi0TPIBPa9hSRwPyhORWwYqGHBg9XGGHYd3b3rzExfITAOSyKK
   peZNBHM/TP3o3pJsYp/vr8DDoZC58SYd8KEUIJY030aVH10Bw/pnLMdjI
   IPhVrrFBaaiCMEOoDh6e0P/it/VfOnGhOxEyaqdNdkyKBrVGTFDQCo/o1
   g==;
X-CSE-ConnectionGUID: VBCTc7/2QVWA3lQeo1Iq5A==
X-CSE-MsgGUID: TB6QFUBKRlq+jAkicqpQXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="81580131"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="81580131"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 19:39:02 -0700
X-CSE-ConnectionGUID: +J9ZLlfBQIWavtB04RUAkw==
X-CSE-MsgGUID: 5Wqq98irT0mE7Mv04zBVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186702714"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Nov 2025 19:39:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFNze-000OvQ-1I;
	Sun, 02 Nov 2025 02:38:58 +0000
Date: Sun, 2 Nov 2025 10:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: chenmiao <chenmiao.ku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __set_fixmap+0x5c (section: .text) -> map_page.isra.0 (section: .init.text)
Message-ID: <202511021055.bpftGsDj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   691d401c7e0e5ea34ac6f8151bc0696db1b2500a
commit: 4735037b5d9b0f809c51976c87d737fa2c48fdea openrisc: Add text patching API support
date:   7 weeks ago
config: openrisc-randconfig-r133-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021055.bpftGsDj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021055.bpftGsDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021055.bpftGsDj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __set_fixmap+0x5c (section: .text) -> map_page.isra.0 (section: .init.text)
ERROR: modpost: "__mulsi3" [kernel/locking/locktorture.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/rcu/refscale.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/time/test_udelay.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/trace/ring_buffer_benchmark.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/trace/preemptirq_delay_test.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/fat/vfat.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/mbcache.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/ext4/ext4.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/jbd2/jbd2.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/ntfs3/ntfs3.ko] undefined!
WARNING: modpost: suppressed 402 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
