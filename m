Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C43F105B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 23:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788131835; cv=none; b=F31Hv729kze7d42i24Zm8bY61nvLsngLxtxfQIRUDiu/A+3gMjZUZ9XuspEdTB6fyfO7OCf3S2VzndhRGtZdxXOtWxzaiBCKJlvS4DSpKMyRVwVmwTyuTmIOMMPri/fgLfJKEEvXpJoxuQGgWU2wZMrMnKCqIA8UceCmS5BlmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788131835; c=relaxed/simple;
	bh=tbdtDTJ/v0bOoZ0O1N/VPnHU/nwdCuJdDEIjxVtfJhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nxfKnl6qcMh+UHqEGrXbqWa80MP/N89ulrGUNVLY1QtYwz5GgfXm4cvzEP07YLH8p+qA7AD0G5PNIw5Z2Gr4yRSRrS46VhwLCE7GVX2+bKWro+78TAa8Zq1WFOJnEP3lDzie9AGKAdZhqU+qgXYmkS6Kbj0QG2Vws8MRb/MYGqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnAid0zF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnAid0zF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788131833; x=1819667833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tbdtDTJ/v0bOoZ0O1N/VPnHU/nwdCuJdDEIjxVtfJhA=;
  b=BnAid0zFlsEMgdh08QKkeRXPtIGDRNhVQjE0n2bd4ZlkLmJpwHDKUzap
   oiCdq7HHuXwP/qjzGcgaoa0knS9NSuhd3H4Hyw9WKwD9L2NQy1A3+AGTS
   ltkqd5n0NstP3o4jLpUdLFqNN0boPXB0ZAYtS00O7CU28KZyTs8yyLknD
   HHmC4b5xksCdwLzXr//oxxhaTLA/MUJ6vInBdbnD2f29h+teiCRhQINtF
   hqUD3S2P4zCWuToI7xjSsodhVAkEeWeGWw9oJc8GRWKbeKr8tRvIOHrCS
   Z0m8ckB1Ls45DVvxdW3m5eKZCuz3XEHC7A0mDiR2vyKr+Ot1msQQ1xkf3
   g==;
X-CSE-ConnectionGUID: GPm4fDq7S/y+0XDIjUlf9w==
X-CSE-MsgGUID: nP+PNXY/Q0Kn9S79Bw1jbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88299704"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88299704"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 16:17:12 -0700
X-CSE-ConnectionGUID: Oohsh89URXudyatG5uCZaw==
X-CSE-MsgGUID: +UJXjKwYR3mC4f3aw3y2Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292142438"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2026 16:17:11 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0olx-000000000Gt-1UUF;
	Sun, 30 Aug 2026 23:17:09 +0000
Date: Mon, 31 Aug 2026 01:16:12 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_context.c:1733:49:
 warning: '%s' directive output may be truncated writing up to 63 bytes into a
 region of size 24
Message-ID: <202608310136.6yOAGoKr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/treewide-Get-rid-of-get_task_comm/20260827-152300
head:   0468e596e7692d0874d82d22272c5759279e96fb
commit: 49cbe4f51427d31478bfbfb63afb27b312ca5a16 sched: Extend task command name with TASK_COMM_EXT_LEN
date:   3 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260831/202608310136.6yOAGoKr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310136.6yOAGoKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310136.6yOAGoKr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_context.c: In function 'gem_context_register':
>> drivers/gpu/drm/i915/gem/i915_gem_context.c:1733:49: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 24 [-Wformat-truncation=]
    1733 |         snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
         |                                                 ^~
   drivers/gpu/drm/i915/gem/i915_gem_context.c:1733:9: note: 'snprintf' output between 4 and 77 bytes into a destination of size 24
    1733 |         snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1734 |                  current->comm, pid_nr(ctx->pid));
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nouveau/nouveau_drm.c: In function 'nouveau_drm_open':
>> drivers/gpu/drm/nouveau/nouveau_drm.c:1233:39: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 32 [-Wformat-truncation=]
    1233 |         snprintf(name, sizeof(name), "%s[%d]",
         |                                       ^~
   drivers/gpu/drm/nouveau/nouveau_drm.c:1233:9: note: 'snprintf' output between 4 and 77 bytes into a destination of size 32
    1233 |         snprintf(name, sizeof(name), "%s[%d]",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1234 |                  current->comm, pid_nr(rcu_dereference(fpriv->pid)));
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nouveau/nouveau_chan.c: In function 'nouveau_channel_ctor':
>> drivers/gpu/drm/nouveau/nouveau_chan.c:336:58: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 32 [-Wformat-truncation=]
     336 |         snprintf(args->name, __member_size(args->name), "%s[%d]",
         |                                                          ^~
   drivers/gpu/drm/nouveau/nouveau_chan.c:336:9: note: 'snprintf' output between 4 and 77 bytes into a destination of size 32
     336 |         snprintf(args->name, __member_size(args->name), "%s[%d]",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     337 |                  current->comm, task_pid_nr(current));
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1733 drivers/gpu/drm/i915/gem/i915_gem_context.c

254f965c39e391 drivers/gpu/drm/i915/i915_gem_context.c     Ben Widawsky   2012-06-04  1716  
bed4b455cf5374 drivers/gpu/drm/i915/gem/i915_gem_context.c Rob Clark      2023-01-03  1717  /*
bed4b455cf5374 drivers/gpu/drm/i915/gem/i915_gem_context.c Rob Clark      2023-01-03  1718   * Note that this implicitly consumes the ctx reference, by placing
bed4b455cf5374 drivers/gpu/drm/i915/gem/i915_gem_context.c Rob Clark      2023-01-03  1719   * the ctx in the context_xa.
bed4b455cf5374 drivers/gpu/drm/i915/gem/i915_gem_context.c Rob Clark      2023-01-03  1720   */
a4c1cdd34e2cda drivers/gpu/drm/i915/gem/i915_gem_context.c Faith Ekstrand 2021-07-08  1721  static void gem_context_register(struct i915_gem_context *ctx,
c100777cc00ce9 drivers/gpu/drm/i915/gem/i915_gem_context.c Tvrtko Ursulin 2019-12-24  1722  				 struct drm_i915_file_private *fpriv,
a4c1cdd34e2cda drivers/gpu/drm/i915/gem/i915_gem_context.c Faith Ekstrand 2021-07-08  1723  				 u32 id)
3aa9945a528e76 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-03-21  1724  {
eb4dedae920a07 drivers/gpu/drm/i915/gem/i915_gem_context.c Chris Wilson   2020-07-30  1725  	struct drm_i915_private *i915 = ctx->i915;
a4c1cdd34e2cda drivers/gpu/drm/i915/gem/i915_gem_context.c Faith Ekstrand 2021-07-08  1726  	void *old;
3aa9945a528e76 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-03-21  1727  
3aa9945a528e76 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-03-21  1728  	ctx->file_priv = fpriv;
a4e7ccdac38ec8 drivers/gpu/drm/i915/gem/i915_gem_context.c Chris Wilson   2019-10-04  1729  
3aa9945a528e76 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-03-21  1730  	ctx->pid = get_task_pid(current, PIDTYPE_PID);
43c504607dc3e5 drivers/gpu/drm/i915/gem/i915_gem_context.c Tvrtko Ursulin 2022-04-01  1731  	ctx->client = i915_drm_client_get(fpriv->client);
43c504607dc3e5 drivers/gpu/drm/i915/gem/i915_gem_context.c Tvrtko Ursulin 2022-04-01  1732  
fc4f125d958f4e drivers/gpu/drm/i915/gem/i915_gem_context.c Chris Wilson   2019-11-11 @1733  	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
3aa9945a528e76 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-03-21  1734  		 current->comm, pid_nr(ctx->pid));
3aa9945a528e76 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-03-21  1735  
49bd54b390c209 drivers/gpu/drm/i915/gem/i915_gem_context.c Tvrtko Ursulin 2022-04-01  1736  	spin_lock(&ctx->client->ctx_lock);
49bd54b390c209 drivers/gpu/drm/i915/gem/i915_gem_context.c Tvrtko Ursulin 2022-04-01  1737  	list_add_tail_rcu(&ctx->client_link, &ctx->client->ctx_list);
49bd54b390c209 drivers/gpu/drm/i915/gem/i915_gem_context.c Tvrtko Ursulin 2022-04-01  1738  	spin_unlock(&ctx->client->ctx_lock);
49bd54b390c209 drivers/gpu/drm/i915/gem/i915_gem_context.c Tvrtko Ursulin 2022-04-01  1739  
eb4dedae920a07 drivers/gpu/drm/i915/gem/i915_gem_context.c Chris Wilson   2020-07-30  1740  	spin_lock(&i915->gem.contexts.lock);
eb4dedae920a07 drivers/gpu/drm/i915/gem/i915_gem_context.c Chris Wilson   2020-07-30  1741  	list_add_tail(&ctx->link, &i915->gem.contexts.list);
eb4dedae920a07 drivers/gpu/drm/i915/gem/i915_gem_context.c Chris Wilson   2020-07-30  1742  	spin_unlock(&i915->gem.contexts.lock);
bed4b455cf5374 drivers/gpu/drm/i915/gem/i915_gem_context.c Rob Clark      2023-01-03  1743  
bed4b455cf5374 drivers/gpu/drm/i915/gem/i915_gem_context.c Rob Clark      2023-01-03  1744  	/* And finally expose ourselves to userspace via the idr */
bed4b455cf5374 drivers/gpu/drm/i915/gem/i915_gem_context.c Rob Clark      2023-01-03  1745  	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
bed4b455cf5374 drivers/gpu/drm/i915/gem/i915_gem_context.c Rob Clark      2023-01-03  1746  	WARN_ON(old);
3aa9945a528e76 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-03-21  1747  }
3aa9945a528e76 drivers/gpu/drm/i915/i915_gem_context.c     Chris Wilson   2019-03-21  1748  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
