Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480432253A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753698373; cv=none; b=B8gUlVPB4mFRljmfUv4c7f6ZuNvPb7CMMtYK4k3GaX5DF8aFeth3K2rpOJl0MhkyqRlugGO6Vv2fDHTrI/5yBTXM6ilt4gokqC1crVGeO9cG5I7rPEmT/kaQEAQbnRPZTqD7UHkPvSPyD7dw2wq4dUX2skqM44vzTf9DpmG58ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753698373; c=relaxed/simple;
	bh=P3YMmkB0HX3PmjT5lX9CLHqAg3nvDnaLG0q58k3+Yqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aSLpBrQ+g5VCPlMP305ynCX60sIou/QWZNc5KUc3d8hpE3YM2c540Yomx683674C7/ZEzZJMhSOJAgV532s6S2dP/CtLmV4aWaf+tbwzZO0whOta56D8B4msGjtH7ZC7DFDoO65WCjHMbHOVdwp1OAXRnMFFmn70Ni3A/bGrH0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha2/sNHC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha2/sNHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753698372; x=1785234372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3YMmkB0HX3PmjT5lX9CLHqAg3nvDnaLG0q58k3+Yqk=;
  b=ha2/sNHCueqKbsn12PvVJTmgUGs1UpeqvOIqaEMNpOGy6HQ4NmktduQ2
   YCsBi/v+l84OZsnVHGqJaoFYHXN2wuqk6utD1dL2h89GkGL/ECEzbOVSv
   tfxzOTsASlyi3z0LOydAkf/ysk2Dxe6aWl85ABsJGEGPWSU/iXKvlLp2a
   Lc+JqE6DL2vRzW2P/+wVpcPW55Twcqzgk9eww/tHVRQ456Cet420xuewN
   pTn2GUajekPfZ1ywM3e0exAIOXzcIH4zdhGefKgGScsYa9KaRYvRnD+T6
   ycJK5Q7moVEcD5s8IqOIAMXLQkAuw4qyfdMqLh+VzpqU0eP53cMDZG2cb
   Q==;
X-CSE-ConnectionGUID: g7uhAu5nQDKm4KG/HYymFg==
X-CSE-MsgGUID: UYQ4x8wKTCOP6W0PhxZpvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66212395"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66212395"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 03:26:11 -0700
X-CSE-ConnectionGUID: mov0MQnlQFqdb2O989hM0Q==
X-CSE-MsgGUID: Pkjq+y/7Si+hVQeUfLdp3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="167712385"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jul 2025 03:26:10 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugL3Y-0000WB-2Y;
	Mon, 28 Jul 2025 10:26:08 +0000
Date: Mon, 28 Jul 2025 12:25:12 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] mm/vmscan.c:186:38: error: macro
 "get_total_swap_pages" passed 1 arguments, but takes just 0
Message-ID: <202507281259.5sJwZuMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 5291f45f705b03858f36c68bbdfdbdf7857e651b [92/92] bytedance: mm: add /proc knob for proactive swappiness
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250728/202507281259.5sJwZuMx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507281259.5sJwZuMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507281259.5sJwZuMx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:186:38: error: macro "get_total_swap_pages" passed 1 arguments, but takes just 0
     186 | inline long get_total_swap_pages(void)
         |                                      ^
   In file included from mm/vmscan.c:20:
   include/linux/swap.h:565: note: macro "get_total_swap_pages" defined here
     565 | #define get_total_swap_pages()   0L
         | 
>> mm/vmscan.c:187:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     187 | {
         | ^
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:761:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     761 |  int err;
         |      ^~~


vim +/get_total_swap_pages +186 mm/vmscan.c

   185	
 > 186	inline long get_total_swap_pages(void)
 > 187	{
   188		return proactive_swappiness_enabled ? 0 : total_swap_pages;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
