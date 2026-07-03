Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38513CAE84
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079474; cv=none; b=qVmcBgSsQtqrzSF1ZkUfiw6U38K9x0uXAjXYBm76cO8+zE7sw5tlJOPIWRCvMDEKkScR9NkOfTuf2rrN8OYQBpZWl61M+ziABCIVrXNs3Xu4L7cIrcBnjqT1nD4QvMkuWyJhs1/zv8xiZaXchXRpjpONO1cInKJqecqjTjnCUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079474; c=relaxed/simple;
	bh=ZW6M918N/wltVfycRu+mdGBmNGpxrXP2HmqtxzbarQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rqdoDidP5at5vPuaQB28SASU3TTULezuekMq3sZaCzI9YkzRdxGiFBqleqYklVKotRyZ6DSpobE5+LeyXMOD+/d1OpiyVUguKSqZAtBoz3sBYiQxYDEmA7I7agNLj/trYiHU8+NnZysZSOnXCVUFzMkre+XwGyuFgKnL2BEXCu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqT3Trk/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqT3Trk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783079472; x=1814615472;
  h=date:from:to:cc:subject:message-id;
  bh=ZW6M918N/wltVfycRu+mdGBmNGpxrXP2HmqtxzbarQs=;
  b=MqT3Trk/f3W7+rJnrXcfygw7UE+Tc3XxaB8jGgL64gc2ksDrBgXzpOgj
   pgbjqxxpVsNvxyOKx4in8Nc0dhMAdi4T/BCwakGRWkFiXPACWk+HPpftw
   tW5lIHfDslKS1QIZ0Jjs/A9Dv4ePq4ERcarVEzCiDVeJGZTRrh+/1ePl2
   h5RzO/1wi4mHSVthH1hoGcJQQuTZ7zQsfO0vRsZZT9jjaZs21X8lb/ezD
   ZSpe2bQ0xtx5mmd5yUKSWjZpXpDrAptTD+jyBp4WsKe/3R6VK0FJPgL8J
   70GnuGmf1zsEr//cU2J0Z7QufNanyTm3g5kNXp+UOaCtpbSGuev8bJIVt
   w==;
X-CSE-ConnectionGUID: f1QJdIwBRy+AtbIy/AYmtQ==
X-CSE-MsgGUID: HndSVUreQtq2qOFP+HZiMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95210085"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95210085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 04:51:12 -0700
X-CSE-ConnectionGUID: V3CiooM+StGB+CEIcdRAKw==
X-CSE-MsgGUID: iLsreynXQfa3WvR6ZUwH3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277426011"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2026 04:51:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfcQG-00000000C4t-03OT;
	Fri, 03 Jul 2026 11:51:08 +0000
Date: Fri, 03 Jul 2026 19:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 0/167]
 drivers/net/bareudp.c:288:12: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202607031901.7dWzEObt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   866eb49750d39fe938dca71acece6f1540bb1123
commit: bc773b15eb19ae3e27dd3a3377f2fe006ce5f382 [0/167] bareudp: Store struct sock in struct bareudp_dev.
config: i386-randconfig-062-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031901.7dWzEObt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031901.7dWzEObt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bc773b15eb19 ("bareudp: Store struct sock in struct bareudp_dev.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031901.7dWzEObt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/bareudp.c:288:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sock *sk @@     got struct sock [noderef] __rcu *sk @@
   drivers/net/bareudp.c:288:12: sparse:     expected struct sock *sk
   drivers/net/bareudp.c:288:12: sparse:     got struct sock [noderef] __rcu *sk
   drivers/net/bareudp.c:623:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] port @@     got unsigned short @@
   drivers/net/bareudp.c:623:20: sparse:     expected restricted __be16 [usertype] port
   drivers/net/bareudp.c:623:20: sparse:     got unsigned short
   drivers/net/bareudp.c:624:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] ethertype @@     got unsigned short @@
   drivers/net/bareudp.c:624:25: sparse:     expected restricted __be16 [usertype] ethertype
   drivers/net/bareudp.c:624:25: sparse:     got unsigned short

vim +288 drivers/net/bareudp.c

   283	
   284	static void bareudp_sock_release(struct bareudp_dev *bareudp)
   285	{
   286		struct sock *sk;
   287	
 > 288		sk = bareudp->sk;
   289		rcu_assign_pointer(bareudp->sk, NULL);
   290		synchronize_net();
   291		udp_tunnel_sock_release(sk);
   292	}
   293	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
