Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B1E3B29C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 23:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FP3mi3Zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700523663; x=1732059663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daMPJww/fi98pBcQzTmoc2bVxnZmnm0x+lwyJMphapU=;
  b=FP3mi3Zx840s0piQSiMpnZ5WSzXh1YMU5kILv4B2gSYiq/lUPAO8ms8v
   tE5qAdfw3VMZWFt17htUD42iHwfyxLTe7d0Pkb6ASACX085oyPAkQNe3e
   vW40MPpdhrOLG5cZsB4FGho17V2waiRrByJJEXnnQt/OUTawrSJp6zDAk
   6+aPLBFPMlmphPs11gs9PvB22ljgbTmQniJ0ITm6Ph2f++tKv946cdXzJ
   pq1epyKvyk1zoOuH9XUBeti+/X35kuOKsQkUWOWoa4tIay6FT4hvvxbTw
   lXKUhbW+wW+GHqjjqBchVyKrvFMBx5049+BdSXFmT3Hzkm5EWH0JfDlyL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371067949"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="371067949"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 15:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="910280034"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="910280034"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2023 15:41:00 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Dsv-00074L-31;
	Mon, 20 Nov 2023 23:40:57 +0000
Date: Tue, 21 Nov 2023 07:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:fraction_bits 1/1] v4l2-ctrls-core.c:undefined
 reference to `__divdi3'
Message-ID: <202311210718.iWh1VQc9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git fraction_bits
head:   d25f61730ea9fb92d79ae3fcd562b33553dd9133
commit: d25f61730ea9fb92d79ae3fcd562b33553dd9133 [1/1] media: v4l2-ctrls: add support for fraction_bits
config: i386-buildonly-randconfig-001-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210718.iWh1VQc9-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210718.iWh1VQc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210718.iWh1VQc9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/v4l2-core/v4l2-ctrls-core.o: in function `v4l2_ctrl_log_fp':
>> v4l2-ctrls-core.c:(.text+0x996): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
