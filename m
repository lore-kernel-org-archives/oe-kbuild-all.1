Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC491FA2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 00:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707696680; cv=none; b=GURNcA2tgBRT2J9w0ofghU5/SCHWCCUqIsQ0/PE0FH06M9cGEpH9pNvUz+B8p8hqSUePpym+YcfKVWs/G2/WkIOxIQed3VbC6SLny5LkVPsJxnyiYHxLEsm0VFjCuLR71m/DmV35gTLs1AM1qyNFSKxCAqocbKdMs94i3i8Kwz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707696680; c=relaxed/simple;
	bh=8/E6IPkEmCs69wqBcErJqRZ7CA7lOnurJf6Nc+e+/9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h809YXyFvNqp6SwGAUz6seh1oE1CVqnxj2h6KXqwWwMH/sDrZcDpjxuT5eHNEUYSoOAOnqMmPEAQeQtfXn2TuvpTmMl9hlcY+UvbQ/FtCD0McLdngYG1UOe7pxWxfxhshZ1In46A/4dd8AgkJRiVwtnFASORI16JeFtdtM7aosc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJ0e0XP8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJ0e0XP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707696678; x=1739232678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8/E6IPkEmCs69wqBcErJqRZ7CA7lOnurJf6Nc+e+/9M=;
  b=cJ0e0XP8Ic0i96WLlgO4AbNfdi6vcBt3FfdGFOiq6qzXVilc3NffiX9s
   BWLsfoYskocU1XFYW/UfUhkK8SiI1wfJvc6Wcz7jNIWG2J4Znep9chisG
   5sItnpVemPIQqlm1BR7gkBc9dhplcRklrdeSYBisuIbmiu9a0E9YrMdyb
   QJhaeEmZMY1vklhAkfBZJ7MIp6JnWEsaxy7UGkLhAiTvFKzuk2efpD901
   2OXYo+1h6U4/BaOw7neIE00VtSJWNwnfV2yzK2Pavbnvqx+5yMR3antQO
   6Viroq7Slhhz4yEBy5CjijBZEronuL7B5oWLb6NkB9O6RpVJ8tL/OgltS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1540014"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="1540014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 16:11:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="2462789"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2024 16:11:16 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZJuj-0006pw-2Z;
	Mon, 12 Feb 2024 00:11:13 +0000
Date: Mon, 12 Feb 2024 08:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 69/107] drivers/media/i2c/imx390.c:864:34:
 warning: unused variable 'imx390_dt_id'
Message-ID: <202402120809.Mw9Lz2nR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   3dace366de06c5b1927ed082fbeac0b4bee29cbc
commit: 13b5770e2922ba2468a542463b6019a91bf9b29b [69/107] media: i2c: add Sony IMX390 driver
config: i386-randconfig-052-20240212 (https://download.01.org/0day-ci/archive/20240212/202402120809.Mw9Lz2nR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402120809.Mw9Lz2nR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402120809.Mw9Lz2nR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx390.c:864:34: warning: unused variable 'imx390_dt_id' [-Wunused-const-variable]
     864 | static const struct of_device_id imx390_dt_id[] = {
         |                                  ^~~~~~~~~~~~
   1 warning generated.


vim +/imx390_dt_id +864 drivers/media/i2c/imx390.c

   863	
 > 864	static const struct of_device_id imx390_dt_id[] = {
   865		{ .compatible = "sony,imx390" },
   866		{ /* sentinel */ }
   867	};
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
