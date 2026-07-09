Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715543AEB5F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 06:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783577110; cv=none; b=k+CoPBhusOddfffoTcN/8rPvZbMtcK3YpEbUgtrlfTQn8rWcm530az9p8kL2UFHHEN/iT4c10phiNxHvISEFhtI0zboByw2ltoWbdhsR+DEnUT2HJ3pjGx9osSvkvwYOv7dB1fiszBYX0sDUoSrzdOW6ccS9RG4xKxh2faPXAHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783577110; c=relaxed/simple;
	bh=NTiZq1PZ3rEuGm8qfINmmOXzBWcfa926lYHYu9M3jGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FVHIRXtUF0+bdsScASxOY0bi008x+bIQH01j/vpl3xbsc/uvuXhlweUknalmh8kx5QjDjmXMyizOeRYug/HyB8iqiBifPwKDoprrZpmeYf0fzDX8xzvpC6xVSdPoAGtLI+jDkbfuSa80iuPMh7MU58T29px5qbXUaTlMgdFhTmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qfvtfu7O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qfvtfu7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783577107; x=1815113107;
  h=date:from:to:cc:subject:message-id;
  bh=NTiZq1PZ3rEuGm8qfINmmOXzBWcfa926lYHYu9M3jGM=;
  b=Qfvtfu7OPbe4zxAV3BwZqzEZBxGQXSxRuPSpGbJzfeJ5cSQ4daOiygSE
   vCN4QlSUqUghi1esqIszpMpVtbE+Gq6GkfOKNHkQrP1XqVaxzMSgJuIHY
   nMecv2GK4Oz+ickb4AqyGIg37oZQalGTO676Uh49iSbkDQw33CxazQyKO
   xDcgPHYfqSI63Z5OYFZMz22mY+Vsx3HZbwWlADrlu9/UWnDZadyyA/Fx3
   /tsaLrZau8BAq+r01BqA7uSZqrpH58B8Uvu5SEjb8EkscYKhlvEciDgn+
   2ZnwZ5sv+OirhyKaS8ZlJWFiCmMkso7bJm/yOA42/Y7OwfM7W6MbUlj/v
   w==;
X-CSE-ConnectionGUID: m1AlTCwSSf2MgNpR99571w==
X-CSE-MsgGUID: G8Sy4xudQqK/uLYElP+4hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94897787"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94897787"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 23:05:06 -0700
X-CSE-ConnectionGUID: EW7wH6PPSwil4UzR7KMQgA==
X-CSE-MsgGUID: UNdBhh2XTqSmLPq3nauJJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252739676"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2026 23:05:06 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whhsd-000000002uf-1srn;
	Thu, 09 Jul 2026 06:05:03 +0000
Date: Thu, 09 Jul 2026 08:04:58 +0200
From: kernel test robot <lkp@intel.com>
To: Phil Sutter <phil@nwl.cc>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/netfilter/nfnetlink_hook.c:375:30: error: expected ';'
 before 'i'
Message-ID: <202607090756.JkceYUnw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Phil-Sutter/netfilter-nfnetlink_hook-Pass-cb-object-to-nfnl_hook_dump_nat/20260709-004129
head:   82b3ae63423bde6a0a2c963376b2feab3c1d404b
commit: 82b3ae63423bde6a0a2c963376b2feab3c1d404b netfilter: nfnetlink_hook: Fix for concurrent NAT hooks dump and change
date:   13 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260709/202607090756.JkceYUnw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090756.JkceYUnw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090756.JkceYUnw-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/nfnetlink_hook.c: In function 'nfnl_hook_dump_nat':
>> net/netfilter/nfnetlink_hook.c:375:30: error: expected ';' before 'i'
     375 |                 ctx->natv = 0
         |                              ^
         |                              ;
     376 |                 i = 0;
         |                 ~             


vim +375 net/netfilter/nfnetlink_hook.c

   340	
   341	static int nfnl_hook_dump_nat(struct sk_buff *nlskb,
   342				      struct netlink_callback *cb,
   343				      const struct nf_hook_ops *ops, int family)
   344	{
   345		struct nf_nat_lookup_hook_priv *priv = ops->priv;
   346		struct nf_hook_entries *e = rcu_dereference(priv->entries);
   347		struct nfnl_dump_hook_data *ctx = cb->data;
   348		struct nf_hook_ops **nat_ops;
   349		unsigned int i = cb->args[1];
   350		int err = 0;
   351	
   352		if (!e)
   353			return 0;
   354	
   355		if (!ctx->natv)
   356			ctx->natv = (unsigned long)e;
   357	
   358		if (i >= e->num_hook_entries ||
   359		    ctx->natv != (unsigned long)e) {
   360			cb->seq++;
   361			return -EINTR;
   362		}
   363	
   364		nat_ops = nf_hook_entries_get_hook_ops(e);
   365	
   366		for (; i < e->num_hook_entries; i++) {
   367			err = nfnl_hook_dump_one(nlskb, ctx, nat_ops[i],
   368						 ops->priority, family,
   369						 cb->nlh->nlmsg_seq);
   370			if (err)
   371				break;
   372		}
   373	
   374		if (!err) {
 > 375			ctx->natv = 0
   376			i = 0;
   377		}
   378		cb->args[1] = i;
   379		return err;
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
