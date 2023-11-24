Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6EC249E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8+PQSCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836808; x=1732372808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qf1Ga6UCQclYSk7ExvQ67io5fOVhsv+pw+N3v3gooRg=;
  b=Y8+PQSChhuTIO6kaCzxms5kWjg7iUZr9WxR2lM6ufSSy04QXet5sROTq
   Uv3/t01Yj58J5UoUEQCE99PzNVM03kY4zCrfWRYNyUzgTZMC6XIgJ6y+v
   n5ptk543U2pcx+U1DKqUgMH9DRIP9gwlccgIQ7/nmXrdcVHP0KnLx0E+7
   P23fdt8YcVTZYGj+m+svQYK/sHK2wlkINBDWnTbCni7lQbLvhElJMfpsl
   GXVpEFdwLzKdM4Bjw2tf7M2igK6EEdCKn7bJ2BIzrU2wBsTEGdDmMWMXt
   JTP075Ca0DTpqQicPO6C2cy1wYLd+c580El+28GsD6HvRUv3luQoZRfl5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="11110355"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="11110355"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911464601"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911464601"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 06:40:06 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6XLg-0002tU-0G;
	Fri, 24 Nov 2023 14:40:04 +0000
Date: Fri, 24 Nov 2023 22:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.6 36/58] nios2-linux-ld: aspeed-sbc.c:undefined
 reference to `arch_debugfs_dir'
Message-ID: <202311241503.UPspLwQL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.6
head:   9fd3fe525544779d6bc28fa948759535ff7232db
commit: 0297e91bee7edaedec63f71dde4a4f2e2d003a63 [36/58] ARM: soc: aspeed: Add secure boot controller support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20231124/202311241503.UPspLwQL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241503.UPspLwQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241503.UPspLwQL-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/soc/aspeed/aspeed-sbc.o: in function `aspeed_sbc_init':
   aspeed-sbc.c:(.init.text+0xdc): undefined reference to `arch_debugfs_dir'
>> nios2-linux-ld: aspeed-sbc.c:(.init.text+0xe0): undefined reference to `arch_debugfs_dir'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
