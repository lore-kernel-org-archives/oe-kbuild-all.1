Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE611DA23
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 01:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757123214; cv=none; b=ZHkl8+zz8S4tjUGXCloiEnejeeWOktj0Egy5um6DwTlklLDByNcBj7Tk7dwOFrl/6KHwt7peMTW489+RHobuFw9ND88Mpv5uWG8ocuT/nz86DAejJz8q9SoPH1/wresREk9blh7bacUywbqTaUq2Ig6QXedA+i45SduCQeMNn9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757123214; c=relaxed/simple;
	bh=AcZ2qNQV9iXawRVgiV6mCswDRsJBvEc++vvVU5rCzx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SriPh5qni8r5KJvYLpbQWSk7+wM8Epe/d9AMhAxdPzuD3UgGmfcsxMtMgnRbtFNM+yNQK5s2FkMF4Kbd2NlloupDhuUksVhZ4Ugw3fhyozn70Hnl4HJOcH8QkUiIoclI7gsEUhUu4tO1cbkRNxsF6MwU0eNHz9txP1pXy2seID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5fomK+x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5fomK+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757123213; x=1788659213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AcZ2qNQV9iXawRVgiV6mCswDRsJBvEc++vvVU5rCzx8=;
  b=Z5fomK+xiwWqS81QB5lNMvVZ+opqyDnRm7JEUF2syPuP1MIEBUNjCdHX
   W4BydGccc9hOqCVEVoeVTAo38XcDAzOOTIIc90hCJRxsZcqMgLKYMoVLs
   w21g1UYvkqKqwLGfTVfBVsBaDfMcZ0gKbBnzIN5iJ+KZhS+BO1lG3oKuY
   fAIiJP0/BS7u+UFV2bx+6sH4c/5CF0un8rdKMGrXXcTycLNBiPuZus1Zc
   RWkVeDeGqtepLfHjcbxxFp7ZIuxnZT74HfTDaPEeWQYY2ene3C9WuIDqJ
   RPe2MTJnZk8q+bMc74BnFpxg1BiWNTuzeuDbzicID94DXSKMRt3vbEIem
   g==;
X-CSE-ConnectionGUID: rsgyQjpcQIuZW/h66vQ2bw==
X-CSE-MsgGUID: mbQyIo5OR0u4Rv/3+fUP4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="76930389"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="76930389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 18:46:52 -0700
X-CSE-ConnectionGUID: wtGsqIdPR5aYTjvy6/Bndg==
X-CSE-MsgGUID: 9FzFo1y+TGWcz2LbGYU+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="176381421"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2025 18:46:51 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uui0u-00046t-2o;
	Sat, 06 Sep 2025 01:46:48 +0000
Date: Sat, 6 Sep 2025 03:46:09 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/11] htmldocs:
 Documentation/virt/kvm/x86/pkvm-intel.rst:349: WARNING: Bullet list ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202509060354.Hle6bQvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   60d0775cb83360cc7e618850d04f2e8d1c77d929
commit: e24fbeb999488f1320ea19b2a0d0ec12aafe994c [0/11] ANDROID: [DOC]: Isolate pKVM & host
reproduce: (https://download.01.org/0day-ci/archive/20250906/202509060354.Hle6bQvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060354.Hle6bQvN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/xz.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/virt/kvm/arm/hypercalls.rst:229: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/arm/mmio-guard.rst:94: ERROR: Unexpected indentation. [docutils]
>> Documentation/virt/kvm/x86/pkvm-intel.rst:349: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/incfs.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/sound/designs/compress-accel.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/trace/debugging.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/kvm/x86/pkvm-intel.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +349 Documentation/virt/kvm/x86/pkvm-intel.rst

   347	
   348	* Page-table management
 > 349	-----------------------
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
