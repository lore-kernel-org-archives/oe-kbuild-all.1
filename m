Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613863EA967
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991218; cv=none; b=kkbSzRxHYV8/1I3XihahuSwFRP1U7FeUeULu5Lx57CF817BL47cVMxQR8x/0TZzWpxdtYYnaJ9wLOoOnVNWozFx7ecLdz34dT43iTq9d93kmQA6UZ3sMQBPBkRJ4ujkXqNRe2xqqInPadygM6wYE/TQm+oy8myWsUXvUkjImQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991218; c=relaxed/simple;
	bh=kAnfopNpv/fjnKs20E95RBxudb2XCWa1MC8aLfwzIs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7bAXWeZ+V8rZF4J82s8anrssEW1W2z5BZc/ae91uB9axuTpRm67Q/rFNs5mF0uz0QsjXRNIeiD1WwMx94Cbvxw9buyYOKTJE1aZHGGDU8pg5TqCf19evVdhHinfN73j7YxN0h6OfGJ/v2hGPxqAqPWIetzbFJn37maJzKTlLaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=amcGEjCl; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="amcGEjCl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KCK1+c1xkLWj0prs2DSC6RdwXYT/SKPIWkQs3ZkYkmY=; b=amcGEjClu8lSQ/WB/bUCrsqvFn
	Xxtx/mhPOrwU5cbmzcvBzqdhlNXMzs6OR27GU/8A+OGLmi+HzLeHt54vkI53rbzxwLrkVjNb3ZlZ+
	Y6buK/xoNKLl2Vt7+sb6ayuuyvL5A6gpN5evP2xJwVjr/mki6nuqnJXaCzJZJcpsWq0/E2ZzwuHTe
	nSB+Y1ROhr7eW3A8XI/SfihT3rPVUKalAOa9XKMqBsIqD777ewBSju6z3KkT2U7gGmY2ZUR8JZbSN
	0Bevc3WCX2kINUwoPbmXDUKUagDfUDTeJuAuG54HkP3wLJ1Bv7/P4kcBvhiy1WZMItM5jPWP4On4I
	DpaJOdQQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfFSm-00000003jN2-3n9q;
	Thu, 02 Jul 2026 11:20:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0C0F5300128; Thu, 02 Jul 2026 13:20:12 +0200 (CEST)
Date: Thu, 2 Jul 2026 13:20:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Taeyang Lee <0wn@theori.io>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:perf/urgent 1/4] kernel/events/core.c:4739:1:
 error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
Message-ID: <20260702112011.GJ751831@noisy.programming.kicks-ass.net>
References: <202607021949.zL9JHdEP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607021949.zL9JHdEP-lkp@intel.com>

On Thu, Jul 02, 2026 at 07:15:35PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/urgent
> head:   91a15888098678641edd3ef4f5d66fa7e77dcc28
> commit: f60c8830996ca8e468f96cc3ae79aab1e6fbfb12 [1/4] perf/core: Detach event groups during remove_on_exec
> config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260702/202607021949.zL9JHdEP-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021949.zL9JHdEP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607021949.zL9JHdEP-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    kernel/events/core.c: In function 'perf_event_exit_event':
> >> kernel/events/core.c:4739:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     4739 | {

Bah, I lost a build fix :-( /me goes try again.
