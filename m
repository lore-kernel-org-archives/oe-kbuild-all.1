Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2C396B6A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446386; cv=none; b=UlaDgYba/DvYZfe6vcQmOhvOm+paHA7Z5ofjGUo1GDSarNEqIsXZ95ObeZP8SU67/d8oTTo6NNgtMQZ/Lo1onleQmWGnGQEd1LPib9iLmvS5kANjHOQt3voYkXwSpRmDU36sXUwYbiyG6zNL1iodbqiV8gIlJZKPb6gwBaDFDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446386; c=relaxed/simple;
	bh=E4yofgBC4IKIPSxfw42oUbmtWie6+upsID46pBUeKIs=;
	h=Date:From:Cc:Subject:Message-ID; b=CbvQE5IYC7DGBbSuHv54W64Xzc/tZ3mLHPra4zjjpnbAcJ99Uo99yefxlCaGAk7MIlCpepSHfxhEZrMLVBjMR2ylyhe7ZWd87PLC/Pz/faXikP6njf5NVqAPUBRAOp3WrRUT5+uRYI9dH4T/6//5giZUKHSIa7IMDsGpx/vNoy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFdU7JCq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFdU7JCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772446384; x=1803982384;
  h=date:from:cc:subject:message-id;
  bh=E4yofgBC4IKIPSxfw42oUbmtWie6+upsID46pBUeKIs=;
  b=eFdU7JCqQN5qGoMDrf7yO42rbDcIrkYKmohVbNsoePr+8zujFKizdStI
   SskIOmt7i2UMQGiMNipzM6h7NC5YsNa9f0rMwStsXDOY713OV/2JT55qe
   unYJM8CqWhp6NZ1z6iNyddKaT2j13E+643rx7H0gLUXKZiTy9r8y2G1eg
   KpVxLHtg/u2N6zpVF6a/AVPFORe6912arq0mLcFB/8fmHGZROuve/Sisr
   xH0+LRXaDgFyhpYqa23FotmgAmcw6REU5OI8aCGLuq9QTIBWqvRx6rYe/
   sFxtyXRa/flOfxZQaXgtB79LrWQNvTs1Lp+QAjjG77s+c15wOyL/Dxn1H
   g==;
X-CSE-ConnectionGUID: j/WXzJjqSsiDfWRohtQcPg==
X-CSE-MsgGUID: iMPJbXceS56JOo7g49DmWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="72651680"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="72651680"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:13:04 -0800
X-CSE-ConnectionGUID: GsWG/eYvTO+V9Mdvj5BMeg==
X-CSE-MsgGUID: JUWTyF93TwGZsVxdg2PCjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="215614843"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 02:13:03 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx0Gq-000000001AT-2nUM;
	Mon, 02 Mar 2026 10:13:00 +0000
Date: Mon, 02 Mar 2026 11:12:03 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 1/1] netlink_dumper.c:60:36: warning:
 format '%d' expects argument of type 'int', but argument 3 has type 'unsigned
 int'
Message-ID: <202603021139.BooAz09b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   c7c481f14ae7838859098e9873d18c44e73fa7cc
commit: 03189c50b96902c65b0a7f1bd39a3b720c0755ae [1/1] tools/bpf: Query XDP metadata BTF ID
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260302/202603021139.BooAz09b-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021139.BooAz09b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021139.BooAz09b-lkp@intel.com/

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
