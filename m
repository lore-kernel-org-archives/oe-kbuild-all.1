Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4063F39C63E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337158; cv=none; b=F2raAhNFgo6IoNLscDlIq/m4X1Ul8utUYBq51Jau7jOzWId0s3RVZdFJ9Cbu7HEWkYewlQQfGlShcKeoGkNHIk74xEiH2g4gFbfmKbpJ8Ldjm9gVJS8wxxx/jkpQxhLeFwatxSSV1z4iTcIq+Tn2NAR2k2JE1tfGqVqt6jFzRFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337158; c=relaxed/simple;
	bh=9kjeEYwFoGtKbizqf+zCndhQW7fKkhs1/5epG37IYh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHEOw9terFeH97FZJQIz29d3pjtcsTKsA/tNUylwnbGxB8TMrwN9kVl8r2LPNVc2V+1lZA4WMZbJSPWFG/HmONz4uPdDxnbA37P95JIsjUXBwniUq29xMVxI7tqLb9hx8QDi3I3XHwHbSYXdtM5kfgSv6UE6FXhtQj9FXaGe5u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4LSfB6Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4LSfB6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D283F1F000E9;
	Wed, 24 Jun 2026 21:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782337156;
	bh=ASpZe3MVFBexTHy3VvCUWNprKoeA4hn5GHaq+mIME6E=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=Q4LSfB6QrVrjGPLRPKeOCGbEeP29sEKKdeBH4jCoQkjCJ2+fIap/I/183iaHgoDxo
	 Yeia8OejT+EShhARXdXZmpd/HTtR2cf1VKzpwG6g88lrQKjGjj0AkH5JUT3J6R1owP
	 e19a+HA4pNVzgOGLmrKNKTTD0CGvEmz5bEdrZqmRbrZPc3lKawR4tw40XD3192DETR
	 UEFe0j96iDbqoviYzQQyWW+2MGO4kPhzGK6g952bbuTusClvt6uY7iHGTR5KI2UqYb
	 uLMfcNn/w7DoW32BgNzlT4M/4ubToOC9jqMfVvCglLEnZPowKHzIhuNeGiyy78lxM/
	 pDigsPfTMwAOw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9E456CE04B1; Wed, 24 Jun 2026 14:39:16 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:39:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:puranjay.2026.06.24a 54/65] tree.c:undefined
 reference to `rcu_preempt_blocked_readers_cgp_ndqs'
Message-ID: <49461750-0379-43db-a957-297b87fb4fc2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202606250524.NuoTnzfd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606250524.NuoTnzfd-lkp@intel.com>

On Thu, Jun 25, 2026 at 05:26:28AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux puranjay.2026.06.24a
> head:   9f9e05ef4454de1724d65dcc1d45018d0457bd7c
> commit: ab15f8d23a687736b674b3b8669a744dd709d97f [54/65] rcu: Make rcu_gp_cleanup() account for ->dqs_blkd_tasks
> config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260625/202606250524.NuoTnzfd-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250524.NuoTnzfd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606250524.NuoTnzfd-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from kernel/rcu/tree.c:69:
> >> kernel/rcu/tree.h:498:12: warning: 'rcu_preempt_blocked_readers_cgp_ndqs' used but never defined
>      498 | static int rcu_preempt_blocked_readers_cgp_ndqs(struct rcu_node *rnp);
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
>    aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>    aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>    aarch64-linux-ld: kernel/rcu/tree.o: in function `rcu_gp_cleanup':
> >> tree.c:(.text+0x66c0): undefined reference to `rcu_preempt_blocked_readers_cgp_ndqs'

Puranjay is an innocent bystander on this one.  The fix is at:

7c6c1219be4d ("fixup! rcu: Make rcu_gp_cleanup() account for ->dqs_blkd_tasks")

							Thanx, Paul
