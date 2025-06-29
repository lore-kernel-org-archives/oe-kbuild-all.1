Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601B17A305
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751234317; cv=none; b=pX2tZLKOiKw3qQuOd8KJo6Xa6K3x0zYWqfWvvo7WQXjHLcTSQAVRK5dmLpS6D2QqMgEFCRgjVqyiQ17TY0mlmPL2we18gF9zvTdk7CxRmt67ce3m1zFuzXTg3N1syXG1dZNK3FMZEFzIsZgeP5glzlxd37Ilz9jcj1u21+kVmrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751234317; c=relaxed/simple;
	bh=MAnYPR15pqsr6TaFTTvljkExiJsvX98njEVLZqE9CE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CtpIQkM/mKXfCAA2zcNfxuk8Yr64OH7VbWjbeTSx32FQCYdz3tgi+8gR8LLfYR9CXAq/8IX6aCvaHe+IHmuPDorQ5cFr1Ofhrf7BkbrxRyX/X7RohOBVwL8eqrhpZap6PRdxwmsQp9HmUOgVR7GNiiqxbLWT4zl5EUWHIiJiWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na6kXM4D; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na6kXM4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751234316; x=1782770316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MAnYPR15pqsr6TaFTTvljkExiJsvX98njEVLZqE9CE4=;
  b=na6kXM4DY1uwloeZyd0Iu232lWsi5w117zSgk+Wsy6QgjhQWqIQ684p+
   q7s6r7YyWCQjg0jQlln7X5yv1/+8exSNRLYJwhIWyPfRty6ABM7tAklcP
   qBNAD04M3kZkR4GCJo6rlo49XAFSmD97WfQLJjewXnRZCMBSsZ/uk2Dot
   EFlscbiPz17dATwl1AG4+zcAuq7xyjDfcSnJucS8Sj+awogbF6FDqyHG3
   n7Yg3wvu2vWxG3sph0p6OFU432UjS0P+DPo9YY1jmoZN8/rjasSExyQNP
   9tycfxCg1QY5fzV5PtVOtI9PbE3UzC1qaPJjMu/sRd/MJsNcYdawB+nIJ
   A==;
X-CSE-ConnectionGUID: ycVbFOJMQF6ah6S+F925tQ==
X-CSE-MsgGUID: wP8kevMhQBmlfN7lOjnnJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57236515"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="57236515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 14:58:36 -0700
X-CSE-ConnectionGUID: Ezl9E+hPQBekEYr8HGZiXg==
X-CSE-MsgGUID: ZJRk+7CKTs6N9nHvPCMvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="176969110"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jun 2025 14:58:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW02i-000YGc-0z;
	Sun, 29 Jun 2025 21:58:32 +0000
Date: Mon, 30 Jun 2025 05:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: [linux-next:master 4262/5998] include/net/sock.h:2098:16: sparse:
 sparse: cast to non-scalar
Message-ID: <202506300504.avZTufkf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: c51da3f7a161c6822232be832abdffe47eb55b4c [4262/5998] net: remove sock_i_uid()
config: alpha-randconfig-r123-20250630 (https://download.01.org/0day-ci/archive/20250630/202506300504.avZTufkf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250630/202506300504.avZTufkf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300504.avZTufkf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/bluetooth/af_bluetooth.c:248:25: sparse: sparse: context imbalance in 'bt_accept_enqueue' - different lock contexts for basic block
   net/bluetooth/af_bluetooth.c: note: in included file (through include/net/bluetooth/bluetooth.h):
>> include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
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
