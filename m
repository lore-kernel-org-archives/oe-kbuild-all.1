Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0594D287508;
	Sat, 10 Jan 2026 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768084470; cv=none; b=XEKetC+HUoSaDZy6xIdkQXX5Z/4ykUgJau6k4iOTYc03Z0LrFeWdNwq1CIcKmq/3WxBOPUksyxaiLgeWFw7hK1GNhgzDCirLzIw69JUMjgk/Oz5cv1K5m4y5OGDOypPlyz4E7cntXmrzEHJjJF7Yej5Gzr4qrmB4lZ7fIATMNKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768084470; c=relaxed/simple;
	bh=BKTpWSz4/xIjjloYp0LYcZS0205nAzDBn8YokYH/PKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkN6aCfiv3kIKkB6tUaxmf+rNfG+OpBm2QDTXm6k1vPCTk5vL0M9TxVzLwfugsaHIiERnOnkOIpRmPOzfvZLRIp/g+fmjHyqJiAroBp4wAu2u1DTBOjsbPWjEsvYrgvfQPEGSKEDsm8M8NULcXK3aETiPozX+aQcdw9tgMFr3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=Kigryeeb; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="Kigryeeb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9qKk9rWTcrLbf2bVpY+S2bQV6sb2Y5xpBdYUJ0eus1o=; b=Kigryeeb91QFfqlT1C0CEICh4l
	DZroXJJdQdhz5l8IMqGVr9TNHoqa6EaqHu1PeEvPZM1U9tQxxroO2khAdduoFzTlZOgbeJx+RSEeL
	Ktxba69dG6SGouFPoQ0TQYHkTRMh+jIny1zudlxZ1LFzNhfvoGgkvcQ5n7J4EBxcw7+52tU98nHzG
	8DfmCAljgXy5iNpakOzs6DIhV766ryDw3yMQZ9LCMX7snoiSEAPZNQvSxI8UXVbqY79hoWAijaZvQ
	5MAd9wr8Ju2SY847W3Lref/m28DebNBoIwcikqY3u//h2ir6DiR+S6BLGU/f4kv7HCzxnYoHMIRyQ
	uYAD9MpQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vehYi-0000000H7D2-1b0x;
	Sat, 10 Jan 2026 22:35:48 +0000
Date: Sat, 10 Jan 2026 22:35:48 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260110223548.GA4041651@ZenIV>
References: <202601110443.5ENBRFej-lkp@intel.com>
 <20260110221508.GF3634291@ZenIV>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110221508.GF3634291@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, Jan 10, 2026 at 10:15:09PM +0000, Al Viro wrote:
> On Sun, Jan 11, 2026 at 05:06:31AM +0800, kernel test robot wrote:
> 
> Folks, could your bot be taught to recognize that kind of situation?
> It's very clear what's going on - an inline function that gets the
> same warning with this config every time it is called.  Commit in
> question has added several calls of that thing; the origin of warning
> has nothing whatsoever to do with it, and that can be guessed without
> even looking at the source - the quoted diff between the logs is quite
> enough for that.
> 
> Looking at the function in question,

[accidentally sent halfway through editing, sorry]

e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2097) static inline kuid_t sk_uid(const struct sock *sk)
e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2098) {
e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2099)       /* Paired with WRITE_ONCE() in sockfs_setattr() */
e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2100)       return READ_ONCE(sk->sk_uid);
e84a4927a404f (Eric Dumazet               2025-06-20 13:30:00 +0000 2101) }

we see that warning in question almost certainly comes from
	READ_ONCE(some_kuid_t_object)
and looking at alpha we see this:
#define __READ_ONCE(x)                                                  \
({                                                                      \
        __unqual_scalar_typeof(x) __x =                                 \
		(*(volatile typeof(__x) *)(&(x)));                      \
	mb();                                                           \
	(typeof(x))__x;                                                 \
})
combined with
typedef struct {
        uid_t val;
} kuid_t;

IOW, it complains about a cast from structure to itself, which is fair
enough - C is pretty clear about not allowing any typecasts to or from
non-scalar types, tautological or not.

Why do we even need that cast?  Seeing that generic __READ_ONCE() is
#define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
the cast added on alpha seems to be pointless.

Folks involved in putting that cast in arch/alpha/include/asm/rwonce.h Cc'd...
