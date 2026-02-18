Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18C26CE32
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 01:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771379491; cv=none; b=SDxC4fNU4DhsfZMl8n9W7hVJZaAzQL3lXfxSfbI0pYCUJ9flflwZGhQj6t8/nZ+ovO5zIM4pux61Q88Ouyb3LAilPb6/jk+9CLjlUbmgmQ+D7Mw6Jhh8DUfHwo7NA59IMgqxO7QcanMtAfcYwj0UAiKwU/QA33dvx1wuaAK3SKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771379491; c=relaxed/simple;
	bh=rUyztzb3j1iDcw1PAtZHQ3T2qlCBfTArYaqTXTwZ9gU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mi0dA9MnJN5b56neIEtNHzhEIQyLlNwlhNOMj3HtlspC5bXQE7fzNxz89WPfMz+9bmw/5D9I/FeexVc3n71Lm9KoyvxBaPFpJojSthmPBAurxSyhBcVt4uuBpul1V0jbeZjhv/gVwDDSnUb4Vgsbc15gBH/dVhPr4qmJC2b+VLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyS3NzlR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyS3NzlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771379489; x=1802915489;
  h=date:from:to:cc:subject:message-id;
  bh=rUyztzb3j1iDcw1PAtZHQ3T2qlCBfTArYaqTXTwZ9gU=;
  b=QyS3NzlRFUQU1wiTN9RWXs0LiYeHRc42xjV+SmpTKGHDKqAxT5h9bohq
   TrOniv800lQXahrkAMQl6LpqZLbQj1yOOLk+cw9qxj474QyjDghIBMb7K
   TQNaFUeyeQbm3cnLrnaBGDie82MTb0tKVegUoEfSeEEbfBB/2mV/qOStS
   rUNcQtOo+EsCvNQK/xwsB1/bwl4tIIH3AEGtLLHXRAp0BCemjArhn2zuc
   T8xHX5ipLCcfgqQxsQbqKVn3FV7gG+Qrh7NWP6diZh+o2ToV1Rb9AZyYi
   bAnIHIBuxKM/MrIBUir+1gpnEsiICk+XRqOe2BoBzqYJM/grPEK/Pkupg
   g==;
X-CSE-ConnectionGUID: /qjtmqGKTJiO8Xdy3eC1rQ==
X-CSE-MsgGUID: NyqcUGH6Tqykce9HyFY3LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76318838"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="76318838"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 17:51:29 -0800
X-CSE-ConnectionGUID: PspHMz0cRsyY3GPjAWk5Cg==
X-CSE-MsgGUID: G86Edh++SN2VEDIUkZ775Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213910509"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2026 17:51:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsWir-000000011vW-0rqN;
	Wed, 18 Feb 2026 01:51:25 +0000
Date: Wed, 18 Feb 2026 09:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 7/8] ERROR: modpost:
 "nfsd_nl_svc_export_set_doit" [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202602180912.KVQAZvMl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   67896fe53a48a300b8826416c1b4023d407c852d
commit: 560e6d056acf00eaa6f7ddeaef47f30fbfd2b79d [7/8] nfsd: add new netlink spec for svc_export upcall
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260218/202602180912.KVQAZvMl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180912.KVQAZvMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180912.KVQAZvMl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>> ERROR: modpost: "nfsd_nl_svc_export_set_doit" [fs/nfsd/nfsd.ko] undefined!
ERROR: modpost: "nfsd_nl_svc_export_get_doit" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
