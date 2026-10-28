Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164164;
	b=wjB872s9RCyEex/AF4rVauOk+EZjH3wct8jQsl/kmiwOUtMJsIaiLt6dqwvVtdCqKTbj
	 2iGT2Z7E1giD229DTuRhkcq/QUQqaypW6XjN7TbSUFUpAEtIgvdgW8zj/Ovbpg+I/vaQr
	 jmyFgYlL1RdUjJ5mKflNbaNJLd0+hiCtTbLb67YGdpjAeB4cTkDvALAcoR+yM/O1QQm/4
	 +2DZr0AtxTX/85lIjgjcyQtig1whI7SmtZ1io0I6BhhXqcNizxYWu9huhgxRyWGPnXsSh
	 DazEOWE5UeCroGEaA/+CazwbFG2CdRZlK6v6W5GtRTFP0s5MbnBm1Z3zr4SOlBE7P7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164164;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8+Er5MFvgogJoLk3V5fKsejMadg7wbq1YhiiQ4w5N64=;
	b=xXvF+cd7gTTlkgeLFYjyl0yZq6XsbYYjLH3kCDraAQviYWmLIOydl8ghHSoE8dFb+T6I
	 r/MREosaTZRkZpUX61On791dc7CuNlLqNQXNG01Ec0gSP+XNxbw9V4llLP8AMrvciGuMI
	 yC8tP+BFpBId4vkFvB3I0vkeOtc02OoVk3a5bJA67/He3LQ61aSi/YgBO5DcbLzB3WGVR
	 a0xu2VFNIbWpZ41IEHyICMSg5uRvYLnedqNb4YUULOvpOpmWKPnwP/S6KexGPxeB5O4h1
	 A5aiW6CWYf6jD4erwoBg3i7MhA74JrHbzsJQKPJF38PnRrDZeaS6YV3odSMZneU0mEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XO+RLxZ1;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F410F606A31D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 05:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F410F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XO+RLxZ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793164162; x=1824700162;
  h=date:from:to:cc:subject:message-id;
  bh=PNJVBSpAqm4Wp2Qevfnpn8HsJxC8pT0eU7p82W/7TD8=;
  b=XO+RLxZ1UCJ/Guh63oh2s5X4QHxxt+xsg2oCWUB/dmyBTJ4EdpP3JYo9
   Rsma4MBkOhyjBe994JEljs4kjjoCvHpTrADb0QryWAvFqk2/EyKrPj6AV
   senrKnakOqz5OvZZweBj9W346adzq7yI0Y8MroefkwrF12Q9X0Oj56Wfh
   4oR/QGtBUzUWSxAMEP0t6h3TGQWQY+n/HFXHRi6wuPfB8DtlGHZRladaA
   Noc0owPzN3RvydzU2G5wEk7q2cCNqlIV27CEs0/c7jVLgdHiaP5fFVaZJ
   TUXpMVi8mFc/GDR5tOz5z+dm7HHsH1oRn24kJDyANlQxrTCaSzPtAM9ey
   Q==;
X-CSE-ConnectionGUID: FOYOjmkZRJCubk562+73kg==
X-CSE-MsgGUID: 8F0YQrPSSPSzCA9tRRNThg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1981893"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1981893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:09:22 -0700
X-CSE-ConnectionGUID: PECunXO6TsefRnwO9+Bksg==
X-CSE-MsgGUID: tTppMrdFQsS/ET3PTPGDsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5093016"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2026 22:09:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLvuY-000000004lT-22lm;
	Wed, 28 Oct 2026 05:09:18 +0000
Date: Wed, 28 Oct 2026 06:08:53 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 0/1]
 drivers/md/md-llbitmap.c:381:3-4: Unneeded semicolon
Message-ID: <202610280635.PHpkilv4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   2cb883efa988e481f8a853178ec792f6fe49969e
commit: 5ab829f1971dc99f2aac10846c378e67fc875abc [0/1] md/md-llbitmap: introduce new lockless bitmap
config: i386-randconfig-2102-20261028 (https://download.01.org/0day-ci/archive/20261028/202610280635.PHpkilv4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5ab829f1971d ("md/md-llbitmap: introduce new lockless bitmap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280635.PHpkilv4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/md-llbitmap.c:381:3-4: Unneeded semicolon

vim +381 drivers/md/md-llbitmap.c

   363	
   364	/* set all the bits in the subpage as dirty */
   365	static void llbitmap_infect_dirty_bits(struct llbitmap *llbitmap,
   366					       struct llbitmap_page_ctl *pctl,
   367					       unsigned int block)
   368	{
   369		bool level_456 = raid_is_456(llbitmap->mddev);
   370		unsigned int io_size = llbitmap->io_size;
   371		int pos;
   372	
   373		for (pos = block * io_size; pos < (block + 1) * io_size; pos++) {
   374			switch (pctl->state[pos]) {
   375			case BitUnwritten:
   376				pctl->state[pos] = level_456 ? BitNeedSync : BitDirty;
   377				break;
   378			case BitClean:
   379				pctl->state[pos] = BitDirty;
   380				break;
 > 381			};
   382		}
   383	}
   384	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
