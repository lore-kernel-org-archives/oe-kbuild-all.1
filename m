Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01F3D996
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 23:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696377313; x=1727913313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hft2siEOjrMzTwWgvMXdlko2VSKRWTuizn1qLHbPhpk=;
  b=K4v+wCb+v78GnkXc4Bik+h72nJkiVgU8TH1O0yq+UCw1ygbGR381vaFa
   5vRy3LkfjBcXgkcxF+BngMKQp+ErPc6ovqMmuS7WzVbNqzhuA/KZZsAvr
   q+PfNTWCYxgAwRd/kPe1oVdlU8sxbrXeNtpeJ7xR823uPGDlhRllYN7dz
   9/FLhkpFAmJjERB6rPhG+qSA4qV65+xMy6BS7G1ym0nvIDkFe1s22heCt
   MPJHVuGz2dkbyytgh7Th01VSxi31oP8sO4BegjwgSvNDwB2CSBpnvcN5Q
   JjxCnNK6nVDKZH1km689DoOaEmmyNZ+k7Z9pi6fNGHianGljlRW6Hz5yk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413925052"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="413925052"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 16:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="786273867"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="786273867"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Oct 2023 16:55:10 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnpEK-0009r0-13;
	Tue, 03 Oct 2023 23:55:08 +0000
Date: Wed, 4 Oct 2023 07:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 10/11]
 drivers/net/ethernet/renesas/ravb_main.o: warning: objtool: ravb_tx_free()
 falls through to next function ravb_ring_init()
Message-ID: <202310040718.VayJGLxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   3cf9365660f9bcf3dd0b09582d9f49634436b28b
commit: 71f70987f97bd71c6ec99c544ffe477e584fdf12 [10/11] UPSTREAM: ubsan: remove overflow checks
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231004/202310040718.VayJGLxH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040718.VayJGLxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040718.VayJGLxH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/renesas/ravb_main.o: warning: objtool: ravb_tx_free() falls through to next function ravb_ring_init()
--
>> drivers/video/fbdev/core/fbcon.o: warning: objtool: updatescrollmode() falls through to next function fbcon_set_palette()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
