Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B212E5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaTYUmD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698668513; x=1730204513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AIxYKjfYMQDoHG7BdQKYuYyA19w72M5Vxmei2/AcHIs=;
  b=AaTYUmD+4LId9FHVktoO2oX7CznKuOpBUSDuySKoEki1Q3Lnv9BVt/HD
   9QjGhy3faonQcUkiVoIS+ZSPpiV2tS2OOm4U78+DJTHP9J5UbSQ0EWhaV
   dHK8/xHlCGvj31fdrqExKo3x8d2jIfZJ3dsnB3qN4J5ELlQLTj3lnrVVB
   uLlflQm2Gpz2zSAUg5Ayae1RROvb6po3EOt5Mby/a8L6e36MImbTMG8hx
   +b9l9V6+ZKP8bO2XPI9IP0uJhltGNwj70L0ksNdWfS1ZhUYVKXLoXr14K
   NAq2S3f3DJkI7CbTAEm6FUDqkPNGnk5p6vJCNOGc1gI+7lqkw77ulurxT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="386953151"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="386953151"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 05:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="883842404"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="883842404"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Oct 2023 05:21:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxRHA-000DFf-2Q;
	Mon, 30 Oct 2023 12:21:48 +0000
Date: Mon, 30 Oct 2023 20:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: undefined reference to `.L874'
Message-ID: <202310302008.l48xgOrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arseniy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
commit: 079c8d9da26ed041a54706de68b754337e6df17e mtd: rawnand: export 'nand_exit_status_op()'
date:   4 months ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231030/202310302008.l48xgOrQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310302008.l48xgOrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310302008.l48xgOrQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/mtd/nand/raw/nand_base.o: in function `nand_do_write_ops':
>> (.text+0x4a24): undefined reference to `.L874'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
