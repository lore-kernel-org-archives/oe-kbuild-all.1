Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1CC1FF1AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067694; cv=none; b=CnR1Y+kgOClB6VvRuR9yGvtXXCOGONINgcPW9Yo7+YzjOeprTgrIVHslIj1vxUhRP+bHycA/5JJPS0igh66vnHk7tVcITZF5ibQAePZXN68C0KUHbqsNdUTEejaP5bB9Mm/cTfZDU1PW63OP9nuCJkV5qynBjk3rtfH6W1YXFes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067694; c=relaxed/simple;
	bh=HKAKPIVNdtthhWTKGZAWm8rDBc5ig2B8wZ6JMd4Y6zs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NDmR1z41oNrkEJgyk5/riqe39CW0Wrg733zpucKn2GL/MO2RVueKM6mRMl8B1HtELJk9p0U1D3m5Dc4rnuA2hTSRKxQv0dj+NRho0xwnfzHCkbjCWJTxIH/ZpTK/y9HcappelAr+uTcZECuHXsUIgpGtHbOze9RJfob+Awqj2sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1WVbXWT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1WVbXWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740067693; x=1771603693;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HKAKPIVNdtthhWTKGZAWm8rDBc5ig2B8wZ6JMd4Y6zs=;
  b=a1WVbXWTJ6zV/H589aPFmdPBLwZgBhCRQjJT5RqE7/khx9eTnHfmquBN
   CD6IuRIjzOlPbj3MTa1fWhRWnPd9txsABso20ZDRTw3jn3EVFXtejordQ
   +w1mosaeHeiXGatyyZQS3gAwEv/EkwNaFNhQ62xUorRyAb8d94WZ+uE1n
   DbDPePprtHruPJVb8AXeR7JMsXOtOw9SVEwGsb3kSuxuNIiHA5daoB47d
   D3OCgjm1jAbkhKYt7EjQYjIbZveXGjZOkHT8+dlwH/GZYnkJkahtFcSSR
   Vm652jZM7vDMu2geLdfsnz7LtliGQuqMtSno+0ax6lHnNFQg6QZ++qbpK
   Q==;
X-CSE-ConnectionGUID: FkIhgsGTQBqxJNIxzolevA==
X-CSE-MsgGUID: MnVi9X1NQNOJCRUarH/gDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41111068"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="41111068"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:08:05 -0800
X-CSE-ConnectionGUID: KPDP8D9eRjaUfI/gu9k9UQ==
X-CSE-MsgGUID: O5pjpVlTSbS0PhRdsjVhEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="145937702"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Feb 2025 08:08:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl95l-0004Tx-25
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Feb 2025 16:08:01 +0000
Date: Fri, 21 Feb 2025 00:07:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] drivers/iio/adc/stmpe-adc.o: warning: objtool:
 missing symbol for section .init.text
Message-ID: <202502210055.4pIZi10f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 9f3d084965a5544f096d4f769e274d4c2892079b [1/1] iio: adc: add STMPE ADC driver using IIO framework
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250221/202502210055.4pIZi10f-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210055.4pIZi10f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210055.4pIZi10f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/stmpe-adc.o: warning: objtool: missing symbol for section .init.text

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOSF_MBI
   Depends on [n]: PCI [=n]
   Selected by [m]:
   - SND_SST_ATOM_HIFI2_PLATFORM_ACPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_SST_TOPLEVEL [=y] && X86 [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for IOSF_MBI
   Depends on [n]: PCI [=n]
   Selected by [m]:
   - SND_SST_ATOM_HIFI2_PLATFORM_ACPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_SST_TOPLEVEL [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
