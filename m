Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8637FF40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380983; cv=none; b=Oyc3D9xoN0GbUhJC7maCF7o4N0zNlVO88C0sQzvR289rCJXFFbqXLK13+yWI8Bv2ExxjWgOtpSQIMmHqpKKnf241CY8rWNpugWuEULhBrkHUKlLsazJCXEEvZBHaJW5+2wgMIUQJKQUDlWOhM1GnLl8tdSWzq60nhcKgpO6T75k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380983; c=relaxed/simple;
	bh=J/kCuaLR6KPyme4emUfTIy9fSkC10Mel0QbqIGCEE9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eRRU/RJVAs7EP5onnyDm+tsCl2603S9NjDc4pH8rcJgwx8q1jdh9hxR7Q35+z0eZXWmWDR7Z/Z8/LCRK7IbXAQvgpDsM7f7J6WpTfkHZCbe7e9qNos4ebfZkhahcPG/jXkaCjY6VGE970iuG/4sFZTo1bSjzEEtVsRVGZsmqID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gayCic25; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1K1kcmwz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gayCic25";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1K1kcmwz"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768380973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J/kCuaLR6KPyme4emUfTIy9fSkC10Mel0QbqIGCEE9M=;
	b=gayCic25y3OAJUPEln6vvYUTF7LdkVoK8iAVvj3Iu8gpCcooKVPTqdTT1P9pCffvLWIji4
	wltCGPK76ns++crB90DgOpwc0BaSeunHy21tAVMHvaroT0vcSiyvXjkYeRJYHEzMwyRRrt
	P2cpRRz5MRPkqGxkoNMNGzQbgyC3tMYT6ozHKSs9LXraZYzLzWV++NdFTW1LZQ1bnUgMNz
	UjlK2ueUECt7znTDI/8cmFyO3MpbA5gSUIO1LSM7g/Z/MhViCOZoZjU5PHlHIm3uyRcZae
	HaYqSW505dPi7nx6TA5gvjK4+j+NQRpY/8F3KLeOlXzplPrscHLx3LM126eb0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768380973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J/kCuaLR6KPyme4emUfTIy9fSkC10Mel0QbqIGCEE9M=;
	b=1K1kcmwzO+E+ubhrU9pRdHH56QkiUzYFsb4GqAe/KzUdUEvEcCxqNjX456S+E6f54u8P5w
	wSjJnL/p6oPzL6Bg==
To: Thomas Gleixner <tglx@kernel.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Ingo Molnar
 <mingo@kernel.org>
Subject: Re: [PATCH v2] time/sched_clock: Use ACCESS_PRIVATE() to evaluate
 hrtimer::function
In-Reply-To: <875x95jw7q.ffs@tglx>
References: <87jyxlk3w4.ffs@tglx> <875x95jw7q.ffs@tglx>
Date: Wed, 14 Jan 2026 09:56:13 +0100
Message-ID: <87v7h4o9n6.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Gleixner <tglx@kernel.org> writes:
> This dereference of sched_clock_timer::function was missed when the
> hrtimer callback function pointer was marked private.
>
> Fixes: 04257da0c99c ("hrtimers: Make callback function pointer private")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601131713.KsxhXQ0M-lkp@intel.com/

Acked-by: Nam Cao <namcao@linutronix.de>
