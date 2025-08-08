Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B7223F417
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754667724; cv=none; b=hic6QgCdDmLRzoj3wJhK/9O854jCTuvC1InrrlKHGYB7FR4RnaE+3ogTkdmE66vv/nkE2HpKmonix6vzZ9pn0yHutTxuUj8vH6FBY43mv+PvJlMsd1jD55qv5EiZd640oSK3Zo6nLOqVL6Jr/O3ac0RdyONbjwkA4clRxTUhv1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754667724; c=relaxed/simple;
	bh=EY28MOieUPmLBAozTRjaXXPYeuJzf8F3At7x7mk8+b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/wWozwztrD+VPFlGr7wDMXua6cfnYjat0xCaJFQ21mMDsBEfeNX5J8ZQQlj84n4hy0DWnJRhmMCge+yL9Q1fp3FzV1tyJyMhqzq/uliPhv9y0xP+Lr6osrmBZNOgO4l2zlmrJriiIkp2yB6BVUd5BHgGxflVmCDhr78gZGcd4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lrCPwmwP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RkYBKCQy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lrCPwmwP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RkYBKCQy"
Date: Fri, 8 Aug 2025 17:41:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754667720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgOer5VumMymuFWzueJn0lUdn5EPPEbn4U3E45BYpnU=;
	b=lrCPwmwP7GcB5g1nOOVRog6Otx2aEfHSnNHeWLnUGu04gSIXT0Qzx3tthhxg1LMEpjurmO
	EQrDEChHfe9z081ig1QC43621wUqUPuwghJe/M+FmxQ5b219m654xYMxFvcZSYANe3N70D
	s5uXgJl1XeUGLZ/RlOdIiPvTV9it6zpYMYVsMpGZFbOOmHtfqm71B46QvyGHYpg9vsWY/D
	O0206rWFIXQqjbhQqrRvk7PnMBjvRMKHZ727nua0W4983TslKJwsgesRmmeNp+7cwXzQe7
	skus7I211BfYE3vTp8BW8zshJqw7AlW8rhpEPCJi41qsvlOm7O1Qhj9GZ+GNhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754667720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgOer5VumMymuFWzueJn0lUdn5EPPEbn4U3E45BYpnU=;
	b=RkYBKCQyl5f8NWadiceGQWAyzmTJZHccqyf7p+cG5D2CGCRlbJDvZ7vYNZZijft6XNSApi
	KWdZDZHLX2zaEJDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 12112/12680] arp_tables.c:undefined reference
 to `xt_recseq'
Message-ID: <20250808154159.-Zn8YDfE@linutronix.de>
References: <202507282103.XJ3hBMdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202507282103.XJ3hBMdC-lkp@intel.com>

On 2025-07-28 21:36:56 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0b90c3b6d76ea512dc3dac8fb30215e175b0019a
> commit: 9fce66583f06c212e95e4b76dd61d8432ffa56b6 [12112/12680] netfilter: Exclude LEGACY TABLES on PREEMPT_RT.
> config: xtensa-randconfig-002-20250727 (https://download.01.org/0day-ci/archive/20250728/202507282103.XJ3hBMdC-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507282103.XJ3hBMdC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507282103.XJ3hBMdC-lkp@intel.com/

 25a8b88f000c3 ("netfilter: add back NETFILTER_XTABLES dependencies")
 https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git/commit/?h=for-netdev-nf-25-08-07&id=25a8b88f000c33a1d580c317e93e40b953dc2fa5

Sebastian
