Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480363603EF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788602317; cv=none; b=FNXnwtQMm4DaA/am0N2KUn9dio2XWXXr4H0A4wLC7CNfb/LHgSuxB7OeR4EXUSM7vn8liV1qwnQibatDx+zRj9d86JrwtEZJMNwtJqnkhm5xKPzJhR52rfqA5//q8cQ+rutI69jfiaiDKd/gK0oiWGg68S4tTnnJHVMPU/881mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788602317; c=relaxed/simple;
	bh=p1IwPYiYp6ll4S4I8AMOr+a5Ug4Pf47xTIsMiC6BBFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bq1RqsewhAcAUTwdldzFQgoQz3TKd3bCBCU1nkdc4pFSbUwx0VPjT7R4uqg7WAPaCtuZzyiXht6KklMPum3JbF1bZd+absb+UbWzj1XhVZ8r1Gi8oDXpP54ohG8lMit6CL/4DZfTDjzH5Ja6fHahu49fW9yhntkM9IuDyTG8xXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0n4TbXP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0n4TbXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788602314; x=1820138314;
  h=date:from:to:cc:subject:message-id;
  bh=p1IwPYiYp6ll4S4I8AMOr+a5Ug4Pf47xTIsMiC6BBFM=;
  b=C0n4TbXPQeHdjSVga8F7SppcxiKaNI5CCAi3JTC5f+n7Wj6ipiiut7Pe
   v29IMYNKopsJ244GSKm7YDmbFuR7BTA7wEmionNDQv/XT/xhhfMle7X7B
   l4KPoXIUnBmAch58hGiAfrJr0XSo13HnK58eIoBbU3SzqUeGjFkTwgmmx
   /FHH2u0g+co/EmmecCmSGon8NRvE/gxo27D1Lrb4krq/7yT+HsMDa1ZKR
   Swa+bitur0gNMLjSmA253EBToU+FkdMSsu04hdoalMqQ9GDZM438oW0xT
   QRNnow6zjgjAdtMsoD4/PBe9dhqbBV4IwjPN1KaR14b+rdsn7Ll1LQdIq
   w==;
X-CSE-ConnectionGUID: 8xT0xVtaSfeQHgaz6Lk6nw==
X-CSE-MsgGUID: IwXDEEP6QR6TVNllZBE+dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="114632052"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="114632052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 02:58:33 -0700
X-CSE-ConnectionGUID: KqktPjVOTUuY+UrvSKffOA==
X-CSE-MsgGUID: PNp+y7UMQ1O6tm2HIDLYaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="270804392"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Sep 2026 02:58:32 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2nAL-000000000N9-1hGS;
	Sat, 05 Sep 2026 09:58:29 +0000
Date: Sat, 05 Sep 2026 17:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Yang <mmyangfl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 3282/4370]
 drivers/net/dsa/motorcomm/chip.c:4229:22: warning: unused variable 'priv'
Message-ID: <202609051727.O4ApRZZK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
commit: 9af9a816821365e57736307bfdfcf06d89065556 [3282/4370] net: dsa: motorcomm: Add LED support
config: mips-randconfig-r061-20260905 (https://download.01.org/0day-ci/archive/20260905/202609051727.O4ApRZZK-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051727.O4ApRZZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051727.O4ApRZZK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/dsa/motorcomm/chip.c: In function 'yt921x_dsa_teardown':
>> drivers/net/dsa/motorcomm/chip.c:4229:22: warning: unused variable 'priv' [-Wunused-variable]
     struct yt921x_priv *priv = to_yt921x_priv(ds);
                         ^~~~


vim +/priv +4229 drivers/net/dsa/motorcomm/chip.c

  4226	
  4227	static void yt921x_dsa_teardown(struct dsa_switch *ds)
  4228	{
> 4229		struct yt921x_priv *priv = to_yt921x_priv(ds);
  4230	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
