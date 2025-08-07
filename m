Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125C8189
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754536792; cv=none; b=nDtgj2F4zhCi8DUOM+PanN2SXYpTNRhykej0QRB7ayzGWXmHtY1HpdBxMZ9s4Ke1f7jlZue3kcgJ5UOSz+hlnMHxxebjTX7gEd1c8lG33l7Y1+TDqaroaR9E3CBv0HdvxswzEtM8v2S0Tk6xojReuJtFdt/3UY51II4zMvw1ets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754536792; c=relaxed/simple;
	bh=7lXI+roYJCFI5tdvgfplP0h8gDRTHb43hTIHyM3ecjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M33ep7+VUi8Ch4pgE80LUH3XWlei+t9J7vnJg7gljZT6ZKJC05/exe2q84SS6imZyC+d29+KlooCLrdzixBdRDG0qly7bCqwi7zFH3zDNHz0qeSMXByHYW/Wj3NY87SwnglCTevs8PuPtxT7JArTKjI7BZ6pT3eoUEU2UQuDM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElTMBqhh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElTMBqhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754536790; x=1786072790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7lXI+roYJCFI5tdvgfplP0h8gDRTHb43hTIHyM3ecjA=;
  b=ElTMBqhhNX4UWOMqLz7qOfsMB3+QK+p/5/Dt7m9/arwcBSaX5sEzhM7k
   t4bKejg9xIw5LEbOst0Wxl077vgxe5PkXtYiGpVV7PwuBx0IBsqrRNB/l
   pT1XJduE4UrYMo376itrVcynStlOGmq31MLQoLfLI2BJ6dYjqmWcOSr7x
   Gs/isYRjcWFKZSMBiyA0o4JbZ0tH9wm1BKqJ29mSRgnPZPawhpYRSzFU2
   x/Da7Z8XTEbkkQvq128cDmFho86N8ma8pMh36yY63IE/s5LNElL0EIInt
   np261yVPNyMduIgYPpAIjY8bg9VP72NQ6dm181o6dNjFEKdj1bXXxM2rX
   w==;
X-CSE-ConnectionGUID: yhcfKsZuQEycu54041S04Q==
X-CSE-MsgGUID: pY77asc0RFCUq35SU1jmXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56941206"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56941206"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 20:19:50 -0700
X-CSE-ConnectionGUID: s6MXw/qjR1KKOxRAcsq04Q==
X-CSE-MsgGUID: seL34ClyRLCzCfA4ui+niw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="195925492"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 06 Aug 2025 20:19:48 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujrAQ-0002JP-0A;
	Thu, 07 Aug 2025 03:19:46 +0000
Date: Thu, 7 Aug 2025 05:18:50 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3106/3106] net/core/sock_map.c:1501:5: warning:
 no previous prototype for 'sock_map_prog_lookup'
Message-ID: <202508070532.sG3pOJWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a8c621aa031669a6835da1431d9765e3bbbc3621
commit: 050383882de382969e4fb8362235749b232cccae [3106/3106] bpf: support BPF_PROG_QUERY for progs attached to sockmap
config: x86_64-buildonly-randconfig-2003-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070532.sG3pOJWR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070532.sG3pOJWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070532.sG3pOJWR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/sock_map.c:1501:5: warning: no previous prototype for 'sock_map_prog_lookup' [-Wmissing-prototypes]
    1501 | int sock_map_prog_lookup(struct bpf_map *map, struct bpf_prog ***pprog,
         |     ^~~~~~~~~~~~~~~~~~~~


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
