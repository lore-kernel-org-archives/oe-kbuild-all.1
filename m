Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803576;
	b=Y5CH04NB9jRzt5jdGdB49vu/M7bhy/evJLTRVb0QgSLMz+cKpEqWBZNMB2kekeMjc3ud
	 2Km4FHTTgCJxbiVxQUKSzyPI8P+9r3Di4sQpa0k/NKp7PnTHLIv8i418b1BZUIYvTF/gF
	 tQOIYq/6b1NqumPDgQc+oSx9QgWBDmYbtE9qwawhuroQd4+Efg5+smumpiA7LH+7SLVfs
	 nWgHQVMFqH1r2dJXSjLw2ijO7YW7UYSIpoBMbeVRKU0KKRim8kV7OEM9C0cqcvwRc/Aar
	 grBykfZo4N+uEHzjF9n/3wMcEzjlmTJ5Mr6bbQu61V5w4rImc90UvR26VyIr100p3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803576;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QYliG5JrqqllTHxErrxFqWbYyN3g1Gh8xTc8edp61B8=;
	b=xy4Rmnonjc1fFJwUlUBI9MM1pvNXc4nmJoeT1SVrmsP6jeU5e6OwtKukpiY0kwU7gjjM
	 BlXBiptxuAZyz8DwUJIqrbTAWsIKDsW5UsWnXUYks7Kf9rvA/peGPDmD/vTnZo2YIMiZW
	 Y+qB/8hEdjM6Hy2+cLwpXOgPyPtmMakylqy4YJnLBtsvfDwc2VLHbo4MMIoPKmb056Ps8
	 HXLSDi0PffGFM5FufqPI7Y92QTdVymKPONoCs3FLMJAiB53ieV9jExZda+CDLa5iSEO7k
	 HMuRTbEwKFpnzOI+lteuiqekL8Q/r4yHLYMY7Ny0kan93DIRp5lKRKwIQyr+uAMmcsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nbx9a8yG;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A2606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 00:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nbx9a8yG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792803575; x=1824339575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U3gmOgWDxR60gD64nCE0iSuuzCf3ICRp5+uOCWLX4u8=;
  b=Nbx9a8yGzTUwUxblVAtL7FAWohBl9ACh/T7l0ZQ7PvJrAjc0iZdHThf4
   jmtAB5+4I5Z3+i6GP4g5p4EYONFj/sjDRsUN2Yx91R4Jl84M1s0QHh33m
   alTETVeSjyAO5bSEqtfEafwg0w9zZIFMopDMkMNIPXqhoV/qrNdsb2b8R
   wQtrl/5pAfQ4PdZnA+brNwDYhtpvYfgY9LVTHhgEFpB674gXkv/iFnzQR
   lyc52oU04m83vtOXRLStjrRsGslvf/4bgH0d36sOGMuhNpixbmdJmg9/s
   yVrvz+Al6MkBy7tqXVQiWzNuksf8rBaM5wMPC2PVeYmmz9KFn9qqS+0s6
   w==;
X-CSE-ConnectionGUID: tYIvtbVeR6y8XGx9n4rXnQ==
X-CSE-MsgGUID: tfc+5kMLTUSZp8qV5bpxrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1468449"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1468449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:59:34 -0700
X-CSE-ConnectionGUID: qXl+4vPMRdWX13HfD+/dPg==
X-CSE-MsgGUID: F1fBYjApSMC90pk5pmk4IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3841319"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2026 17:59:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKQ6a-00000000TRO-1Jg2;
	Sat, 24 Oct 2026 00:59:28 +0000
Date: Sat, 24 Oct 2026 08:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: vmukunda <vmukunda@marvell.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Sunil Goutham <sgoutham@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	vmukunda <vmukunda@marvell.com>
Subject: Re: [PATCH net] octeontx2-af: Fix npc_delete_flow counter read for
 cn20k
Message-ID: <202610240855.NijJJoJD-lkp@intel.com>
References: <20261023100112.3402726-1-vmukunda@marvell.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023100112.3402726-1-vmukunda@marvell.com>

Hi vmukunda,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/vmukunda/octeontx2-af-Fix-npc_delete_flow-counter-read-for-cn20k/20261023-100112
base:   net/main
patch link:    https://lore.kernel.org/r/20261023100112.3402726-1-vmukunda%40marvell.com
patch subject: [PATCH net] octeontx2-af: Fix npc_delete_flow counter read for cn20k
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261024/202610240855.NijJJoJD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240855.NijJJoJD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240855.NijJJoJD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/af/rvu.h:13,
                    from drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:11:
   drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c: In function 'rvu_mbox_handler_npc_delete_flow':
   drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:1962:58: error: 'rvu_pdev' undeclared (first use in this function)
    1962 |                                 if (blkaddr && !is_cn20k(rvu_pdev))
         |                                                          ^~~~~~~~
   include/linux/soc/marvell/silicons.h:22:41: note: in definition of macro 'is_cn20k'
      22 | #define is_cn20k(pdev)          ((void)(pdev), 0)
         |                                         ^~~~
   drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:1962:58: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/soc/marvell/silicons.h:22:41: note: in definition of macro 'is_cn20k'
      22 | #define is_cn20k(pdev)          ((void)(pdev), 0)
         |                                         ^~~~
>> include/linux/soc/marvell/silicons.h:22:46: warning: left-hand operand of comma expression has no effect [-Wunused-value]
      22 | #define is_cn20k(pdev)          ((void)(pdev), 0)
         |                                              ^
   drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:1962:49: note: in expansion of macro 'is_cn20k'
    1962 |                                 if (blkaddr && !is_cn20k(rvu_pdev))
         |                                                 ^~~~~~~~


vim +22 include/linux/soc/marvell/silicons.h

25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  12  
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  13  #define CN20K_CHIPID	0x20
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  14  /*
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  15   * Silicon check for CN20K family
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  16   */
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  17  static inline bool is_cn20k(struct pci_dev *pdev)
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  18  {
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  19  	return (pdev->subsystem_device & 0xFF) == CN20K_CHIPID;
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  20  }
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  21  #else
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11 @22  #define is_cn20k(pdev)		((void)(pdev), 0)
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  23  #endif
25d51ebf0f54f9 Subbaraya Sundeep 2025-06-11  24  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
