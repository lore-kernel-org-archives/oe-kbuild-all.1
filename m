Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A61922F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727711059; cv=none; b=LI4CBEOF070w0gH5ySfaf6JbnQMrtSi3HtOTwXZ7KqCwBJv/5ulwp9G5cvaBF//kidjLGG+8fAfIgLILwsds1F0kbv2EqurXwdm7wCXKm2lKjswCMuIyoECPY/+FvL46q12jTA81WBtT4wMvfGxsTOFd+iQUl6Bahkgd7mor9bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727711059; c=relaxed/simple;
	bh=FYniBTHnRswEhFv8p+aWwUFDa0x+f3zLNmbIy+u4VDc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=pSSbKKu2SlnJPYe+z6vdC5ILTSoCZqtOk9PXhgF9mg26dYcL9dS3U0MyMKwizcv9P5J2pg9nR2veirRA4XoePNeuXQMjUGQH19gxts8hkn1a1MNA0RrkRq4fBP9jU6G6Inpkl/7PG8zM2UJSrAhKQWwcBHu8hNMlhVvyezMOgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=YvivWYIQ; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="YvivWYIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=bY/0f3CNjhpx/FyFd42O0wfTb7Is37oQ67w3+Wwi7iU=;
  b=YvivWYIQCmF94LId8xDFQ8JVfrhXCx/PQUi5hsc2ZBq7FddXXSOBOsNl
   eKKErMOGASlbpTmqLFFKl3XokQgZU+IyVzX7uxoTLDUz9Ly94TlARVdV2
   rVABHdCYl9L164fFMMAVnQsK6u+iqOwsBeW769wd9ATHPv4/nSYK50wxN
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,166,1725314400"; 
   d="scan'208";a="186033570"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 17:44:15 +0200
Date: Mon, 30 Sep 2024 17:44:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Boris Brezillon <bbrezillon@kernel.org>, 
    Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org, 
    oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/panthor/panthor_sched.c:2024:15-20: ERROR: invalid
 reference to the index variable of the iterator on line 1997 (fwd)
Message-ID: <e872f55b-ca2a-df9d-1f63-8b9b1612d67@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The use of group on line 2024 does not look right to me.  It's not
pointing to a meaningful value at this point.

julia

---------- Forwarded message ----------
Date: Mon, 30 Sep 2024 23:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/panthor/panthor_sched.c:2024:15-20: ERROR: invalid
    reference to the index variable of the iterator on line 1997

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Boris Brezillon <bbrezillon@kernel.org>
CC: Steven Price <steven.price@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: d72f049087d4f973f6332b599c92177e718107de drm/panthor: Allow driver compilation
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r064-20240930 (https://download.01.org/0day-ci/archive/20240930/202409302306.UDikqa03-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409302306.UDikqa03-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panthor/panthor_sched.c:2024:15-20: ERROR: invalid reference to the index variable of the iterator on line 1997
   drivers/gpu/drm/panthor/panthor_sched.c:2024:15-20: ERROR: invalid reference to the index variable of the iterator on line 2027

vim +2024 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  1988
de85488138247d Boris Brezillon 2024-02-29  1989  static void
de85488138247d Boris Brezillon 2024-02-29  1990  tick_ctx_cleanup(struct panthor_scheduler *sched,
de85488138247d Boris Brezillon 2024-02-29  1991  		 struct panthor_sched_tick_ctx *ctx)
de85488138247d Boris Brezillon 2024-02-29  1992  {
de85488138247d Boris Brezillon 2024-02-29  1993  	struct panthor_group *group, *tmp;
de85488138247d Boris Brezillon 2024-02-29  1994  	u32 i;
de85488138247d Boris Brezillon 2024-02-29  1995
de85488138247d Boris Brezillon 2024-02-29  1996  	for (i = 0; i < ARRAY_SIZE(ctx->old_groups); i++) {
de85488138247d Boris Brezillon 2024-02-29 @1997  		list_for_each_entry_safe(group, tmp, &ctx->old_groups[i], run_node) {
de85488138247d Boris Brezillon 2024-02-29  1998  			/* If everything went fine, we should only have groups
de85488138247d Boris Brezillon 2024-02-29  1999  			 * to be terminated in the old_groups lists.
de85488138247d Boris Brezillon 2024-02-29  2000  			 */
de85488138247d Boris Brezillon 2024-02-29  2001  			drm_WARN_ON(&group->ptdev->base, !ctx->csg_upd_failed_mask &&
de85488138247d Boris Brezillon 2024-02-29  2002  				    group_can_run(group));
de85488138247d Boris Brezillon 2024-02-29  2003
de85488138247d Boris Brezillon 2024-02-29  2004  			if (!group_can_run(group)) {
de85488138247d Boris Brezillon 2024-02-29  2005  				list_del_init(&group->run_node);
de85488138247d Boris Brezillon 2024-02-29  2006  				list_del_init(&group->wait_node);
de85488138247d Boris Brezillon 2024-02-29  2007  				group_queue_work(group, term);
de85488138247d Boris Brezillon 2024-02-29  2008  			} else if (group->csg_id >= 0) {
de85488138247d Boris Brezillon 2024-02-29  2009  				list_del_init(&group->run_node);
de85488138247d Boris Brezillon 2024-02-29  2010  			} else {
de85488138247d Boris Brezillon 2024-02-29  2011  				list_move(&group->run_node,
de85488138247d Boris Brezillon 2024-02-29  2012  					  group_is_idle(group) ?
de85488138247d Boris Brezillon 2024-02-29  2013  					  &sched->groups.idle[group->priority] :
de85488138247d Boris Brezillon 2024-02-29  2014  					  &sched->groups.runnable[group->priority]);
de85488138247d Boris Brezillon 2024-02-29  2015  			}
de85488138247d Boris Brezillon 2024-02-29  2016  			group_put(group);
de85488138247d Boris Brezillon 2024-02-29  2017  		}
de85488138247d Boris Brezillon 2024-02-29  2018  	}
de85488138247d Boris Brezillon 2024-02-29  2019
de85488138247d Boris Brezillon 2024-02-29  2020  	for (i = 0; i < ARRAY_SIZE(ctx->groups); i++) {
de85488138247d Boris Brezillon 2024-02-29  2021  		/* If everything went fine, the groups to schedule lists should
de85488138247d Boris Brezillon 2024-02-29  2022  		 * be empty.
de85488138247d Boris Brezillon 2024-02-29  2023  		 */
de85488138247d Boris Brezillon 2024-02-29 @2024  		drm_WARN_ON(&group->ptdev->base,
de85488138247d Boris Brezillon 2024-02-29  2025  			    !ctx->csg_upd_failed_mask && !list_empty(&ctx->groups[i]));
de85488138247d Boris Brezillon 2024-02-29  2026
de85488138247d Boris Brezillon 2024-02-29  2027  		list_for_each_entry_safe(group, tmp, &ctx->groups[i], run_node) {
de85488138247d Boris Brezillon 2024-02-29  2028  			if (group->csg_id >= 0) {
de85488138247d Boris Brezillon 2024-02-29  2029  				list_del_init(&group->run_node);
de85488138247d Boris Brezillon 2024-02-29  2030  			} else {
de85488138247d Boris Brezillon 2024-02-29  2031  				list_move(&group->run_node,
de85488138247d Boris Brezillon 2024-02-29  2032  					  group_is_idle(group) ?
de85488138247d Boris Brezillon 2024-02-29  2033  					  &sched->groups.idle[group->priority] :
de85488138247d Boris Brezillon 2024-02-29  2034  					  &sched->groups.runnable[group->priority]);
de85488138247d Boris Brezillon 2024-02-29  2035  			}
de85488138247d Boris Brezillon 2024-02-29  2036  			group_put(group);
de85488138247d Boris Brezillon 2024-02-29  2037  		}
de85488138247d Boris Brezillon 2024-02-29  2038  	}
de85488138247d Boris Brezillon 2024-02-29  2039  }
de85488138247d Boris Brezillon 2024-02-29  2040

:::::: The code at line 2024 was first introduced by commit
:::::: de85488138247d034eb3241840424a54d660926b drm/panthor: Add the scheduler logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
