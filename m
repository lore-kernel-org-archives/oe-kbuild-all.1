Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52370EEB2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416404; cv=none; b=Bh7JbQ54jBwbhdHxHhMMrxcKyOBEJJMEvKeMzSTDahbadkkUUX2MNmml5BSu+rroF/dN2oN22q+JJ5AEL0Q8XX26wgILKhEHYJr2DsRjLeJ9H0r5plpTWeMu1cvKS49iYXO3lyXuuXO6wT2/GNoNYl8pv1cululUd0mBYBiG5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416404; c=relaxed/simple;
	bh=q6Yso5/NFV685K/ZLlgraQWfUNal1IU4poLhDmR1cCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NF3XumlgAVuQFMZD+Rlm073ylWMxpWRaETFxLQitUi6Cw1mrfQ3Nvtq5Mg9lfRSE2Z2YDuFOEhWpTJtfMFcmIzRWlUQBVmDzkPsRXNc2rEpryhTyx7XkTJFweZVCZ4uPgmZ1+eqNzjdSyzoUNtBYRIK3DvJBDtv94wcg7PXPeDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdjco6pu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdjco6pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748416402; x=1779952402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6Yso5/NFV685K/ZLlgraQWfUNal1IU4poLhDmR1cCc=;
  b=gdjco6puPb1GEmBW5tyQSVkrLV7h+7syWYm/3/Z6iezu4Bm12du4Qjvx
   9n54s+23EJxtRmkE8XkPRVB8u9urbUVoUfhOnDVAOyhIePuQXh04QBtP8
   gHaxWh5G4pqzdE8aSmGqWl4q/jWhrI/EZtCkouEY8X1L31ljcXkv56SgX
   GWk9B4tgCB3Ao8Mfcx4yAFeUC4GJ6+rC1zK6dGR3nvrjCgfAkuhwWkaMY
   o6TWjEXueqsNM/UwkdKgv8z+lmgGQ7UvdsA6AX+IlHJjml/U+iq1Ua0PA
   d4EkUD/rjgT5CJeRMV8fOSSWzJw5C1CnnSnZYoRDYM1Fef/6V3A8gEF1S
   w==;
X-CSE-ConnectionGUID: PIF8tov1SNaezzLX4iYWUA==
X-CSE-MsgGUID: Nb3ajeAkSImu8aD+qzBGIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="53055732"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="53055732"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 00:13:22 -0700
X-CSE-ConnectionGUID: ECQiSkgoT1eAaUzCfab4wQ==
X-CSE-MsgGUID: B8CJ+UiUQT2IftGKXUv4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143183982"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 May 2025 00:13:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKAyU-000VN2-1K;
	Wed, 28 May 2025 07:13:18 +0000
Date: Wed, 28 May 2025 15:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 41/41] kismet: WARNING: unmet direct
 dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
Message-ID: <202505281501.jSDYhBaT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   610c395142f7a77d9818044c313edb454646a21f
commit: 09f6a7bcc18d8ef3f558da6a12d1345cdbcc507b [41/41] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_CRYPTO_DEV_HCT-0-0 (https://download.01.org/0day-ci/archive/20250528/202505281501.jSDYhBaT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505281501.jSDYhBaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281501.jSDYhBaT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - CRYPTO_DEV_HCT [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
