Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56936A34E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 23:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543599; cv=none; b=ry2vpo2KnEKq/J3Ow4XOe4W29qfn90i+ro0LPmM3itJE6XKPqhEVhq1RcelWtnMnJVg0odcQOepKpBQO1RLWFHgV2UOp/3d+3lswSDJHKTWkwTJcODP4xmdBLln7pdgTW1OuRXak0yNJGTkO49sotSrhGn/L3wgQPXfvzz71rFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543599; c=relaxed/simple;
	bh=i4obKOwWnHeUaS+A2XHWjjY42vqcIO0ko+avRygn9VM=;
	h=Date:From:Cc:Subject:Message-ID; b=bA4tEe9JCl+0Ckj4RBWX75k5EzKHhq8MIvBLOSvcLlqW7vII13OH66dXpDb3Zkj/mfSM+69nO2quzY/mL8nmsNK2tGkjivUdkHpzoj+T6mVE6EbiD1Oeo977ds404BeFY5G/Z2NOFvaGVS2VXdjvNvtchP+0uDf0NNzs7P9lywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVI68yf3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVI68yf3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778543599; x=1810079599;
  h=date:from:cc:subject:message-id;
  bh=i4obKOwWnHeUaS+A2XHWjjY42vqcIO0ko+avRygn9VM=;
  b=mVI68yf32yFxj91WqO+G63r6YCYK8lIaDVusS6VCkKHXJo9aTvTU3VWU
   gcOdEk8AS8eP2brqNn8CwioAZiOi/9qw2/NyM6Y/GxgM2gxiw3BxZk1S0
   APotzgU08Xf6hu4XL0HqfXguyPiYFlxTRqiom4WYvUVWlsW+w8X1zQlIK
   eMgLYN0tuzDB644Esuq1gfnxiOUhR8fXNSKMtnf2pHgYz03+SagQT2Q1A
   HzzBQk+LMPYK1Mz6UXLvDjTRcF6vMrM+KcGRnA3/nYMMC6ks2M8YwP26T
   rpwEDASqZp66AUtF21puEhhjspXiOH+kHaJysIr2eKHv8gwiaL5nj9E3i
   w==;
X-CSE-ConnectionGUID: FUecZh18R6ePYSicgW1ILQ==
X-CSE-MsgGUID: ov9XCD0dQXm7c9MFHjNHuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79163222"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79163222"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 16:53:18 -0700
X-CSE-ConnectionGUID: isxuYqxCQaiXdVKJSAiSCQ==
X-CSE-MsgGUID: lBU0Y2D7R0CWL432DrY0jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236762753"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 May 2026 16:53:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMaR0-0000000085h-0TTZ;
	Mon, 11 May 2026 23:53:14 +0000
Date: Tue, 12 May 2026 01:52:39 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 1/1] netlink_dumper.c:60:36: warning:
 format '%d' expects argument of type 'int', but argument 3 has type 'unsigned
 int'
Message-ID: <202605120100.6KHAc8uz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Saeed,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   722b023c516c8bfbfe652bb6d118f38eda6a2cf2
commit: 03189c50b96902c65b0a7f1bd39a3b720c0755ae [1/1] tools/bpf: Query XDP metadata BTF ID
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260512/202605120100.6KHAc8uz-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120100.6KHAc8uz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120100.6KHAc8uz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from netlink_dumper.c:12:
   netlink_dumper.c: In function 'do_xdp_dump_one':
>> netlink_dumper.c:60:36: warning: format '%d' expects argument of type 'int', but argument 3 has type 'unsigned int' [-Wformat=]
      60 |         NET_DUMP_UINT("md_btf_id", " md_btf_id(%d)", md_btf_id);
         |                                    ^~~~~~~~~~~~~~~~  ~~~~~~~~~
         |                                                      |
         |                                                      unsigned int
   netlink_dumper.h:76:33: note: in definition of macro 'NET_DUMP_UINT'
      76 |                 fprintf(stdout, fmt_str, val);          \
         |                                 ^~~~~~~
   netlink_dumper.c:60:49: note: format string is defined here
      60 |         NET_DUMP_UINT("md_btf_id", " md_btf_id(%d)", md_btf_id);
         |                                                ~^
         |                                                 |
         |                                                 int
         |                                                %d

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
