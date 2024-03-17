Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82760125C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710668900; cv=none; b=fiRNxLLhu/8ejOqLx7XrZSgJd45E3CUD6s0nxtdJGTl2hSPywKqNJl0eKH8KRzjuIRryxu81FcC/SM5ffIkZmMNF1cjZRZlLiLxyH11qVivLWzstT0JBjELWKc4IokGK3hCwDnHdX0miEtPCjYuQfCmtKQPmlIk3uEW1UxrnCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710668900; c=relaxed/simple;
	bh=8LHaGHqD9nh1NJGjYXaKGBz3d5Z2ugN47dQwSuXupYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFxtBQo7zQaX2scOP2vz7aWHm6IMbYhL+vZGesd7cEoQutCeibmxG66EpCtvJ07G1OZyavawDbHSY/Bw0EBpZNsreTyJ7qtPaoZFqYTDIykXUr0g6mHSBAZI93ZG2TLdJSlHKS7Iqw1/i04wUpKg8IHot5pO9TdDrahpQgaasQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmrT47o8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmrT47o8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710668897; x=1742204897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LHaGHqD9nh1NJGjYXaKGBz3d5Z2ugN47dQwSuXupYo=;
  b=YmrT47o8K3vfqIZwUPhoXWuW0TES5avESh6kwLWmoMji9noGo/4WUD5k
   O4aN1hkesOo30RG0Rg5tptpKCPrX47EIiSSHpnNvaSlAuGg1AHKjn4QdX
   ZfDyJbHI3A4SKOE/I2LwwNUHTYJHmYMjXjDjBjFwJCPJjo4jyjQontu/4
   qrnBZ1OAWMWcJ9X7xySCd5QJKlPpul6f1/PscJdGT8alrbG2WBLoZLvDA
   ZmyIpuyAh3k3UL15xplTsMaj9g2ohEum4Zmg/qHg0kdwfJwDM81NTiuP0
   fnGwuY6DRZjnbGnELgZ+7KlwIjXThTkZPXCGJAJ8eKmKF23Z/hSBvsNUB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="16135359"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="16135359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 02:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13224574"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Mar 2024 02:48:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rln7l-000G9x-25;
	Sun, 17 Mar 2024 09:48:13 +0000
Date: Sun, 17 Mar 2024 17:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JofDiamonds <kwb0523@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21426/30000] net/core/sock_map.c:1501:5: sparse:
 sparse: symbol 'sock_map_prog_lookup' was not declared. Should it be static?
Message-ID: <202403171747.MBuYnaps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   32bb7b0a7c87769858fbb9d60574b830383c28f7
commit: 050383882de382969e4fb8362235749b232cccae [21426/30000] bpf: support BPF_PROG_QUERY for progs attached to sockmap
config: x86_64-randconfig-123-20240317 (https://download.01.org/0day-ci/archive/20240317/202403171747.MBuYnaps-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171747.MBuYnaps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171747.MBuYnaps-lkp@intel.com/

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
