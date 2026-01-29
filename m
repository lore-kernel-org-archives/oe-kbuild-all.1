Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4393D2FFDF8;
	Thu, 29 Jan 2026 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679563; cv=none; b=NnClgwCSw01Z+eUAqn4IH2gcMbbhZ0G2Wpx8PaKPYLOktcIjYiWk416lYVHzzOK9ADJ4t36ShoVK7Xyy4vuBlsEBuJGfjV20sDrE6wzrElGs0wF9Ox7Nic05OIXaJROU4bma8k16YVSYlAvwFxjjpB/ocHBAyrnhX+mKEzK5DuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679563; c=relaxed/simple;
	bh=xSpkUgCzP9cX+cRelbgVCH4GtvR7DjdShJpL+cElgqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtDVLdcrV0v/Q3jJYBQa6m3NY8RIcb5Vm2KL8+KjMw245/O7vDU1qe5UYCE97tfkKBSMB1CiVvi3AOQSrz1YAQT/IhglFWLewI6TboPzNQQwD2CfwZ5j/prCtwEcaZ8DAieg7iIfJSUuJYV1LNrPLpunsCeEAmGCYhu+3dguK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jqk0ezws; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jqk0ezws"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A+hYlSRjBu6HNntGyonMnIM8PZWc0/b2CFhn83zOoCs=; b=jqk0ezwswKkWJUA5nwJtkqmpBo
	0Ru85rXAJyUIwcpade79cqXHMBlZs/D7JZUQe7kB7wEFTwaRhs80aZnlOqUidv7SHqHIshE8LLOA/
	/hZt6KxrsDJhLeAyVtAUQ9bQOrqGS1zYbeCeTtBPQldgxmz+lRrpSKln3/8zxTo4Y2L3qyfQXcUfC
	KWsFtFs4DT6tWawgv9r8fuHscNdVHDmAvwELJjz77O1Y71z/5TnI1gXJVZhG8OtjP3uuoDa6pJqxx
	OeGhETnoNMvxf/3cNn/4cJ0exT9d+hfCoYYFkSeIE1ago2uyXR9YgrzZ/WFdxyy71JD7ZRIFUMPfe
	vgBQdplg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOUi-0000000A8kC-08ac;
	Thu, 29 Jan 2026 09:39:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5C822300754; Thu, 29 Jan 2026 10:39:19 +0100 (CET)
Date: Thu, 29 Jan 2026 10:39:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Oleg Nesterov <oleg@redhat.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, ubizjak@gmail.com,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: include/linux/seqlock.h:1257:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <20260129093919.GZ166857@noisy.programming.kicks-ass.net>
References: <202601290910.uwScjRjc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601290910.uwScjRjc-lkp@intel.com>

On Thu, Jan 29, 2026 at 09:32:00AM +0800, kernel test robot wrote:
> Hi Oleg,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
> commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b seqlock: Change thread_group_cputime() to use scoped_seqlock_read()
> date:   3 months ago
> config: s390-randconfig-002-20260129 (https://download.01.org/0day-ci/archive/20260129/202601290910.uwScjRjc-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290910.uwScjRjc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601290910.uwScjRjc-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    s390-linux-ld: kernel/sched/build_policy.o: in function `__scoped_seqlock_next':
> >> include/linux/seqlock.h:1257:(.text+0x3ee04): undefined reference to `__scoped_seqlock_bug'
> 

Yeah, this is an UBSAN build, and those sanitizers keep confusing
things.

The problem is, some distros seem to actually ship with that crap on
:-(.

I need to go prod some compiler folks.

Uros, do compiler folks care about optimizer quality in the face of
UBSAN or should I go kick distros for shipping with UBSAN enabled?

If s390 isn't your cup of tea, I think Ingo has a x86 config somewhere
that shows this same.

> vim +1257 include/linux/seqlock.h
> 
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1251  
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1252  static inline void
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1253  __scoped_seqlock_next(struct ss_tmp *sst, seqlock_t *lock, enum ss_state target)
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1254  {
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1255  	switch (sst->state) {
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1256  	case ss_done:
> cc39f3872c0865 Peter Zijlstra 2025-10-09 @1257  		__scoped_seqlock_bug();
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1258  		return;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1259  
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1260  	case ss_lock:
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1261  	case ss_lock_irqsave:
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1262  		sst->state = ss_done;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1263  		return;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1264  
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1265  	case ss_lockless:
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1266  		if (!read_seqretry(lock, sst->data)) {
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1267  			sst->state = ss_done;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1268  			return;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1269  		}
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1270  		break;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1271  	}
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1272  
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1273  	switch (target) {
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1274  	case ss_done:
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1275  		__scoped_seqlock_invalid_target();
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1276  		return;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1277  
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1278  	case ss_lock:
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1279  		sst->lock = &lock->lock;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1280  		spin_lock(sst->lock);
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1281  		sst->state = ss_lock;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1282  		return;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1283  
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1284  	case ss_lock_irqsave:
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1285  		sst->lock_irqsave = &lock->lock;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1286  		spin_lock_irqsave(sst->lock_irqsave, sst->data);
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1287  		sst->state = ss_lock_irqsave;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1288  		return;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1289  
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1290  	case ss_lockless:
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1291  		sst->data = read_seqbegin(lock);
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1292  		return;
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1293  	}
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1294  }
> cc39f3872c0865 Peter Zijlstra 2025-10-09  1295  
> 
> :::::: The code at line 1257 was first introduced by commit
> :::::: cc39f3872c0865bef992b713338df369554fa9e0 seqlock: Introduce scoped_seqlock_read()
> 
> :::::: TO: Peter Zijlstra <peterz@infradead.org>
> :::::: CC: Peter Zijlstra <peterz@infradead.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
