Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98451AAE0F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083140; cv=none; b=s7vf+zEwU8lzncDPYus2onQpoiIDGta4Sd3HFM7jswR7QG3yFgSfFPVA1mWsYsHUnasMSbhUswruK5/MVY92tkKKswoaiTRmRvWP1FALstwjvWSm1P6N+CiwGflauW1jOfGcJps5Ya5tp5HHJIzfpbODUD4ICTvdppfGaJskomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083140; c=relaxed/simple;
	bh=1c1ZWgGM+dNYZl90Yz3GdEgUIKZ2n2C5b4if16Q0Ayk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUY95mYuzNFz7iIyfrXVUG+HydEJwE8t7E158LRpdJtF7w6glXFl2dsC6M1FBArFCDKgTCDYsh35bp3Euzy//kSTTbMUyBqVL5Sov2/Wh9nWvQtgH+qscwJT+DBALv7OIGYRLfIDiqOuyQBHelmZwhtFQLC9nJ7/9o6dMwgY0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8D3C32786;
	Thu,  4 Jul 2024 08:52:18 +0000 (UTC)
Date: Thu, 4 Jul 2024 09:52:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>, Marc Zyngier <maz@kernel.org>
Cc: James Morse <james.morse@arm.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [linux-next:master 9019/10049]
 drivers/irqchip/irq-gic-v3.c:47:23: warning: 'broken_rdists' defined but not
 used
Message-ID: <ZoZiwNbzoFQi5-Vg@arm.com>
References: <202407021807.cBuWVBVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407021807.cBuWVBVa-lkp@intel.com>

On Tue, Jul 02, 2024 at 06:40:12PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
> commit: d633da5d3ab1a0eb26a2213d65da1e189e82f8ab [9019/10049] irqchip/gic-v3: Add support for ACPI's disabled but 'online capable' CPUs
> config: arm-randconfig-r034-20220810 (https://download.01.org/0day-ci/archive/20240702/202407021807.cBuWVBVa-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407021807.cBuWVBVa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407021807.cBuWVBVa-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/irqchip/irq-gic-v3.c:47:23: warning: 'broken_rdists' defined but not used [-Wunused-variable]
>       47 | static struct cpumask broken_rdists __read_mostly;
>          |                       ^~~~~~~~~~~~~
> 
> 
> vim +/broken_rdists +47 drivers/irqchip/irq-gic-v3.c

This can happen when building on arm32 with SMP disabled. So we either
add a __maybe_unused annotation or we move the variable further down in
the CONFIG_SMP block. Marc, what's your preference?

-----------8<----------------------
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index c29b424d1d0c..6393f3d780e9 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -47,7 +47,7 @@ static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
 
 #define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
 
-static struct cpumask broken_rdists __read_mostly;
+static struct cpumask broken_rdists __read_mostly __maybe_unused;
 
 struct redist_region {
 	void __iomem		*redist_base;
-----------8<----------------------

or,

-----------8<----------------------
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index c29b424d1d0c..187948f41bb3 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -47,8 +47,6 @@ static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
 
 #define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
 
-static struct cpumask broken_rdists __read_mostly;
-
 struct redist_region {
 	void __iomem		*redist_base;
 	phys_addr_t		phys_base;
@@ -1316,6 +1314,8 @@ static void gic_cpu_init(void)
 
 #ifdef CONFIG_SMP
 
+static struct cpumask broken_rdists __read_mostly;
+
 #define MPIDR_TO_SGI_RS(mpidr)	(MPIDR_RS(mpidr) << ICC_SGI1R_RS_SHIFT)
 #define MPIDR_TO_SGI_CLUSTER_ID(mpidr)	((mpidr) & ~0xFUL)

-- 
Catalin
