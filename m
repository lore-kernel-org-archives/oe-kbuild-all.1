Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46199226548
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884779; cv=none; b=OWbrx7UiKEpVPmckhKvZjf4jdJ2mbiJx0kQTzTkZUmFZVh7nhUonZXm3ef/gWfAqF8e0LRg2L7kEEQybbugr35fWUzb6E0mrd6qpkHc81d/nfixQoNJFTtnYeL9WTZndGkG8G0ITloZkat7LrE9W/6EItaOpF1nc1IXGfmVDxDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884779; c=relaxed/simple;
	bh=8A1dXi50zr9jc//oHpIkLmhi+QMuAgkDHT8SH7tivVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVrD2NF0IKpvIDhOVbSGvvMAJ7kFGAWkzZZASOR7QKCA3l/czO03Pft6F9CXWFsu4Wju4jhxX7zl13jICYYIVPzvCDbpjkHbSLbxQ4h0BqeVHX5uoHyPv6EN9ryjMlH65L48/pNRzOPpRqcAqq4A2dQ/07ZjZHtMI3DV2UNV03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WW2a7+i9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WW2a7+i9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744884777; x=1776420777;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8A1dXi50zr9jc//oHpIkLmhi+QMuAgkDHT8SH7tivVs=;
  b=WW2a7+i9Yx742+Q8kVn3BCgLGezbuMvVoKuMYI/DT/81VBxwhQHaDy/u
   H3ibMEms+Un1oymYdIZV+/xSMsVjIfYP6VWumZrvzRK7R2vy1cC+7yZMC
   SQd7rlcugghs3DraHKI/2aeJXjsgMwMvg/KmIQyw1w8wFVI16ZeYPLydy
   vXes0TTE22353EU0706tseH1TAP5JCJHe5XGIRgiNyb2c8HMKqCSh3oO/
   TftCTkcpkw0j5CaBPIyNr2nXNZpWHprkgaEV97uPC9xX96+0Zz+mCR0F5
   XDo10/y21O+tWGGbOGglr5SGmGC4yDDh6sz/r06Z+Luq72yHfCHZRPkXq
   g==;
X-CSE-ConnectionGUID: 40Jqrg8dR5mG0cnebf1//g==
X-CSE-MsgGUID: it3CGNReQQKGewYRNDtDtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="56650604"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="56650604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:12:57 -0700
X-CSE-ConnectionGUID: Vw5lvglLQI+SQSKKnV+q0g==
X-CSE-MsgGUID: A9ZEDIp1RyWYxpxFOzxzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130621628"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Apr 2025 03:12:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5MEn-000MKy-0v;
	Thu, 17 Apr 2025 10:12:53 +0000
Date: Thu, 17 Apr 2025 18:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 43/43]
 security/selinux/netnode.c:215:41: warning: passing argument 3 of
 'security_node_sid' discards 'const' qualifier from pointer target type
Message-ID: <202504171816.Vy364LgL-lkp@intel.com>
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
head:   04731499aa0dc2b500ec1c264986b40637ef49cd
commit: 04731499aa0dc2b500ec1c264986b40637ef49cd [43/43] selinux: eliminate global SID table if !CONFIG_SECURITY_SELINUX_NS
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250417/202504171816.Vy364LgL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171816.Vy364LgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171816.Vy364LgL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/selinux/netnode.c: In function 'sel_netnode_sid_slow':
>> security/selinux/netnode.c:215:41: warning: passing argument 3 of 'security_node_sid' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     215 |                                         addr, sizeof(struct in_addr), sid);
         |                                         ^~~~
   In file included from security/selinux/include/avc.h:22,
                    from security/selinux/include/objsec.h:30,
                    from security/selinux/netnode.c:34:
   security/selinux/include/security.h:537:43: note: expected 'void *' but argument is of type 'const void *'
     537 |                                     void *addr, u32 addrlen, u32 *out_sid)
         |                                     ~~~~~~^~~~
   security/selinux/netnode.c:221:41: warning: passing argument 3 of 'security_node_sid' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     221 |                                         addr, sizeof(struct in6_addr), sid);
         |                                         ^~~~
   In file included from security/selinux/include/avc.h:22,
                    from security/selinux/include/objsec.h:30,
                    from security/selinux/netnode.c:34:
   security/selinux/include/security.h:537:43: note: expected 'void *' but argument is of type 'const void *'
     537 |                                     void *addr, u32 addrlen, u32 *out_sid)
         |                                     ~~~~~~^~~~


vim +215 security/selinux/netnode.c

224dfbd81e1ff6 Paul Moore         2008-01-29  178  
224dfbd81e1ff6 Paul Moore         2008-01-29  179  /**
224dfbd81e1ff6 Paul Moore         2008-01-29  180   * sel_netnode_sid_slow - Lookup the SID of a network address using the policy
10ec95a4e2dfdb Stephen Smalley    2024-09-11  181   * @state: the SELinux state
224dfbd81e1ff6 Paul Moore         2008-01-29  182   * @addr: the IP address
224dfbd81e1ff6 Paul Moore         2008-01-29  183   * @family: the address family
224dfbd81e1ff6 Paul Moore         2008-01-29  184   * @sid: node SID
224dfbd81e1ff6 Paul Moore         2008-01-29  185   *
224dfbd81e1ff6 Paul Moore         2008-01-29  186   * Description:
2c3d8dfecedd7f lihao              2020-07-07  187   * This function determines the SID of a network address by querying the
224dfbd81e1ff6 Paul Moore         2008-01-29  188   * security policy.  The result is added to the network address table to
224dfbd81e1ff6 Paul Moore         2008-01-29  189   * speedup future queries.  Returns zero on success, negative values on
224dfbd81e1ff6 Paul Moore         2008-01-29  190   * failure.
224dfbd81e1ff6 Paul Moore         2008-01-29  191   *
224dfbd81e1ff6 Paul Moore         2008-01-29  192   */
10ec95a4e2dfdb Stephen Smalley    2024-09-11  193  static int sel_netnode_sid_slow(struct selinux_state *state, const void *addr,
10ec95a4e2dfdb Stephen Smalley    2024-09-11  194  				u16 family, u32 *sid)
224dfbd81e1ff6 Paul Moore         2008-01-29  195  {
9b80c36353ed4c Paul Moore         2019-08-01  196  	int ret;
224dfbd81e1ff6 Paul Moore         2008-01-29  197  	struct sel_netnode *node;
9b80c36353ed4c Paul Moore         2019-08-01  198  	struct sel_netnode *new;
224dfbd81e1ff6 Paul Moore         2008-01-29  199  
224dfbd81e1ff6 Paul Moore         2008-01-29  200  	spin_lock_bh(&sel_netnode_lock);
10ec95a4e2dfdb Stephen Smalley    2024-09-11  201  	node = sel_netnode_find(state, addr, family);
224dfbd81e1ff6 Paul Moore         2008-01-29  202  	if (node != NULL) {
224dfbd81e1ff6 Paul Moore         2008-01-29  203  		*sid = node->nsec.sid;
a639e7ca8e8282 Paul Moore         2008-04-25  204  		spin_unlock_bh(&sel_netnode_lock);
a639e7ca8e8282 Paul Moore         2008-04-25  205  		return 0;
224dfbd81e1ff6 Paul Moore         2008-01-29  206  	}
9b80c36353ed4c Paul Moore         2019-08-01  207  
cde3b1b66f2de9 Christian Göttsche 2025-03-18  208  	/* If this memory allocation fails still return 0. The SID
cde3b1b66f2de9 Christian Göttsche 2025-03-18  209  	 * is valid, it just won't be added to the cache.
cde3b1b66f2de9 Christian Göttsche 2025-03-18  210  	 */
cde3b1b66f2de9 Christian Göttsche 2025-03-18  211  	new = kmalloc(sizeof(*new), GFP_ATOMIC);
224dfbd81e1ff6 Paul Moore         2008-01-29  212  	switch (family) {
224dfbd81e1ff6 Paul Moore         2008-01-29  213  	case PF_INET:
10ec95a4e2dfdb Stephen Smalley    2024-09-11  214  		ret = security_node_sid(state, PF_INET,
a639e7ca8e8282 Paul Moore         2008-04-25 @215  					addr, sizeof(struct in_addr), sid);
9b80c36353ed4c Paul Moore         2019-08-01  216  		if (new)
47a1a15645d558 Christian Göttsche 2025-03-18  217  			new->nsec.addr.ipv4 = *(const __be32 *)addr;
224dfbd81e1ff6 Paul Moore         2008-01-29  218  		break;
224dfbd81e1ff6 Paul Moore         2008-01-29  219  	case PF_INET6:
10ec95a4e2dfdb Stephen Smalley    2024-09-11  220  		ret = security_node_sid(state, PF_INET6,
a639e7ca8e8282 Paul Moore         2008-04-25  221  					addr, sizeof(struct in6_addr), sid);
9b80c36353ed4c Paul Moore         2019-08-01  222  		if (new)
47a1a15645d558 Christian Göttsche 2025-03-18  223  			new->nsec.addr.ipv6 = *(const struct in6_addr *)addr;
224dfbd81e1ff6 Paul Moore         2008-01-29  224  		break;
224dfbd81e1ff6 Paul Moore         2008-01-29  225  	default:
224dfbd81e1ff6 Paul Moore         2008-01-29  226  		BUG();
b04eea886409de Paul Moore         2013-07-23  227  		ret = -EINVAL;
224dfbd81e1ff6 Paul Moore         2008-01-29  228  	}
9b80c36353ed4c Paul Moore         2019-08-01  229  	if (ret == 0 && new) {
224dfbd81e1ff6 Paul Moore         2008-01-29  230  		new->nsec.family = family;
a639e7ca8e8282 Paul Moore         2008-04-25  231  		new->nsec.sid = *sid;
10ec95a4e2dfdb Stephen Smalley    2024-09-11  232  		new->nsec.state = get_selinux_state(state);
a639e7ca8e8282 Paul Moore         2008-04-25  233  		sel_netnode_insert(new);
9b80c36353ed4c Paul Moore         2019-08-01  234  	} else
9b80c36353ed4c Paul Moore         2019-08-01  235  		kfree(new);
224dfbd81e1ff6 Paul Moore         2008-01-29  236  
224dfbd81e1ff6 Paul Moore         2008-01-29  237  	spin_unlock_bh(&sel_netnode_lock);
9b80c36353ed4c Paul Moore         2019-08-01  238  	if (unlikely(ret))
67b0b4e4988f29 peter enderborg    2018-06-12  239  		pr_warn("SELinux: failure in %s(), unable to determine network node label\n",
67b0b4e4988f29 peter enderborg    2018-06-12  240  			__func__);
224dfbd81e1ff6 Paul Moore         2008-01-29  241  	return ret;
224dfbd81e1ff6 Paul Moore         2008-01-29  242  }
224dfbd81e1ff6 Paul Moore         2008-01-29  243  

:::::: The code at line 215 was first introduced by commit
:::::: a639e7ca8e8282b75be2724a28bfc788aa3bb156 SELinux: Made netnode cache adds faster

:::::: TO: Paul Moore <paul.moore@hp.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
