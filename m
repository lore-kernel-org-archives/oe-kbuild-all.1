Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB12877E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756188729; cv=none; b=UaK9z4lgEm6KH0QpzDvr0uukqbiKOASoJ45Ak9TeQvSxcm6hJNJPGajHq+FX2prBx62yuJYxKbzEWQhCkCgaWzdTjIQB4Kgw1yP+HdygcO+BUB02unv4gNV1rYRzDyJ7v31fd0N/violy2/ZXJn+bghOdfpBf+m1G9JxICGv2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756188729; c=relaxed/simple;
	bh=jfVaDi/1Rfjc21GBI6cfZWCpc9RGKZZWbFdi0rh77ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+mn4+chaib+kcUZpbcM0kxxLOkCQo1bjh/hmpG42Vg/rTEplUuYAi5lR/PGDreY4klP8oI1tO375VcFJDUJPAPDE6EcPNaou+SrxDxRLFqOGvvJbPxrYzFu360Dk9wSYhIGdL7OCB1NGe/mw3MnOwsa9pU1vsi8/v+qIdq0xFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qd3vD01E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qd3vD01E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756188728; x=1787724728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jfVaDi/1Rfjc21GBI6cfZWCpc9RGKZZWbFdi0rh77ew=;
  b=Qd3vD01EI0M4CZ78xXmqn9Gyr7k7AEUSBn6/DVRgt6uqaPdRqmGpKBAc
   BeNeKHGkyTtRTnLmV1LR7JGhoX0qfQIZ+ChQ3C5DVPX0oNM8Dw4+rjL5p
   ni2Ublly5a5oH8ejbixcRJB5lrYh27FJH8LdigVZud7JL4eguISpxqWL6
   osLWz+raFI12vkMCDrYDXd64Mnim+Sryg13fw+YMnfklJDEJ28dz7E1Cb
   XkKwHgAGoQN/7gRYgS1OfMTaJkseNhOozEmPlAp5dXG11O5UMnMe00S4W
   2cac2nC8oBhiLLwazoyQnxd3itOfVx/yIAb+QV282BhrDWDMmN3JPOazQ
   g==;
X-CSE-ConnectionGUID: GHuQbKV7TmC8G2ngMTJFfA==
X-CSE-MsgGUID: 6nmOSqo4TniNm2ySnQWGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="45990562"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="45990562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 23:12:08 -0700
X-CSE-ConnectionGUID: kBFDl8tzT2ydz3qerefmTA==
X-CSE-MsgGUID: tYHgl1i9REyG5R0y+P9w1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169656061"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Aug 2025 23:12:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqmuZ-000OGJ-06;
	Tue, 26 Aug 2025 06:12:03 +0000
Date: Tue, 26 Aug 2025 14:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 38/47] kernel/entry/common.o: error: objtool:
 irqentry_exit+0x370: call to instruction_pointer.isra.0() with UACCESS
 enabled
Message-ID: <202508261440.puyyvBTN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   3aaf1200ebca49bc745506e411f36c54754e1754
commit: a204651a939f81e1d14f28da912f70a7807c1aea [38/47] rseq: Switch to fast path processing on exit to user
config: x86_64-randconfig-r131-20250826 (https://download.01.org/0day-ci/archive/20250826/202508261440.puyyvBTN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508261440.puyyvBTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261440.puyyvBTN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/entry/common.o: error: objtool: irqentry_exit+0x370: call to instruction_pointer.isra.0() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
