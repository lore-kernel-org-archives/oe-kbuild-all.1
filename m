Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84135FDC9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706693842; cv=none; b=AOyz5mYngd0sRJZv/j7U8PFGlUEssMm5I/MZsC7OjHQTpie3QpfH6UhTeFxtjiZVvd5TZ7PZzuGPBuhej6yzt+PjuHzPUhwZ34vpKdNpnU+tWyuNg8VqJ0Bdkv4qU/SOCRL4PstsaA5leM59ubPwAMIAHsWDa5VBJ1TVj9tMBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706693842; c=relaxed/simple;
	bh=hWOX5/cVsVWdpt4YPLRhHull1xnJHywBmaWuuJ890DI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6oMVUDwlMuGMAl1Lyfenrh+J9bMQnf/lC1tZelxuswVIRi5SkRbsnYKLQYR0bpFz57vr243T9DgIYyCzwDoD6x/zKSraekHo8GIR6cJOMjUd6QanmTEeN4J33XriRAOx3EJ0vdOzshgFPomNbsucw3dUlDrhdqU1dlNPZEUaXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx0AbRfa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx0AbRfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706693841; x=1738229841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hWOX5/cVsVWdpt4YPLRhHull1xnJHywBmaWuuJ890DI=;
  b=hx0AbRfaDvXhs1GbTbLxIgBIb6PJq8N7IWRRTbodV5hiJChV/jSbZjak
   femBVnv0KZbTicN/5S6uE9MzMJ0TD40lQ4pcut223BWrvr5XUjJ8zFGj2
   SruQuDiqjepWi5AlYt9QvJUGQX+OrZZaYjLOeTYCMVDVQRppYj1V7wN9D
   vF1mjapkqlHNxRcoSVH/wDLx4HV2HhPcKP958jh4y4kQAnBUVEf8MVfWM
   g/jZX4EShXk0F+gzrpRh75uPjIb1aSgo7bSfpEpEmUlz9ILFTPF+fPaHP
   ywRRgbyFMtWBJMB1Osip9UEaE3TwTOwH9NMKMT80s/khAOp2hf8Xudr4H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2488816"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="2488816"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 01:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36805516"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 01:37:20 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV71t-0001Or-36;
	Wed, 31 Jan 2024 09:37:14 +0000
Date: Wed, 31 Jan 2024 17:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Oleg Nesterov <oleg@redhat.com>
Subject: kernel/ptrace.o: warning: objtool: .text.unlikely: unexpected end of
 section
Message-ID: <202401311748.wrSxIcOq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1bbb19b6eb1b8685ab1c268a401ea64380b8bbcb
commit: 5431fdd2c181dd2eac218e45b44deb2925fa48f0 ptrace: Convert ptrace_attach() to use lock guards
date:   9 weeks ago
config: x86_64-buildonly-randconfig-r002-20230716 (https://download.01.org/0day-ci/archive/20240131/202401311748.wrSxIcOq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311748.wrSxIcOq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311748.wrSxIcOq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/ptrace.o: warning: objtool: .text.unlikely: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
