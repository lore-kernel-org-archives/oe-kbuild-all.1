Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94215A8;
	Thu, 16 Jan 2025 01:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736989271; cv=none; b=bTbeWJ/VsUzT0sEknpLBASQzq6a6WRp5woJZU/lC86azmhRyqXHCTKuRsr8/He+a6YTiDTW+8MlvJgz5HIaLIj/8PuB3z9ZZW95VIFUUdKFPhMsOclE8p8CBpy5rOKCxW1C14iHTCgSmwEuqbWbju/hN+P4r/duepVj3+q1bmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736989271; c=relaxed/simple;
	bh=Gbu9FnlKq7TkHt68gC8PnGL5GJKGTfnCcXtXkQa+cVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coWMBj2oQrplQKiFItxCr/gmIO2EEOGEOmCNn3yucDoAMLE/UNlc19RoiXlmsUuupMB67FfsgUePT9kLl70lqhvnfpGONWOwrwzPvp8uVVk/iRQ1s8Z8U5svjzrWXj/kQqz79RFYIbcgWzRvphQegPp/UnexrtoUL5rbe+A0OMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=AZ15Q+9j; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="AZ15Q+9j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=oVlMuv9kB9e8a0JN+dfYuuz3cQ4oafMBT25lYbl5SeY=; b=AZ15Q+9jv+4QjhOX
	CQ6lLBuOjy/KPcJggj+7nDrmaAhp70Ya9C/m8XvFRzpS492uAl2UVf2DtRfIjie/Ig7kvMB8yohES
	Ofi96AySjtibsHl7ynT9VP2YEJJpG87EzwVyS2gFeOZ9md7Y69dGyBRxE1KQUP9GBnKASmQWKl6RH
	/rZZ+IBmbhnVwddritHHG9mJgwFMw0TuKjdX99UMsmb1dZY6vjZfLEPfOROQP7thvIOlz/OpQ8zya
	iQetg7MnPWzA50pRY3UgF8uGrCOe+v9NoV/zvlb3t2OHg0Y2IQuQS86Op8aY0e4ldhZO99Ys12J7a
	874WfxYcubezFzkxKQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tYEFu-00AW60-2A;
	Thu, 16 Jan 2025 01:01:06 +0000
Date: Thu, 16 Jan 2025 01:01:06 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:irq/core 6/17] ERROR: modpost:
 "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko]
 undefined!
Message-ID: <Z4haUhJICEpzBcL8@gallifrey>
References: <202501160501.6r9pNtBg-lkp@intel.com>
 <Z4gubTOiYm-_H1uW@gallifrey>
 <4e7c06d7-665e-430c-8317-0f3a10a58762@broadcom.com>
 <Z4g8znXQElHT2Urj@gallifrey>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Z4g8znXQElHT2Urj@gallifrey>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 01:00:47 up 252 days, 12:14,  1 user,  load average: 0.02, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Dr. David Alan Gilbert (linux@treblig.org) wrote:
> * Florian Fainelli (florian.fainelli@broadcom.com) wrote:
> > On 1/15/25 13:53, Dr. David Alan Gilbert wrote:
> > > * kernel test robot (lkp@intel.com) wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
> > > > head:   12cbdcb9f05559ff72eb8a04df829852804c0276
> > > > commit: dd1f17a9faf5359d76644236cde4cc1720f1184d [6/17] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack() by generic function
> > > > config: arm64-randconfig-002-20250115 (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/config)
> > > > compiler: aarch64-linux-gcc (GCC) 14.2.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501160501.6r9pNtBg-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > > 
> > > > > > ERROR: modpost: "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko] undefined!
> > > 
> > > Hmm, that's not happy is it - I'll have a look.
> > 
> > We should be amending your original patch with the following:
> > 
> > diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
> > index 32ffcbb87fa1..c4a8bca5f2b0 100644
> > --- a/kernel/irq/generic-chip.c
> > +++ b/kernel/irq/generic-chip.c
> > @@ -162,6 +162,7 @@ void irq_gc_mask_disable_and_ack_set(struct irq_data *d)
> >         irq_reg_writel(gc, mask, ct->regs.ack);
> >         irq_gc_unlock(gc);
> >  }
> > +EXPORT_SYMBOL_GPL(irq_gc_mask_disable_and_ack_set);
> > 
> >  /**
> >   * irq_gc_eoi - EOI interrupt
> > 
> > 
> > This was not going to be a problem back when Doug's commit was accepted, but
> > later on, irq-brcmsbtb-l2 was allowed to become modular with
> > 51d9db5c8fbbed160081d4cb5c193abdf67ded05 ("irqchip/irq-brcmstb-l2: Switch to
> > IRQCHIP_PLATFORM_DRIVER").
> > 
> > This totally escaped me when I acked your patch making use of the generic
> > irq_gc_mask_disable_and_ack_set implementation.
> 
> Thanks for spotting that; I'll give it a build test and post a v2 in
> a little while.

V2 sent:
Subject: [PATCH v2] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack() by generic function
Date: Thu, 16 Jan 2025 00:59:20 +0000
Message-ID: <20250116005920.626822-1-linux@treblig.org>

> Dave
> 
> > -- 
> > Florian
> > 
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
