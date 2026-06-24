Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E07B2236F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 01:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782265840; cv=none; b=It2F3HMJymlW9hGgczJjBLcWPj5Nn3KtVKKJPWGAkbC4g4jB3UFk1AUEZbkDvKyi1gWTB6So1IV5BF0vWrV1J/RU6RJxF5GlouaV063XjzaAeroqJSqqhgXdfNqdPsxL/Calzz+Ir8g59ZZQz3lY+IHChL7nnSQZZS/z/9bL8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782265840; c=relaxed/simple;
	bh=I2PyUqTGk/PESk2l9s9E5rzupD8/5jT7VSUhZzpMKLU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mqpfBoNXce5PESzyRnNN8RbjLAnk8hGrrgkXVCwDI45b/XsxsKxWGn99nqW4BGFeTyU0Gru4C5xSBMCxbq2yOg1eS0gQUA0xGBbCkAWURKqq8eSelSy5j8zX4zQnZv+MKgDs2Bl12Fk5CsHArbZlSrVmivONya3s1gDUR8Wsbmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGQIj/vm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGQIj/vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782265840; x=1813801840;
  h=date:from:to:cc:subject:message-id;
  bh=I2PyUqTGk/PESk2l9s9E5rzupD8/5jT7VSUhZzpMKLU=;
  b=JGQIj/vmHlWxeiEurfwco+/BwZSKlca1Qfvkvf9hU969uEqS615hdnX2
   J4Oi02OChkPMK4kdlx9C1IWRiguSFMHNmNpJw5rD2ZQrQdrlC0iMkc8xa
   kETA2nuZJFifAsvWONv8ZusZsSK4Pmf4ESs46LdD8rGkVDAZRSAJol0XF
   A1yH4LfKd8oGt3ZOgvpoAoPi1W0HS25xb7IM5tNHWLv/RrmeBzk/2O+HZ
   IRy2B3GvxRW7MuScQ50ck4p9bWSd2ILFojQ8toz9FijntV/GF/erAsHYV
   05YUhMqAgdueoMJoqHjB+2uJdi8ZN3zlRf7a0SLQ/wPnA8xWSoaNFRw1R
   A==;
X-CSE-ConnectionGUID: Lo5iY4rdR1yTL2ZOBKOm3A==
X-CSE-MsgGUID: XHmQTyB/QJal7oFHNvkBNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86921898"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86921898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 18:50:37 -0700
X-CSE-ConnectionGUID: 04P6TGpnRym3+WK6Xwr7Mw==
X-CSE-MsgGUID: eJS323emQzKLgv9dFU7png==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="279845037"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2026 18:50:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcCko-0000000032n-0HBq;
	Wed, 24 Jun 2026 01:50:32 +0000
Date: Wed, 24 Jun 2026 09:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmck-rcu:puranjay.2026.06.23a 60/62] Warning:
 kernel/rcu/tree.c:3636 cannot understand function prototype: '/*  * Racy,
 memory-ordering-free test of whether the normal or expedited grace  * period
 recorded in *gsp has completed.  Callers that need the full  *
 memory-ordering guarantees must ...
Message-ID: <202606240930.Z4Ut2p23-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git puranjay.2026.06.23a
head:   6daa08cf676d7c1ff53101073fdedbf3a6762370
commit: 790b44c0b205abf2a20f00b880109046b74de583 [60/62] rcu: Detect expedited grace period completion in rcu_pending()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260624/202606240930.Z4Ut2p23-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240930.Z4Ut2p23-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240930.Z4Ut2p23-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/rcu/tree.c:3636 cannot understand function prototype: '/*  * Racy, memory-ordering-free test of whether the normal or expedited grace  * period recorded in *gsp has completed.  Callers that need the full  * memory-ordering guarantees must use poll_state_synchronize_rcu_full();'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
