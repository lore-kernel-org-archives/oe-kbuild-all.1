Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423B23D4101
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 10:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965722; cv=none; b=NKBKLJqsV6vAZgDTttM7SGjrSDsljEc66xNZGwkff7/QUgczIBe9cylg5zNp7z6h0gdX/oheSe6xE6qiOlJMP9P9nIz8sKTL/oVpG8Ha3wAbuQ7Mi0LVQeYcJ1Vyie2bfM9kCF0jWQhqim6mR04YaWbJFELg/nYs5hp2E2GGaBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965722; c=relaxed/simple;
	bh=RQZfWunTveBGTrLi/8LjGUJqz5oKuLD/v0g5KNaOPIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvW25wbJwSKPaDahNA5w5N1dFdWBVeMuD2JjSJjkYev58Pgh3IFIeIeGnjr2PRQDFFmn65i8LS9Q8ogs+SsGkvzQsDbg7iOO947/re6gDPQaiyiRjeKzEnTLksWflOTpxjg+3LNsnN5Ymzr8CTWtSkyIAVups3Rphpag+o+RIFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSfpi6Qb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSfpi6Qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779965721; x=1811501721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RQZfWunTveBGTrLi/8LjGUJqz5oKuLD/v0g5KNaOPIw=;
  b=lSfpi6Qb+GTgR32j0jnCclNJqE+IdX9gm2NjkTOgW7qgXaDaLmuXI82x
   T2hqDShnBDvbGtF4j0/CjOQmXKQja9dU4CPYGD2WkQoxkG9QU1YmGO+dY
   x4FZ8VdXzU1ZRZvgjHj5+YmQxEN20did3umAnzrSKNFd9NG1TvMVgAjju
   VBUdwaWCh9MI8shpN6mVMAr0qMbPwIj++L0YXEbSv665lDTyyQLlHWtuq
   2hZ76VDvGWZDOmaHCd+jlsajWRpDpl0VzAdX8n3agz6P+8SwpyBpkEfDV
   eglLdsjY4gcSbZrHGhqH9Y3jk/TZ8c5XTddKpoTn9l9z2+3cyE6ICAsO7
   w==;
X-CSE-ConnectionGUID: eEyVFs6pRUaH6Xg8dlAvcA==
X-CSE-MsgGUID: dQrD5/hBTJGmqCvbQ1cIjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80796636"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80796636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:55:20 -0700
X-CSE-ConnectionGUID: FJO8QiD2TSujPQRICqxUhQ==
X-CSE-MsgGUID: 3rCEFMJ8Q0Omu2SZ5cJmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266420616"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2026 03:55:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSYOQ-000000005sk-03zS;
	Thu, 28 May 2026 10:55:14 +0000
Date: Thu, 28 May 2026 18:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chuang Wang <nashuiliang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuang Wang <nashuiliang@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Neal Cardwell <ncardwell@google.com>,
	Martin KaFai Lau <martin.lau@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5] net: reduce RFS/ARFS flow updates by
 checking LLC affinity
Message-ID: <202605281822.xLK0Dj87-lkp@intel.com>
References: <20260525025854.13982-1-nashuiliang@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525025854.13982-1-nashuiliang@gmail.com>

Hi Chuang,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuang-Wang/net-reduce-RFS-ARFS-flow-updates-by-checking-LLC-affinity/20260525-110036
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260525025854.13982-1-nashuiliang%40gmail.com
patch subject: [PATCH net-next v5] net: reduce RFS/ARFS flow updates by checking LLC affinity
config: sh-sh7763rdp_defconfig (https://download.01.org/0day-ci/archive/20260528/202605281822.xLK0Dj87-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281822.xLK0Dj87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281822.xLK0Dj87-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: net/ipv4/tcp.o: in function `tcp_splice_read':
>> tcp.c:(.text+0x3e90): undefined reference to `sock_rps_record_flow'
   sh4-linux-ld: net/ipv4/tcp.o: in function `tcp_zerocopy_receive':
   tcp.c:(.text+0x4cf4): undefined reference to `sock_rps_record_flow'
   sh4-linux-ld: net/ipv4/af_inet.o: in function `inet_send_prepare':
>> af_inet.c:(.text+0x538): undefined reference to `sock_rps_record_flow'
   sh4-linux-ld: net/ipv4/af_inet.o: in function `inet_recvmsg':
   af_inet.c:(.text+0x570): undefined reference to `sock_rps_record_flow'
   sh4-linux-ld: net/ipv4/af_inet.o: in function `__inet_accept':
   af_inet.c:(.text+0x644): undefined reference to `sock_rps_record_flow'
   sh4-linux-ld: net/ipv4/af_inet.o:af_inet.c:(.text+0x2048): more undefined references to `sock_rps_record_flow' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
