Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821CE27B348
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 20:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065145; cv=none; b=s3BsooK8klUf52DUsD8H9D9EgBpxQ8WYN7BXMF7GmFxsO5D2HExZzt/3jDFHkP41+ZzvRWaN4FfVJ4VGacer7zf0iqClagISJItvW+nVmMSC/E95m3W9FfNg6pg6AW2uljaIhb1/Fhoc9WUigJ6Rzoy1FmgWcA+IDn7zXw/lvjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065145; c=relaxed/simple;
	bh=TQZrcR/ypdEJ9RXLOaHKILKlM5KMf/zysIhFIjmV/Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+Ly8pIqEm33jaYayF8hQuS5hxgmt2T97Q/uibpEZRWC/bjLp43blJW8c2i7xxEXoBDELS4GHrP7Hm4ouVURNtOLSl+8susMXfyBPnkWqbtutQXnDuMM7wHXRtC3tMytZfQYr6W63ehZd7ng9mP/8aKQ8QwDUfnzdpK2E05k/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sa+a2h7y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sa+a2h7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763065144; x=1794601144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQZrcR/ypdEJ9RXLOaHKILKlM5KMf/zysIhFIjmV/Ik=;
  b=Sa+a2h7y7/yNicxlRmHhotTBsVopimENNJEjJ2VoIuQPtudPMi/gbYtX
   Mv4qH8iZ+XI7UPSgYlEA7nZWVwfqUFtpDSRLZujxu1nLY67sS7KvohrAS
   3Nfm+wyGdyPzHsYmvGCcUIKenPDFa7/iWx3paoXoSH7TjqiOApigDD2po
   R+LcADiMp5PVoUquh4g+OwFjveoRq5S+serSjwRH6b85y3kIuKTBW2TCI
   dTy3oMmH+to9xR5VjYM+nlWsP5IZW2EBRASZRhUMljNkGSKn+0OD74lBG
   VemvS+BA1qzsekt3MqTT5MqlrhMVJGkdskx148K9u3/kxgdsftuKKiKmg
   A==;
X-CSE-ConnectionGUID: C79fumyhQ5yx6G9lZB8aCQ==
X-CSE-MsgGUID: LqClwlUgQxuZoTSCRqllGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65042947"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65042947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 12:19:03 -0800
X-CSE-ConnectionGUID: Su0nQCwPT3msM+RMuhbZJw==
X-CSE-MsgGUID: Tjkrpwy7TOeOIri1Ag7MPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="188845006"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 12:19:02 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJdmV-0005pX-20;
	Thu, 13 Nov 2025 20:18:59 +0000
Date: Fri, 14 Nov 2025 04:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
Message-ID: <202511140407.VnaDOCI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ccec5944606ee1389abc7ee41986825c6ceb574
commit: c51da3f7a161c6822232be832abdffe47eb55b4c net: remove sock_i_uid()
date:   5 months ago
config: alpha-randconfig-r123-20251113 (https://download.01.org/0day-ci/archive/20251114/202511140407.VnaDOCI3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140407.VnaDOCI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140407.VnaDOCI3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/llc/llc_proc.c:56:9: sparse: sparse: context imbalance in 'llc_get_sk_idx' - wrong count at exit
   net/llc/llc_proc.c:102:23: sparse: sparse: context imbalance in 'llc_seq_next' - unexpected unlock
   net/llc/llc_proc.c:117:17: sparse: sparse: context imbalance in 'llc_seq_stop' - unexpected unlock
   net/llc/llc_proc.c: note: in included file:
   include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar

vim +2098 include/net/sock.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  2094  
e84a4927a404f3 Eric Dumazet   2025-06-20  2095  static inline kuid_t sk_uid(const struct sock *sk)
e84a4927a404f3 Eric Dumazet   2025-06-20  2096  {
e84a4927a404f3 Eric Dumazet   2025-06-20  2097  	/* Paired with WRITE_ONCE() in sockfs_setattr() */
e84a4927a404f3 Eric Dumazet   2025-06-20 @2098  	return READ_ONCE(sk->sk_uid);
e84a4927a404f3 Eric Dumazet   2025-06-20  2099  }
e84a4927a404f3 Eric Dumazet   2025-06-20  2100  

:::::: The code at line 2098 was first introduced by commit
:::::: e84a4927a404f369c842c19de93b216627fcc690 net: annotate races around sk->sk_uid

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
