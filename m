Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497234;
	b=P9Qugm1JGb6LjBZJTpfsPcIyfqwGJRlBaFg0R4GIWOXrvCcO2vnWo5NHvEqCOYpZHN8X
	 dvlQZl9q6+bnQghSp3qesTwWWF34PWH2M3OXUHObUhgeXZ+VPhZR7wctoZbcJZfC9HKmc
	 SqVj8zfOyImSlLuq33aW3M107fLWz4DZ/jFJ+/iT/JdvSGYGDztZKtPE6LRx2/qT3c5QL
	 VlJmNyzAg77Yy5NZVv+KX0BtCOT9q1CF+dtf+yqI3nUihZHqsXZ9LaOa+6GD9DRP0nwFc
	 8AqUfxx8v38bX+4ZuJTmSvnvJEYvLOPRSz99yLBfSA2NzYhXZmM1mvxMgbptrqhcopg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497234;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3gxmmwLJzoPIAvkBVAuWF5/VJLSOLmbTR3OLisG7gik=;
	b=3Vgpujkg3dtyYls8WVvi/deFyJSRKK7nihMqCJZYM60zijK2okSm91O6j1x3i46ulcTw
	 MEk7T+6xSJW2tye1kCT3N9KOyX1Ogd0DPRhtai20HfRQFtiY0HdmV5l3/bXiFzgFa7NY4
	 XdiZ69XHglvPO5udztx0XKs/EFNd3imW1+5eksy6m7lwKduXnGYf2JmdegnrMCgjObb+e
	 2j9FVaiLAXFmUZzJJspmHZG94AWKPSqo3bvf/NsOfjrS0um5zVT9NIDAHPQUnfCKbJxy+
	 HltEFroN4Rozf1WvLAd8wWjTtmg+A226sqxMwRM7baH4CSS00LHBBfMXjBylvtNNrcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WL04f+N4;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E26606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 11:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E26606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WL04f+N4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792497234; x=1824033234;
  h=date:from:to:cc:subject:message-id;
  bh=iEkffHjCdNkPeIn03HLrh0b91ZD9Ju0zyUsXLP5dNMY=;
  b=WL04f+N49MJ17AKNpOC/xM5cnIyWsnvfRVvD+HpBGN9SwUWVFH2plvds
   BXKAc2xDyqP2paiacgL4/cO1u80Y0o/yGJZw2hPdzurFCRDss2UekB6RO
   d+hAIxaH130DLZhAiTK5ITV1y9s9wvYlPfDHhxNCh8HJK1Bf6LodvAUz/
   kX12Z8oz58M1WR3GztVlIzrXxuJwPo6gW91Q9MwpOLBHGdz/tjq1PkpKI
   pOhdMcVu4Bn6fGBcX8IBJVyTc9kJ0SCIfE25RJ4HCPiqknl+RRv1KucV+
   Ua/YN0zeZ4QkeMh03yp7aaSYcFyXE9In3QN9tyzd01nNmyT7pa8NiiEiG
   g==;
X-CSE-ConnectionGUID: 4peq7WQATNiEP8DsqOB4Ig==
X-CSE-MsgGUID: BfheP5LBQ7OTPK+LiKnZkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1091174"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1091174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:53:54 -0700
X-CSE-ConnectionGUID: aNfEt3igQyCwPWyPE18ZkQ==
X-CSE-MsgGUID: +GHAMR/wTkeumLUKywY0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2782640"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2026 04:53:52 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ8Pd-00000000NRS-38NQ;
	Tue, 20 Oct 2026 11:53:49 +0000
Date: Tue, 20 Oct 2026 19:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 52/52]
 drivers/media/i2c/max9x/serdes.c:2693:12: warning: 'max9x_suspend' defined
 but not used
Message-ID: <202610201916.riCyaki1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Dongcheng,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   773b2eb76d5ee325c7d60f2c161b9b12f32d13fa
commit: baa76709460c288499d118e2daa55ca3df5a6436 [52/52] media: i2c: add gmsl & isx031 support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261020/202610201916.riCyaki1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201916.riCyaki1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201916.riCyaki1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/max9x/serdes.c:2693:12: warning: 'max9x_suspend' defined but not used [-Wunused-function]
    2693 | static int max9x_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/media/i2c/max9x/serdes.c:2685:12: warning: 'max9x_resume' defined but not used [-Wunused-function]
    2685 | static int max9x_resume(struct device *dev)
         |            ^~~~~~~~~~~~
   drivers/media/i2c/max9x/serdes.c: In function 'parse_serdes_pdata':
   drivers/media/i2c/max9x/serdes.c:295:47: warning: '%s' directive output may be truncated writing up to 4 bytes into a region of size between 0 and 19 [-Wformat-truncation=]
     295 |         snprintf(dev_name, I2C_NAME_SIZE, "%s %s", sensor_name, suffix);
         |                                               ^~
   In function 'parse_sensor_pdata',
       inlined from 'parse_serdes_pdata' at drivers/media/i2c/max9x/serdes.c:370:3:
   drivers/media/i2c/max9x/serdes.c:295:9: note: 'snprintf' output between 2 and 25 bytes into a destination of size 20
     295 |         snprintf(dev_name, I2C_NAME_SIZE, "%s %s", sensor_name, suffix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/max9x_suspend +2693 drivers/media/i2c/max9x/serdes.c

2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2684  
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08 @2685  static int max9x_resume(struct device *dev)
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2686  {
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2687  	struct i2c_client *client = to_i2c_client(dev);
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2688  	struct max9x_common *common = max9x_client_to_common(client);
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2689  
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2690  	return max9x_common_resume(common);
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2691  }
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2692  
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08 @2693  static int max9x_suspend(struct device *dev)
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2694  {
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2695  	struct i2c_client *client = to_i2c_client(dev);
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2696  	struct max9x_common *common = max9x_client_to_common(client);
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2697  
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2698  	return max9x_common_suspend(common);
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2699  }
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  2700  

:::::: The code at line 2693 was first introduced by commit
:::::: 2445b17eae1d5356936a0a598940dfaad469c29d Add serdes drivers

:::::: TO: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>
:::::: CC: sys_oak <sys_oak@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
