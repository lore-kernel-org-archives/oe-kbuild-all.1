Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4CD342CB3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150871; cv=none; b=ITT44ceHFHkaHOCXLNS1tueDkMD5UyW7YttNAnK3jKTBFamgzcE5/PkJhGYrlkkSlGh5NBvkwHbbHBHbC6EB8ptRExiXi+wX62uAWQoOeAxQqSjgHYP1d952iqCzZN/jyQwvNDbHw/eWQ3br+9SXxoU4+AXEMPT/fCX7dOmn8wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150871; c=relaxed/simple;
	bh=a1iXOTxQoVxehZZ/umkgXmj2gBCo029mZpe8rYCGeaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tT36hxz874Eht9zUoFma2dzQoZ6wTSgRqGJlWkWgmWlVc5VzZa/ie9AuRMaGTfkkZqb0KYIsMLtuTipI5vVi7MqgU1E8Jepo73msqgTEhLD8rqXyBgVH5RpZlwJNcdtCc+oBTMTWRbSTNZ3K5ew8bSc/g0vKxFd2EwEYs4s+EQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0t1mzgm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0t1mzgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782150870; x=1813686870;
  h=date:from:to:cc:subject:message-id;
  bh=a1iXOTxQoVxehZZ/umkgXmj2gBCo029mZpe8rYCGeaQ=;
  b=j0t1mzgm9NsoZ1SQm8e+V5HkhNGjtVpjFQ0ImE+DpLCR3vMWskDGCrHe
   1ZvUCj4azcekEOGMKq3m8Yr6m9ubrdtejRyZJxHTEqoisjmL5pD9w+fWm
   eiY8VHGpJQ9hr2hUQvrIrSNeEO/9KPa/z+6uBsVdruNXdWjxbN5Hjkl0a
   w0tsopNL3T4hGM6lTNkhzOMKK67qtwM2vD62nQh43sfb2/PzsxdiJWkxB
   EmWnK7tzb2/CRAK71DQeR54q0nwU50K4w4YcHzSJVRtZWq2z7/6e0hdwv
   TpEhgKCkwf2C5LeTuIk6h9BT62I9FqmalNP99zwDNta8vyV3YWGwRUouM
   w==;
X-CSE-ConnectionGUID: Xr4MMXvBTTaaBA7JHIR+jA==
X-CSE-MsgGUID: cYXY2BuXRPCTwQsP405Vdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="70404425"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="70404425"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:54:28 -0700
X-CSE-ConnectionGUID: a6WMXBfERjCC8mTCb78oTQ==
X-CSE-MsgGUID: YGa/tg3aT6maFKe2Pl/M+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249333910"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2026 10:54:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbiqm-000000001fG-39BZ;
	Mon, 22 Jun 2026 17:54:24 +0000
Date: Tue, 23 Jun 2026 01:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 34/47]
 smb2pdu.c:undefined reference to `__moddi3'
Message-ID: <202606230114.wS9xhKtg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   e8683c3fba9d37761fcfb08ab47017e7cc7ca665
commit: b5040be73ddbcea282706f484f9b7eae08327706 [34/47] ksmbd: return requested create allocation size
config: sparc-randconfig-001 (https://download.01.org/0day-ci/archive/20260623/202606230114.wS9xhKtg-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230114.wS9xhKtg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230114.wS9xhKtg-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: fs/smb/server/smb2pdu.o: in function `smb2_open':
>> smb2pdu.c:(.text+0x12c24): undefined reference to `__moddi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
