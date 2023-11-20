Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024D1CA80
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JwUdU815";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xpoyxI+1"
Date: Mon, 20 Nov 2023 16:04:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1700492681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oh40aSrtvq6glAgq/bdBFVCeFjDmlqcMtxXXW1HlknE=;
	b=JwUdU8151FKrbjOYvNSJI6lBgxxTCmIN+g6z/WrNlWT7yY4I/9Pl0s5ZKqRxDCvFac1tBH
	T+A4ienPAe0qPC8NniOTcfY9AfD5ZBAlineyUdh+cHch1GRFjHP6lhR1iMHpKDEyCncbEl
	H3bzJMrnaOYIsfWHvc2/4SlQlZWFsDzGQSvnn7TiW7BEOIMcTs0LwiFvuo09y50+lBiCqk
	e/jcbXfgu9RlishGJIOB735JAA9KpSpOYVebY8E5Cj2gQu7OvZZFrG1LKprwUc0Set2pGt
	K1TLs2oYRJIkPx49fzFFm/9qMzSY8XQjwaK7EmPQTkNv88CrUXx04x55pHY3Lg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1700492681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oh40aSrtvq6glAgq/bdBFVCeFjDmlqcMtxXXW1HlknE=;
	b=xpoyxI+1PeEf+Z6Njkoufnd1rF+eCnrxi6HOFdkZApJaTBGajo66P4T5g3DhgNvXK5NRvy
	3ddlGqHiMcnfCODA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [rt-devel:linux-6.6.y-rt-rebase 142/184]
 kernel/printk/printk.c:2381:22: error: 'printk_threads_enabled' undeclared
Message-ID: <20231120150439._qKL0FyT@linutronix.de>
References: <202311130313.Y13FKhwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202311130313.Y13FKhwn-lkp@intel.com>

On 2023-11-13 04:00:25 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.6.y-rt-rebase
> head:   7f644692ce0f1f283a272dff7543f45eb7ba37d8
> commit: 91dc74f04c8f125c4e42796aff7a4e8d45a8cca3 [142/184] atomic print in printk context sometimes
> config: i386-randconfig-002-20231111 (https://download.01.org/0day-ci/archive/20231113/202311130313.Y13FKhwn-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130313.Y13FKhwn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311130313.Y13FKhwn-lkp@intel.com/

The definition of printk_threads_enabled() in the !PRINTK case is in
	[115/122] printk: Track registration of console types

but should have been part of
	[PATCH 110/122] printk: nbcon: Introduce printing kthreads

it has been folded into to the wrong patch.

I leave it as-is on my side. John, could please re-fold it to the proper
patch before feeding the series back to me?

Sebastian
