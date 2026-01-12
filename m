Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4191E2858;
	Mon, 12 Jan 2026 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768221218; cv=none; b=sm+KimYFqwqDjFtUoIEZjEu7Z9Vt7+Jx8tXYOBubo57SdufyMr17YSbB/o/oeoDDQSaSIM68nskQjEp+ITbdwxzfaL2tho+iE57QR9bBcK9JAsJH3dPJRc2SPnBOuQv9I2XiYSJLhLQAZbUG6LALV/mXpZZbbgBrhzzEUSstRR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768221218; c=relaxed/simple;
	bh=4GjPblbmu5Juqd5aBHHQAGXAxKOnBuHkx9CyFP6MOgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxFURLfwmXRz61MBfY0GFvcB0v+3DWKWlfrxbxvOjt711F4Nn5v8hgoAMhbtK4pio02j6v33CW7jI3t0ZENbKDs1gUx73fJZ8IhuEXCX6eMoPu2ICq5sXEtS3HycHTcRZk3cUSm3gHUoXlFod3rV+0Z3M+vRrxNAiRwS5uRzunY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pWCLeI0M; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pWCLeI0M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pXxnz/c23jP5nSYnMyyz9ngpaFVBybu69ISFl48tK3o=; b=pWCLeI0MUAkAm6YE3oiNZOV0JP
	GTT67B8RQhp2Cv0/WDVhHtVqZFRwz+sdVf53wJT6dVpdRk3bbORuVL/voGuvhCbpWN9SkybEXEacr
	TkPByPfGXJHAUUqbgvJMytgUKMoszzZYB02Rye42vf3w4W0qljkb2DWptjLGOgfngNSkbvXcLO52T
	SeC9kmHPSaBnEyirXsupo91PPnvE6dmvuk7InKBO9c5GRI/GypKA0UixgzBoAvv9BbGL9HovOOiH7
	fDKJwvis9BXWkdSihsnl7f4Bw/pU266J9ZYTsMp+SWWNM02HSlPk/I+5TYM1eJNiizOGT7ausGIK2
	NqFRCHiQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfH6z-00000000hRT-1D14;
	Mon, 12 Jan 2026 12:33:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4166930057E; Mon, 12 Jan 2026 13:33:32 +0100 (CET)
Date: Mon, 12 Jan 2026 13:33:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Eric Dumazet <edumazet@google.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260112123332.GI830755@noisy.programming.kicks-ass.net>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
 <20260110223548.GA4041651@ZenIV>
 <CANn89i+5CSw_uWAq8tKAxs7XcrxCGUKD=Yhp+=tdyJO72Yo-uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89i+5CSw_uWAq8tKAxs7XcrxCGUKD=Yhp+=tdyJO72Yo-uw@mail.gmail.com>

On Sun, Jan 11, 2026 at 11:08:34AM +0100, Eric Dumazet wrote:

> I have sent a fix, but got no reply from any alpha users.
> 
> https://lists.openwall.net/linux-kernel/2025/11/03/350

That is not fix, it re-introduces original problem of volatile
temporary and bad code gen.
