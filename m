Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C971C6B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d113kDVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701264026; x=1732800026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AygwCNhfICqIYxsuyLTiBq+Nk30jRiKfYQh3MQANlA0=;
  b=d113kDVhuUQLIFqQOBn4Whz9xridjts20Zk/f9m1icrEeKkmQ9Dasp3m
   rGtkGpFscbrGKmtR5UcVS770DnDNEPxfMrpWey4Op6jkJCnqrggGubOWK
   /+ewZY+Iya4iGJTXJsyjUN60B/jXMMqieCkY6n1CCN+3Kgz3YcLofnBi8
   7dVuIW3cxYUEFl2uAmc5jJx9FyukSieLPjXc8citaBIGeWK6vG7EGDuws
   dviTQn9EOzKFwWjvjaykqAxkeSy+aZiASiwJ31LLWjtAcAfOw53ODHd4h
   6aKtFktijFBlqvPSVA/DZqgNmyMaLZBtYXnCMx2gfoz/ttDnnp8tuoUqs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="459659926"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="459659926"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:20:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100525268"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="1100525268"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2023 05:20:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8KUI-0000Gy-1V;
	Wed, 29 Nov 2023 13:20:22 +0000
Date: Wed, 29 Nov 2023 21:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: drivers/leds/leds-turris-omnia.c:438:15: sparse: sparse: cast to
 restricted __le16
Message-ID: <202311292054.KbZXkYBb-lkp@intel.com>
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
config: csky-randconfig-r022-20230824 (https://download.01.org/0day-ci/archive/20231129/202311292054.KbZXkYBb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311292054.KbZXkYBb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292054.KbZXkYBb-lkp@intel.com/

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
