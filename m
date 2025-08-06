Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAF41A3165
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754496386; cv=none; b=DeP+zpeoTlahlcXmuNPEkPlrs/z2PMkGz1/EuaaJVGX5UlYA7bs2TSJ2ZUyV55zT+oBE6/aETuEV2c2pZg5ZFjrq3b0oNfKIVYvRFhjHtNxXisi/zFce0Q1a0+xzfaXBiU0PTRS+JWBSysIpeQsAxPgi7CE8BsXHGEe+dn2PeCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754496386; c=relaxed/simple;
	bh=UqAZa/fR4SxFLTH7avMqCd4BJcEPhOaFR+eSyeokFxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMI7XVZ/vI0iuYTAItH+ZJRNzQnldtkbpv+vKgttZ/pRjkQAhMo62UGu+Io36DAD0qmufOR7Rhae/fxRb/NqXCRrcjyV8Offd10RMCXzZbRgdpUcmbIzu2HvrXiB5+EaJEeynKBuGZGBEabB8VzSLG69Eb/4Xk/BC6KJ+xDX3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzkdxhSA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzkdxhSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754496385; x=1786032385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UqAZa/fR4SxFLTH7avMqCd4BJcEPhOaFR+eSyeokFxM=;
  b=MzkdxhSA1v2SBghhZWgcxmn3P5AAAB37QE5j7L20eyfNSy/2Szwi/OSY
   1jV8HzS84TGXvFCUEsXQDUKv0OuB3NLuAuBbSRi/hwVRRk3g6j6+Us9Pe
   xDB9g519YKpJyViVj4uAEs8wadOVuMx6uFe1hLgRJAN2Y7RpYR1P0KmGs
   YEkwMU/16kERZewdCjVwFp9hCjZ078+hvElIo341y0csxrQxzKTI+157s
   FRFM7tjTx9xfx/fdoS6lVrjlWLYqvKyUzmjdS1Xpjb831wgG/IswemnEy
   ot0FJP7szBJ0hkB1uoK0zGR0GjgzU7glHVgyQMTD9UgMMIV+RKFeZbXGU
   g==;
X-CSE-ConnectionGUID: CjzuLqcQQkiiNe7nN9SMHA==
X-CSE-MsgGUID: xauQp/6PQSaI3X79YWrxEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79368647"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="79368647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 09:06:25 -0700
X-CSE-ConnectionGUID: Abf3ZhUyQe++4Szf1Z0Uug==
X-CSE-MsgGUID: 45KvlLihRCyicDtrLDYzjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="168933191"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Aug 2025 09:06:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujgej-0001qQ-10;
	Wed, 06 Aug 2025 16:06:21 +0000
Date: Thu, 7 Aug 2025 00:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3106/3106] ld.lld: error: version script
 assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed:
 symbol not defined
Message-ID: <202508070026.lRMtLNGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a8c621aa031669a6835da1431d9765e3bbbc3621
commit: 5476cb89ef2297bd36f8b38e27b54617b6f63236 [3106/3106] x86/vdso: Implement a vDSO for Intel SGX enclave call
config: x86_64-buildonly-randconfig-002-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070026.lRMtLNGR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070026.lRMtLNGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070026.lRMtLNGR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed: symbol not defined
>> llvm-objdump: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory
--
>> llvm-objcopy: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
