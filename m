Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307714A60C;
	Wed, 15 Jan 2025 22:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981717; cv=none; b=tJh9FNOGF6FUGfDGoKJZvVMCnwfGvqui2SYpUawp6F+HD+f5en6aw0a4+6kbnSD95aL5h/06LTTE9SBWJgEL1axPasEyW3mJHklrYVfPM1OWx7DZBOSjMbTZ8UUmZeTFTuq7/XLMXiWzGOZ8OBWo5hfAyBPMNHHxG8g6gfbYBak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981717; c=relaxed/simple;
	bh=JohlN4E1yXsmy23P1MUAbCbnTFZIxwtY3hn7f4zOJKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRffGRkx+qXbDVQF+ZeACYhDunIRYCtldR0X7n9u7NbFPR/HiZQHGNmjY4ECQN89GGmG7uQNaP/XkjYUckOYmrccGX7ZRAuSjZs7WcNCMkYkSBtaMCXd/bDmd5zcqzxSdCkxZcjaz0wAZYpHZmPHP9Kz6Fq5MLMGnRQavL7k5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Vn9o7fcZ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Vn9o7fcZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=i35gEgCbUs27Y0a+WQCSQBKJo82ExVKVQFHbZyysc7w=; b=Vn9o7fcZey0pNdf8
	qSAYWT1nhC+4MVn3xR8gn/92KGCV26Gi4kHxb0V4b0MpIvh2EigBIxH69EVdCmta5hIy5NKtj5pTO
	ap7l8kh03TmNUCtlRPIcJWi3myrlNbFmeWwoHk8nE7hh+JigT5ULc7XRs3qvBs+aGJWzmNQIj1XbX
	7KQVY7In/5XR65+P0/Kr4u8EiOQf2j+Q7OVwNVgPSl0/mQ7WuUgCK2XDfDYHfRpX8LPQAGVUQQQAS
	imNOxXhSy9yEYc5XXQuFbNV43AfhleU8O2q/NSxgYtNZLfgKxzthqbd1nQ5I3oq8/qEHYcHzgxvNR
	sh3MefOozokf4huarw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tYCI2-00AVTO-2M;
	Wed, 15 Jan 2025 22:55:10 +0000
Date: Wed, 15 Jan 2025 22:55:10 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:irq/core 6/17] ERROR: modpost:
 "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko]
 undefined!
Message-ID: <Z4g8znXQElHT2Urj@gallifrey>
References: <202501160501.6r9pNtBg-lkp@intel.com>
 <Z4gubTOiYm-_H1uW@gallifrey>
 <4e7c06d7-665e-430c-8317-0f3a10a58762@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4e7c06d7-665e-430c-8317-0f3a10a58762@broadcom.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 22:54:39 up 252 days, 10:08,  1 user,  load average: 0.04, 0.05,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Florian Fainelli (florian.fainelli@broadcom.com) wrote:
> On 1/15/25 13:53, Dr. David Alan Gilbert wrote:
> > * kernel test robot (lkp@intel.com) wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
> > > head:   12cbdcb9f05559ff72eb8a04df829852804c0276
> > > commit: dd1f17a9faf5359d76644236cde4cc1720f1184d [6/17] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack() by generic function
> > > config: arm64-randconfig-002-20250115 (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/config)
> > > compiler: aarch64-linux-gcc (GCC) 14.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501160501.6r9pNtBg-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > 
> > > > > ERROR: modpost: "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko] undefined!
> > 
> > Hmm, that's not happy is it - I'll have a look.
> 
> We should be amending your original patch with the following:
> 
> diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
> index 32ffcbb87fa1..c4a8bca5f2b0 100644
> --- a/kernel/irq/generic-chip.c
> +++ b/kernel/irq/generic-chip.c
> @@ -162,6 +162,7 @@ void irq_gc_mask_disable_and_ack_set(struct irq_data *d)
>         irq_reg_writel(gc, mask, ct->regs.ack);
>         irq_gc_unlock(gc);
>  }
> +EXPORT_SYMBOL_GPL(irq_gc_mask_disable_and_ack_set);
> 
>  /**
>   * irq_gc_eoi - EOI interrupt
> 
> 
> This was not going to be a problem back when Doug's commit was accepted, but
> later on, irq-brcmsbtb-l2 was allowed to become modular with
> 51d9db5c8fbbed160081d4cb5c193abdf67ded05 ("irqchip/irq-brcmstb-l2: Switch to
> IRQCHIP_PLATFORM_DRIVER").
> 
> This totally escaped me when I acked your patch making use of the generic
> irq_gc_mask_disable_and_ack_set implementation.

Thanks for spotting that; I'll give it a build test and post a v2 in
a little while.

Dave

> -- 
> Florian
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
