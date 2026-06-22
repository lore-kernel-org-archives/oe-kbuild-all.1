Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139602F5485
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782156944; cv=none; b=MtU8JF4M49QfkAdQaU/Of1bF/YNIBz0kpfTfuZYn2eB54jQ9GVJnpr3TvmjUH199XX/1N8B6fAVBrBTekYPPPHRnLpUMrXU/VMcBKlGQ6rCH+sNlP9rjohsBFUss8q5enF4Vx8RmSjmKT2uT+pcrBNh69iqCGFPNpz2PC/ZwqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782156944; c=relaxed/simple;
	bh=JnG6IajjCq+Ozh1KIxeiyEmL0mTaDCorDb9ofc5mydI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HAlPeR0lE4ReF1bgve3eTi7eg6FDF193Xm6DKpMSal2Gfc8cGxqeb8AsNyLS5RsMF9qwudlecU2WRsL75hfSOW56fsYq9ezNEw+Bllo+yLbLf9PiCrM6gG30+2sX0azAySiaMRyVTJWHANyQdghfr4l2D5mOCQYIbiZfb6yshqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SG+2FS7S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SG+2FS7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782156938; x=1813692938;
  h=date:from:to:cc:subject:message-id;
  bh=JnG6IajjCq+Ozh1KIxeiyEmL0mTaDCorDb9ofc5mydI=;
  b=SG+2FS7SRE1LGl7F9COL4ZnlHr2Dt7RhDP2sjS79p3aNtaDvrEa0xNCo
   begjHYTbhCPiyjp04L4L9te+KlCmrMiolB/EcOXg/xOiryAD0a3hicTso
   L2vOB8kOKAvyPJcIiEBAJIu1sAGcptgWAIvm9R4YOZK+/70NKzyCRYYD0
   6HEKMw9H/fm4m7+Qwr+BgYrBq+pvtK9rtbuQtGua8JNpayPcacItvnP5M
   sPbxoJFl6pl2/YCEvUbayy9YANXH4QLy98C+UewyxKgDyNDVezvZZbvRQ
   sNO70RIe2FR2myxefDEnWPZprZVYEWSK+9l3hh09jju3+vtodWd0HrM6G
   w==;
X-CSE-ConnectionGUID: 6KNq+uJ0TCaAy6KiU9a6wA==
X-CSE-MsgGUID: 1iBwPnYISraMNsApFcNGkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108438905"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="108438905"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 12:35:37 -0700
X-CSE-ConnectionGUID: SoE3gl+YSDi+Q01j247uLQ==
X-CSE-MsgGUID: 9jMFX0YnRd+hbqdtUVnmXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249176507"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2026 12:35:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbkQX-000000001mV-1pjx;
	Mon, 22 Jun 2026 19:35:27 +0000
Date: Tue, 23 Jun 2026 03:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 76/86]
 drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c:114:39: warning: variable 'id'
 set but not used
Message-ID: <202606230304.aOfAAJ4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   e56dd62df7d34f2d009ad860978cdcd913d63722
commit: 515a33b47a64397b06262d948ec16dc100aa74b5 [76/86] hwmon: (t14s-fan-ctrl) add thermistor support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230304.aOfAAJ4c-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230304.aOfAAJ4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230304.aOfAAJ4c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c: In function 't14s_fan_do_read_thermistor':
>> drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c:114:39: warning: variable 'id' set but not used [-Wunused-but-set-variable]
     114 |         enum t14s_fan_ctrl_thermistor id;
         |                                       ^~


vim +/id +114 drivers/hwmon/lenovo-thinkpad-t14s-fan-ctrl.c

   110	
   111	static int
   112	t14s_fan_do_read_thermistor(struct t14s_fan_ctrl *t14s_fan_ctrl, u32 attr, int channel, long *val)
   113	{
 > 114		enum t14s_fan_ctrl_thermistor id;
   115		int ret;
   116	
   117		switch (channel) {
   118		case 1:
   119			id = THERMISTOR1;
   120			break;
   121		case 2:
   122			id = THERMISTOR2;
   123			break;
   124		case 3:
   125			id = THERMISTOR3;
   126			break;
   127		case 4:
   128			id = THERMISTOR4;
   129			break;
   130		case 5:
   131			id = THERMISTOR5;
   132			break;
   133		case 6:
   134			id = THERMISTOR6;
   135			break;
   136		case 7:
   137			id = THERMISTOR7;
   138			break;
   139		default:
   140			return -EINVAL;
   141		}
   142	
   143		switch (attr) {
   144		case hwmon_temp_input:
   145			ret = t14s_fan_ctrl_thermistor(t14s_fan_ctrl, channel + THERMISTOR1 - 1);
   146			if (ret < 0)
   147				return ret;
   148			*val = ret;
   149			return 0;
   150		default:
   151			return -EOPNOTSUPP;
   152		}
   153	}
   154	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
