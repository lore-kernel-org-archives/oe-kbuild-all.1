Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B959727FD71
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766532415; cv=none; b=E6aFd6OjtgwfEOMQUXGE3FT8uNuGBAjQTI1r9D+TLKadZi9HF40h0queD2OLSqSflLKH3p0x2Hu5bfjwTEVN0TdarCKT0BsRWSxe88uejhHPAhZIKc6zGy4jk1rEyCThh8HO7QVzsU8drSHUlHMSw5eF7+yRPBAg+2kOEJf0xmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766532415; c=relaxed/simple;
	bh=XBeFFiaUEj9mbs3mz21tdIWHy5J5Tx3RpcU2nH+E398=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rcZ8dXKE8GcySinJUm8/EYc7e2cJhsiYTINRypCZG2xsT+XaP1iIddTIDSAA/kIWERK9Vb0Fdl5jGGYBB4s21UUhD63hLGna2NjXs3VP0O6H7Rj/JGPcHmcl0pV86C0DQTcsk3ORgZ1+yEbdgnWRTXxrdxvpRlfa4S15Bg9Ot9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vbwv8MYD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vbwv8MYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766532414; x=1798068414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XBeFFiaUEj9mbs3mz21tdIWHy5J5Tx3RpcU2nH+E398=;
  b=Vbwv8MYDDDtdpWOX8kbVYfs3nPowLuio6NqKbEWfUJiHMEmsyjBT2A/T
   QIIQ7aUYgDWL/FvHpLuGVMFMBh/Her+SKaJdrMzHumFjZ5QdWdHlHLIHD
   o0/dSl2zV50fDHXXuH3L+ndqbhe2NKrqFrRnEvQVo2oBMsIlZ6uzRhvk/
   GXcy+jtosRQhN6y8BANtWEaOKbgv28b4TO/DSkvV8WdJKgvSEguIsS+hk
   WHd2O3gcC+zIpHmdbFJ+vYWTFgiXzzP3nbIs33B57wf00l2aU1Jt1U+Dv
   vYA1day+e+/pwz5OLlphqhpLSgwi0xXy8WZcnkjSirXK2xfyUs9uYQU7D
   A==;
X-CSE-ConnectionGUID: 9y1Vqjr7Tq2kGUjwRppFqA==
X-CSE-MsgGUID: 66XzA2EnSGeivHoRcS5g6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="67574696"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="67574696"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:26:53 -0800
X-CSE-ConnectionGUID: Txvl/prmS/iZMFzGRcuavQ==
X-CSE-MsgGUID: gKNZk5BBTSOdnbLj+xbpKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199865648"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Dec 2025 15:26:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYBmD-000000002Tj-1dU5;
	Tue, 23 Dec 2025 23:26:49 +0000
Date: Wed, 24 Dec 2025 07:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig"?= <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-soundwire:next 4/7]
 sound/soc/codecs/sdw-mockup.c:267:19: error: initialization of 'void
 (*)(struct sdw_slave *)' from incompatible pointer type 'int (*)(struct
 sdw_slave *)'
Message-ID: <202512240724.TNfvVd4w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git next
head:   c6f1e99ab03c5a94ed6389f5930e91f274b3ba67
commit: 478f3890709a092a97a0218f61af19ac9b725573 [4/7] soundwire: Make remove function return no value
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20251224/202512240724.TNfvVd4w-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240724.TNfvVd4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240724.TNfvVd4w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/sdw-mockup.c:267:19: error: initialization of 'void (*)(struct sdw_slave *)' from incompatible pointer type 'int (*)(struct sdw_slave *)' [-Wincompatible-pointer-types]
     267 |         .remove = sdw_mockup_sdw_remove,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/sdw-mockup.c:267:19: note: (near initialization for 'sdw_mockup_sdw_driver.remove')
   sound/soc/codecs/sdw-mockup.c:240:12: note: 'sdw_mockup_sdw_remove' declared here
     240 | static int sdw_mockup_sdw_remove(struct sdw_slave *slave)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +267 sound/soc/codecs/sdw-mockup.c

81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  261  
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  262  static struct sdw_driver sdw_mockup_sdw_driver = {
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  263  	.driver = {
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  264  		.name = "sdw-mockup",
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  265  	},
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  266  	.probe = sdw_mockup_sdw_probe,
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14 @267  	.remove = sdw_mockup_sdw_remove,
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  268  	.ops = &sdw_mockup_slave_ops,
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  269  	.id_table = sdw_mockup_id,
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  270  };
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  271  module_sdw_driver(sdw_mockup_sdw_driver);
81d3d3d0bf09e6 Pierre-Louis Bossart 2021-07-14  272  

:::::: The code at line 267 was first introduced by commit
:::::: 81d3d3d0bf09e606dbc1e3daad1c7cef3976fca2 ASoC: codecs: add SoundWire mockup device support

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
