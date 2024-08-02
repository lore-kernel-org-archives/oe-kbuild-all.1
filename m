Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44353487B0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722601823; cv=none; b=L9ecTOraIKVfB9s6s2GbIPLGZeKaorK+KUJH1fRK6wOwCrZlyw3qXkYfedqlsW9cuiOQx0kWSK2eZhkldsOInAtXrcPGSSq3WxZvkK5r+860f0qMdIpISnONogushmurVsutXBKrITHz8QVdoa9LIPkscLtq3PhMp8NfwlKBcHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722601823; c=relaxed/simple;
	bh=OiIRiq3r01zlpA7qpcLPsqArtb6V9TiRrGa/WkykeRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaVwSntF6fk9KKORljegX02PihMUhXJ+tVgqnPj3CYkHAFfa6ti4LdmRIwpG2qJ4JdnLG+Cpgg2IEUTIHq6OOWL9SZdKOSUpKwhHloWSzO0kYwxyBIBxFXyFAicbWYGvfFQiq62gE7dBJRwmeCpzodatXN2xIKwqzXJvM8do/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkLHJtyw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkLHJtyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722601821; x=1754137821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OiIRiq3r01zlpA7qpcLPsqArtb6V9TiRrGa/WkykeRk=;
  b=SkLHJtywrxcp7Y0ENIunftRq1uGCm0hvKytCH49Y99qoxdnwSxosatd1
   M1trMstbvkW40/7S2n/9UmbQHYSRvVQVGH7JEfMmsn2YP8QoCmUof7c1c
   Q7UJFdi5HUwSInkto/XEjtQhx95vv2l7ckmIjZS8Sjs8xZjH14JmW2IQI
   kFCyqnqYBUCdPR9STwU+wLkDZNvgU7cJGBKxebUDsx9CmqYVjeJTmP4Db
   WEzRcCQr0sj5H3cwOeqEKrDVqrw+E4GAHJTAEvRx6rQt8RmwbjxHt3K51
   Kz/dnyPGQnGcGXfUS9+chNbF6cXg+eE7F/M7PLpheu/wk0ZIj8SuiMcCD
   g==;
X-CSE-ConnectionGUID: VtdHpfBaTnORkAQAfZojSA==
X-CSE-MsgGUID: S7drYZVnTJ2FWTrhwprePw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20780670"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20780670"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:30:20 -0700
X-CSE-ConnectionGUID: 7NuwiQdtQgCh8iyX1GaqWQ==
X-CSE-MsgGUID: CdU5eBKDSyKlukTQR4mkdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="85991210"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Aug 2024 05:30:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZrQG-000wlM-0O;
	Fri, 02 Aug 2024 12:30:16 +0000
Date: Fri, 2 Aug 2024 20:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Herbert <tom@herbertland.com>, davem@davemloft.net, kuba@kernel.org,
	edumazet@google.com, netdev@vger.kernel.org, felipe@sipanda.io
Cc: oe-kbuild-all@lists.linux.dev, Tom Herbert <tom@herbertland.com>
Subject: Re: [PATCH 06/12] flow_dissector: UDP encap infrastructure
Message-ID: <202408022051.e0Dqh7P1-lkp@intel.com>
References: <20240731172332.683815-7-tom@herbertland.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731172332.683815-7-tom@herbertland.com>

Hi Tom,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.11-rc1 next-20240802]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Herbert/skbuff-Unconstantify-struct-net-argument-in-flowdis-functions/20240802-084418
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240731172332.683815-7-tom%40herbertland.com
patch subject: [PATCH 06/12] flow_dissector: UDP encap infrastructure
config: arc-vdk_hs38_defconfig (https://download.01.org/0day-ci/archive/20240802/202408022051.e0Dqh7P1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408022051.e0Dqh7P1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408022051.e0Dqh7P1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: net/core/flow_dissector.o: in function `__skb_flow_dissect_udp.isra.0':
   flow_dissector.c:(.text+0x81c): undefined reference to `__udp6_lib_lookup'
>> arc-elf-ld: flow_dissector.c:(.text+0x81c): undefined reference to `__udp6_lib_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
