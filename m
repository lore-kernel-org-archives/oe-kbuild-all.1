Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368361BC4E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088853; cv=none; b=A112jjdB6XBsDft5XuIWAmSy1J0ruZQAcB8RzvJyivCKSK54oncBdkjlJUIshAnVvmmTrcyNjbuZHTydlaz9ZjPLe84c9RlBuwKh/EbCQ0chZ+qQt5T+WitQK4ng+xli86DgIpwLJJcZIqqDAxQymbBMkI8CtIdiu+R8C0JZ/9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088853; c=relaxed/simple;
	bh=H16CKDtQp78AyLpfRN6q+55rL0pZKc/qLiQxVT1U6vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFfTyIhxhDLnRrkm8HqYSyRzWv8BXsy3dxRoHGvJSiv+DftahCdlP5YYcDwb9IkuAS8thPxP8w/albDvoSsSX16PQd3F00/ImS4i5G3EGa0ph65d0SfTDfWKWX0qxVZZTjDtvELP5H8T6WpJ6uGqcA6WoNoxaSC0hpwregvvK2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328FFC3277B;
	Thu,  4 Jul 2024 10:27:30 +0000 (UTC)
Date: Thu, 4 Jul 2024 11:27:28 +0100
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
Message-ID: <ZoZ5ECjjgFNCaPYj@arm.com>
References: <202407021807.cBuWVBVa-lkp@intel.com>
 <ZoZiwNbzoFQi5-Vg@arm.com>
 <86cynt4jem.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86cynt4jem.wl-maz@kernel.org>

On Thu, Jul 04, 2024 at 10:05:05AM +0100, Marc Zyngier wrote:
> On Thu, 04 Jul 2024 09:52:16 +0100,
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > 
> > On Tue, Jul 02, 2024 at 06:40:12PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
> > > commit: d633da5d3ab1a0eb26a2213d65da1e189e82f8ab [9019/10049] irqchip/gic-v3: Add support for ACPI's disabled but 'online capable' CPUs
> > > config: arm-randconfig-r034-20220810 (https://download.01.org/0day-ci/archive/20240702/202407021807.cBuWVBVa-lkp@intel.com/config)
> > > compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407021807.cBuWVBVa-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202407021807.cBuWVBVa-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> drivers/irqchip/irq-gic-v3.c:47:23: warning: 'broken_rdists' defined but not used [-Wunused-variable]
> > >       47 | static struct cpumask broken_rdists __read_mostly;
> > >          |                       ^~~~~~~~~~~~~
> > > 
> > > 
> > > vim +/broken_rdists +47 drivers/irqchip/irq-gic-v3.c
> > 
> > This can happen when building on arm32 with SMP disabled. So we either
> > add a __maybe_unused annotation or we move the variable further down in
> > the CONFIG_SMP block. Marc, what's your preference?
> > 
> > -----------8<----------------------
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index c29b424d1d0c..6393f3d780e9 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -47,7 +47,7 @@ static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
> >  
> >  #define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
> >  
> > -static struct cpumask broken_rdists __read_mostly;
> > +static struct cpumask broken_rdists __read_mostly __maybe_unused;
> >  
> >  struct redist_region {
> >  	void __iomem		*redist_base;
> > -----------8<----------------------
> > 
> > or,
> > 
> > -----------8<----------------------
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index c29b424d1d0c..187948f41bb3 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -47,8 +47,6 @@ static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
> >  
> >  #define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
> >  
> > -static struct cpumask broken_rdists __read_mostly;
> > -
> >  struct redist_region {
> >  	void __iomem		*redist_base;
> >  	phys_addr_t		phys_base;
> > @@ -1316,6 +1314,8 @@ static void gic_cpu_init(void)
> >  
> >  #ifdef CONFIG_SMP
> >  
> > +static struct cpumask broken_rdists __read_mostly;
> > +
> >  #define MPIDR_TO_SGI_RS(mpidr)	(MPIDR_RS(mpidr) << ICC_SGI1R_RS_SHIFT)
> >  #define MPIDR_TO_SGI_CLUSTER_ID(mpidr)	((mpidr) & ~0xFUL)
> 
> The second version seems to be the most logical one, since we already
> have this SMP-only block (note to self: constraint GICv3 support to
> SMP only at the earliest opportunity).
> 
> Feel free to add my
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> 
> if you decide to push a fix on top of this branch.

Ah, it's also used in the CONFIG_ACPI block further down. So
__maybe_unused may be easier. Or add some #if defined(CONFIG_SMP) ||
defined(CONFIG_ACPI) but it seems too verbose.

-- 
Catalin
