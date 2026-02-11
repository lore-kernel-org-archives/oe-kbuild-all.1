Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB61A33AD8C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 16:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770827610; cv=none; b=d2nD7Pq2A2idRxR/BSuIISQF8+pHGVZa5iA2DnrfJIgPGrYwh5VdwQBuSgZ8p0RmZ4J/gkNJErh2hmfrZc7wGmW4RnlgKAhZjTFzfEDGXJEBrbxiluBQdNib55LxeC4d4skP8R+aHku5QD5HH4EVgKi2VkRSIh0yPIA1KIeuse8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770827610; c=relaxed/simple;
	bh=HAIYvlbWhYLjXT/jFjX9JmTWPFwdHlAF4qrvqKBgcPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EyT1uiAKK3mxeD4wQfIZZ6RWG3GK7+gJisV4ERU2KC2axvH5M6+PDtv1RtO/jUHkaCZbSnB1CfiS2mDk9lafysRe90+IPGxQa+zf+wq+xZmfZAsJaExOveApfqzQepUFSO/sQYDw9MhMp0BDsvJ9chT0Kec9M+FtgPMJboyAd5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3ZVPevy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3ZVPevy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770827609; x=1802363609;
  h=date:from:to:cc:subject:message-id;
  bh=HAIYvlbWhYLjXT/jFjX9JmTWPFwdHlAF4qrvqKBgcPE=;
  b=J3ZVPevyPc5nsaKwtRZhV7fBITxaf8FOwVTgArUxkYzSKN07IYOojjt2
   V6HImQ9lc+piCoJshUEmSgQACzw8PzqBZEnx54RhiJ2DIstmqtpMiiOKn
   3DL08lZqgXf1Bh+FlB+0ErLNPjLey5FQrcq1mH2ehMlfeT2+mxjaaZwS6
   IrAYLdBNXwDGOvD0rNoQPnKpabkSaAS59ik/awjfblX7HMUQWP6s6tuAu
   9A0iC4980mhRijwlj5Kuq8d+R23G9QWQabtRCucoYzoiUFIC7Jn5bJeMO
   P/RgnsfpXD3aG5QT1ey8finTZTZrbc4gAqIRkNFe4CDfXjdXYp4ZYJ6kN
   A==;
X-CSE-ConnectionGUID: nWhtS71BT+yuadRESbE7vg==
X-CSE-MsgGUID: kB9QJN3TQsej9dFbslc8wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71879556"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71879556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 08:33:28 -0800
X-CSE-ConnectionGUID: sHE91MFXQBqqHz4tygP8YA==
X-CSE-MsgGUID: v5VJcMhHSqWO1pI1ovnMVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="212120313"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2026 08:33:27 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqD9Z-0000000017B-0TFc;
	Wed, 11 Feb 2026 16:33:25 +0000
Date: Wed, 11 Feb 2026 17:32:38 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 107/107]
 load_address.c:81:25: warning: incompatible implicit declaration of built-in
 function 'strstr'
Message-ID: <202602111710.VX51WCvt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   39507179e24402e6e2b6fb69547bca374f4882d8
commit: add3a49ae91a1f6390b3fbf14a7ec9c6231bfbd6 [107/107] selftests/exec: Build both static and non-static load_address tests
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602111710.VX51WCvt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111710.VX51WCvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111710.VX51WCvt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   load_address.c: In function 'main':
   load_address.c:65:69: error: implicit declaration of function 'strerror'; did you mean 'perror'? [-Wimplicit-function-declaration]
      65 |                 ksft_exit_fail_msg("FAILED: /proc/self/maps: %s\n", strerror(errno));
         |                                                                     ^~~~~~~~
         |                                                                     perror
   load_address.c:81:25: error: implicit declaration of function 'strstr' [-Wimplicit-function-declaration]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:10:1: note: include '<string.h>' or provide a declaration of 'strstr'
       9 | #include "../kselftest.h"
     +++ |+#include <string.h>
      10 | 
>> load_address.c:81:25: warning: incompatible implicit declaration of built-in function 'strstr' [-Wbuiltin-declaration-mismatch]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:81:25: note: include '<string.h>' or provide a declaration of 'strstr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
