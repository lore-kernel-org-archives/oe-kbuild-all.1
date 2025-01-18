Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E03398B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737214650; cv=none; b=NLdwFuTLcwT+tedOwPs4BoFwn9XK7vwALCiSF9vMcEzDc6EoyC2aZnVnBeaMS+4yC7V0kE/Xg9XIfHWwW8IUoirSemYqlX/3UHzAJTg4Xix6riKhsVytBKRyTUDux6dQ050RTwtQvFvWquZFAK89UsAMml8XHlpVcu0dIkXu/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737214650; c=relaxed/simple;
	bh=TLuWzQwc4oV42Shhchb6YIa0cLBXa8YYInIAf8aFrWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbK3X3sT41yh7VLBwHooyV4T7To6qpL4giFBFGZa2jIAbSk8KpuxwJDP3CJ+G87qz1QGr6tR2aqipoxwSWScWci5RTlzsWBM0AP24xQv5D1vDhSMV+9Q0Mk5MASoAR6MkBTd0QnEJvXVnursJ1KLst4bCvqKRMa6mbl1QXHrjFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPVTM7D6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPVTM7D6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737214648; x=1768750648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLuWzQwc4oV42Shhchb6YIa0cLBXa8YYInIAf8aFrWc=;
  b=aPVTM7D69Ut656KrSTo0KH7x5FwpLh5ciwp0QFmSWpnxuTTNhgSJDi83
   LoiPN/gQjpPOzN1vrc1jUzabnUCUz4QyonqmlmST6Jkq6qhC3q0xWtgh6
   4/eU10nAu00mKTuWm3WQI6SpzrzJWNce3zyKSaoP2NiJG1iqmzFVsIhhH
   sz7OCtgCLEU3cUbla2cBgu4gKjTQoFy2NAL/a2II+WN28Yupp9me7QnLw
   w0pfkcltCN8UWts1cda+rd1Wa5Meml/Z0DJvzSQV2DKYo15tJju6aCpkC
   70Bz1ttLF6dXmuX/nmVSt4v2ep2PLJpIzafMGN7MdJn93H69FfoAhfBKV
   A==;
X-CSE-ConnectionGUID: r0jVvaBdS0GjsbPGttJTGQ==
X-CSE-MsgGUID: LZm8zzf+QrikOSc2CDxd4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="25232857"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="25232857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 07:37:28 -0800
X-CSE-ConnectionGUID: 13p1LCvERkOm0Y7Cw9y5eQ==
X-CSE-MsgGUID: xGp6Gp/PSiSVfpj5vpXRBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="106113569"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2025 07:37:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZAt2-000UZ9-2C;
	Sat, 18 Jan 2025 15:37:24 +0000
Date: Sat, 18 Jan 2025 23:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1407/1407] hifc_lld.c:undefined
 reference to `rtc_time64_to_tm'
Message-ID: <202501182334.LzPZxncS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   52349611d09c6a9a2b558b3ce1cb1dca0d47dbe8
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [1407/1407] scsi/hifc: add hifc driver FC service module
config: arm64-randconfig-003-20250116 (https://download.01.org/0day-ci/archive/20250118/202501182334.LzPZxncS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182334.LzPZxncS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182334.LzPZxncS-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/scsi/huawei/hifc/hifc_lld.o: in function `hifc_sync_time_to_fmw':
>> hifc_lld.c:(.text+0x4d4): undefined reference to `rtc_time64_to_tm'
   aarch64-linux-ld: drivers/scsi/huawei/hifc/hifc_dbgtool_knl.o: in function `ffm_intr_msg_record':
>> hifc_dbgtool_knl.c:(.text+0x268): undefined reference to `rtc_time64_to_tm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
