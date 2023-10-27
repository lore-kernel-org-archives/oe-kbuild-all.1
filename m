Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7D51A5BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaCsz8Gr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698409354; x=1729945354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6GCf+QceKRMh7sQplwkjaYOcPl0JMTRvYGJ4vOmyEfE=;
  b=IaCsz8GrGxEjyoK9KZ+ilrDl4cBEG2Hm1plAspqTQw4M5kdgis6fRN8w
   FmIzme5TQOpxNDXY5ysomAutHmigVOOuoifgdJXqo+P6jmZemvkbS/lfA
   p7QPg3Soa5eDO0j5SlzYFWBX/PbotWZ4MzpQ+cxd11iMcAzpkrWEtx9r7
   6DYoiQSJuMjT2Qbp5Fwy2l46M7HinupnDvk8IL6QOoJSanZu/RGt8Mr8L
   wut68FiOZIn1Wm/FdoDKU3e7iMSmtzYBiKqLRHiiptMGGi13PESaOI31s
   RJlcuWVD39drF3Kcx3qTZrzCLlNwjXuLhn2Fy7P8mj/Lo/g6nzAA/WXES
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384973302"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="384973302"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 05:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="759578369"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="759578369"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Oct 2023 05:22:32 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwLrC-000Aov-0T;
	Fri, 27 Oct 2023 12:22:30 +0000
Date: Fri, 27 Oct 2023 20:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] tcp/dcpp: Un-pin tw_timer
Message-ID: <202310272059.5miWmTdw-lkp@intel.com>
References: <20231016125934.1970789-1-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016125934.1970789-1-vschneid@redhat.com>

Hi Valentin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master horms-ipvs/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/tcp-dcpp-Un-pin-tw_timer/20231017-145512
base:   net/main
patch link:    https://lore.kernel.org/r/20231016125934.1970789-1-vschneid%40redhat.com
patch subject: [RFC PATCH] tcp/dcpp: Un-pin tw_timer
config: x86_64-randconfig-161-20231022 (https://download.01.org/0day-ci/archive/20231027/202310272059.5miWmTdw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310272059.5miWmTdw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310272059.5miWmTdw-lkp@intel.com/

smatch warnings:
net/ipv4/tcp_minisocks.c:331 tcp_time_wait() warn: inconsistent indenting

vim +331 net/ipv4/tcp_minisocks.c

cfb6eeb4c86059 YOSHIFUJI Hideaki  2006-11-14  317  
c5b8b515a21137 Dmitry Safonov     2022-11-23  318  		tcp_time_wait_init(sk, tcptw);
cfb6eeb4c86059 YOSHIFUJI Hideaki  2006-11-14  319  
^1da177e4c3f41 Linus Torvalds     2005-04-16  320  		/* Get the TIME_WAIT timeout firing. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  321  		if (timeo < rto)
^1da177e4c3f41 Linus Torvalds     2005-04-16  322  			timeo = rto;
^1da177e4c3f41 Linus Torvalds     2005-04-16  323  
^1da177e4c3f41 Linus Torvalds     2005-04-16  324  		if (state == TCP_TIME_WAIT)
^1da177e4c3f41 Linus Torvalds     2005-04-16  325  			timeo = TCP_TIMEWAIT_LEN;
^1da177e4c3f41 Linus Torvalds     2005-04-16  326  
a5aa10687f83ac Valentin Schneider 2023-10-16  327  		/* tw_timer is armed after the hashdance and recount update, so
a5aa10687f83ac Valentin Schneider 2023-10-16  328  		 * we need to make sure BH are disabled in following section to
a5aa10687f83ac Valentin Schneider 2023-10-16  329  		 * ensure the timer is armed before we handle any further skb's.
cfac7f836a715b Eric Dumazet       2017-12-01  330  		 */
cfac7f836a715b Eric Dumazet       2017-12-01 @331  	       local_bh_disable();
a5aa10687f83ac Valentin Schneider 2023-10-16  332  
a5aa10687f83ac Valentin Schneider 2023-10-16  333  		// Linkage updates.
4461568aa4e565 Kuniyuki Iwashima  2022-09-07  334  		inet_twsk_hashdance(tw, sk, net->ipv4.tcp_death_row.hashinfo);
a5aa10687f83ac Valentin Schneider 2023-10-16  335  		inet_twsk_schedule(tw, timeo);
a5aa10687f83ac Valentin Schneider 2023-10-16  336  		// Access to tw after this point is illegal.
a5aa10687f83ac Valentin Schneider 2023-10-16  337  		inet_twsk_put(tw);
a5aa10687f83ac Valentin Schneider 2023-10-16  338  
cfac7f836a715b Eric Dumazet       2017-12-01  339  		local_bh_enable();
^1da177e4c3f41 Linus Torvalds     2005-04-16  340  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  341  		/* Sorry, if we're out of memory, just CLOSE this
^1da177e4c3f41 Linus Torvalds     2005-04-16  342  		 * socket up.  We've got bigger problems than
^1da177e4c3f41 Linus Torvalds     2005-04-16  343  		 * non-graceful socket closings.
^1da177e4c3f41 Linus Torvalds     2005-04-16  344  		 */
08eaef90403110 Kuniyuki Iwashima  2022-09-07  345  		NET_INC_STATS(net, LINUX_MIB_TCPTIMEWAITOVERFLOW);
^1da177e4c3f41 Linus Torvalds     2005-04-16  346  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  347  
^1da177e4c3f41 Linus Torvalds     2005-04-16  348  	tcp_update_metrics(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  349  	tcp_done(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  350  }
cc35c88ae4db21 Atul Gupta         2018-03-31  351  EXPORT_SYMBOL(tcp_time_wait);
^1da177e4c3f41 Linus Torvalds     2005-04-16  352  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
