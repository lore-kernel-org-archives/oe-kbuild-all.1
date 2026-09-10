Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17A5319851
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 01:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002193; cv=none; b=pPIQqcPqtsx8L4QqjzwRAGfe8gQ3tWZ8/Ghlh5sL14BBZRT5/ps4XTeSFAS7QjvrdMXen5vPDmUcBiJVirLdHQGO4RebfzgCHmFAVfHWVoxwsBrYSaU+wRqeBdNRlwZPA4leItxtNJWjvwNOLr1JAok/6/liY2HtK4obSgHGY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002193; c=relaxed/simple;
	bh=BTKpJLHGXNkyYUhWATg0COH3LNHy+qT5hNJWJohx2to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyzgCegx1Y+BcXFgA3HnFxIzWL9btYHcvCofK6uwGEXRCDA1bc0LXiSGIwwoM6vaAKGU7k4FgOrLophwqq3i+TkNH/zLbw+N4oSwSYxgEjU2yUEpscbB3+k67Dj3wi58Sr5sbNrBp0Mx/qQffqmzls2V+dz85f4nnfj2HDQTZl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYCdNDJS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYCdNDJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9349C1F000FF;
	Thu, 10 Sep 2026 01:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789002192;
	bh=Yp+3gU1LAc/wyHzHhn3IgT2GDscH8d/CdOmIcLaKvSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QYCdNDJSFGce8zSa7x1n8JPeNJfArRWUqn3FwdaQX+bdSTq0a1jqc7k1w+w2j2bfD
	 FWzmendr/+r4A2ai6hnY0SNTXyH/CKPnGwGh/jAh9JzYGYHKqFi5Be73XN0plqlojt
	 ER+damfxPUDh89aJ/yZ94FNBlBvaY2BRJjjKRBYKX24vfLYKjZZip33oyPlyGXdxCD
	 94y3aMhw8jNh/1OvgDWnlgOcsWY3aybVQhUtAHdz7Jm4kbfSOTi5Jnica4FBvKpfpU
	 YLekiJ2wGzm3G6/MK44tMjepHals3cpRPSjn/h5gNPfD6WNbDaKEqvezEayGJ1Sd89
	 RKV93HCfbKCLQ==
Date: Thu, 10 Sep 2026 03:03:09 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [libata:for-next 7/7]
 drivers/ata/pata_parport/pata_parport.c:707:13: warning: conflicting types
 for 'pi_remove_one'; have 'void(struct device *)'
Message-ID: <aqIBzTU8VK4KQRrJ@ryzen>
References: <202609100732.jcpwPdM6-lkp@intel.com>
 <1f3cbeb0-29ca-405e-8604-4a4fcb55e0a1@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f3cbeb0-29ca-405e-8604-4a4fcb55e0a1@kylinos.cn>

On Thu, Sep 10, 2026 at 08:53:40AM +0800, Pei Xiao wrote:
> 在 2026/9/10 07:15, kernel test robot 写道:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
> > head:   d82c5cf658c306979c786a6702487cf9fbc2b5de
> > commit: d82c5cf658c306979c786a6702487cf9fbc2b5de [7/7] ata: pata_parport: unregister devices on protocol unregister
> > config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100732.jcpwPdM6-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 16.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100732.jcpwPdM6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202609100732.jcpwPdM6-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/ata/pata_parport/pata_parport.c: In function 'pi_remove_by_proto':
> >    drivers/ata/pata_parport/pata_parport.c:621:17: error: implicit declaration of function 'pi_remove_one' [-Wimplicit-function-declaration]
> hi Maintainer,
>  I'm very sorry about this. I haven't had my physical machine with me
> recently, so this patch hasn't been tested. What should I do now? Do I
> need to revert this patch, or should I just fix this compilation error?

I dropped this series from for-7.4.

Please send a new version that you have actually tested.


Kind regards,
Niklas
