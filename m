Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EABE24521
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 03:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692848304; x=1724384304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hu+uTPkAAnIwISOW/yyrjbkwvcZJRAuodOVXgVUqww8=;
  b=mu04HSKn2FA+KyYrfHEa5CRY/ngsoiaL+R/FmE9XyVOj340KO7m8McXU
   sNBPpF0rVYhHAvotLUrnonJRLxhk7VFBUoZ5AK3rE5JkP02ovxZEKZgxV
   hsoyAsdW1y3LDsyCq6htNPedzgTlVzF5tDhrXMsg4phdgJWoFUqoUAbxm
   /NfC/sPkFysYqvVISgFscwpX3OwbNiWfXxrwS2zHG/D05LT59GyBY0302
   t7JM9VwKGU1yaApzz1wSRMMQrwIEF9FR/En1T26+umgLa0u74ZUfOrC16
   ph3zLuxhl4LmarZ3+WWasKU7hUHfYRDAKpZbSvh+W+lJ+mipnKEwUyEfT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374305495"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="374305495"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 20:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910751229"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="910751229"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Aug 2023 20:38:22 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ1Ar-0001ji-1I;
	Thu, 24 Aug 2023 03:38:21 +0000
Date: Thu, 24 Aug 2023 11:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [linux-next:master 9571/12208] net/socket.c:1676:21: warning: no
 previous declaration for 'update_socket_protocol'
Message-ID: <202308241150.LquDYwGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: 0dd061a6a115f25132989cbd591a25afb2dee086 [9571/12208] bpf: Add update_socket_protocol hook
config: i386-randconfig-r026-20230823 (https://download.01.org/0day-ci/archive/20230824/202308241150.LquDYwGT-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241150.LquDYwGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241150.LquDYwGT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/socket.c:1676:21: warning: no previous declaration for 'update_socket_protocol' [-Wmissing-declarations]
    __weak noinline int update_socket_protocol(int family, int type, int protocol)
                        ^~~~~~~~~~~~~~~~~~~~~~


vim +/update_socket_protocol +1676 net/socket.c

  1659	
  1660	/*	A hook for bpf progs to attach to and update socket protocol.
  1661	 *
  1662	 *	A static noinline declaration here could cause the compiler to
  1663	 *	optimize away the function. A global noinline declaration will
  1664	 *	keep the definition, but may optimize away the callsite.
  1665	 *	Therefore, __weak is needed to ensure that the call is still
  1666	 *	emitted, by telling the compiler that we don't know what the
  1667	 *	function might eventually be.
  1668	 *
  1669	 *	__diag_* below are needed to dismiss the missing prototype warning.
  1670	 */
  1671	
  1672	__diag_push();
  1673	__diag_ignore_all("-Wmissing-prototypes",
  1674			  "A fmod_ret entry point for BPF programs");
  1675	
> 1676	__weak noinline int update_socket_protocol(int family, int type, int protocol)
  1677	{
  1678		return protocol;
  1679	}
  1680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
