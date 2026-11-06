Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006791;
	b=F7338d7r+A6l9PYF8jkuqLVqp+ImDZfrq+5dJYNH2oYx6E0BzZtmBrAgVFsDVV2HcAiS
	 LCkduLEmiNNeF2hwAr97cdqkWTcNTAEwsKJbomybH+LXE8r3IUwBE19PGeZL/45I9XzIZ
	 EWMIPemJr3iY239Ue6hV4LpcAf5B8pelS0+mFpXycqtD6FY9vGXEhOWNEWLpCvKrpTugK
	 SJcaRNTuNBHs+gw38cSUSJjiw0G1Mt7EwdvYd6AQVyEvyX7ZHEMa9YNQ9wrgp+wgcEuqZ
	 qfaFGAf9DUwes/UtavJX5532g8k6+/hYB6WlGfjl7RAp7cz/6iMuc0TKM/lQYRR+V6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006791;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=hPWKcpA8gbc6K+qpk4qE0+1VJLR5wZ99w4qWO8xJTy0=;
	b=UHmO9T1o/1uVNqypK6xvfjQC3AuuZviaUQirRykRjV7aOZCBEkwulgX6PnGFL96oJz1O
	 +cHyJPkjtc+pgWYTJhG4YkIgtKtvg8fgkY0mSVmBV6xwpINyeOL7bCXKBSoAymd1GzyAG
	 /3gpXL7D9MatmU2D/oqjzT8rMmIbV7MOhPVg5+fAaejxLyhwhiINXuoXX/XQF2F8KZSq0
	 9atoV+sACVDeUA01FtTorHv7z+5Ni+FRCkWR+Egq9WU6kUxcdoT9DFWCgH40il84+5qNs
	 894OPiUYnyj+9zfH2JZvjA3R5ygztSGG7EpchC5IYep5fsDDeeZ6ZZTB0Gp0dThkdAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PYdJWZRp;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D03606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 23:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D03606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PYdJWZRp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794006787; x=1825542787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvBbdnT9G2yc1/b3L8ujEA7BGXcYFu+3P0AbMue/Nzs=;
  b=PYdJWZRpZjpMUGnoE4F051Vc8dDTalb8dPfbJ3S6inoN+AhZzLVg9MbD
   8kMTvD6u4yy5OVJHJ1ICnfCx7jreJQiD+vxhOxecWlIXqlc65FXnHx537
   zgs3lzWa+VB16jJGKIPQp1ymDwzkbOP1ASaDDmYNSBs5vU8CQS3UfdwwB
   xJCjL0EAM/mhkQjYRKx0mSUWjZ7b25VjiXuoSF2GPifkoVu4chsduPs+y
   6u85ToIfQORYJ7zWKsBJRWb+4IXTIwDMk2shkRVnlWPzYPdSWD4/eAzHN
   4y/V6yMp+d+WDGKB5+Jwda6ftB5rQGc5+Hwb7IHhCYpRp9UiXK76o0b+r
   w==;
X-CSE-ConnectionGUID: frQO9fB7SrWJKFIQuexlyQ==
X-CSE-MsgGUID: 1k4HovPUTgimYrt/1mfkgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2706200"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2706200"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 15:13:04 -0800
X-CSE-ConnectionGUID: h+2wbBgxTt6Vc+d+Gwt+gA==
X-CSE-MsgGUID: ExUNlSkzSBG3AmjgmDAW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7735845"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2026 15:13:00 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPT7B-00000000APL-2uLr;
	Fri, 06 Nov 2026 23:12:57 +0000
Date: Sat, 07 Nov 2026 00:12:36 +0100
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>
Subject: base.c:undefined reference to `wmi_evaluate_method'
Message-ID: <202611070038.qzOOv1De-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d48723711bae9b8cdc56719c448ba42fef28cbee
commit: 884d53763d304af64a9b795161f9fc3b83a5e3d8 platform/wmi: Remove dependency on CONFIG_X86
date:   4 weeks ago
config: riscv-randconfig-r2108-20261106 (https://download.01.org/0day-ci/archive/20261107/202611070038.qzOOv1De-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070038.qzOOv1De-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 884d53763d30 ("platform/wmi: Remove dependency on CONFIG_X86")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070038.qzOOv1De-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `wmi_wmmx_mxmi':
>> base.c:(.text+0x6e): undefined reference to `wmi_evaluate_method'
>> riscv64-linux-ld: base.c:(.text+0x1de): undefined reference to `wmi_has_guid'
   riscv64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `mxm_shadow_wmi':
   base.c:(.text+0x230): undefined reference to `wmi_evaluate_method'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
