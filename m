Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B228DA0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417790; cv=none; b=ag5s9/M9RHlffNaEszNYeTkMmMw3c3RwW0/xXn/IddhOYk8YZioHF+p9+61njvQ7DKSTQSklvWfxAR83Sn/biojKUUdkAaD8xdSBg9N7YkX8unvGL9iLVaEX1dTM1LkcslWo0T5uqL95vUro+TyjYEjELGVfEkzcbpDX79WvLYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417790; c=relaxed/simple;
	bh=AKUnzwbOJ27Loy1x5XIQKAremB/AsPenF0ZaCRZpYW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uf9WSkFWxEhOn0wdNizKkwxZwpB5fsqwqIziEU9mR/s0FyEqTNNaO7aquqfYK6jESaC2Q2zc5z5nrt90XIQGI5KqH3PhGiM8PxwmgH6l2YbzZ6+mKf46rKO+lioL5fJ0NPQi+pXpBj1g0cEsdW5ajogqWy1SdbH+4kcUfkA5+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTAgybfP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTAgybfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724417788; x=1755953788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKUnzwbOJ27Loy1x5XIQKAremB/AsPenF0ZaCRZpYW0=;
  b=YTAgybfPseFl+JGsmK1QdG6h3DAtt/uWwDPWi+PFXZuKokmlzLJP7OE5
   Be4bbPoUZY1R6XmGLqiQIzJKgm5oUtG38mPqIR7eYrrlNu0lwtjNEQ3EV
   8AlNynJHyQMjGva/7oqVWQrzCxclseUYpjaqzq0+zwyC4wm0JIDsTZgBC
   NR2J9lbBd0AB4Ahf+aKyD69oUIJJENXV+y33epjEVmTcXSd2GBuV9IwX2
   hnP99qC1JVxDlZ/WKInt+L3GLDvyAMAx6LS6lNhsI+9+t6sBpXwqHqz4n
   LdSznGPMvgq/S/xH20xASON2GnW1uHyuSFRYpJut1K1v+/OgU21eMqTAh
   A==;
X-CSE-ConnectionGUID: SXq2HGLKT1SLB55D05jvwg==
X-CSE-MsgGUID: DD2p2qmVRFeFYGC3OXDcbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25777600"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="25777600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 05:56:27 -0700
X-CSE-ConnectionGUID: QZNgP+gAS7OXCDoPtOJgiw==
X-CSE-MsgGUID: YEg3+2tiQbGKYtMWvr47Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62508306"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2024 05:56:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shTq4-000DiS-1S;
	Fri, 23 Aug 2024 12:56:24 +0000
Date: Fri, 23 Aug 2024 20:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5609/6439] fs/bcachefs/btree_update_interior.o:
 warning: objtool: bch2_trans_verify_not_unlocked+0x18: stack state mismatch:
 cfa1=3+0 cfa2=3+16
Message-ID: <202408232023.5uNZM4tR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c79c85875f1af04040fe4492ed94ce37ad729c4d
commit: e4076169e231fa4142d8126b1cb920bf55fd9a19 [5609/6439] bcachefs: Assert that we don't lock nodes when !trans->locked
config: loongarch-randconfig-001-20240823 (https://download.01.org/0day-ci/archive/20240823/202408232023.5uNZM4tR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408232023.5uNZM4tR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408232023.5uNZM4tR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_trans_verify_not_unlocked+0x18: stack state mismatch: cfa1=3+0 cfa2=3+16


objdump-func vmlinux.o bch2_trans_verify_not_unlocked:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
