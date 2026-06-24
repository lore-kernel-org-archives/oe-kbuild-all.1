Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7932AE7A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 22:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338916; cv=none; b=I+zrZTsG3NkGzXRqgVwrhSRMSNeuKLRfC+ymooqrMdCHxI5gOeGQ9shvFygrtH33gRrsRccR1DqBpS1d8YSwjbqaV/qCaDC8NRWcQ56g5Y6memB5iIiP9royMc9E401Ixxoasl32v6sFzDJ+op0YKSbleC3HSP3ZtVjU1OacOwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338916; c=relaxed/simple;
	bh=bA++iS/osS9vntRbFEiRfjDPegWhwMBu1TBAJ3YlxOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dj/6Fj5JQZX2Gk/q23ZJ0SufY+4fcpgKVJ9KMWG3+VFWzG8wxMvS+ehpvYgXJSITR7Wx/eeHcr0+oevTb7dIO447KSIljPGzrHok9y4lW3h5wsJxJL4GfyEOeZIxe1gE6LmCYOq6AAHwd6poQqidNzcj/bjrd/yArq/kALa7Wm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8MqR5sq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8MqR5sq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782338916; x=1813874916;
  h=date:from:to:cc:subject:message-id;
  bh=bA++iS/osS9vntRbFEiRfjDPegWhwMBu1TBAJ3YlxOM=;
  b=M8MqR5sqhBovqWSsVgGLt1KYuI3elDkLA09i2KEphNP4EpDdqLvxg3PA
   xennx1dODAJkkXKIKUYZvthdKNgg92BmP/wrfK+jIL+k1u3GXhvcyqy8R
   WA1xXL4ACXZjnxzzuCUzWrsUZJK5WnjEsD9TThYZ5U8oysew8uPkasBOE
   pCV1LrfHNmoK/UQwRaa2EDXMh0dn8iHC2/ZMnmsXAMQ93rhTLkM3KguHY
   FFny4ccj7U/Griy/xQt0Hoq2OhDoWkqZhCkNyQ+0R39rqbSZivOg3BfF0
   nYbAj0Xt53b2yzucHN6wAbdY1JkDRW0nHf9Fz/jGvOPLaUj1773n9Z+T5
   w==;
X-CSE-ConnectionGUID: eXwm54/qRN2+eNu6T8qA2g==
X-CSE-MsgGUID: oPSMtveiSvGuBH46LEvQLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83208857"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83208857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 15:08:36 -0700
X-CSE-ConnectionGUID: 3YIOVihRSzOXxtO+UxHTSw==
X-CSE-MsgGUID: NL9g0NkJQGexkyqHHhXY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="250148332"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2026 15:08:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcVlj-000000003hT-2z7I;
	Wed, 24 Jun 2026 22:08:29 +0000
Date: Thu, 25 Jun 2026 06:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:puranjay.2026.06.24a 54/65] arc-linux-ld:
 tree.c:undefined reference to `rcu_preempt_blocked_readers_cgp_ndqs'
Message-ID: <202606250557.nNZaLYcf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux puranjay.2026.06.24a
head:   9f9e05ef4454de1724d65dcc1d45018d0457bd7c
commit: ab15f8d23a687736b674b3b8669a744dd709d97f [54/65] rcu: Make rcu_gp_cleanup() account for ->dqs_blkd_tasks
config: arc-defconfig (https://download.01.org/0day-ci/archive/20260625/202606250557.nNZaLYcf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250557.nNZaLYcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250557.nNZaLYcf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: kernel/rcu/tree.o: in function `rcu_gp_cleanup':
   tree.c:(.text+0x6b6c): undefined reference to `rcu_preempt_blocked_readers_cgp_ndqs'
>> arc-linux-ld: tree.c:(.text+0x6b6c): undefined reference to `rcu_preempt_blocked_readers_cgp_ndqs'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
