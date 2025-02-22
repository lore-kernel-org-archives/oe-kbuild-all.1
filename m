Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89B2080D6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740221535; cv=none; b=UcbQRf3LHCMVoJY046TaLLbdeTgkTV0/EhAkFMYuxVPoFb8WADkQNfQQLRP27F+QFK/+DqyxhxNzeh5Nv3vKhTKy+vl7WU6g1kowi+kpiTujLVDDXgN6zQdYo6kLxASOcKxKxY2rs5znIpl+3dpMBcIiI8d3GzkR7VPHjThKrwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740221535; c=relaxed/simple;
	bh=XpV1u0D3ymjR25Dw9jhC/izd1YLGQHJN0/+KHCr9hN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DMsZ58ih3O4ujxKhfv5Mx6JGRhXiUJaMUoAMFr7M+K5EbfZV7ulKBWMqwabld3B0C/U0dfruK0z3Epw07YheVTxmrVRICWOYce+lGFObMPxsmfcG+Wh0l1/5zXQOnwgKfSWK/HdBR7VjTKjfpWpfG7g5fJ08Wnine54UlQQ6DeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8DALuSn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8DALuSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740221533; x=1771757533;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XpV1u0D3ymjR25Dw9jhC/izd1YLGQHJN0/+KHCr9hN8=;
  b=W8DALuSnayCAGZ7TW/KjY7Wa1Aaq1xAOujtdDnMMg5P1xZNeTAsFsbbc
   BwhFKNGmdCH2FiLRQ30OKoAX9NkXTL9n9rDh4ZT7NmezZ53D3Z5LZsDee
   o4Wp87QSW1JOC3C4F2yZ6fWZRufu6UBsJb/PpMpBs0us8dY+LqsU9GTfK
   k+00LcZZe5E5+xNgn6x2Hr7678+yTCWZCgHS+ix3cB/HGBgo2aq2WZQS0
   YedUuKmhBGWeq7dF8I4JW8lWWKcrRKqcvdAjBPPcVMuYKZsgi9fXAShZZ
   7HjwHEN+KFKpy+NuMG60C7pwKACAmMIuJCehb2AKRXsKIpE7LzubKHjR1
   w==;
X-CSE-ConnectionGUID: zDGbgVDZTv+cVLsWErgROg==
X-CSE-MsgGUID: EZqx6nAaQdaXqsRf6oqUug==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40226554"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="40226554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 02:52:13 -0800
X-CSE-ConnectionGUID: aqT4y3t3TG6el2PaJvZhjw==
X-CSE-MsgGUID: CfGBYWy3T+a8Elx56WEw0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="116125119"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2025 02:52:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tln7B-0006Ur-1a;
	Sat, 22 Feb 2025 10:52:09 +0000
Date: Sat, 22 Feb 2025 18:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 12/42]
 security/selinux/netnode.c:105: warning: Function parameter or struct member
 'state' not described in 'sel_netnode_find'
Message-ID: <202502221851.LrLcsP3U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   8e33da6864e173556431920c74deb653617db98e
commit: 897e85169ad60085853a3d494489bf6ab7dac182 [12/42] selinux: update hook functions to use correct selinux namespace
config: i386-buildonly-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221851.LrLcsP3U-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221851.LrLcsP3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221851.LrLcsP3U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/selinux/netnode.c:105: warning: Function parameter or struct member 'state' not described in 'sel_netnode_find'


vim +105 security/selinux/netnode.c

224dfbd81e1ff67 Paul Moore         2008-01-29   92  
224dfbd81e1ff67 Paul Moore         2008-01-29   93  /**
224dfbd81e1ff67 Paul Moore         2008-01-29   94   * sel_netnode_find - Search for a node record
224dfbd81e1ff67 Paul Moore         2008-01-29   95   * @addr: IP address
224dfbd81e1ff67 Paul Moore         2008-01-29   96   * @family: address family
224dfbd81e1ff67 Paul Moore         2008-01-29   97   *
224dfbd81e1ff67 Paul Moore         2008-01-29   98   * Description:
224dfbd81e1ff67 Paul Moore         2008-01-29   99   * Search the network node table and return the record matching @addr.  If an
224dfbd81e1ff67 Paul Moore         2008-01-29  100   * entry can not be found in the table return NULL.
224dfbd81e1ff67 Paul Moore         2008-01-29  101   *
224dfbd81e1ff67 Paul Moore         2008-01-29  102   */
897e85169ad6008 Stephen Smalley    2024-09-11  103  static struct sel_netnode *sel_netnode_find(struct selinux_state *state,
897e85169ad6008 Stephen Smalley    2024-09-11  104  					    const void *addr, u16 family)
224dfbd81e1ff67 Paul Moore         2008-01-29 @105  {
a639e7ca8e8282b Paul Moore         2008-04-25  106  	unsigned int idx;
224dfbd81e1ff67 Paul Moore         2008-01-29  107  	struct sel_netnode *node;
224dfbd81e1ff67 Paul Moore         2008-01-29  108  
224dfbd81e1ff67 Paul Moore         2008-01-29  109  	switch (family) {
224dfbd81e1ff67 Paul Moore         2008-01-29  110  	case PF_INET:
73073d956a20735 Christian Göttsche 2022-01-25  111  		idx = sel_netnode_hashfn_ipv4(*(const __be32 *)addr);
224dfbd81e1ff67 Paul Moore         2008-01-29  112  		break;
224dfbd81e1ff67 Paul Moore         2008-01-29  113  	case PF_INET6:
224dfbd81e1ff67 Paul Moore         2008-01-29  114  		idx = sel_netnode_hashfn_ipv6(addr);
224dfbd81e1ff67 Paul Moore         2008-01-29  115  		break;
224dfbd81e1ff67 Paul Moore         2008-01-29  116  	default:
224dfbd81e1ff67 Paul Moore         2008-01-29  117  		BUG();
a35c6c8368d88de Eric Paris         2011-04-20  118  		return NULL;
224dfbd81e1ff67 Paul Moore         2008-01-29  119  	}
224dfbd81e1ff67 Paul Moore         2008-01-29  120  
a639e7ca8e8282b Paul Moore         2008-04-25  121  	list_for_each_entry_rcu(node, &sel_netnode_hash[idx].list, list)
897e85169ad6008 Stephen Smalley    2024-09-11  122  		if (node->nsec.family == family && node->nsec.state == state)
224dfbd81e1ff67 Paul Moore         2008-01-29  123  			switch (family) {
224dfbd81e1ff67 Paul Moore         2008-01-29  124  			case PF_INET:
73073d956a20735 Christian Göttsche 2022-01-25  125  				if (node->nsec.addr.ipv4 == *(const __be32 *)addr)
224dfbd81e1ff67 Paul Moore         2008-01-29  126  					return node;
224dfbd81e1ff67 Paul Moore         2008-01-29  127  				break;
224dfbd81e1ff67 Paul Moore         2008-01-29  128  			case PF_INET6:
224dfbd81e1ff67 Paul Moore         2008-01-29  129  				if (ipv6_addr_equal(&node->nsec.addr.ipv6,
224dfbd81e1ff67 Paul Moore         2008-01-29  130  						    addr))
224dfbd81e1ff67 Paul Moore         2008-01-29  131  					return node;
224dfbd81e1ff67 Paul Moore         2008-01-29  132  				break;
224dfbd81e1ff67 Paul Moore         2008-01-29  133  			}
224dfbd81e1ff67 Paul Moore         2008-01-29  134  
224dfbd81e1ff67 Paul Moore         2008-01-29  135  	return NULL;
224dfbd81e1ff67 Paul Moore         2008-01-29  136  }
224dfbd81e1ff67 Paul Moore         2008-01-29  137  

:::::: The code at line 105 was first introduced by commit
:::::: 224dfbd81e1ff672eb46e7695469c395bd531083 SELinux: Add a network node caching mechanism similar to the sel_netif_*() functions

:::::: TO: Paul Moore <paul.moore@hp.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
