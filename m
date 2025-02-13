Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C77E206F17
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739471841; cv=none; b=olzJMyCGBvHaztOzwMjt/yLW5xltKIv78IRDNrq3ix2+QSi9YtaNxpCMZGZJy+UHIKWGsj9AC8Aa4AwENCMd7HFNVwethFjHMpYv/lSIC+ToBjs33FL1ctzszxBL2p4MKFXm0MH/47vhXQ34PtJNAunX5l/M2OD4fphcN/F6kGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739471841; c=relaxed/simple;
	bh=ccOeCS+SDXPVgNMH9y9XIDdzolfnwWQrm6W9xgUBq/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJworkqg2vhXG61NY0K3IOInWA6pDM+7Va4V+TxkSUECTFEbOlhmB1QOxFCOA+v1Ha2UVxFI1FGCfGWx2if8XieMrX4Mw3RKjbflWKbbO4qi7kwnkuVDI2Zf6Y9VsU+gvaLqkIa8shna+/8mBvUGqHaOpbX/i0OriXiMaTiQg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Px4WY6zx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Px4WY6zx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9E5C4CEE4;
	Thu, 13 Feb 2025 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471840;
	bh=ccOeCS+SDXPVgNMH9y9XIDdzolfnwWQrm6W9xgUBq/8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Px4WY6zx5HOJNFy0xgCG13vBn0vLQOjaMHQychLDmCxSbjSYJKbfunzHgEqD6hBY8
	 Zl5hbMh4IRbTctj3KdZxPq3od46b0xyfIKTumNTnfvVUlnVNuntaQO28ZANe0xaN9G
	 iQ8AssvlvYEE7HsbmwNRSyT5vLAMlM9y5mSn2h4q0/m1a42KEOppESHLIUOHNf1lj9
	 vSijo+UJIZAbsaofdYKQZ8ITiCYZe59XwmJ750v4DObtfxe+JvA9nOoKpnVh1hsZSt
	 h45XgMHk42/gvIOVx4tiAWDCwAHlaSXh2XHhnnKeQMuRKWOVjy7cSeoJU762k49DjG
	 vHMIzQd/BC41g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AA8B9CE059C; Thu, 13 Feb 2025 10:37:15 -0800 (PST)
Date: Thu, 13 Feb 2025 10:37:15 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2025.02.12a 73/77]
 kernel/rcu/rcutorture.c:2440:42: sparse: sparse: symbol 'updownreaders' was
 not declared. Should it be static?
Message-ID: <224988ce-ed04-487b-bc3e-88f4c06fd979@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202502140113.iZOFajfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502140113.iZOFajfB-lkp@intel.com>

On Fri, Feb 14, 2025 at 01:45:58AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2025.02.12a
> head:   9909b31f911e4cb67bb84cd07c5172c0823ac549
> commit: bc33cbe9ab89abc9ae3d33843c3d84e383ac8677 [73/77] rcutorture: Add tests for SRCU up/down reader primitives
> config: nios2-randconfig-r112-20250213 (https://download.01.org/0day-ci/archive/20250214/202502140113.iZOFajfB-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250214/202502140113.iZOFajfB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502140113.iZOFajfB-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> kernel/rcu/rcutorture.c:2440:42: sparse: sparse: symbol 'updownreaders' was not declared. Should it be static?
>    kernel/rcu/rcutorture.c:444:12: sparse: sparse: context imbalance in 'rcu_torture_read_lock' - wrong count at exit
>    kernel/rcu/rcutorture.c:484:13: sparse: sparse: context imbalance in 'rcu_torture_read_unlock' - unexpected unlock
>    kernel/rcu/rcutorture.c:763:38: sparse: sparse: context imbalance in 'srcu_torture_read_unlock' - unexpected unlock
>    kernel/rcu/rcutorture.c:813:34: sparse: sparse: context imbalance in 'srcu_torture_up_read' - unexpected unlock
>    kernel/rcu/rcutorture.c:2118:9: sparse: sparse: context imbalance in 'rcutorture_one_extend' - different lock contexts for basic block
>    kernel/rcu/rcutorture.c:4165:41: sparse: sparse: context imbalance in 'rcu_torture_init_srcu_lockdep' - unexpected unlock
> 
> vim +/updownreaders +2440 kernel/rcu/rcutorture.c
> 
>   2439	
> > 2440	struct rcu_torture_one_read_state_updown *updownreaders;
>   2441	static DEFINE_TORTURE_RANDOM(rcu_torture_updown_rand);
>   2442	static int rcu_torture_updown(void *arg);
>   2443	

Good catch, and yes it should be static.  Will fix with attribution,
thank you!

							Thanx, Paul
