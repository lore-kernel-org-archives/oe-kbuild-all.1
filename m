Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0608127B340
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 03:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782185678; cv=none; b=pk6ubgqR7IwTDLoKlF5YG4X2JJRcv9LijPXEL+/fLH87dHA3lPBEtEIvWsCemZuc6yWR1BAG4O1fwtxVAk5fH2NuOoXypnFFcDPDQKRpBnmcWSVBCTPl8H1awL2hmbG7w78W4I9Gyfg2al9eTjiX/Hq+U1lOKnO8WvGnt7Pts7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782185678; c=relaxed/simple;
	bh=NLxqh9wbwoZPtXXTWboTWsgtlgMbAfOLL1ypBTNzRqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JRHfv8G08jmUx0rlnhPL4FRruDJgrkYpJY2CYBR4S2fI9osFX94wcSLIcS8NVKWNJJrI+pXZc09ND0qmMLzh8Y1kHAZRmI+dBDwsYY1lSVbpKK+EWOIroPZmg8ypX4vvwHbv8iVX2i2UVnXZ7+QAmY4xf8JHRwgZVJJJO0DyQFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aieH0uya; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aieH0uya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782185677; x=1813721677;
  h=date:from:to:cc:subject:message-id;
  bh=NLxqh9wbwoZPtXXTWboTWsgtlgMbAfOLL1ypBTNzRqc=;
  b=aieH0uyac8CkU6WAhEoXDNHvMRAd2mtFkZNX6WEZkPwHhRDduVCQnvNj
   UgXIqaiy77Q49YxM2WWZ8k1V+/GtlX4pK+2cV8CBthWCInMtUOxGk6uwK
   KwIukcBj42B+lMwVgTs2WsPknlC/u4Vc+rufQCwUPPeSWjBy3xiPHGO5p
   gFzSN/BhvbNSBo1/udq9qtwK5XZ8LJE9RZ+D7JZeCBLCRpHCszqDyjkLn
   9cAH2XrsU6ZIZUPNZNCzu5R2i/N5til7zVNhqEhv9n5HGjTYJJyiUv0Gh
   zs2wV4XFUJ2NYLVpV9ACRHK3CJdMudt9qwSaZD2KSQS9+jIQNjt84sWLC
   A==;
X-CSE-ConnectionGUID: +x6COKA1Tx2hasDNCPZv4Q==
X-CSE-MsgGUID: 9VE9CVp6TmWVZuiMx7aDZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100472193"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100472193"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 20:34:36 -0700
X-CSE-ConnectionGUID: izUv2CvQT7+zgfcABmALmQ==
X-CSE-MsgGUID: CNG3lAIbT0+izcvw/fzAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253742212"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2026 20:34:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbruC-000000002DN-1uwE;
	Tue, 23 Jun 2026 03:34:32 +0000
Date: Tue, 23 Jun 2026 11:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 12/49] Warning:
 fs/smb/server/oplock.c:930 function parameter 'wait_ack' not described in
 'smb2_lease_break_noti'
Message-ID: <202606231148.8D0sk6Dc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   4f5e97218912f54a09ac326b838a79afc87da990
commit: 15221a1aa9257fbc2f7cc3b3153a7b643d925d6b [12/49] ksmbd: do not wait for RH lease break ack on overwrite
config: x86_64-randconfig-003-20260622 (https://download.01.org/0day-ci/archive/20260623/202606231148.8D0sk6Dc-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231148.8D0sk6Dc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231148.8D0sk6Dc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/oplock.c:930 function parameter 'wait_ack' not described in 'smb2_lease_break_noti'
   Warning: fs/smb/server/oplock.c:1484 function parameter 'send_interim' not described in '__smb_break_all_levII_oplock'
   Warning: fs/smb/server/oplock.c:1484 expecting prototype for smb_break_all_levII_oplock(). Prototype was for __smb_break_all_levII_oplock() instead
>> Warning: fs/smb/server/oplock.c:930 function parameter 'wait_ack' not described in 'smb2_lease_break_noti'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
