Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A413AF9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPesK0rQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702135362; x=1733671362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8f/LqNeunxGMjPb3IXsL/dR2s6eRkvmQKc57l5wEEpc=;
  b=CPesK0rQDXjXtE6lX++dejR/diPz7f/nirgm2RJh0jmGFUdrq8BwVtHg
   EGCa+GZzSITVtcJTreW7Q4YTgz9EN9cks/617BJlxGNu6e+gVRGnHRnvQ
   UaSKrrhqq5Q2v4nvAQfRlszTpv8Ywz+pqdjdP4uCx3K3oRe6f5mh9EzGZ
   P6jJaAZHi2nQYi2wyOCk7Wob356Kdhb1v05SjkN2PGB6yvBaUgUoThE5V
   vzu910pwE2kkUMQQWjbdk3InmTMq65dBn3dPGMounCfp46ocuK2SoU+oG
   JudkbfpJPxbeuOx8c0tGazZUhj4hUvJXFPbX/4Dge6X2f3IBJqi92HL+Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="480708604"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="480708604"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 07:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="945720148"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="945720148"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Dec 2023 07:22:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBzA6-000FUr-0h;
	Sat, 09 Dec 2023 15:22:38 +0000
Date: Sat, 9 Dec 2023 23:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: io_uring.c:(.text+0x6c4e): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312092349.v2av9uL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 7b72d661f1f2f950ab8c12de7e2bc48bdac8ed69 io_uring: gate iowait schedule on having pending requests
date:   5 months ago
config: csky-randconfig-s053-20221204 (https://download.01.org/0day-ci/archive/20231209/202312092349.v2av9uL3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092349.v2av9uL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092349.v2av9uL3-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   io_uring/io_uring.o: in function `ctx_flush_and_put':
>> io_uring.c:(.text+0x6c4e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6c52): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6c6a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6c6e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6c8e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6c9a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6ccc): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6cd0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6cea): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6cf4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io_uring.c:(.text+0x6cfe): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
