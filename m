Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B49810FD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 02:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768702177; cv=none; b=PiLrxOyzI0ivfKV35Ze/MgDSApunfzaVZjXT3PaKYLogSvZ2uvBK0GWcTtAALBAySyfkwj+SXw3lp4DjcB6SY02e1icydpH/jdNJJEHf/A7igxiI6EmX/gGwqvyGal8qRjGDwd2Ek2ynbzEwdpZz5tJfVpk5EkkLh2DkHncxYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768702177; c=relaxed/simple;
	bh=YlWij2EQqG7ptCH2p+iabAjYW5W/bO20JW+xKj7gKRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VU+mwlyCyczotA44bmGjKXUroY2rOsWxByf/phDVh1EnST1Fzodfgx0+/YBzWPXuIApRbwAsl2zC6b2EWrW8xNdzOdcvasz52I1Toe3BgO28/p0DbRw2mxVMTT6c/O9PpzpXbmDifrzW7PeznujdZHfb1KrGL/pnqqEx+6jc0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBFJ+VzO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBFJ+VzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768702176; x=1800238176;
  h=date:from:to:cc:subject:message-id;
  bh=YlWij2EQqG7ptCH2p+iabAjYW5W/bO20JW+xKj7gKRg=;
  b=bBFJ+VzOBjlCbRE+y/HHbsFeXsUzZ1OQoLVsnHfdN33SW8LeyzskMXXY
   PZ4IIhUrfXneQNgrDULKPu4FUbJEEl627bnLDQKRzXDDL1HcPVulaxOUC
   pI1k7b/1WqrlcaekcZlEvgWKNwUEhcrt/w5hV58BYQC+Q9f6CoZ13Hmls
   HlB5qFNlGIuvqnZM/6y9IyvyDT1v0r9GwtcIIwqRoBblpkyq8ikStMne0
   fzHM8uXtzmSm7IzL3eq2UY4Ah55hSOh8qn9R9avqnTo1CLRx2GG6YEEh6
   WPE8z8qXv51fPgj3dHALlsO3fAXuUWgu8jpdOp0iKzS2cDw8QNTy3v/DV
   w==;
X-CSE-ConnectionGUID: w5qe/oxURJGA8wTjz09BSQ==
X-CSE-MsgGUID: c5n9gDN0SFiubhBCmUJrcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="57515984"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="57515984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 18:09:36 -0800
X-CSE-ConnectionGUID: 3h9lpWRjR3yhPWWk8zxZbQ==
X-CSE-MsgGUID: dYVC03W/S0OBFQ+lrmlK0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205353009"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2026 18:09:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhIEN-00000000MXS-2iLA;
	Sun, 18 Jan 2026 02:09:31 +0000
Date: Sun, 18 Jan 2026 10:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:for-next 44/44] ld.lld: error: undefined
 symbol: kunit_binary_str_assert_format
Message-ID: <202601180932.KETS7oxn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git for-next
head:   7e2b963b93483080d900f13e152acb63b7149f7a
commit: 7e2b963b93483080d900f13e152acb63b7149f7a [44/44] smb/client: introduce KUnit test to check search result of smb2_error_map_table
config: i386-randconfig-053-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180932.KETS7oxn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180932.KETS7oxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180932.KETS7oxn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_binary_str_assert_format
   >>> referenced by smb2maperror_test.c:22 (fs/smb/client/smb2maperror_test.c:22)
   >>>               fs/smb/client/smb2maperror.o:(maperror_test_check_search) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: kunit_binary_assert_format
   >>> referenced by smb2maperror_test.c:20 (fs/smb/client/smb2maperror_test.c:20)
   >>>               fs/smb/client/smb2maperror.o:(maperror_test_check_search) in archive vmlinux.a
   >>> referenced by smb2maperror_test.c:21 (fs/smb/client/smb2maperror_test.c:21)
   >>>               fs/smb/client/smb2maperror.o:(maperror_test_check_search) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
