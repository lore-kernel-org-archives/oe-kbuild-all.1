Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370461CF96
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735479237; cv=none; b=neFqNV0ZviXpyXH/MdmwzJPJ4Fi4eP3bsppZm2NqfSLzUQ0Lk2fDIPSfPuD+sVYntWmAYiSB8OLaDxaX0/IfNvTRCGssWCQrtRIEk9TzK9A16StCNyvG6WQa1Mny/71YFUNq8PvomvoPQFarQIisD4Oo8194YDFCi4i5i8N+2t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735479237; c=relaxed/simple;
	bh=JTzbD8N7WyZn3HovdYHi52MFWhvXEJfoNdFPtReqyvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvab6jJe6+gmZ1SoBPhOZrwA4q1Oy/B9zvUcm0Xltyr+QOY1xmxctBK1ZMwFIt1Ecfb8D6iELMzg7DxSWigkVIsX1fyDiLHpQ1uktjI/GnzR9uq42G8uIOKtbbj6ihO9oVDeFaXU0eD57D3Bp5sOT3cBHsZQEWZYM6SVUo1RLzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K40FxPeH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K40FxPeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735479235; x=1767015235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JTzbD8N7WyZn3HovdYHi52MFWhvXEJfoNdFPtReqyvw=;
  b=K40FxPeHZ03pWXO8etsV+CN08m4dAl8Rf/EcXFuaStCBBC5OVDY/Ed+6
   8Cwe0MYkPFHNBXr6ls1PLt99du+0dIVseCIwHkh6YVf7kw8hmhv8vinP+
   b204vzszazU1io7214ODrNgUdSIIaYAfHr4kbrczbHjJOjlsVQ2z4wvMJ
   SJbp7DQ/1U+nZL8JS9C1vrNAS4n8gUOldQ2V5T5yK/OF6G3s3RRNu2aN5
   UwDB9HTw80Mp6wyoaS8g1RGnctSLb/SOjrqbNhqdRHVFzyYsgC1CXAsLL
   GHmnwhS/Fm9wQ0vvJUK9V4/qX7+VC8c0Jxx4iJQ0kHg3+393OWN4unqg2
   Q==;
X-CSE-ConnectionGUID: WrBQjY2MSiGlcWTOYa19/Q==
X-CSE-MsgGUID: B+CUamCSQz+t2lGGT7ZDkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="23386031"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="23386031"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 05:33:54 -0800
X-CSE-ConnectionGUID: S9Wm2cDMQSizCUl3oW9ftw==
X-CSE-MsgGUID: z9mr0k7gSNWXWQvuO29sbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="100953414"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Dec 2024 05:33:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRtQV-0004gi-1U;
	Sun, 29 Dec 2024 13:33:51 +0000
Date: Sun, 29 Dec 2024 21:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Laibin Qiu <qiulaibin@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1356/1356] kernel/seccomp.o: warning:
 objtool: __secure_computing()+0x164: unreachable instruction
Message-ID: <202412292126.8dsmJnAO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: e5d58f5ee731b2ff4e5c801cb875c804c63593e4 [1356/1356] seccomp: Invalidate seccomp mode to catch death failures
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241229/202412292126.8dsmJnAO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412292126.8dsmJnAO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412292126.8dsmJnAO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/seccomp.c:190: warning: Function parameter or member 'ret' not described in 'ACTION_ONLY'
   kernel/seccomp.c:190: warning: Excess function parameter 'sd' description in 'ACTION_ONLY'
   kernel/seccomp.c:190: warning: Excess function parameter 'match' description in 'ACTION_ONLY'
   kernel/seccomp.c:320: warning: Function parameter or member 'flags' not described in 'seccomp_sync_threads'
>> kernel/seccomp.o: warning: objtool: __secure_computing()+0x164: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
