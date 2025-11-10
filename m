Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774022D7DE7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 19:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762801290; cv=none; b=hbG1k9xK1sP5aU+zaQ2hyyCxzJ50Q9rLAAKOYKA1IgmEvBiNeyyc1P3nhKpVqGAgZuMZyeboIrQWnR/9ExGM0PxCMZ6NeM5qdO3VJy3uscx3rIrdkBGdCAnAIIH6TfqpiX8X32RnEToREsMx1pHeqhj0Sqf8WIQRi4vcTFuESjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762801290; c=relaxed/simple;
	bh=cUkh1YvkKBpwi91LoLJpLpU6K9KT3aH2H/tNBidcbFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBjTljXpz3uUMOCEze5t+SAjvdyIjjnF4VKh9lROdTY8Gg4yMjTypwM4NBQcisubmqDEkC9FVlsO4ZxarjQaYxH+Ob6Zt5PKnzE7+5skAPJfnF+om3D0zNqdz0EX4l9pmYBUkxHqt7WvON6npUDU05Ck6f/5eeLODgAh6IThNcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SO/0ZSeT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SO/0ZSeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762801289; x=1794337289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cUkh1YvkKBpwi91LoLJpLpU6K9KT3aH2H/tNBidcbFg=;
  b=SO/0ZSeTN2mAttsjbYeSIPZoVl0uBsgp4R/PkarBB2gacCXMzVnirQ+H
   OAoS1sLFtTTWk+ZaCWnWDnexeTLsGPe6TajKFFj40luHPu3tTuT5qAWpN
   RCh797dBZ0hYPmyWimmZTPaGEI6KJripNXURXy6Dr7Prwfjeyu6aQPJFu
   Xe7MwigGTKorZfUyRjjDkiF3x6cHdh+MQdAgwWCDq/7LUdDuFwye5Y4F3
   i58N6bU7Xr81J14lAC99ozyOiAiwKBDiqUdvRnEV6/mh022FV4VhpqRcW
   i4gGCiIshtDtuDnooD/Q0zbOZk3QZiFTjTRL+8Ae57BkjaBH/ogD2r77D
   Q==;
X-CSE-ConnectionGUID: p7dC2fh0Q66o7hlHzqMEYg==
X-CSE-MsgGUID: rQ5nqdLkQh6AB5izbLSR2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76205947"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="76205947"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 11:01:28 -0800
X-CSE-ConnectionGUID: sqgqVUvkSbWsxFcmLbKkFg==
X-CSE-MsgGUID: rP5e+Cz5R7a4HSyjPK9jdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188920026"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Nov 2025 11:01:27 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIX8m-0000tV-15;
	Mon, 10 Nov 2025 19:01:24 +0000
Date: Tue, 11 Nov 2025 03:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk 26/29]
 drivers/media/platform/dreamchip/rppx1/rppx1_db.c:151:1: warning: control
 reaches end of non-void function
Message-ID: <202511110222.J9azzHXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk
head:   14a3f460905b5d9be43ad2bab030625085a52423
commit: a056035a5cbfd41477e0cc50bab949fa8aa75abe [26/29] media: rppx1: Add support for Bayer Demosaicing
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251111/202511110222.J9azzHXB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110222.J9azzHXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110222.J9azzHXB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/dreamchip/rppx1/rppx1_db.c: In function 'rppx1_db_probe':
   drivers/media/platform/dreamchip/rppx1/rppx1_db.c:37:25: error: 'EINVAL' undeclared (first use in this function)
      37 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_db.c:37:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/dreamchip/rppx1/rppx1_db.c: In function 'rppx1_db_param_rkisp1':
   drivers/media/platform/dreamchip/rppx1/rppx1_db.c:150:17: error: 'EINVAL' undeclared (first use in this function)
     150 |         return -EINVAL;
         |                 ^~~~~~
>> drivers/media/platform/dreamchip/rppx1/rppx1_db.c:151:1: warning: control reaches end of non-void function [-Wreturn-type]
     151 | }
         | ^


vim +151 drivers/media/platform/dreamchip/rppx1/rppx1_db.c

   137	
   138	static int
   139	rppx1_db_param_rkisp1(struct rpp_module *mod,
   140			      const union rppx1_params_rkisp1_config *block,
   141			      rppx1_reg_write write, void *priv)
   142	{
   143		switch (block->header.type) {
   144		case RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT:
   145			return rppx1_db_param_rkisp1_flt(mod, block, write, priv);
   146		case RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM:
   147			return rppx1_db_param_rkisp1_bdm(mod, block, write, priv);
   148		}
   149	
   150		return -EINVAL;
 > 151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
