Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCED38DD4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170192; cv=none; b=C2EAYEuP6ZwoZ1MPbRBmwLErOMGB4Qz6BTpR4AFmiBmpe9/Hy/USXHQoi1w2xKdyRIJYUMqiDsVaoH0ULyriNWdcCsTMpIoeyg6ZWfpOzWnxOPX8oylwhBYZeiAmBJVNjIqDK4/k6uFTWFVIZKIq97MYFWDFTLdWAtS3hQrzxDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170192; c=relaxed/simple;
	bh=s0ASB9R5U6c5ijqsIoHVU3z6qpQzMSkly5hTmUJnkcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tf89rgriP8eYmc1etPFn29UJvPbNip14bSwqaDKC/WN8pT1oLqAa/c6fQAkfAE4uF2tcCItOhaYjC6+kwReSRh+N9gabvlHnDKKL1xMoiOcpwzQbIMXTUw95uruZ9MhFiA6wyZaa9S/mh+oDplfWomq5txfI0rMm4Tw72YDBj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73467367;
	Fri,  5 Jul 2024 02:03:34 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C0B63F762;
	Fri,  5 Jul 2024 02:03:08 -0700 (PDT)
Date: Fri, 5 Jul 2024 10:03:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kernel test robot <lkp@intel.com>, James Morse <james.morse@arm.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [linux-next:master 9019/10049]
 drivers/irqchip/irq-gic-v3.c:47:23: warning: 'broken_rdists' defined but not
 used
Message-ID: <Zoe2yiHKJqxneAhq@arm.com>
References: <202407021807.cBuWVBVa-lkp@intel.com>
 <ZoZiwNbzoFQi5-Vg@arm.com>
 <86cynt4jem.wl-maz@kernel.org>
 <ZoZ5ECjjgFNCaPYj@arm.com>
 <87a5ixp1fu.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5ixp1fu.wl-maz@kernel.org>

On Thu, Jul 04, 2024 at 05:27:33PM +0100, Marc Zyngier wrote:
> On Thu, 04 Jul 2024 11:27:28 +0100,
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > 
> > On Thu, Jul 04, 2024 at 10:05:05AM +0100, Marc Zyngier wrote:
> > > On Thu, 04 Jul 2024 09:52:16 +0100,
> > > Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > > 
> > > > On Tue, Jul 02, 2024 at 06:40:12PM +0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > > head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
> > > > > commit: d633da5d3ab1a0eb26a2213d65da1e189e82f8ab [9019/10049] irqchip/gic-v3: Add support for ACPI's disabled but 'online capable' CPUs
> > > > > config: arm-randconfig-r034-20220810 (https://download.01.org/0day-ci/archive/20240702/202407021807.cBuWVBVa-lkp@intel.com/config)
> > > > > compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407021807.cBuWVBVa-lkp@intel.com/reproduce)
> > > > > 
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202407021807.cBuWVBVa-lkp@intel.com/
> > > > > 
> > > > > All warnings (new ones prefixed by >>):
> > > > > 
> > > > > >> drivers/irqchip/irq-gic-v3.c:47:23: warning: 'broken_rdists' defined but not used [-Wunused-variable]
> > > > >       47 | static struct cpumask broken_rdists __read_mostly;
> > > > >          |                       ^~~~~~~~~~~~~
> > > > > 
> > > > > 
> > > > > vim +/broken_rdists +47 drivers/irqchip/irq-gic-v3.c
> > > > 
> > > > This can happen when building on arm32 with SMP disabled. So we either
> > > > add a __maybe_unused annotation or we move the variable further down in
> > > > the CONFIG_SMP block. Marc, what's your preference?
> > > > 
> > > > -----------8<----------------------
> > > > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > > > index c29b424d1d0c..6393f3d780e9 100644
> > > > --- a/drivers/irqchip/irq-gic-v3.c
> > > > +++ b/drivers/irqchip/irq-gic-v3.c
> > > > @@ -47,7 +47,7 @@ static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
> > > >  
> > > >  #define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
> > > >  
> > > > -static struct cpumask broken_rdists __read_mostly;
> > > > +static struct cpumask broken_rdists __read_mostly __maybe_unused;
> > > >  
> > > >  struct redist_region {
> > > >  	void __iomem		*redist_base;
> > > > -----------8<----------------------
> > > > 
> > > > or,
> > > > 
> > > > -----------8<----------------------
> > > > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > > > index c29b424d1d0c..187948f41bb3 100644
> > > > --- a/drivers/irqchip/irq-gic-v3.c
> > > > +++ b/drivers/irqchip/irq-gic-v3.c
> > > > @@ -47,8 +47,6 @@ static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
> > > >  
> > > >  #define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
> > > >  
> > > > -static struct cpumask broken_rdists __read_mostly;
> > > > -
> > > >  struct redist_region {
> > > >  	void __iomem		*redist_base;
> > > >  	phys_addr_t		phys_base;
> > > > @@ -1316,6 +1314,8 @@ static void gic_cpu_init(void)
> > > >  
> > > >  #ifdef CONFIG_SMP
> > > >  
> > > > +static struct cpumask broken_rdists __read_mostly;
> > > > +
> > > >  #define MPIDR_TO_SGI_RS(mpidr)	(MPIDR_RS(mpidr) << ICC_SGI1R_RS_SHIFT)
> > > >  #define MPIDR_TO_SGI_CLUSTER_ID(mpidr)	((mpidr) & ~0xFUL)
> > > 
> > > The second version seems to be the most logical one, since we already
> > > have this SMP-only block (note to self: constraint GICv3 support to
> > > SMP only at the earliest opportunity).
> > > 
> > > Feel free to add my
> > > 
> > > Acked-by: Marc Zyngier <maz@kernel.org>
> > > 
> > > if you decide to push a fix on top of this branch.
> > 
> > Ah, it's also used in the CONFIG_ACPI block further down. So
> > __maybe_unused may be easier. Or add some #if defined(CONFIG_SMP) ||
> > defined(CONFIG_ACPI) but it seems too verbose.
> 
> Ah, of course. Go for the __maybe_unused then, it's not a big deal.
> 
> My Ack still stands.

Thanks.

-- 
Catalin
