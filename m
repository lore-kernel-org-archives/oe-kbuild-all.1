Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0679D45BE7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 20:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3t150lZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702672043; x=1734208043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66i58z8ydVQfo7v8jDo7PKUGqm/+mmyRjt9qi4WsFPU=;
  b=k3t150lZP1ycivOiM/EqLNMdEVXl+l86z++EcrkZ25KdmzCAjFreztqH
   xDkBzGDUB4VS2+8kxG1+L+9dZMx0RXrcoK4kf0SJnrFAM9MsxmFTY99Up
   6OO06VPBdG7yCCQ481rsWP92BK4jsz1tKuf8f44VeqQyYo1FJX4E+VLzb
   TAb3j9FvMI6Idr4wGcssrObouYX67ne0etYVeNp+q4jhJ7XcYO/LMGw8o
   1RqEq66R+unJIMK1N+dwlpm1SkUa4xodPHI9Wg3NrmsLP9Vvub4kW8Ypy
   YKBgD2xOvOGDgzo2O9uE4OINyXkWG628q+5g+jPq1y5IKosTdAMxUp3Ds
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="392498770"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="392498770"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 12:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="774872843"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="774872843"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Dec 2023 12:27:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEEmE-0000i2-2c;
	Fri, 15 Dec 2023 20:27:18 +0000
Date: Sat, 16 Dec 2023 04:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8203/8213] io.c:(.text+0x6): relocation truncated
 to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312160433.Oz8VJHH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: dbc55af6aede12ea3ce12815182ebde335da9522 [8203/8213] Merge branch 'slab/for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
config: csky-randconfig-r016-20220425 (https://download.01.org/0day-ci/archive/20231216/202312160433.Oz8VJHH3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160433.Oz8VJHH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160433.Oz8VJHH3-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/io.o: in function `netfs_read_from_cache':
>> io.c:(.text+0x6): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0x14): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0x42): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0x46): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0x6e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/netfs/io.o: in function `netfs_rreq_unmark_after_write':
   io.c:(.text+0x7c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0x80): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0xa0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0x138): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0x14c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   io.c:(.text+0x150): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
