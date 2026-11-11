Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436147;
	b=uQK2yyLnUtoZWDJbCbec/9GhAYXKLvbT0xH27eUhGZm3o+6MqdoN4ArUkDMYI3cIH2MU
	 slgBQw8Pa9hyGlKwtQuv+kI6lyOARethZ5kcAnBC7MJiqqjWbkXpFmo8rpHj9bgUwT9gw
	 z9lk31iTb6uk3yhuqOTpmidGxnGdSLA+Crasd0R8rg94tf4t00idfogWy2RlI4IoMLqSA
	 cGG2TWHHNQn27fsWfz3s4GMILHnAspcdhrr8ivwT+6224dDfAdWxuQG6w4rurEVpKGT2y
	 Ww5VVS10RxJ9Wpd1QNCMfmNVbLx8xXwYL1gZShMh7MA9+zcAFwHBExqFB5pkjWseuWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436147;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TLdDgn3Ai45acahclfwfNqPz9JKyT0rWmH7UZ1AVFzk=;
	b=BvxoVuEvUz8d5igkDx3M18Mbk7tkOwJw7rzxu5tx0HHC6iaEs6PPS9zCd5whOBoKAnr4
	 Mci8i/OdeEj66d/1jypJvTrjft6QTE6qhPeMWvVGlk8BLT1OFhCeSIIu+TfGetrWO5EF4
	 Uh2Z0DKaDAO7nrsOuVhoWQICrjCemZfky/lkQlJ9Ot5EqshLwjJDQsSMApFsLhenu3QoU
	 bBBuWT6CwfwisJM5oIWkWTscHToQCW3LBlcJLThayN0IExD4WQmY18/27oyfgvlUuE8Cl
	 r3ix7t15IOlNgqskQ7GciVAneAJy+VpNS61DPFBhUpeVqc52sVdzKG3Yo4ExEG1fdog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buzv6cBM;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3914C606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 22:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3914C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buzv6cBM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794436147; x=1825972147;
  h=date:from:to:cc:subject:message-id;
  bh=amiJKz52KCnjrB+8uAplDrc3Oq4ZCh70VqB5vRYKSaA=;
  b=buzv6cBMQrSNR4iAC7+QyagmniW3fRkY3WL6HA8uulJDcpf44TheuBWC
   rHx6HVRrgOxDED/z5kegJZ1XH87JqXYuFcYYPkAnVOWMtzWtG7ADXNbUU
   kj/DC4NL+/CFmo+CFgS7G50luWI+ANwKbJa4MLzCLSpA1jdZX2Fu3U4zg
   CLz4akybvrzva56xGv3Cqi5MMjXc47cOXtPNrg7vWzBR66vBraB9WUArM
   9ZdHRRvf2W8IY1IWqXtkYmhYUjj02y4/kb8Id+Jj5x8YdNPv6vlmywpux
   4LjC4Gq0IAzuilEwP5+JY4NZJlvqG5Iy7kMSNz8lJDQqLUKbMyxQ9x5/4
   Q==;
X-CSE-ConnectionGUID: t+O8Bk2tTvOH1B1ph/8iwQ==
X-CSE-MsgGUID: VeGq0YjTSM6oW/4qLGe9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3119657"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3119657"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 14:29:04 -0800
X-CSE-ConnectionGUID: L3eAEFK8RkOrG4WPaIJrLA==
X-CSE-MsgGUID: UoSOLWoSRiePw4SOP+CCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="10288454"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 11 Nov 2026 14:29:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRGoP-000000000fB-1Xh0;
	Wed, 11 Nov 2026 22:29:01 +0000
Date: Wed, 11 Nov 2026 23:28:41 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations-backup/frame-slots 25/34]
 drivers/base/power/wakeup.c:1206:18: sparse: sparse: symbol
 'bpf_wakeup_sources_read_unlock_dtor' was not declared. Should it be static?
Message-ID: <202611112305.EophAj9S-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations-backup/frame-slots
head:   57f1029f852dc5be270836c5ca820f32cdb62637
commit: c61e4e0ead5c7d7fdf695d60288fa454e7e286a1 [25/34] bpf: Register cleanup destructors for the remaining referenced types
config: x86_64-randconfig-2302-20261111 (https://download.01.org/0day-ci/archive/20261111/202611112305.EophAj9S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611112305.EophAj9S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611112305.EophAj9S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/power/wakeup.c:1206:18: sparse: sparse: symbol 'bpf_wakeup_sources_read_unlock_dtor' was not declared. Should it be static?

vim +/bpf_wakeup_sources_read_unlock_dtor +1206 drivers/base/power/wakeup.c

  1205	
> 1206	__bpf_kfunc void bpf_wakeup_sources_read_unlock_dtor(void *lock)
  1207	{
  1208		bpf_wakeup_sources_read_unlock(lock);
  1209	}
  1210	CFI_NOSEAL(bpf_wakeup_sources_read_unlock_dtor);
  1211	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
