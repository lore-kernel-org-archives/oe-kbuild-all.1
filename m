Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA071F4606
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 19:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767210677; cv=none; b=LQ8mbhqAh9O/aatPRLmulyKtKGbfNwcSJMthWwEZPv2tmSHtLJGW0GmusJNPH8bqHz37aTLku2DYY/5Bqx3tRKvg0uLghgiQeW3pyoVhXGjMFVSgX3K0CFP0qWNckLsuHMDsxz4LAYLnQBPPbMrhhaJee1HTr9arqgI4cG79geQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767210677; c=relaxed/simple;
	bh=lOGsClpaFDh9bZhBKv9QSWpi3is1hOpVQuvuy+P5Apg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KxjythQa4Tne81jVKo46JSwTke7wBSSNsLkXut02hRjv6iMQHG/DeiK7c4HEnALGYbrnXxfCfWaui+hYD1FtwN3yJdz1yjdyOqg+V4zZX5toKkgojqDuQ5CWIG2179mi/6sv1RBpn3NfenSLtOSES9AbrKhgxNYOSsgplPWEn1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRgZDogx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRgZDogx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767210675; x=1798746675;
  h=date:from:to:cc:subject:message-id;
  bh=lOGsClpaFDh9bZhBKv9QSWpi3is1hOpVQuvuy+P5Apg=;
  b=eRgZDogxOpvvOZNwyNRrB41F0ibejcmrm0IxedEvOLdWHXiJXl42fNFa
   F1KNg0+77BMbWXc3zYQQmRY4SiwkyEq2xYs/qeEiYdIUJwXX8gcCK54Eh
   d2ohiBSGEh+A7O9hjEr0Vaq+PRABE808YgrYAXaaW90TfHKOCzTUILL+u
   YcxXx9vjUlBbG0ioWRt/RTfhQsgxIftysLRmQyDdIDqEd0ZE1ri6TCZGy
   +hr1o/J1qAWEt78kgMKkW/ZB0j/a4tvqRfOPAFXGo06Q5saFjsdeSVRaU
   7MwyOTcFawu+RE4LakXGQhwXO3cTuTMkiKNTi4QNOqaktAMCVh5ssHX7+
   A==;
X-CSE-ConnectionGUID: DxeBJA8VQae84oT4kgjNsg==
X-CSE-MsgGUID: k3CsAI8JRWORtFELjH8seQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79405568"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="79405568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 11:51:15 -0800
X-CSE-ConnectionGUID: cMwU+EUXSZmX4Rr7j08fjQ==
X-CSE-MsgGUID: 1i+N9eX/R32tUtnWVF2VHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="201955874"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Dec 2025 11:51:13 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb2Dv-000000001Rd-1BFn;
	Wed, 31 Dec 2025 19:51:11 +0000
Date: Thu, 01 Jan 2026 03:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 mm/pgsize_migration.c:26:1: sparse: sparse: symbol 'pgsize_migration_enabled'
 was not declared. Should it be static?
Message-ID: <202601010316.QVuASY6v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   a0c89b9a66cb83f486730bdbb70f960e58cb0274
commit: 918c98f267d6a1512cb5d671523bb408da4b070a [2/2] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_migration/enabled
config: arm64-randconfig-r123-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010316.QVuASY6v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010316.QVuASY6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010316.QVuASY6v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/pgsize_migration.c:26:1: sparse: sparse: symbol 'pgsize_migration_enabled' was not declared. Should it be static?

vim +/pgsize_migration_enabled +26 mm/pgsize_migration.c

    23	
    24	#define is_pgsize_migration_enabled() 	(static_branch_likely(&pgsize_migration_enabled))
    25	#else /* PAGE_SIZE != SZ_4K */
  > 26	DEFINE_STATIC_KEY_FALSE(pgsize_migration_enabled);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
