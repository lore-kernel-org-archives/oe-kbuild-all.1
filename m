Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90B39843
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PS0mRC55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697670634; x=1729206634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KXCa4gT7nwdvt0W4tRGjUY13uaP9REBpUHIcB9eb4Lw=;
  b=PS0mRC55J4MVgRzuiN2tyuOkaCgs88FY3GUcL3tDRs1n3uIghvP3yN22
   IprMu/hSO3s1JgoRGc9MXSGLw5y9Mog9eZNKjJyemY0CLT0tN9Gm/Ouhn
   eNY63GpeNMAOMqz+/KGXNq4ImwyAVbfLCBcEspvOABXTxFQRtxN6qOdXj
   ultwN6vgjNuwd/gZr5oJbi/IpLy9WSxGnuHj8rKL4P5n8/MxHdtMZnFFQ
   BsHQqGn4p/k9/5ZfprFybsXq6fWt5IQGpP8yFe5DrcdSHtTtCFvi05rTs
   QCe3HrcBYqBHjVt9Ow1ARtrVpwzYTS5YPBpakVQbGv7HXSpxQUQguqAi+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="365485277"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="365485277"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 16:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873210632"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="873210632"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2023 16:10:32 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtFgM-0001DO-07;
	Wed, 18 Oct 2023 23:10:30 +0000
Date: Thu, 19 Oct 2023 07:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Safonov <dima@arista.com>, David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v15 net-next 08/23] net/tcp: Add AO sign to RST packets
Message-ID: <202310190624.8HoxehB3-lkp@intel.com>
References: <20231018205806.322831-9-dima@arista.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018205806.322831-9-dima@arista.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c4eee56e14fe001e1cff54f0b438a5e2d0dd7454]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-tcp-Prepare-tcp_md5sig_pool-for-TCP-AO/20231019-050315
base:   c4eee56e14fe001e1cff54f0b438a5e2d0dd7454
patch link:    https://lore.kernel.org/r/20231018205806.322831-9-dima%40arista.com
patch subject: [PATCH v15 net-next 08/23] net/tcp: Add AO sign to RST packets
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190624.8HoxehB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190624.8HoxehB3-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#176: FILE: net/ipv4/tcp_ao.c:519:
+		return -1;
+	} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
