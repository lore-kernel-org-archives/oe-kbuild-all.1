Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969C28466C;
	Tue, 13 Jan 2026 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306245; cv=none; b=EeM9MPV4rW1B/HCXNsQVXYhWltlbUVKAHBJy/WkSWGFva4oNhoanY5lEI2Dukiu5JiwHrWBiiX1aNZN4j0phiSuppeQ2Nx5fVItVmRiyqzK/6T1x7WIO2S6+6l5Ua/Dq/lNAnbiUMjm8+iKfmtzvSRDoAlg7UwaxJaT4Cqwbs20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306245; c=relaxed/simple;
	bh=36GZIlEje74IbviSGcsdT8kDlknkT4YM9AdLRg2HUqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sabho0/yf1/Gm+By70lb1CCDiiZD+y1GdKRqM+G+AB1FhjJ4r7uPlQXUnMuKT01l2SvBYnxItK4IaF0grW6stoYU7X0MMnw0dfSncDi5Vd/Kps0h8ZMjtN20w3mworhmLjO/uAYslx95QRpMwcqDShyH610YE61s05ieDNqT/1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b4zxdeDI; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b4zxdeDI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7cFCJ7cpVYMYza9LwvILSBwUBCBqO7xqTqLhMOITkzk=; b=b4zxdeDIcRSJodBe7gvSCM1ShN
	VuPegvQxDj/27+ejltRF4rLxnqEWLFfxn7Erk6aWPbc41jC5sdOCwj98GwPLF5o12m4kKBqdJriFk
	TM0+kk3KsuOzHS0EOa/rgVUJDuGCXdcJvV5sxzMz1Du8ZP3MQgE8SIhvDJ7VfiG62FiXShIMSm0VA
	0k5Cxx5jMdzRTbJWRFYMywFZh2QAXXCwprr4cre9ZcHVazZdmYufNuAHjmWRiVaybxDA6mzyQTKcw
	j20rtpyVjY6CtvETULz7dJrFpojETq7Sn9zb84oA6VVA7EsjFQlbtRbLvTCiq7PX1CM3RIHQ1JAGQ
	v4hfpl1w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdEO-00000002lc4-2lIQ;
	Tue, 13 Jan 2026 12:10:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 35CE530049A; Tue, 13 Jan 2026 13:10:40 +0100 (CET)
Date: Tue, 13 Jan 2026 13:10:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20260113121040.GC831050@noisy.programming.kicks-ass.net>
References: <202601131901.j7WJ9OeZ-lkp@intel.com>
 <20260113115946.L49jwJMx@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113115946.L49jwJMx@linutronix.de>

On Tue, Jan 13, 2026 at 12:59:46PM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-01-13 19:22:40 [+0800], kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> > commit: cec199c5e39bde7191a08087cc3d002ccfab31ff futex: Implement FUTEX2_NUMA
> > date:   9 months ago
> > config: arm64-randconfig-r123-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131901.j7WJ9OeZ-lkp@intel.com/config)
> > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131901.j7WJ9OeZ-lkp@intel.com/reproduce)
> …
> >sparse warnings: (new ones prefixed by >>)
> >>> kernel/futex/core.c:505:38: sparse: sparse: cast removes address space '__user' of expression
> >>> kernel/futex/core.c:505:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
> >   kernel/futex/core.c:505:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
> >   kernel/futex/core.c:505:51: sparse:     got void *
> >   kernel/futex/core.c:894:9: sparse: sparse: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit
> …
> >  > 505			u32 __user *naddr = (void *)uaddr + size / 2;
> 
> [ ] I (PeterZ) have it fixed, will post soon
>  [ ] Fix it for me, I'm saving the world atm
> [ ] Ignore it because of $reasonable_reason

Lol :-)

Its here and a few lines down with the same thing I think. The cast is
to get byte pointer math, instead of u32 sized pointer math. Both the
original uaddr and naddr have the __user thing on, but that intermediate
cast trips it up.

Does this work?

---
 kernel/futex/core.c  | 6 +++---
 kernel/futex/futex.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index cf7e610eac42..3961d256c79c 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -545,7 +545,7 @@ static u64 get_inode_sequence_number(struct inode *inode)
  *
  * lock_page() might sleep, the caller should not hold a spinlock.
  */
-int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
+int get_futex_key(void __user *uaddr, unsigned int flags, union futex_key *key,
 		  enum futex_access rw)
 {
 	unsigned long address = (unsigned long)uaddr;
@@ -579,7 +579,7 @@ int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
 	node = FUTEX_NO_NODE;
 
 	if (flags & FLAGS_NUMA) {
-		u32 __user *naddr = (void *)uaddr + size / 2;
+		u32 __user *naddr = uaddr + size / 2;
 
 		if (get_user_inline(node, naddr))
 			return -EFAULT;
@@ -595,7 +595,7 @@ int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
 	}
 
 	if (flags & FLAGS_NUMA) {
-		u32 __user *naddr = (void *)uaddr + size / 2;
+		u32 __user *naddr = uaddr + size / 2;
 
 		if (node == FUTEX_NO_NODE) {
 			node = numa_node_id();
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 30c2afa03889..99595742c994 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -215,7 +215,7 @@ enum futex_access {
 	FUTEX_WRITE
 };
 
-extern int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
+extern int get_futex_key(void __user *uaddr, unsigned int flags, union futex_key *key,
 			 enum futex_access rw);
 extern void futex_q_lockptr_lock(struct futex_q *q);
 extern struct hrtimer_sleeper *
