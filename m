Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280392C236B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765318382; cv=none; b=lRmmwMw5LseLvBvdO0Xf2gLpH0OdTVVWKRZ4vbOR3N4z5IWvJN+CgabW2ECpia9FO57yhg9Tvl8m9g5Yp3ZqeN/qKW1BI3VzuFd+aMN0euQReHvKkUIX7ayUBxl8P9s1Ng3Mu6Zk9vvwdtWpIkWMmpRzx/xdB92Gc55t/vb0qFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765318382; c=relaxed/simple;
	bh=34U1zJndIQZdtVKdCJ9P8M0U9bR4S1ajPORjffB+5J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccDL9Gak9IvhJEFlcEV8jSRQ4Ed/hoYcDJr67Z+E71u3odEEKwkyZP78RiSMqbWnhrPoupuPJSea5r430EdeUgpYHuDjoLG3lQBlxRo8XQ4UTw2bphbiC4Ae8IYXyv3sSJW8rpUdUIGscFQ796ueyHyoziW+cIfpCfNLUFvP1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPc7qztz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPc7qztz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9193BC4CEF5;
	Tue,  9 Dec 2025 22:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765318381;
	bh=34U1zJndIQZdtVKdCJ9P8M0U9bR4S1ajPORjffB+5J8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gPc7qztztArHD7nF5ZesLjSvAnQDhDIzLPXpCyNYOUwpQoC0neAkzqEjjKhi1MFin
	 fopbDj6hJfqb9GHtIOgdhzP2lBS6C7Bol0Fcip9mTy1DliHOB9XtcsGZ6fO+mrqhOL
	 hUf6oNZpqpkTY6MhBPQFZ362gfE1ubJ6QfSXWKBYysZKuavKFZKGG8JPki0Dams0SH
	 5Cs2FWde4elx4MK6bT5wmmj+pXMQBphosk4B6htoCi2T6mptVdQCwO/rHzr7m8k08N
	 1WEXF9lVmE28HV6vvYc3axqSKX96jt516+p1AdC3KOWk8aE4bszItQNUq5l8iYuFup
	 1xGB0TFFRyfJw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1AB1FCE0D19; Tue,  9 Dec 2025 14:12:59 -0800 (PST)
Date: Tue, 9 Dec 2025 14:12:59 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 26/28] ERROR: modpost:
 "synchronize_rcu_trivial_preempt" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <fc024774-39e6-47b6-8d85-31e7bca6760f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202512100414.kBXGXqFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512100414.kBXGXqFk-lkp@intel.com>

On Wed, Dec 10, 2025 at 04:51:11AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   9776d62e236bef99859e9067f540aa6f6683b432
> commit: c8afe1ef55afc0eab8eef3eba2a4cd62d88e8bdb [26/28] rcutorture: Add a textbook-style trivial preemptible RCU
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251210/202512100414.kBXGXqFk-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100414.kBXGXqFk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512100414.kBXGXqFk-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "synchronize_rcu_trivial_preempt" [kernel/rcu/rcutorture.ko] undefined!

Good catch, and I am adding the needed EXPORT_SYMBOL_GPL() with
attribution.  Thank you for your testing efforts!

							Thanx, Paul
