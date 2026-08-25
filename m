Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDBD3E51F5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646534; cv=none; b=BZc1CqiG+YmXm6S3/QKIkMQ8s8oM02wqCnd0N1sO1bo3DJlMEL0VrXW3yVkgYp+5LqR31yx3IlrdpTpWhpSF7Q/6h8Fh3sJ9zn0ne8AzEG6xp4RZrIyC2h6YgT2LrXiz9q1e0k57W50V7dUfzPDcDyGyGFdJ/zxkbjn04TZtKVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646534; c=relaxed/simple;
	bh=jdArGFLf2aXRU0ZwGFFQ9M6v9JBTq+P2CSh3fdQ+wGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Det3f7n0svjJB2jeNR5CgY0DadPQ1SIYsBnahqkvCyMIPQeGVO9WpuEG80dylS/URY939VCkWBrLP4bnClcyiiFKyXAHMwiKEv3w6KFy2RS3Ss1vtiXkElbINyUHuTpyLP5r/sxarJJIRzDX0c+u/IVYg522v3VzYQYejMwCIH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0ZKHV5x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0ZKHV5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787646532; x=1819182532;
  h=date:from:to:cc:subject:message-id;
  bh=jdArGFLf2aXRU0ZwGFFQ9M6v9JBTq+P2CSh3fdQ+wGA=;
  b=T0ZKHV5xzDVgGdpRroNXE1/x3xEeWJhP0GIxEKZUOMC5FEbyZtzoMBKz
   uhX13DfLoFBov9/rj02gZocAymmny3Dwxi7leX1UVoVhqCn+Q3BymIKUL
   A6kDY+GwHZSygd+sGMeBvdAC6C3jvsB5ZUmzug5Wfrgv0dhJD7I/WYN9s
   GxardDFEvAjc3euQSzGE9lsVSg22XE4uTZ7NeOCDOJq4ZOjK28/rlqSs5
   F8uxKdNOCzRZR97ri40NYdr9dz8z1kbdcjr2TWLVxVyuJ5XA77mrbbK3n
   AUdndtMJSQgvV1SB9ccTiy6AnqISFM4CGeGgWTSAB2MbGuX9TFs6JVn1g
   A==;
X-CSE-ConnectionGUID: 6mZdxQKUQ9mIzObK7SjEGg==
X-CSE-MsgGUID: 5S6pt2XoShOYCN0d8azumA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87055343"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87055343"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 01:28:51 -0700
X-CSE-ConnectionGUID: bVF4OYLtS6aLI1YTZ7fNeQ==
X-CSE-MsgGUID: HmfPC+A8Qfuk4JL7UkeYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="267798727"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 01:28:51 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wymWW-000000005Hn-277b;
	Tue, 25 Aug 2026 08:28:48 +0000
Date: Tue, 25 Aug 2026 16:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/232]
 fs/eventpoll.c:2008: warning: Function parameter or member 'ep' not described
 in 'ep_get_upwards_depth_proc'
Message-ID: <202608251815.PPutfrHU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jann,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   c61fd5b8b09deae047599969ab292b6bdb20b706
commit: 1b13b033062824495554e836a1ff5f85ccf6b039 [0/232] eventpoll: Fix semi-unbounded recursion
config: x86_64-randconfig-104-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251815.PPutfrHU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251815.PPutfrHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251815.PPutfrHU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/eventpoll.c:2008: warning: Function parameter or member 'ep' not described in 'ep_get_upwards_depth_proc'
   fs/eventpoll.c:2008: warning: Function parameter or member 'depth' not described in 'ep_get_upwards_depth_proc'


vim +2008 fs/eventpoll.c

  2003	
  2004	/**
  2005	 * ep_get_upwards_depth_proc - determine depth of @ep when traversed upwards
  2006	 */
  2007	static int ep_get_upwards_depth_proc(struct eventpoll *ep, int depth)
> 2008	{
  2009		int result = 0;
  2010		struct epitem *epi;
  2011	
  2012		if (ep->gen == loop_check_gen)
  2013			return ep->loop_check_depth;
  2014		hlist_for_each_entry_rcu(epi, &ep->refs, fllink)
  2015			result = max(result, ep_get_upwards_depth_proc(epi->ep, depth + 1) + 1);
  2016		ep->gen = loop_check_gen;
  2017		ep->loop_check_depth = result;
  2018		return result;
  2019	}
  2020	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
