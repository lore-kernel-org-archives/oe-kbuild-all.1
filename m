Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7CE1DE4E1;
	Thu,  4 Dec 2025 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836374; cv=none; b=qTCPpekMV733Kh5aHbPbGkAdhVUzpB8wtT239sOKNG6nOS9E71Y9dVnQcITaA6b58BzoSRJPcP9QVOybMjjdr28twglOfwN+O8KHfzVoLPpSVD3qovMX26i3IS5IYkVPg90BS6PCGWM5EllndRyuZErcSpCl8+fznSa1gLX3jRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836374; c=relaxed/simple;
	bh=F4MOGEBbJx/awVa2QOmQ8xIPGzE0XjtbB1nvvmmyLd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLSTy7AbTO49SKeRDu3MX7/5E1yEc7JHkrC96cU1djnnS4qe90m1gFctSCx+pzM4C7O01Yw3qw5UnmxlWtva5hNLEMpbd8q3uJTMMvzyl98VQ+tjS54l/4Q3Le8eYBUCnCSSKsfbGBcurjmXton1x/7gQZaRH3/hUfV/7YX5IlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B9oNiX6p; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B9oNiX6p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TrffoYNSG+1mpO4I719udc0KZUrd2KhSrNvEZFdxZ4M=; b=B9oNiX6paT3xv8r39g1qQNvoV5
	c4Pdvx9NcvYdAiGlRv2MOMu61zrMLFbCtXrq2dTeewuvs6+mZwfUuXnX3hvcoe2yBHx1Mo0jRJz2f
	ysWA8siVxI3BOMHLmEpbIr3EDoTdLPeRoq8TQItKnWymlRtp83v1gucseF3GNlxmiDJTM9imy7p1z
	GTqe9s/QXXV4vw3mE6jeW4dsZksCu0pbG/gf4+uWrCHME837ouoXqbEPEQqi/0n6gnVjSsEng53Xi
	UGdPPXW62cdPF58oFGVazmBf40c6uV/+qNtQ+9QYy1k03hoOCiVxnq9JdbBEjdXrYgyjrZH38c9/D
	zayHCbSg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4Yf-00000003ut4-3jM1;
	Thu, 04 Dec 2025 08:19:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 63D0430027B; Thu, 04 Dec 2025 09:19:14 +0100 (CET)
Date: Thu, 4 Dec 2025 09:19:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Oleg Nesterov <oleg@redhat.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: include/linux/seqlock.h:1257:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <20251204081914.GA2528459@noisy.programming.kicks-ass.net>
References: <202512032230.5pqkcg8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512032230.5pqkcg8x-lkp@intel.com>

On Wed, Dec 03, 2025 at 10:22:28PM +0800, kernel test robot wrote:
> Hi Oleg,
> 
> FYI, the error/warning still remains.

I don't have this report in my inbox. I had some for other builds, which
I fixed, but not this one.

Anyway, let me go stare at it. This is the optimizer failing in some
way.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
> commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b seqlock: Change thread_group_cputime() to use scoped_seqlock_read()
> date:   6 weeks ago
> config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20251203/202512032230.5pqkcg8x-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032230.5pqkcg8x-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512032230.5pqkcg8x-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arm-linux-gnueabi-ld: kernel/sched/build_policy.o: in function `__scoped_seqlock_next':
> >> include/linux/seqlock.h:1257:(.text+0x96a0): undefined reference to `__scoped_seqlock_bug'
> 
> 
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
