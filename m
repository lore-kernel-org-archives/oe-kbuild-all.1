Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D74726CE32
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 05:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779168462; cv=none; b=mjwtlEA/rh/YQ9/m+U7bV/cB7lmsa8i2Db/eSxYLQTpIK9wPhK7nb6D0AlXeneLLA5axmVPGgkDD55XKXhWA54c4hacTHhu6z7TTzVv4eRaKxbV/V2Mwy+cYfncdJYpVhuqH6JGlpLsOeB3ZTnLw92RCuhZEk3GYhHYrEcN3CX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779168462; c=relaxed/simple;
	bh=KFFodQR7GjkJ1YEDA88aqxPEWxN5Qb0WUbvcIKocI6U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b2Z+HitALCMNZyHQIh/iskKguXLpD7SuKAFZRJGpSkCvnD81ap3YSMYIVztNDLbdHpRZt0TsMy1Zxn5U9GcHMQGCa4LRZY+2RdRjmXG6wFiNgAY6nkFr8ZLdlY9141m576Jxd5sMuRZ7ciquUDw1dGTDI4q0MbGYZckLrsAfHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mq3ujPBE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u4VZGBBL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mq3ujPBE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u4VZGBBL"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779168459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sbTjlMTubWseICTErk0lG1RJVmdKbkahS151vr0xRJY=;
	b=mq3ujPBEUvy9kW5C1jVu2Yczht9wHOdylmdeJkEIu0UDRJ8nlFiG8BS9erpJCtMk9qG8al
	frUuSB+5X4duxfj7wLjXvHpt7pslL70r5Ax6hnY2TOL1hrXWzg0hAKyWGryZn+0g1yqKst
	EshAA/XYtT6NAFZNNmdOgifQQsYY826BKO9qVT2mY8Dei6JgqAjJRy553KhZ0bXFfpt27p
	mQlU9/Fg6gfABPz1QNLoQliHpMKW7yzDqSmb/rUf0Py5WxgoZLWqnYgQm7XE5/YVUs486V
	Ey7SNVQjTJem7/qkUt+krcaliYqoppRGnucOy171O40vWDG+4gFTJCgrWj4HLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779168459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sbTjlMTubWseICTErk0lG1RJVmdKbkahS151vr0xRJY=;
	b=u4VZGBBLQkAUxG3GJIDbk16jHdPl9IE/2x4OOGZNXboHmowZ+PBFFFxt2g8TZSLrMHJWxt
	b9V36cZwW7A1PrBQ==
To: kernel test robot <lkp@intel.com>, Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Juri Lelli
 <juri.lelli@redhat.com>
Subject: Re: kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
In-Reply-To: <202605191116.acPXYOW4-lkp@intel.com>
References: <202605191116.acPXYOW4-lkp@intel.com>
Date: Tue, 19 May 2026 07:27:33 +0200
Message-ID: <87zf1wufy2.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:
> sparse warnings: (new ones prefixed by >>)
>    kernel/trace/rv/monitors/nomiss/nomiss.c: note: in included file:
>>> kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst @@     got struct sched_attr [noderef] __user * @@
>    kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:     expected void *dst
>    kernel/trace/rv/monitors/deadline/deadline.h:115:46: sparse:     got struct sched_attr [noderef] __user *
>>> kernel/trace/rv/monitors/deadline/deadline.h:118:21: sparse: sparse: dereference of noderef expression
>    kernel/trace/rv/monitors/deadline/deadline.h:120:30: sparse: sparse: dereference of noderef expression

Already fixed by:
https://lore.kernel.org/lkml/20260512140250.262190-2-gmonaco@redhat.com/

Nam
