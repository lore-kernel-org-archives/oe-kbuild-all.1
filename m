Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC52282FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706368590; cv=none; b=QH/tMYsEVkAEPl54yp/Wx5mMLItwzxS8zNzv4Ve22sMcGUeMsMTrFDQ2LGra+87PklgDkU98595Lurzfhvgvn45qy29ZvYrt3jmOc5boMK9YxfwYPDu8/erTDOpPbNSjovOwc/NQCz2X4aF2pGAXcVTalPnp1JFnNliUnI7esHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706368590; c=relaxed/simple;
	bh=xLUsrfGH9IBafZIGuz5txGUspaxunwsnXWoJKEzLQR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8UQGypx+Fsi5Lq8GM/X2ezJYnN3YMG4J8U+uufbljljIgQJFde0CvICEsVjrqVpx1o+WEQmn2cJ6keVHFzYZ4YarRh5EOfxZ0SvZ6bFJjq08Zsn3RYM+N8YgDRvrLmzAX3rTPb1pc+5vJtl+mV14hNKoak3L6nmItzbMILkSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4Wyk3fI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4Wyk3fI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706368589; x=1737904589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLUsrfGH9IBafZIGuz5txGUspaxunwsnXWoJKEzLQR8=;
  b=L4Wyk3fIv+4s3G8TLBzDbz/30ndOqYJIOdzcfKhpjeqiZZlp4oGSJhNp
   z9wgn0rgnPf0xJT9x2l4id1Zuu0E6yssHxESImcb13y16YTaDJRLCuLA4
   jsjPAwQOZyNiiEotk3s8Atc/od28MEx4s4x5swQF5s+uYOdbkk/ZG5zZ5
   2rgVYUml0ClqO83UpeGmWTGuEy9QLVUzb8nF9/nhXENTYiTbX3fbwGqkC
   DV6HTRf1yKwe2zQbhnes9semK9DcdF1XbKXwXAmyp7KjAGJ92Rl6WHHkm
   SVhMIQagthn4Tomicd8NZHzrOrwmxFozK+0sV+d1i4wYYBklNnnAH8Gav
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9342681"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9342681"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 07:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2993847"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2024 07:16:25 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTkPv-0002S6-1C;
	Sat, 27 Jan 2024 15:16:23 +0000
Date: Sat, 27 Jan 2024 23:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [netfilter-nf-next:testing 8/9] kismet: WARNING: unmet direct
 dependencies detected for IP6_NF_IPTABLES_LEGACY when selected by IP_NF_NAT
Message-ID: <202401272357.BmlNMzk9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git testing
head:   bce197d1b01d778a734ee15b19a48ebc2b41390a
commit: 3076d3576759db157092ee7db5a9087d2ef01b00 [8/9] netfilter: xtables: allow xtables-nft only builds
config: alpha-kismet-CONFIG_IP6_NF_IPTABLES_LEGACY-CONFIG_IP_NF_NAT-0-0 (https://download.01.org/0day-ci/archive/20240127/202401272357.BmlNMzk9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240127/202401272357.BmlNMzk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272357.BmlNMzk9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IP6_NF_IPTABLES_LEGACY when selected by IP_NF_NAT
   
   WARNING: unmet direct dependencies detected for IP6_NF_IPTABLES_LEGACY
     Depends on [n]: NET [=y] && INET [=y] && IPV6 [=n] && NETFILTER [=y]
     Selected by [y]:
     - IP_NF_NAT [=y] && NET [=y] && INET [=y] && NETFILTER [=y] && IP_NF_IPTABLES [=y] && NF_CONNTRACK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
