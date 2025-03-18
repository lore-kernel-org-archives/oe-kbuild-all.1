Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AE15E5C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 21:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742333458; cv=none; b=NT20ebi7Jruy++YXLwIKODE4NjQLLJWnW11g+heF/IU48LNhnhxVZQsrK/FUjcMtR3YTZg14XSK//X61pkoUR3nE3qYEtha2fGI5TisT0H/19q0duwel4ALuJOKNT/sLFz9k6MvVTo9ceogr7irTZHXzIibdUc2Y/Z+JwLDCYAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742333458; c=relaxed/simple;
	bh=+N+aJ4qNXqqZ6T/1IFI+eqe1fVsgkpw7635S2jVtPrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epcH6wvJNveiSFKyYmoH20nUN8nEulbF377GrcCYJ5oXNNgNPvA/PcD2xv7A/uP5j4JBUOlvPgqXPSjZpCeCuSDamDx2ej+mWyPueE0cUWoUv0Y/kYEH+lL2MGp23vAM2mE6DQW6SbZmDeY1ek9wYu7LWzkeTAkWnda19V/Va18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eM7vrjk8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eM7vrjk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742333456; x=1773869456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+N+aJ4qNXqqZ6T/1IFI+eqe1fVsgkpw7635S2jVtPrI=;
  b=eM7vrjk8LBu1a60cpzqBArZ+huxu9fKfNTVcdWSXrBBGt57kFL9Hpksm
   P8zOrnWJYvx1+iV/Mnw5G3jMXv/N3q5d0NzGGPYhHxHbQExTaTTi2XS3l
   CvI/auNK/VO+RESk0iHYrPrc8Ne73QkbmiTe8S7IUiiQlttpEEM8RdS/l
   /NvYPhH4p0TqjnowdIU32pSJ5QCUhcEqCVneXCL0+D3e6tqRGJKntyGhF
   HzPFiCaFpRlPMPHC99TcBgwg/6wJlLuzvXoWnUEElFkEaUIUhaExgwMqB
   u26FUK7T2qe3cLC5wvcf0qnMvuhXsF4gHKWu5cKvk204JiOCR1FJdom1V
   g==;
X-CSE-ConnectionGUID: x2f5GksaT+OyfI9EZlWGFA==
X-CSE-MsgGUID: bGRqzXgwSUqa31/VmADaQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43634938"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="43634938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 14:30:55 -0700
X-CSE-ConnectionGUID: 7T1sPeULSpqG0Ptljcwm/g==
X-CSE-MsgGUID: vFmWYw/kQBmd5enhyJvWtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122310585"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Mar 2025 14:30:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tueWR-000EBa-2e;
	Tue, 18 Mar 2025 21:30:51 +0000
Date: Wed, 19 Mar 2025 05:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
Message-ID: <202503190527.j0Fc5Flz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   41adfeb3d639c546b7412cca528a054f4021a594
commit: c3e816a56786096a2f1521a3445a5f6b056af6f9 [1/1] ANDROID: Incremental fs: Add zstd compression support
config: x86_64-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20250319/202503190527.j0Fc5Flz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250319/202503190527.j0Fc5Flz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190527.j0Fc5Flz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
