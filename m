Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE81F0E26
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 23:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960770; cv=none; b=OWTOO0yiAhykGmdzr4FN/Xh+V4kslOkhCDTTWXnLqP7uWvF1IlDEYn563BiscpH3GpOnViSA0r00OLPzvufuPKUYhE3P8eBQf2Bsg2L8IjA/CU9v4bFuzkxeLE+pxRGGcpiNHzkDuFF5kwOeTQCSM5El9Ms5PwAu0c8QT6LCZx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960770; c=relaxed/simple;
	bh=c0cAAcj+jfzZ9jBhsS1y5Faz1EPtZnZBIVeHidv0x7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Er5CcqPVTq752mcWnmG/g+ukKRLLmzES2rGETSIVeiHVxatNGzlKc00kOJlbLz0v9jKS97nMtUQv7e7Al/R2Jf5r+tX2t/YUPEkw+/LCCJAW0SvLEbKLFPqSFJpved1qBktmh1WTXB9DtuEQS977ach3wtkNBbieHPWjCjwSb0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnbKDxAu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnbKDxAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C912C4CEDE;
	Wed, 11 Dec 2024 23:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733960769;
	bh=c0cAAcj+jfzZ9jBhsS1y5Faz1EPtZnZBIVeHidv0x7I=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=TnbKDxAuPXnsqKbUKIZCLO9HNntt4pI0PlzL7mI7qxRGaB4dHRXyk+8QXUi7Vg5Th
	 FOGO36rCw8GDV7SWCE5nv4GzFxwZ54mTVS+8n1ecEL0zjtXRAG3NXDl4vWSTWLdK/p
	 z6noY9U+g9usmwqNWptvCOVpFBZLoxf7zF97nlAsCyl/B5B9kECM33vOv6S5948RnN
	 bf/lPkryx62L6sZKQtiOEwu3gAv2Rxa3fz98A/Rp+TpuDmM8QXlMUKAY43I+ebmcOI
	 HEO9mybp1OZnVkiXIrCYBoZz2pA5IHVcy/RfJnxQws6FlLMoHkIc0h53Y0URpdrCDa
	 FZ7UBQYrf5lRg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 49E6FCE0A32; Wed, 11 Dec 2024 15:46:09 -0800 (PST)
Date: Wed, 11 Dec 2024 15:46:09 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 51/57] ERROR: modpost:
 "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <12f955e3-bbd8-482d-83dd-b9ac00bc2f68@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202412120535.T5YZArL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412120535.T5YZArL9-lkp@intel.com>

On Thu, Dec 12, 2024 at 05:55:36AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   58b186eb8049230c475262f8e9eab34299677b8a
> commit: 9133bc2bf728593225932a2574688beeb602b1ef [51/57] rcutorture: Include grace-period sequence numbers in failure/close-call
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241212/202412120535.T5YZArL9-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120535.T5YZArL9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412120535.T5YZArL9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
> ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
> ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
> ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
> ERROR: modpost: "inb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> ERROR: modpost: "inw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> ERROR: modpost: "nec7210_locking_ioport_write_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> ERROR: modpost: "nec7210_locking_ioport_read_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)

I believe that this is fixed by the following commit, which I will likely
fold into the original.  Does it do the trick for you?

							Thanx, Paul

------------------------------------------------------------------------

commit c2cf9cf59e746aa60badcb07f58b09b7f604c19b
Author: Nathan Chancellor <nathan@kernel.org>
Date:   Wed Dec 11 12:43:01 2024 -0800

    rcu: Use IS_ENABLED() for Tiny RCU rcutorture definitions
    
    The rcutorture_gather_gp_seqs() and rcutorture_format_gp_seqs() functions
    are currently guarded by "#ifdef CONFIG_RCU_TORTURE_TEST".  This fails
    in kernels built with CONFIG_RCU_TINY=y and CONFIG_RCU_TORTURE_TEST=m
    because in that case there is no CONFIG_RCU_TORTURE_TEST cpp macro.
    There is instead a CONFIG_RCU_TORTURE_TEST_MODULE cpp macro.
    
    This commit uses "#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)" to correctly
    handle modular as well as built-in rcutorture for kernels using Tiny RCU.
    
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
index 1971683f1a82d..b97c64e99a905 100644
--- a/kernel/rcu/tiny.c
+++ b/kernel/rcu/tiny.c
@@ -257,7 +257,7 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 EXPORT_SYMBOL_GPL(kvfree_call_rcu);
 #endif
 
-#ifdef CONFIG_RCU_TORTURE_TEST
+#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)
 unsigned long long rcutorture_gather_gp_seqs(void)
 {
 	return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xffffULL;
