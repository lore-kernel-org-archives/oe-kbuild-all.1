Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E50142070
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 23:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739750173; cv=none; b=g2h+yjQs/8LZ7JSCzUNlvzclR4bnZequk4cuBVKKOEjGU3iSlK/aL8dridqSZCwESnvHiKR9aFxbxoKNUD4I7eUIoT+E/4BfC0Sm4aaKsFcWwboHzgVFqT7PZKs6hq24bK2xo1+aiPiAmMirzh9WyvHZSeNKig1ApCfH7QY1j0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739750173; c=relaxed/simple;
	bh=8AYz0EmCV2ytRU6YL9uX9xI7ho/nfQeiruy33R6GAfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpEqtowvTk/y9lh2/Bt/3VzsP3tjiEnpPDUOA9RsjP2DhwO38nyAdHtRiiNve3bUdYy4HnXPlduKXuD6DvmLXmWBTymQEp4q1+AeIx2Wzv2i0FuAWfhH0G+BMYNsLYMModR9IHzZZfootPeAUjulxFDfgediX8aNB2pBrqOl44I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U27KbiWM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U27KbiWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739750172; x=1771286172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AYz0EmCV2ytRU6YL9uX9xI7ho/nfQeiruy33R6GAfY=;
  b=U27KbiWMT0HVFxReqB7MjQZGrufMs4t5kd2tmL+YJ3uWg9JOOn/0DNBp
   HBtZ1uY18xv5+bW/CTp8cOxxca54etLcqy3m9+dM7EeFz8k1TsYlA/DAD
   Yqh5hSD7zZ8GHJBD1aPkmE/cOF9T22qGGdVmHLZ+CX5VBk+P9L5ARHiOe
   VY2SqIq9za5t5dk6Ei68g00u0mf8PDcWKhgomBhc6vUv+crUnrXV+3vZi
   QmcDB+hQZrqrpbacG4sG0C2mCubkGUdkS/kxO3zgrjTV6gLmz2lVpGi3H
   kndC3zg3x+5tYNgaMtaE3HMyMwe6M61YeDHSH5/2+TcBCZR1IFAhdLyw3
   A==;
X-CSE-ConnectionGUID: ruElzEx/TeG/4IxWFCZP1A==
X-CSE-MsgGUID: S2BRctorRb2WyxsvqZHrqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="57956020"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="57956020"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 15:56:11 -0800
X-CSE-ConnectionGUID: Xd8I3eYAQJ2ybRV/erctUQ==
X-CSE-MsgGUID: CHA4Ui50QES9y3RSjcyOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="144818334"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2025 15:56:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjoUa-001CNr-1b;
	Sun, 16 Feb 2025 23:56:08 +0000
Date: Mon, 17 Feb 2025 07:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:slf/nested_sti_blocking 2/3] vmlinux.o: warning: objtool:
 svm_vcpu_enter_exit+0x39: call to trace_hardirqs_on() leaves .noinstr.text
 section
Message-ID: <202502170739.2WX98OXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux slf/nested_sti_blocking
head:   6a3df6b9387c72e91ac82058fdd387b38e42dfe0
commit: 2394190a1f9102c9e202b18f8b851e3b5f04e620 [2/3] KVM: SVM: Set RFLAGS.IF=1 in C code, to get VMRUN out of the STI shadow
config: x86_64-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250217/202502170739.2WX98OXk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170739.2WX98OXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170739.2WX98OXk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x39: call to trace_hardirqs_on() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
