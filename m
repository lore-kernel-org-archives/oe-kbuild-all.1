Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2BB38F91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwC8w3qT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272619; x=1732808619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63xF9uOg8OVtnAgYBg5OwqCiqI0g2+7pktQhnVsh81A=;
  b=TwC8w3qTW0QykOR4D6ymMAM1aqS9s+ZNRQ19Yu8tSeyd1SAmmFuEaeYa
   bxQnVnQ1F8/bHkluF2Z/MlM+T6hcfYKkpd8qEev1D82NlcdUhZKVWOst+
   KUTCsMDXMus5AYGXqvAgOtMH6PLIKJVfOjQg5bztSqy1JSXt1bXZleNSw
   VLXuUF3fiqWeFaEQAMsvK2BNiHKGKO/QsNNOtgkt1rodulJFkMJBR+m0x
   zeb+whGQAFSN0NUbKmnEgXUJFBQt5AySg3lz41unDolB337jhhT21r/C6
   XPddtIFLKCY7RHPAXVIPztlA2NJvNjgLkf1jWm9LyY0QksCh3F4m5QOfN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="83284"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="83284"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839470240"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="839470240"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2023 07:43:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Mit-0000Os-0U;
	Wed, 29 Nov 2023 15:43:35 +0000
Date: Wed, 29 Nov 2023 23:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: drivers/leds/leds-turris-omnia.c:438:15: sparse: sparse: cast to
 restricted __le16
Message-ID: <202311292308.oZ97PtBs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: 43e9082fbccc7df8b2028c1ba040c58cefda703f leds: turris-omnia: Add support for enabling/disabling HW gamma correction
date:   4 weeks ago
config: powerpc-randconfig-c042-20230517 (https://download.01.org/0day-ci/archive/20231129/202311292308.oZ97PtBs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311292308.oZ97PtBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292308.oZ97PtBs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/leds/leds-turris-omnia.c:438:15: sparse: sparse: cast to restricted __le16
   drivers/leds/leds-turris-omnia.c:446:16: sparse: sparse: cast to restricted __le16

vim +438 drivers/leds/leds-turris-omnia.c

   426	
   427	static int omnia_mcu_get_features(const struct i2c_client *client)
   428	{
   429		u16 reply;
   430		int err;
   431	
   432		err = omnia_cmd_read_raw(client->adapter, OMNIA_MCU_I2C_ADDR,
   433					 CMD_GET_STATUS_WORD, &reply, sizeof(reply));
   434		if (err < 0)
   435			return err;
   436	
   437		/* Check whether MCU firmware supports the CMD_GET_FEAUTRES command */
 > 438		if (!(le16_to_cpu(reply) & STS_FEATURES_SUPPORTED))
   439			return 0;
   440	
   441		err = omnia_cmd_read_raw(client->adapter, OMNIA_MCU_I2C_ADDR,
   442					 CMD_GET_FEATURES, &reply, sizeof(reply));
   443		if (err < 0)
   444			return err;
   445	
   446		return le16_to_cpu(reply);
   447	}
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
