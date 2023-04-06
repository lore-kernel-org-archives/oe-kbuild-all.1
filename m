Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705EAD47
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 19:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680807788; x=1712343788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qmWhij7qMLtjjjkVImxSg0GZvY+qkirdk6xo/rWp7MA=;
  b=AetbD3zcAluFIO/2TSOtmXn0nfndeRlNsbI0JfmeJ+2aXMAkXGXFJNR4
   3htKVYKG2Rr4rrX3a5FETWZwuHy9t7ncdp0IrzBmWLvZKdFmZg0H68nuY
   q2D5Mgk4TMi0ZQ3YQyCsAitr3te+Po8UbBZnjv+AVWTS8Pgnbu55hyXHU
   i/oix5uURmNMpqpOLNXchW/DaIKFvzQydey7KEAqGl0YMEmPat8VllvUK
   BCOhRM8LDKDDRPW3mBc6p70FwacByRcL7rAU7GnXF0cfjwtbEwiwdmy90
   1A0+ko3fKYxuGq/Wme3bpwYtMtROuDyhBSg1AGJimdHSPHxx2PGr8hBCJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344580925"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="344580925"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 12:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861507062"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="861507062"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Apr 2023 12:03:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkUsz-000Rcg-27;
	Thu, 06 Apr 2023 19:03:05 +0000
Date: Fri, 7 Apr 2023 03:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] net: add uring_cmd callback to UDP
Message-ID: <202304070244.kmFlDfh5-lkp@intel.com>
References: <20230406144330.1932798-3-leitao@debian.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406144330.1932798-3-leitao@debian.org>

Hi Breno,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main horms-ipvs/master linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/net-add-uring_cmd-callback-to-UDP/20230406-234400
patch link:    https://lore.kernel.org/r/20230406144330.1932798-3-leitao%40debian.org
patch subject: [RFC PATCH 2/4] net: add uring_cmd callback to UDP
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230407/202304070244.kmFlDfh5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/481b4799b28c2e6bc49578ebbf64f7506df13804
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Breno-Leitao/net-add-uring_cmd-callback-to-UDP/20230406-234400
        git checkout 481b4799b28c2e6bc49578ebbf64f7506df13804
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070244.kmFlDfh5-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/udp.c: In function 'udp_uring_cmd':
>> net/ipv4/udp.c:1718:20: error: 'struct io_uring_cmd' has no member named 'sqe'
    1718 |         switch (cmd->sqe->cmd_op) {
         |                    ^~
   net/ipv4/udp.c:1726:1: error: control reaches end of non-void function [-Werror=return-type]
    1726 | }
         | ^
   cc1: some warnings being treated as errors


vim +1718 net/ipv4/udp.c

  1714	
  1715	int udp_uring_cmd(struct sock *sk, struct io_uring_cmd *cmd,
  1716			  unsigned int issue_flags)
  1717	{
> 1718		switch (cmd->sqe->cmd_op) {
  1719		case SOCKET_URING_OP_SIOCOUTQ:
  1720			return sk_wmem_alloc_get(sk);
  1721		case SOCKET_URING_OP_SIOCINQ:
  1722			return max_t(int, 0, first_packet_length(sk));
  1723		default:
  1724			return -ENOIOCTLCMD;
  1725		}
  1726	}
  1727	EXPORT_SYMBOL_GPL(udp_uring_cmd);
  1728	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
