Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A51C3C1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 23:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737588105; cv=none; b=p2hcHe1Qk+mYLEtpLg/G86d5rRtaSmYGpFhwKs0zcRmlp21SmKLtXezF26/mSr4zOB/xYosnLun1U0BOvVjifU+Sj9Ojp688g3Y7+jwPyvaCyVaZNEo9xFTCxo30NSClkWb0lKGEIqnHbaN7r7e4KohR48tIlL/l72Pu9OgNFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737588105; c=relaxed/simple;
	bh=GoxyxotnYWwtZaZGo4YgsoGX75pMU5YCNjrjGuTgg7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bA6pQJCsUb3lklasFsKST7CTszsBKlaauAA06UkfrBALIEjwe0I7oExIAybUO1ilvi6gvGs3ytwwp+2Z8U+aejC+Ti6V0RPx5Y2foB+RiwOTM+4KDb/NgHvtZGERYhn/sNz2fpDZlTgHP7vYUkAY6DENZegBvSPg68CHttyvkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOiyKyif; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOiyKyif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737588103; x=1769124103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GoxyxotnYWwtZaZGo4YgsoGX75pMU5YCNjrjGuTgg7A=;
  b=lOiyKyif+h2XkpdFz6ql7MqRciCbq/IaeiJDvSbB5ra3tHa5C63LWVAk
   9x2zKamJnt0HPVlfUz2/T+Q8qGSCxsQGLqLf5yV1wik4LlVBDxB1n+8Ka
   GhUZtYWg4PbgbXbgj3N/6/5tHSKHpcpMeyATn+jFq9zvP3gsTQX5XMxFJ
   O02PcCQzcVBU3jMH44067og6sQ07eOOuKwUdmj2Fmflybh5sJ96Jk/oSg
   Mcza1RXqzAFDkhhtcysKaozhNxMPw+Tk25umPvtNhyJ9wuCuQLxKrfQaY
   5EikXoMxo/905SeQ7h7aIMp12DvkEf4tdhhGPZy8Y4g8JnYkNdy3b8h+t
   Q==;
X-CSE-ConnectionGUID: Q/c6XN0vQvGX6zLcx/kosA==
X-CSE-MsgGUID: hBp8uRcrQdGOH5q28jX22g==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37948693"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="37948693"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 15:21:43 -0800
X-CSE-ConnectionGUID: 1EKfEuOdRP6frX/PPpiQ8g==
X-CSE-MsgGUID: W4RMUmBVSkynyMEeUiL0oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="107096967"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jan 2025 15:21:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tak2V-000aOx-2q;
	Wed, 22 Jan 2025 23:21:39 +0000
Date: Thu, 23 Jan 2025 07:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1] kismet: WARNING:
 unmet direct dependencies detected for PARAVIRT_CLOCK when selected by
 VIRTIO_PVCLOCK
Message-ID: <202501230733.WxGso7iK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f2a45e7307e73a366b48781aa253aec45ff1fd5a
commit: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 [1/1] CHROMIUM: virtio_pvclock: port driver impl from Android
config: x86_64-kismet-CONFIG_PARAVIRT_CLOCK-CONFIG_VIRTIO_PVCLOCK-0-0 (https://download.01.org/0day-ci/archive/20250123/202501230733.WxGso7iK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250123/202501230733.WxGso7iK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230733.WxGso7iK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK when selected by VIRTIO_PVCLOCK
   WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK
     Depends on [n]: HYPERVISOR_GUEST [=n]
     Selected by [y]:
     - VIRTIO_PVCLOCK [=y] && VIRTIO_MENU [=y] && VIRTIO [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
