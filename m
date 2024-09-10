Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1EC17A924
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726006278; cv=none; b=SR4ye9u3cyu5sVHWcnvb4mVX9WgaYKRRlePgmU8FCSCeHmfcU451G+8BMo5KJG8zm7S7ZSzHEfLTOhCyprAP+gVMfcJgD6PktBTNqnr62Hq/wfE1FFgezxauhmO78A6Mfm7Dh8mR41QSX+6gN6yjg/GC1WrRn2DLbmcGlB6ofYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726006278; c=relaxed/simple;
	bh=0sgwXL68sw3gwlHjkHkH+1+HKasDSo02ifjtxitVhtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOsN8i6O9PH4Jg0jRjp6XXLucYBpo1U2SYS+K001cOD10W0fYYtuuyoMuIj5WYyq3o7POaczKFMsRkueQkylY+nm2fGy5RCbyRWHxLnbhmU50uHM0wSq1hjL5YdD9p9yZs49CGBDlxfJIiYM2tTAeb7BK4Z/Due8YzwSaILvHxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsP2vwq2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsP2vwq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726006276; x=1757542276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0sgwXL68sw3gwlHjkHkH+1+HKasDSo02ifjtxitVhtA=;
  b=PsP2vwq2HvlUKMez96jjWYLNVrN/9o7NzL80GqlUGVVh4HFaOpCKeSKw
   mMQz70eIghOt+JKjlJqh9e3F29A3gnvTVj+xJ5npnP3GmlEjByJKO4H50
   CPZDrH+zjACMbhglEWvNIn5DIA3q1MhPfR8bAIoVi3v+T8iFRzvjGqgO9
   Xj9OcfysWdNDPKiEV72yqI2atmbJ3tkRmkBuiJn6F131dL88qgu92xv+g
   EK2TQgAMfTZgohSGq2Ths1rp/eyp7pRkZ4WinjAVObt4zs9OvXCl61Okh
   LKNAptyZSf23BtfqNTsevA0yBE+IqG/AXzoA3bf8eEGp3zChmowqDVMc4
   g==;
X-CSE-ConnectionGUID: OSi/PsekSBmFPlwPBOTd8g==
X-CSE-MsgGUID: P+ugMmClRUquGZyf6YYAOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36136810"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="36136810"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 15:11:15 -0700
X-CSE-ConnectionGUID: mdUKyi5kQP27h+a/9YEcFg==
X-CSE-MsgGUID: g7zRhRr+Rv22oKqF4XUVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="98002953"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2024 15:11:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so94p-0002li-0L;
	Tue, 10 Sep 2024 22:11:11 +0000
Date: Wed, 11 Sep 2024 06:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JofDiamonds <kwb0523@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16131/30000] net/core/sock_map.c:1501:5: sparse:
 sparse: symbol 'sock_map_prog_lookup' was not declared. Should it be static?
Message-ID: <202409110644.OlZbU3Ny-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cbfb00d89c3b9971c3f0732b4f34d4e674bff5d8
commit: 050383882de382969e4fb8362235749b232cccae [16131/30000] bpf: support BPF_PROG_QUERY for progs attached to sockmap
config: x86_64-randconfig-122-20240910 (https://download.01.org/0day-ci/archive/20240911/202409110644.OlZbU3Ny-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110644.OlZbU3Ny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110644.OlZbU3Ny-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/sock_map.c:1501:5: sparse: sparse: symbol 'sock_map_prog_lookup' was not declared. Should it be static?

vim +/sock_map_prog_lookup +1501 net/core/sock_map.c

  1500	
> 1501	int sock_map_prog_lookup(struct bpf_map *map, struct bpf_prog ***pprog,
  1502				 u32 which)
  1503	{
  1504		struct sk_psock_progs *progs = sock_map_progs(map);
  1505	
  1506		if (!progs)
  1507			return -EOPNOTSUPP;
  1508	
  1509		switch (which) {
  1510		case BPF_SK_MSG_VERDICT:
  1511			*pprog = &progs->msg_parser;
  1512			break;
  1513		case BPF_SK_SKB_STREAM_PARSER:
  1514			*pprog = &progs->skb_parser;
  1515			break;
  1516		case BPF_SK_SKB_STREAM_VERDICT:
  1517			*pprog = &progs->skb_verdict;
  1518			break;
  1519		default:
  1520			return -EOPNOTSUPP;
  1521		}
  1522		return 0;
  1523	}
  1524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
