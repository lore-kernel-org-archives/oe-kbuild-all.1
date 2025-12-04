Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A031A06F;
	Thu,  4 Dec 2025 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764846311; cv=none; b=qc40EA+U8Qmns/F2nKkm88P3msInkJB0/BcJmM+UGb/eRmSQmEvwuvolU0KOd2DxLeVrdta7DToe5oiFWsYr/6TA+pXlfgA8V3DsHmDeE5ZkYrI7cURK/pw4Hr9f5WPVExwPQ0berVbTLDQmft+yEF+k54p7Eac/LFZNGDZEzwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764846311; c=relaxed/simple;
	bh=sNy/AJ9so1emRuuQfmd0cbIwhSV+BgyEvnkq9tI6xcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZOZwcKQqbwLT9GZXgkR2mwHp0YXXJtgD8flwo9ATn9koHYZfUDQd7JXgyhXVEqAvi6Jrv/GnqGruEhNni3WLP5opWyiBijmIqniIc8QLXiCFUi+09Je6Sdwatlo94SstFFBNF1ezVvL2GgbCcn2veDWzlxu81TSQO5jwFEO+1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AV4xk33V; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AV4xk33V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sxb0x9Zv/eScZNohDY7zCYZvzfVIlcPVJ6w589Oub2I=; b=AV4xk33Vi4vdSKsYd7rxlq92ma
	q4Cy0IKq4pbWWtbQDvC0+CF6DOwfoOc3tHoPrZ7wx9Vsv4xU1UXYapJpJSdcU/HpKMvJ1hvcjYneM
	An0XVh1CrllGgkxKSggWP1ySW17BgLnyTZtlrTdhKWElby9fZjq/aHs4eam9J6e8OPQTv7WpuPya8
	Uxzf5csIft+ApXZpsZs0XAQWVpJSiRJWmlpDzI7cR/j00SUDAt27Vm5TwK59MONrq55upoCncsRRG
	mMcp1+8wrm4ezHLOVsG7dr2F1ldzw+IiCF9HPRxnPGCK8chmAJQIHnLzaB68hgTmNQyMg2K4HnkR/
	WgGGyc0g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6HS-00000003stb-07yt;
	Thu, 04 Dec 2025 10:09:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 87C7D300566; Thu, 04 Dec 2025 12:05:04 +0100 (CET)
Date: Thu, 4 Dec 2025 12:05:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Oleg Nesterov <oleg@redhat.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: include/linux/seqlock.h:1257:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <20251204110504.GI2528459@noisy.programming.kicks-ass.net>
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
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
> commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b seqlock: Change thread_group_cputime() to use scoped_seqlock_read()
> date:   6 weeks ago
> config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20251203/202512032230.5pqkcg8x-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0

>    arm-linux-gnueabi-ld: kernel/sched/build_policy.o: in function `__scoped_seqlock_next':
> >> include/linux/seqlock.h:1257:(.text+0x96a0): undefined reference to `__scoped_seqlock_bug'

I cannot reproduce using the gcc-15.1 toolchain from kernel.org

$ make O=tmp-build/ ARCH=arm CROSS_COMPILE=/opt/cross-15.1/bin/arm-linux-gnueabi- -j64

completes using your .config. I've tried twice now. In any case, if this
reliably fails for you, could you try:

  https://lkml.kernel.org/r/20251204104332.GG2528459@noisy.programming.kicks-ass.net

perhaps it is that same problem. If not, could you perhaps hand me the
kernel/sched/build_policy.s file?
