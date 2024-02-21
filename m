Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C255B5D1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 17:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708536078; cv=none; b=FA+GUXROw9Rd961QtkUM6Lxx5Hy7WEzV7QicTgHO8dMqtm1LzVUBWvZRo1Quf8SX3ZV7rVT51hZjoFak7J2odK4W3INWky7/53ciKd9Kfkf1p198VfW+0PN52t5xOzkOMwfNjafklqI59EMn6alDB8xgZL1hD2EK+D24b7fgKVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708536078; c=relaxed/simple;
	bh=tGTMdk1BzwcbrSt4BtEA/1O92NcPYICRw95ixpWM8eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XneYaPgwvJPuhS/i3ufqVtrKgQ6Vaxd9TNPyrN+AmvZC8I9oJIEWXNxYJVnO959tH9m3QcDadw0F0XYtvPQ/R/wGLWuFiTXY6RQd9o83y9WH4CT9qpAF2HXLi75MbYfe3VTYhvjtsp8VBW3szHc2UNb0FNz+XZgOVJUMiw32n3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQqgBvgz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQqgBvgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708536072; x=1740072072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGTMdk1BzwcbrSt4BtEA/1O92NcPYICRw95ixpWM8eA=;
  b=VQqgBvgzMQwdZMjgeO9sKQvp/f80LZ/is/LwlsFTppbqcoCZnTceFI8V
   8f59Tqr0H7YOKSwx5CRbcPtRJauJrYwN1TSczaCSblYI3KYFpdNQuXTqQ
   K4p2jhzMNKliEt8l4uGI177ABdHf0eKP5nBFGNIHguYrv21Yhuc4WYnA8
   8reAO6LI1jrbLD6zVNNLNxrilURxvHoozhNDGt7cb73cAuY8aSh3se9mM
   ARagC0wNAkiyedNavHHm+oCZhO42CN1hiVASTY5TrnT5cwEQemB7Tb2t+
   0ycvkzCwpuGHPWrcZwoP2Z2GInkh4HJz6RpI2HhhBpk065UcjR4LJXako
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13332268"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="13332268"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 09:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913340395"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="913340395"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2024 09:21:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcqHM-0005XM-1d;
	Wed, 21 Feb 2024 17:21:08 +0000
Date: Thu, 22 Feb 2024 01:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 18/23] error[E0425]: cannot find
 function `has_capability_noaudit` in crate `bindings`
Message-ID: <202402220113.FdnbBGOA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e49421f9a1de2b7abd3ad10ad1f326d96ad507de
commit: 2e4f09314cedd8936fcf20656b6807be6185b211 [18/23] ANDROID: rust_binder: add priority inheritance
config: x86_64-buildonly-randconfig-001-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220113.FdnbBGOA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220113.FdnbBGOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220113.FdnbBGOA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `has_capability_noaudit` in crate `bindings`
   --> rust/kernel/task.rs:219:28
   |
   219 |         unsafe { bindings::has_capability_noaudit(self.0.get(), capability) }
   |                            ^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
