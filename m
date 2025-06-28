Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1F3595B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751142007; cv=none; b=bdIyQYqN/vpSZzMa8cl5wAas1+ksDS5uTN6mkXPuk5XDB8mv9FXVBoJ4XPfjOHRvroHg9qG4JCIHq67VLSjYHJHHlIU3X1Fk6EsfK1ltyIkbFpFeZTuH0I1cWJ9ydA95CgbKeYxx3Emkacs+foawGcpCZg16+so25LmXCzcfgGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751142007; c=relaxed/simple;
	bh=3kzgMzI9+La46pMz1M12dGBtQqn/ZJQzVILZmYLUwwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1dZme3V7AvmjSTMiRmLXvKOqXrjWDMi/bmmVpLM+nXonF1Itzl9azUvMithiaxyyeTqXVSwfTjyxfv0zcNdNWswK1klz7tLBE4POAcLe6vgKB3F3mq569+7HtQ69c7Gk3l7zJFycnCJ1qDTEpJjpSapZAsNdNZERYjryveRvtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mh/KT4BK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mh/KT4BK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751142006; x=1782678006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3kzgMzI9+La46pMz1M12dGBtQqn/ZJQzVILZmYLUwwk=;
  b=Mh/KT4BKW9zeoT4F1WoUTIvpAMe5grJaTMvYvXIW24WQUvBMZ0sqs4Xu
   HGtJyHyxdRFD8IRAQMeffEBmrPb6xiUeWWdGLBW6RofIpHVsZt1wJFLhK
   Y0O/ZvAANLts1/GXclCQ9S0QWXQpB4VtRtnFpoyQWh/TbsOnVEZ01TYDP
   OnQawYEOczKXR+aAudcCJrbrJaOeSWCBhAc/OXZK4tcfz32A5mc2NARBc
   SCJ2dbbqFItPYpxZdzb+rsFp+MfuTHFISjKfVGV6YqQui4dPhVoyRRqEl
   YlvfsCcrwwsu5A0GqiN4+g8utPBTrL6u4kb/1Vz8fFoRVzRQolOerHRP+
   Q==;
X-CSE-ConnectionGUID: Ts/nITdjQsOjX11x9Fq8dg==
X-CSE-MsgGUID: MTfSGKBuQ/+dUIAFZa+qBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="56042120"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="56042120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:20:05 -0700
X-CSE-ConnectionGUID: KUs1aHUHSXeqGz6QFVViRg==
X-CSE-MsgGUID: 7BdVuYMfR8eJEAFrCJdfyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="184123547"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jun 2025 13:20:03 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVc1o-000XLe-1O;
	Sat, 28 Jun 2025 20:20:00 +0000
Date: Sun, 29 Jun 2025 04:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
	eric.dumazet@gmail.com, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next 2/4] net: move net_cookie into net_aligned_data
Message-ID: <202506290617.ImmLRhZL-lkp@intel.com>
References: <20250627200551.348096-3-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627200551.348096-3-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-add-struct-net_aligned_data/20250628-040753
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250627200551.348096-3-edumazet%40google.com
patch subject: [PATCH net-next 2/4] net: move net_cookie into net_aligned_data
config: riscv-randconfig-002-20250629 (https://download.01.org/0day-ci/archive/20250629/202506290617.ImmLRhZL-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290617.ImmLRhZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290617.ImmLRhZL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/hotdata.c:5:
>> include/net/aligned_data.h:12:9: error: unknown type name 'atomic64_t'
      12 |         atomic64_t      net_cookie ____cacheline_aligned_in_smp;
         |         ^~~~~~~~~~


vim +/atomic64_t +12 include/net/aligned_data.h

     6	
     7	/* Structure holding cacheline aligned fields on SMP builds.
     8	 * Each field or group should have an ____cacheline_aligned_in_smp
     9	 * attribute to ensure no accidental false sharing can happen.
    10	 */
    11	struct net_aligned_data {
  > 12		atomic64_t	net_cookie ____cacheline_aligned_in_smp;
    13	};
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
