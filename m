Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C72350A6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710831567; cv=none; b=K8xELvcls/9NKSI+YOkcxIZJMHLvf2308zuiOWhAHdjji04r9kJXMQXCEKSTenpNploZviNuhp9xfnQARCNWc6cciXTPzLC7qx/9wUZatj8UTx+6kaqDRht+DaRgOwNqRJ4LjC00ju02DBb1adHp5vtB+7J+H15eChWoFQNMVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710831567; c=relaxed/simple;
	bh=DThDYviEwzQzJB3SwFvxF62+XzM4/PpaPh30qXr7cFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2EjFQWQzbD1hubSKdV254bb5CaAgxQp3I/hvz9TkSzVubRXb0rSf/JJohSd96XFj2mxJYdI5HyerFmjfI7JtyFy4mmosmOwD7E7AttMaXNV0vpWqXEvuj07qirVSf+inFq2MY/sMfJgZSHb4ssMuuykP5Up0ovk7+/Hi86HB+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GY4HTCql; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K5QI81JA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GY4HTCql";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K5QI81JA"
Date: Tue, 19 Mar 2024 07:59:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710831564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DThDYviEwzQzJB3SwFvxF62+XzM4/PpaPh30qXr7cFU=;
	b=GY4HTCqlta6AD2Ee+eYnkx/jrSY2mogzL8timsgFlUGN4shtVO6Ey8zdJH8V869S/Ebsfo
	OyE2oxuoNG5NQGF4SKLl19nTz9YHAKYcHRYe8CiUUmkVvpxg1Ag48ZeNpsp6L/A580a+SJ
	x4d2uRO65PcgbEfu0y67djtkAMhs9Pht1GUonyZuoA0gvloMwts06IVjnsLCkhDvN4/R5T
	19AR15ZW7g2czgYqxI/R/Hji9UEtQqM+eROlacedm4HwPzEs2YO9aas8TPDNDJ4Ur3ytbI
	ciTi5F3ioPNYOKPfgqeyEfMg3BVdjuU1/9kQ6qsdCCT9j+YPl7iBR+EWA3kX5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710831564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DThDYviEwzQzJB3SwFvxF62+XzM4/PpaPh30qXr7cFU=;
	b=K5QI81JASOL0Pdt3AHXrJsUHWEMCmONNn+6xWVIa3rn2zaT/CD+noOwBMQdvYiss/WAkV5
	LGaHM0SrZLWgcTBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Ben Hutchings <bwh@kernel.org>
Subject: Re: [cip:linux-4.4.y-st-rt 1008/22725]
 arch/mips/include/asm/elf.h:228:23: error: initialization from incompatible
 pointer type
Message-ID: <20240319065923.s15UVtSB@linutronix.de>
References: <202403191433.fX3nKbft-lkp@intel.com>
 <20240319063506.AmxvUePC@linutronix.de>
 <ZfkzI5DGDJmhuoUD@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZfkzI5DGDJmhuoUD@rli9-mobl>

On 2024-03-19 14:39:31 [+0800], Philip Li wrote:
> Sorry about this, we will configure the bot to avoid sending reports
> from cip tree to you.
Thank you.

Sebastian
