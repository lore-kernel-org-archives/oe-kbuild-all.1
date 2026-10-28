Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225655;
	b=lSVS0NdvW6CiGv0OAAmYMUNWYu81i4cN0a5WokxVJDQJTR1dyLytQNSj2pOMKkP1pumW
	 xmLI16TTIbOpoyY/8m2EJpEd73Z6Cd1MS7ZGJCLKGcNjX/W5TkcgTA4cXK8z4f+OOySLI
	 TSNnZyTOUs8b07auViTTKOpWZigi2mn482xbXmqYZ8C9P+p/CHRjRzCLZbLvToIvPa5vS
	 os0WleCbEWYGKQUrzCyw1D1JCjeIM0Mog3VAiCw+IRl5NHWFzWUYKlwnt8JNDhfMS0c0p
	 UI2av7c3ddW0I9hYPaBLO1zuac4uh1Sl5W2HHwO0RSTglCjdmGoCNaPu/zBMP1v/W3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225655;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CPAQ5aEe1+o5nluWzz/DBPwd6eX5zlu5pB/TxmtERq4=;
	b=gCYAxaGFOx2TJTFF9MNsZcmi6xGmJu74W87s5tgKZBOyUWffchlAkAQZIdkmlrordzXw
	 GSZNnFWUPR+fU4tqxd8ip8lHLZxr8r/zxG7JXZhlDr2xNoWpg89dgLoPJClQQ5miyFrqd
	 fs8g8Qaonyc0Umy99wiYwmKBA1pxgV2BDV+Z9FRIxcU6nczLVHEMfEmanV69s6xNkvtPw
	 MFWN8ikaFOb/M+EDXLR/Ue4ChZYywPyGyRcxX4/taTNZvD5V9s2LYS/VCgP1Fuh2lVnu0
	 OHC59qeHjGPsoY25MyxfFMmorMoTLZ36PrKRgaRGIyUDZ8LAdUUFnWA+9MJEWyt0+8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JXLcLIdH;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE9606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 22:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JXLcLIdH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793225653; x=1824761653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ru4HLyyM7que5XLxorAZZQbmon96ZOZDe/PoRiF9CaQ=;
  b=JXLcLIdHuRiX2LAtETjGwBLbcXRZ1VpX8zuy3Gtj7Yy4FxVJnAqjn/xa
   hYGAg52TrjWSProcBkpcxY1mpmhtxRaD+PweuBh01FmdkxrNrg2SEswWP
   8KEYWORitUhKMDdk2r0qj0FbT3npoKYKB33b4oaL04VY+ztxsenBbwmwE
   23pGrENc9F5d4itJzdxe1JG3odVRtHj6nO0S+XPvUd64KstdnPVBx7dBE
   7ngZOlQAfKobn6yreosuhR4PePH+WtF3HngGz+kdU8ovXxLcqo2SzI4py
   ezM2qr12LzuGu4uzzVQOZMMq0wH7OKPE+lGhgNHtHottzYfyifT3D1N1v
   g==;
X-CSE-ConnectionGUID: WB/fK7A+QmiZ6rDHQulaOg==
X-CSE-MsgGUID: ooVyz2m2QzitJaXKyRqyfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1839760"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1839760"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 15:14:13 -0700
X-CSE-ConnectionGUID: bTot76MXTrqL7upPlI0thA==
X-CSE-MsgGUID: ZKmjVt3TQzClSrc191RMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5053514"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2026 15:14:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMBuL-00000000ZIa-0xkB;
	Wed, 28 Oct 2026 22:14:09 +0000
Date: Thu, 29 Oct 2026 06:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	netfilter-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf,v3] netfilter: nfnetlink_queue: restrict NFQA_EXP to
 userspace helpers
Message-ID: <202610290533.P0h5GHpa-lkp@intel.com>
References: <20261022154644.2002766-1-pablo@netfilter.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022154644.2002766-1-pablo@netfilter.org>

Hi Pablo,

kernel test robot noticed the following build errors:

[auto build test ERROR on netfilter-nf/main]
[also build test ERROR on nf-next/main linus/master v7.3 next-20261027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nfnetlink_queue-restrict-NFQA_EXP-to-userspace-helpers/20261022-174644
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20261022154644.2002766-1-pablo%40netfilter.org
patch subject: [PATCH nf,v3] netfilter: nfnetlink_queue: restrict NFQA_EXP to userspace helpers
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20261029/202610290533.P0h5GHpa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290533.P0h5GHpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290533.P0h5GHpa-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/nfnetlink_queue.c: In function 'nfqnl_ct_parse':
>> net/netfilter/nfnetlink_queue.c:1770:25: error: implicit declaration of function 'nf_queue_hook_entries' [-Wimplicit-function-declaration]
    1770 |                 hooks = nf_queue_hook_entries(entry);
         |                         ^~~~~~~~~~~~~~~~~~~~~
>> net/netfilter/nfnetlink_queue.c:1770:23: error: assignment to 'const struct nf_hook_entries *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1770 |                 hooks = nf_queue_hook_entries(entry);
         |                       ^


vim +/nf_queue_hook_entries +1770 net/netfilter/nfnetlink_queue.c

  1748	
  1749	static struct nf_conn *nfqnl_ct_parse(const struct nfnl_ct_hook *nfnl_ct,
  1750					      const struct nlmsghdr *nlh,
  1751					      const struct nlattr * const nfqa[],
  1752					      struct nf_queue_entry *entry,
  1753					      enum ip_conntrack_info *ctinfo)
  1754	{
  1755	#if IS_ENABLED(CONFIG_NF_CONNTRACK)
  1756		struct nf_conn *ct;
  1757	
  1758		ct = nf_ct_get(entry->skb, ctinfo);
  1759		if (ct == NULL)
  1760			return NULL;
  1761	
  1762		if (nfnl_ct->parse(nfqa[NFQA_CT], ct) < 0)
  1763			return NULL;
  1764	
  1765		if (nfqa[NFQA_EXP]) {
  1766			const struct nf_hook_entries *hooks;
  1767			struct nf_hook_ops **ops;
  1768			unsigned int i;
  1769	
> 1770			hooks = nf_queue_hook_entries(entry);
  1771			if (!hooks)
  1772				return NULL;
  1773	
  1774			ops = nf_hook_entries_get_hook_ops(hooks);
  1775			if (!ops)
  1776				return NULL;
  1777	
  1778			i = entry->hook_index;
  1779			if (i >= hooks->num_hook_entries)
  1780				return NULL;
  1781	
  1782			if (nfqnl_hook_exp_support(ops[i])) {
  1783				nfnl_ct->attach_expect(nfqa[NFQA_EXP], ct,
  1784						       NETLINK_CB(entry->skb).portid,
  1785						       nlmsg_report(nlh));
  1786			}
  1787		}
  1788		return ct;
  1789	#else
  1790		return NULL;
  1791	#endif
  1792	}
  1793	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
