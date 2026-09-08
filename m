Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3CD4B53EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875140; cv=none; b=nMdyxceNY7nrNol24jPyTKX/uZj3lqIXAJ59tmk/rwad4YL0W48woTghcSlivVVlmvNuLgWPJr3IkKI6vbe59Ton267eaiu2l9u+ptPUtFmw2m2ZOwF8uLmKivOphgwse3LXzT1zwWRAWo+3UKJ2Y0TaHJGQbryflo4Hk1eXUXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875140; c=relaxed/simple;
	bh=sSklNck0Sbon2G2fmPfDEDP0QKg4rj2PBD466RCgAGw=;
	h=Date:From:Cc:Subject:Message-ID; b=IxY6AUn243fYV/Q+5yyrX58bIyQiHxhNLyED2agzE880Vz/zMx2LsK95XvbbgDnEiGxCRaKof37IkGOl2OR8//zHOsPYwcK+TToyI/0ycE3IBhNvybcjJSisQFxKUBxiOIqJJXdQYnvcAcnKyg/NlTcqvYoF+rnguYhgidLq5oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnUW1iIe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnUW1iIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788875133; x=1820411133;
  h=date:from:cc:subject:message-id;
  bh=sSklNck0Sbon2G2fmPfDEDP0QKg4rj2PBD466RCgAGw=;
  b=ZnUW1iIeRrSvKcUYhcVlL27nrBX36avNoHBXpT70i/seoXuXHBRmXoS3
   HpuWdKIdA3GZdcRhWbCYFeyFyueSMV5KPa0RxEwyKt2JoSPRVidZf2VgV
   xNIjYUdAAm6fFi+PX/jIykruNtEjqK6rpuHSXmogsje1Bz8b685jULWzZ
   wGNiew0FLWHLeMBOIg6WZs1KJNLTGcEzIWux7Dv5xqpZQVXCo6vZaVK7G
   w5+8w9JDi3wHh1M7lbcLfmkbGZzS+JotHBxxifLOHfmCsEZ2Uw4w/Od5t
   sIkp6YLKVw8lS9xXhjznc2QZD/UGy8XwOrxYXte05CJMHuQ2LWor6Dod6
   Q==;
X-CSE-ConnectionGUID: TZBBHfdjReKe87mFzPwrMw==
X-CSE-MsgGUID: nsul30pvTFeX5OF9Twp9HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106792797"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="106792797"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 06:44:39 -0700
X-CSE-ConnectionGUID: HXTKqFTfQNS0+r5OuSfL3A==
X-CSE-MsgGUID: hBDH/hTfTQ2gcaaqg6esyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="309263847"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 08 Sep 2026 06:44:38 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3w7n-000000000iQ-2x0P;
	Tue, 08 Sep 2026 13:44:35 +0000
Date: Tue, 08 Sep 2026 15:44:12 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 1/1] netlink_dumper.c:60:36: warning:
 format '%d' expects argument of type 'int', but argument 3 has type 'unsigned
 int'
Message-ID: <202609081550.poM9y4Rw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Saeed,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   fba0f76dc652f3ae4d38d5a486cad998d353c67f
commit: 03189c50b96902c65b0a7f1bd39a3b720c0755ae [1/1] tools/bpf: Query XDP metadata BTF ID
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260908/202609081550.poM9y4Rw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081550.poM9y4Rw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081550.poM9y4Rw-lkp@intel.com/

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
