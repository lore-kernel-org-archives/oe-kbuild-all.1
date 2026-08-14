Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B3433F5BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 05:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786684254; cv=none; b=r/tMgIw9NARh6pyHMOo2CUffJ51RHESlyp5GoKhq+8opwvsTPyl91cm/zh5mF2iwN0jKE2nN94z6l0TQkAFzeSMMO0ZpeE21hDd4nUy1+Asmj4PjmL9HuipGGWrQG2SpqGv73uxSPrmlMBu7E/3SwHp6L5of5JZO4ZwF8D2NAEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786684254; c=relaxed/simple;
	bh=BtOR4q9qE018zObNVydlsYcYNz5VXz7vmFQ6xMfBTRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MlbPtI/TZeMENcOzw9Il5vA46kE/jts0Q6+S5fGwmvE8xO0WCwKt9P4T+Qw+5eKaOPwtTg/x5/EHrLZWxkV8Q7RiS9p34CqGyPwcWQ7Ct93dpzGNPCRRQiSCj0wNr+ec4VZABRvL0EMcB9wt//JgpLJR9a8KZCcKTzkMDCzOHjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltYX54td; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltYX54td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786684252; x=1818220252;
  h=date:from:to:cc:subject:message-id;
  bh=BtOR4q9qE018zObNVydlsYcYNz5VXz7vmFQ6xMfBTRs=;
  b=ltYX54tdeFFc61G7fkhkqcu3DfhP1cEH173/dzkPesuyCqu9QFgitXcj
   gLVlL5b1yx6mBLwzWqG35UFF2Yp45qp1giRVS/B7Fk/FXMpOYw0b14Z1n
   UoN0DKdZWTS2N3ONgqF5nvjdVGfwZt4MbqPnrbZ0o7Zm1z1UFz6sgqPDp
   7OZyxfCHcANUZljEwj3ZilkqQRP8xrWMkGB+7DA09VCV0L4AImmVcsG8J
   Rv3uW7bNc87qCwczPN8ohvzbjYgrET6aoUiyFWVF9pMkSUm6S2gkhKLZP
   ImYfvD4GQCwNOObEEtwDmzY8UyVBWyWTRPXAZo0bCgiMkocZ56QP1CP+Y
   A==;
X-CSE-ConnectionGUID: 2d3g6IGvTDKp8YkNzDX38g==
X-CSE-MsgGUID: uUek/ApFSVeDI6j5OM/NNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87283425"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87283425"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 22:10:51 -0700
X-CSE-ConnectionGUID: dlh2YmT0R3KjJ5RhIGSQxg==
X-CSE-MsgGUID: JESQBxkWQy+oIx6Vbxth/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="288921579"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Aug 2026 22:10:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wukBr-00000000Xnq-3JCE;
	Fri, 14 Aug 2026 05:10:47 +0000
Date: Fri, 14 Aug 2026 13:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v3 22/30] net/rds/tcp.c:572:28: warning:
 unused variable 'ctx'
Message-ID: <202608141345.mpAz9iys-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v3
head:   b5c5a5b075f61f062cb2d253d35c118b8eecc40b
commit: aa01e0152a5063570b31fe61af5cb16eaa895a7b [22/30] sysctl: net: use ctl_field in RDS sysctls
config: arm-randconfig-003-20260814 (https://download.01.org/0day-ci/archive/20260814/202608141345.mpAz9iys-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141345.mpAz9iys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141345.mpAz9iys-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/rds/tcp.c: In function 'rds_tcp_init_net':
>> net/rds/tcp.c:572:28: warning: unused variable 'ctx' [-Wunused-variable]
     572 |         struct ctl_context ctx = {
         |                            ^~~
   net/rds/tcp.c: At top level:
>> net/rds/tcp.c:114:31: warning: 'rds_tcp_sysctl_table' defined but not used [-Wunused-const-variable=]
     114 | static const struct ctl_field rds_tcp_sysctl_table[] = {
         |                               ^~~~~~~~~~~~~~~~~~~~


vim +/ctx +572 net/rds/tcp.c

   569	
   570	static __net_init int rds_tcp_init_net(struct net *net)
   571	{
 > 572		struct ctl_context ctx = {
   573			.ns.net_ns = net,
   574		};
   575		struct rds_tcp_net *rtn = net_generic(net, rds_tcp_netid);
   576		int err = 0;
   577	
   578		memset(rtn, 0, sizeof(*rtn));
   579	
   580		mutex_init(&rtn->rds_tcp_accept_lock);
   581	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
