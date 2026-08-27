Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBB0175A6D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 04:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803617; cv=none; b=ni7CtIechkmCaUsmowuhoqX9TaDTfA0Ku5SpDMb6EEggMThsL71sFc/kHVxg4Coh7e3DluIHQyHa7725n4hAKlLmwlPLH0TRlSaHUjdG6jhPP/wavBOclNgKLOsKK/8UxJ3cIx0BklpPoI4UmUynhk+CmsFhwbzcvGMwUqO7D4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803617; c=relaxed/simple;
	bh=kEI9OvVbWJ7wq71P6L9MVOAfwamjGbck54SdcC+yBG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9d4wVtDJkdkjTfYHHGel0g8mnN35Us1e2jM/8drU3kYTQu9VdCPZOScyRPzqVOqhH7RgASbjms6+dulHGmM3vFXRpuXWrkfF/Db5hNaqxNK2bN87FWNdvnSg6kxSOUQEduYqd2TeUrKVRLyz+GHAEhK5QlRgF2sQHcHEKbCCH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQxsF2Cj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQxsF2Cj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956242332dso14330945e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 21:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803614; x=1788408414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leRlXbqgKULRfa+v/5YQeWOCF+c2KyYlCCc0f3p+zUs=;
        b=NQxsF2CjeTgbLkXkMjB8nyjtQ/Cz+ny7BPH4/0jqCQ6bO8HXoMujYAOmPzYR9N0/Sv
         ODGOXa/yA+8IqP3Sw/2gXYP1TiGkwmsxXkx3Me69CQlvUGy9a/s46hUCJHAV+Utt2RFx
         SslUOqLYPcO5CbgSCjKVx1Bm399OTfqgrzjQbsx359c2aTcbutD4fkgyOgqv3teJ7Hws
         ujxgYFJh6C4222Bcs0dnlVD7oFGjzWyLi/7WNQ0pjmM3lcXJJ9jzec+/mB9+4Zdf/+Bn
         1YsIUHwH2WYDtquBUENx96UHsEVVjXhcS+de9BwwOQPzY5rXxk/Hv2C31OjOoM4Yoaez
         EDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803614; x=1788408414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leRlXbqgKULRfa+v/5YQeWOCF+c2KyYlCCc0f3p+zUs=;
        b=slCimVruy9oCKJpUd08fHK042BHR/nE4xMADaHP4Ee9ik/G5MEe4tGNOiieEvVVk8M
         MJ23nFFadREYXel0d7IHK7J7TxoKQeehNwsjUeqfWNZzrgkAgpuSHSfRyXu0ADakDSMp
         6NpEj/3WV9lXRPKkvgsbp9UJasMUIku0yuEsfjgXYoy2K+MZBgvTuQ8IXbdEo1q27Kw0
         3mSjzHXAedo+FichrAltuKazVMe8glkPRb+fpZzuKAW7ffqfnt+Wa/1MO8z9ZTMP0TQ3
         1t5pQnIZwmYLiKd4uCKbGGknLvt0Y5UREcB0Ne6K+q0WNlODNuRKc5tcEkVxAdyn8Lke
         h9rQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq25K+x6YnTIaF87unJSRuxJ1wEiVGgzTSAdGMOT48oOWcTbkzCgmZnuLdeEiop1YYSCkW0WVOIMPXuLDd1@lists.linux.dev
X-Gm-Message-State: AFuF++lkP7z8slniGsHSjzdsGN4xroB6lyfUvlE2wwqSZILjcUzXFBEU
	pF+YFwhL8Xt8KpBBzYHoPeiFfqy+YDmpXxO8TrQwplMe06IlR/rzLhye
X-Gm-Gg: AR+sD12LeuT5wRDhYh62JLY/1BXqfwAP9k10ganCo361HSCNJ5fYGQQd5htx21zioe3
	WjWzzUu7ei/7jWBD4LoDuyO3B79gvEw7uLUw4s2PPKZPCoXtEO4rI5PMmNlH2uuvOphRp9fjGxV
	Kr4ekbKenOj0G/TItVab7eCd8WPEYJLIeWSPNJwdnPjaMeBCYjNeMWNPnsR+JajW3a1uJPo7ydj
	2aG/SRVWaC/L1W3eLASBqzxp1WiZx9Cjv4u1YPrkGZ0xGxAXKxwwAQPDctemXzXCqjdn626jaCi
	ky6qi1gWiXeJFbeC+NolWuorJsLHHsavtmep+Y+Adda7NL0j5srlXomSiirXZFn8WTnxqsdwfzO
	2wurllOyIKCXUf080LP89yvgEZIm5n2NnqWKC8HRDgKVdJqW3yumNsSFBy70EgUUXw1u6EYbDKn
	eSmssom9bS+vWdfeLoqDsxQ7oCjqWqab737tktvNv7LDFoLCq96DJg1+W8+HJL4dTMl3jrNJGSy
	ZyIJH1zr0zaxog54/rE0aS39BKyfRYYQWKrm4JS5ltfe8J6ZGlXChfRhX02RY59y2guIcK3A6Tv
	32TPpZY1Y2LvWsapA7qAjho=
X-Received: by 2002:a05:600c:c118:b0:49b:c8e:8e6 with SMTP id 5b1f17b1804b1-49b0c8e0911mr59314915e9.0.1787803614027;
        Wed, 26 Aug 2026 21:06:54 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499fa55f458sm31127865e9.0.2026.08.26.21.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:06:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 06:06:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] microblaze: Fix MB_MANAGER build with older binutils
Message-ID: <ao-3jrT0aP0_fSBA@gmail.com>
References: <20260813024026.5402-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813024026.5402-1-kmehltretter@gmail.com>

On Thu, Aug 13, 2026 at 04:40:26AM +0100, Karl Mehltretter wrote:
> The suspend mnemonic is an alias for mbar 24, and both encode as
> 0xbb020004. Use the underlying instruction, which GNU as 2.30 already
> supports.
> 
> Fixes: 88707ebe77e2 ("microblaze: Add custom break vector handler for mb manager")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310310151.UhB396Qs-lkp@intel.com/
> Suggested-by: Michal Simek <monstr@monstr.eu>
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Just a friendly ping in case this got missed.

Thanks,
Karl
