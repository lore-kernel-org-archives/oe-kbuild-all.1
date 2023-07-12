Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A251B1F942
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689166736; x=1720702736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dW4Jsq1TDuUkIMxwAT6n20PHn68OwWO1bPsU0NCNAmI=;
  b=TJG2LE6SZTw6ndpSZ8h1IpsXoS5lxzXsrd+tMpJZ3XIvW5bjzDSH6EBl
   muoAqBiPimKBZL49b9hQLBb3XGTclgGHfGAI0mE5cv0CT+h9p3rVmvZ/w
   B5LNUlxr9k+vHbgyUnm0dks3uRNNIV4gtDhv4RU+Bg2wJDyyb3yrzFkX8
   upWd5G+Jn3IsLnceEC2Od+gNHNNDgm5dvfYBn+nkkORWg27eXPn9KRUsY
   zFTdHiP/ez9qXLkF8FG71CCE60Yo4Kb07oQaXP68mWPLjc5RnhbJ5+HJB
   TCF0n8GyHlPh20de/oYQEAKQne8bcZxFQJwAM0WMSH6VsTiVTCEFuxwud
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428617443"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="428617443"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 05:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895623154"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="895623154"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 05:58:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJZQk-0005hR-1e;
	Wed, 12 Jul 2023 12:58:54 +0000
Date: Wed, 12 Jul 2023 20:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bobrik:ivan/tcp-listen-drop-tracepoint 1/1] ERROR: modpost:
 "tcp_listendrop" [net/ipv6/ipv6.ko] undefined!
Message-ID: <202307122017.RNAnLQAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bobrik/linux ivan/tcp-listen-drop-tracepoint
head:   ec65eacb29485b1a871ad01eba86d91a29d3e3b0
commit: ec65eacb29485b1a871ad01eba86d91a29d3e3b0 [1/1] tcp: add a tracepoint for tcp_listen_queue_drop
config: m68k-randconfig-r031-20230712 (https://download.01.org/0day-ci/archive/20230712/202307122017.RNAnLQAW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122017.RNAnLQAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307122017.RNAnLQAW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tcp_listendrop" [net/ipv6/ipv6.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
