Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641627;
	b=IDjErSrlJYa9ekm+ddzuGu2RQIt0KcJrh6HThSJI8CGg34Z4DpdluKOaxFy5DdXypIv1
	 lchBNmOYoSvXRD+tUWIgjFzTvaHVEET4WxlavbySeSXTRYV0jLkUUTR++7C8B/xOANACB
	 8XvzYWs6U44Pg+pt6C8uaTxY55GwoaIcKEO9A1/GPd1TR83UyT2BlP5H3xHz5uwyMPQ97
	 Q3TDbTwuxiUE9oMwyMgFrGKLzCkOZ3l0m3t5xceJ9RjgYP5Iq02PIAbqyOCZh1sm+/9Wf
	 BbvlF9RkeTisjQ3PhFc+ZubMle9DxGgiRBtoBIG/2BgPbA2EsyTABz6xWlf/QDPjFEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641627;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rr/UiXnemsSPjREqPdZeEpJ/5C0JuTQFG+3/KVcoJJs=;
	b=xrMZGCt9MbxgDyZO67Xa7B5QTUeEhZ3fUcl9F8RFHpy1FtS8OVkm8qdbKlv4dlTyDCMt
	 yZQcfbdYjjkRBdGnOzSdGi2ZneNV5+ETglTTKxj4m0QTidHRuDv+oCfveWVvovQZGyk56
	 xOPRGCQymsOLcJiGjelRgx+qgLXA80lwy8c/oHHMu7SBt74G5nPyizyz0Fh8F8bS0pGJ/
	 2MWl9m1kDLQuvx9fKSeUSVB5UUHcICjE9x80+abvrXeIuIB4z+wGFygDagQI2tj3bwXAt
	 4uoAl6l8hrxVQzyAu8t9JEpMXSnLIwbDbSk/0dK4kxdpb+GoMil9HmW4YQQG7s7asAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ht0XmZdD;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F56606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 21:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F56606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ht0XmZdD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795641627; x=1827177627;
  h=date:from:to:cc:subject:message-id;
  bh=Zjg8SechYErBW2f6u/V20AgyV5ql4Oy7OUYViQ6xzvY=;
  b=ht0XmZdDeE/d28tKpwOlxjX6t2T9La2c+KaiHMlGQJhjazb4uIkU7kPr
   7CRCYg2qIdCfq5BTcXYfVNXjnnUculyieib7ohWy542Sj1Txaslmi+IFO
   soHaq/t7pwHskH7hcDW0rY3+I4uPT7t5gTu9Fh+ZrTKSOQKn03776NTI6
   Sz23YFe9AtzxTnBrDmxTc92exX4ybO8q71HAo/9XZHYKFsID+N1ejdPJf
   VNOSTRm3t7kuFi41n2jmCotF7uTi7Dq1//c0hpSyF0jHbePVrpyGvSiiJ
   IFaEQLhQhqanhzqDrhTNpTX1XmR7a6GwIBYGR5qrGQk1tHePzmmZlGbaY
   A==;
X-CSE-ConnectionGUID: Gxj3EDbmRKW03X+cxMIiXw==
X-CSE-MsgGUID: gS9PlwceS/2pSlcNFSVa9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4550670"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4550670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:20:26 -0800
X-CSE-ConnectionGUID: P6gDeg44RD+rwpFELTseVA==
X-CSE-MsgGUID: v7X+V4zMSluRwj0aCi0MDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11843337"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2026 13:20:25 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWKPd-0000000006F-2FxK;
	Wed, 25 Nov 2026 21:20:21 +0000
Date: Wed, 25 Nov 2026 22:20:16 +0100
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:dynfont 2/7] Warning:
 drivers/tty/vt/consolemap.c:724 function parameter 'replace' not described in
 'con_set_unipair'
Message-ID: <20261125220642.kv8jCKxK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git dynfont
head:   055d85899ee42c6e0f7cdbc361ffb5326ef29d20
commit: fe6a772414fab14fea5654fd156be7a883183a0d [2/7] vt: consolemap: add con_set_unipair() and con_clear_unimap_locked()
config: sh-randconfig-2200-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125220642.kv8jCKxK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125220642.kv8jCKxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125220642.kv8jCKxK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tty/vt/consolemap.c:724 function parameter 'replace' not described in 'con_set_unipair'
>> Warning: drivers/tty/vt/consolemap.c:724 function parameter 'replace' not described in 'con_set_unipair'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
