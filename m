Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760410;
	b=i237Iui5xFVjcXYzXtfJtEc/cQtLsic/I2tFXwPU62fKXHWGWasZ2SVpk2DNmyuV97zL
	 oyYcnMMxOvHTjvuN4VYE9Xos9IUFQyuZsk8m9QUvYyFhTw0LaT7PWJoyjrbc5sUqBNLCd
	 tcgzKkQphRYtZu5/UIDVZwjhnB0qrkC17mApUUEFNebU/6WZz+8SbvVqqqgNIxzbA9OZ3
	 ONC8fpOrhO3LyxegGeJrmKJhf0fnGhrZ7IwwIZAgM+aPPKlk1LKJgpHom9G/JcgQ2Fkry
	 qTYBzt58PCkGsmYrq4Ru+Rdi1vygEXR3h7n4CTdSDo+RbSWtwxyyrI8cwHm6t90U6bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760410;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=p2Nrgu6IH4PU7wr6jnYH03MOh7B08Su9SKDkV60ULiY=;
	b=1rXUHN1L6jtS6+fCO7Vr4dwBltc9DPQACAdkcB+tObBti3w7sgLH6iwQ4ElRvQAMDQVm
	 ia14pYKcFF0lblH5afBczWRZPY3SV2nB6NIUhOWz3MjhSGizh93vHjskq4xziGtjydyul
	 1/AeOBJrMPKvHUTpa3mZ4fHl3RhHuafQVFRlcwoFSIOHQ0YDjUA7OHi1vFIRXGVUcQvo2
	 z4kQd2kHLcQevJjlb8K5p3VbPR66ZRLQt5XBqkpbFkhm5DZv4q3S/YFErBw6Em9irOo+z
	 HadKTk/DyRqt8PQpM0U5uCF/athpUo2Wh6lJVJGkIm6CZA2BvRE2rE2FL1fR2DLQQlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ebzWpFFw;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B11606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 06:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ebzWpFFw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795760410; x=1827296410;
  h=date:from:to:cc:subject:message-id;
  bh=bVQ1MaMso6qxhvbolVtp1a0qHa9gIzDV59045V0xubI=;
  b=ebzWpFFwKTdcsU5aLBBy5Bd2k4lDwxUf2nSJpEAC5LlOY9qMUWGJzn9v
   nRHaqF9MbYucQeuNWuErh+CBshwWxKVFOWdGRbsJuAJXtYrpPPaC8YmQj
   csNOPdKfRv1gv46xPVew7GIl7juFdXWLY/is8X3vE3Ij6usrVlnA8G/I7
   morQcDBHGW72ayVALBGLSlwfl+/F468GTTWmC2QFHMIx4SfyVqpdsDsL1
   hrdjopV5z1b8lUmvXPc3Q3AP7W5nzOOntHlF0m6/+zmYSPD4bQA3VOJzb
   jxaUrrM4QsZ7SdMcxm3TAk7P5OZkeEzYTzTPy8r9jYuX0+WFV8/ZDmqap
   g==;
X-CSE-ConnectionGUID: VuKpHtcXQKC1YrhTMYmoBA==
X-CSE-MsgGUID: eeJBfRTqRCaiGC+JldE0JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4522301"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4522301"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 22:20:10 -0800
X-CSE-ConnectionGUID: ZQZBDa48QDCR70qSP92Fkw==
X-CSE-MsgGUID: JA6KtdJuT466XFzEI8qU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="14097603"
Received: from igk-lkp-server01.igk.intel.com (HELO cbd2aa73d023) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 26 Nov 2026 22:20:02 -0800
Received: from kbuild by cbd2aa73d023 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWpJG-0000000002R-41w6;
	Fri, 27 Nov 2026 06:19:50 +0000
Date: Fri, 27 Nov 2026 07:18:53 +0100
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/n1d/enablement 11/11]
 drivers/clk/renesas/r9a06g032-clocks.c:1338 r9a06g032_reset_set() warn:
 inconsistent indenting
Message-ID: <20261127055317.7uMk5YFT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement
head:   6ffd02f2e68f76bced1f3ccf135ffadbc62b57a0
commit: 6ffd02f2e68f76bced1f3ccf135ffadbc62b57a0 [11/11] DEBUG reset calls
config: m68k-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127055317.7uMk5YFT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127055317.7uMk5YFT-lkp@intel.com/

smatch warnings:
drivers/clk/renesas/r9a06g032-clocks.c:1338 r9a06g032_reset_set() warn: inconsistent indenting

vim +1338 drivers/clk/renesas/r9a06g032-clocks.c

  1322	
  1323	static int r9a06g032_reset_set(struct reset_controller_dev *rcdev,
  1324					bool set, unsigned long id)
  1325	{
  1326		struct r9a06g032_priv *priv = priv_from_rcdev(rcdev);
  1327		unsigned long flags;
  1328	
  1329		spin_lock_irqsave(&priv->lock, flags);
  1330		clk_rdesc_set(priv, r9a06g032_resets[id], set);
  1331		spin_unlock_irqrestore(&priv->lock, flags);
  1332	
  1333		/*
  1334		 * Figure 7.3 and 7.4 in the RZN1 Introduction Manual recommends
  1335		 * a 5us delay for reset to propegate after assert or deassert
  1336		 */
  1337		udelay(5);
> 1338	printk(KERN_INFO "****** wsa: %lu %u\n", id, set);
  1339	
  1340		return 0;
  1341	}
  1342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
