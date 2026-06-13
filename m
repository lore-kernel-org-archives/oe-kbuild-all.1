Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7622D238A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781380471; cv=none; b=hvNP38ZMdbwbB9NwhF1htvoCPs3YcDX3htw6PB4cV+MboSreJfPm5gONjB2wkYohCt0vlyL99FZ6E0p/J/uwKzIa6a0dL/LTsSPAs1IL/+4aCmdBy/kVl7ycVygzj892rOcjQqY2KDVuF39MrWhZKF1xsAT4qxZhrKOKcpLsCAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781380471; c=relaxed/simple;
	bh=S0w8M6qCDJ6gXh8F3IfP3mlUbRAFp8ddpBIoN5jNze8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhtwNb9j9+yABtHYFi8Wt9nNlRGRgf2UvpLPGQsp4Le0p5rBwQ0Kvq3+5HRUBiwflcf/TUulTf5f5VRLMcdmRf3OykzdW2hlomZIHVFRRXcVWYuUPBKIq2LPIfPCPgMCw4bI7P4VnRNzP6XUumuL01XWYMBa9ewciJEAXSvCg38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfxcOS87; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfxcOS87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781380468; x=1812916468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S0w8M6qCDJ6gXh8F3IfP3mlUbRAFp8ddpBIoN5jNze8=;
  b=GfxcOS87vlmzLnuHKxs25XaY4Bf7TTQqoSr61/BhXxEw2B7qEPEuRFBt
   1ClDS+86jC4J0mQRpq7o5BYz6Jll28BimWz97wLMw5wFpBLJTyLfm4iCZ
   t8L04J2UMy+RSdlWWuyXAWUOjAKOHGoYssJQUEYZ2Gpw3A8Z7SaaN3LBl
   7rw/LlN8dteOhSofJHmzQ7eeZaPCgdP+uEMFooRYPRbxD9i/BK0QJ5WIQ
   HioKCQgISN++Z33wWCNbZtDJ+bs0IVxhKI/UCspbrI+FJfwOOfLgChsZ5
   xplL3IWKud0ov/BK9SymX4WJDSCp4pzfJaFt9v+nOTrBlvhiDeoYpK4t+
   w==;
X-CSE-ConnectionGUID: H4ItDdfQQ/Wblta6rmWoyQ==
X-CSE-MsgGUID: 02evkWBgRdmzEqqrNyOVaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="107612489"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="107612489"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 12:54:28 -0700
X-CSE-ConnectionGUID: TB/2Ou0YSA+0y250S7NZxQ==
X-CSE-MsgGUID: OAMjj7BtQGaejf5jiCpGtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="247134552"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jun 2026 12:54:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYUQs-00000000QEc-3KLN;
	Sat, 13 Jun 2026 19:54:18 +0000
Date: Sun, 14 Jun 2026 03:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: chia-yu.chang@nokia-bell-labs.com, andrii@kernel.org, eddyz87@gmail.com,
	horms@kernel.org, dsahern@kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, jhs@mojatatu.com,
	kuba@kernel.org, stephen@networkplumber.org, davem@davemloft.net,
	edumazet@google.com, andrew+netdev@lunn.ch, donald.hunter@gmail.com,
	kuniyu@google.com, ij@kernel.org, ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com,
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com,
	vidhi_goel@apple.com
Cc: oe-kbuild-all@lists.linux.dev,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: Re: [PATCH v1 net-next 1/1] tcp: Replace min_tso_segs() with
 tso_segs() CC callback for TCP Prague
Message-ID: <202606140311.15fhp3QN-lkp@intel.com>
References: <20260613080831.236636-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613080831.236636-1-chia-yu.chang@nokia-bell-labs.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/chia-yu-chang-nokia-bell-labs-com/tcp-Replace-min_tso_segs-with-tso_segs-CC-callback-for-TCP-Prague/20260613-160954
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260613080831.236636-1-chia-yu.chang%40nokia-bell-labs.com
patch subject: [PATCH v1 net-next 1/1] tcp: Replace min_tso_segs() with tso_segs() CC callback for TCP Prague
config: x86_64-randconfig-075 (https://download.01.org/0day-ci/archive/20260614/202606140311.15fhp3QN-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140311.15fhp3QN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140311.15fhp3QN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tcp_tso_autosize" [net/ipv4/tcp_bbr.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
