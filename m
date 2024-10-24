Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45B14A0AA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729775698; cv=none; b=Cxp7F4YgwK2aqAYPoK2OE7s/PDTOFVFowRu62Gtn96xS6MuiyZ87W2HzxC5yuRoQAycheFepzumQ7/tdAFMGedZUsJohQU1JB/X09Lkvppi8bPUoq16xmbgLdDXZSxuVESXqCE3uVhX/ELut0h0Pk3yXu4iF29Rq3e9Qpap2SNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729775698; c=relaxed/simple;
	bh=yBZxuhtvtoN4Gpai5Rl9XV7yJTicWyNcHZm7Lk94yBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUY/lpdrp63zKBUc6MvrhRi4Wlyppc+4aduCrzwG8QwtU9xB0EQeuc8+md2Jq0aqkxcGbXPNuhePOB116C1JvrPv4bvPIKzjAKFc5bllWkcYGvb2bB2hYStgyfUbx8NP3XXW7aLU9zhWyMp0m78wOIpwbB9fC8W/VM/SiHHFuw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxpM45KK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxpM45KK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729775696; x=1761311696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yBZxuhtvtoN4Gpai5Rl9XV7yJTicWyNcHZm7Lk94yBQ=;
  b=SxpM45KKFkGFWl/z6vdqFaBg0XItSSYLRlSQjBAZgeM2vyS3RsbtAKzq
   f12WmmoW+kwvM+0cCzJUPwh1ziofIR6+gNG9urMm9t6wkNeLQmw9FgRKv
   kLaTYzWtcKO0wP6rsntAMdUv72k/xF18GsEZmqgVKirTdvZFgY17qJjxO
   l6ECCurQhKei8jF7TDQvr1OEFOUombFztlXZlLYzusP7vhnHTeagSSg7L
   bD/C2N/RX/tynpSTZB1gqIKS+jg+VV+Ehyh4dNoJp1Zvz7trdCfgQl7Ym
   i8RsMLu2rqKAT7f3qQ5E9UMzCsWXaHnhD8dgiMCEUmI6MWzcCSkf/JMWW
   g==;
X-CSE-ConnectionGUID: Caeq0xHDT/aMe8gOS+4psg==
X-CSE-MsgGUID: oDbVidcGQBGI17lfg+o/kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39944430"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39944430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 06:14:56 -0700
X-CSE-ConnectionGUID: e9l6M7ORT42WYe6lHhufOA==
X-CSE-MsgGUID: G1Xx+qBlTZOv+7V3GSB83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85146320"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 06:14:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3xfw-000WRs-1X;
	Thu, 24 Oct 2024 13:14:52 +0000
Date: Thu, 24 Oct 2024 21:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 6523/6766] lsm_audit.c:undefined reference to
 `init_net'
Message-ID: <202410242132.k5ZsxBPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
commit: 6d2eccb70d100b9f5405714a469d39fd9195af21 [6523/6766] lsm: Add audit_log_lsm_data() helper
config: i386-buildonly-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242132.k5ZsxBPq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242132.k5ZsxBPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242132.k5ZsxBPq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: security/lsm_audit.o: in function `audit_log_lsm_data':
>> lsm_audit.c:(.text+0x141): undefined reference to `init_net'
>> ld: lsm_audit.c:(.text+0x146): undefined reference to `dev_get_by_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
