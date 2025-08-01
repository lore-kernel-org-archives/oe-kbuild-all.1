Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C878F26
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754074272; cv=none; b=kI9YBnH7JDki1IFVNTnFtYXngV/xvu5ZgPjOjE8yK5w0AXHJgQqKpKgZNCVv/CrgXsv6je0NkBEJwMyUjaDnNQjoBU5caMHF4mPnNYelk1DmKwnADZZO8bAbXG+HRO3YagEhjt1rECraej0bgkAUk3s9XccMBoUxUi0vQrjsnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754074272; c=relaxed/simple;
	bh=GJtOm3slrvof6q+hTzB/Ofv3KWMB/gG+He2meHC94sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1CW6wY3J7ZyJwbjmsRLSZF+tzgBWVFkqQlQSH3xR+njYc37Jjltd6WPWo2ZhY/pCYeq3FEg700WI9xl1wXHljQbghpig5PDqNhiiTlXkdcrrHoYL854qMzfl5J3UlkMp9oLU1MnFuJP6D/tij1Y6BKH4JGm6px0tNnk1lSZmV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVmYsvkl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVmYsvkl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4589b3e3820so24786325e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Aug 2025 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754074269; x=1754679069; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SK9F1RiLyxBRk7x2ImhfvuGUVVv8TtKtiEni0Ha8RRY=;
        b=IVmYsvklN6cEsEa+QFYsqIK5XETJFpKDPHm87oPOAnBMFFCV7pOPmqWiPJoke0OTFq
         NIs5bqhIVebgIgDCeUcMBSxTwuPlPErqHFqR6ZXQCGlGSr43wzkKDExgBryBiva6CG5K
         qZmnsbQZOcVUKhTTkQ8qSl4L3ipjdBjc/6OsWqZ76hItSYUQb+uJ+WloJ9ypBarYzZGW
         Ahl7g2rQ8uP8Ax3R91WbhFDzLOy2fRxP9pcKRIVExMhIgMDHcEp0GKq8Wa1+dt6CUWg1
         vZKDY9BNuZiOgml61nQ65ENHDnLErHQOhfpcOcd9EDlSS6D1ihQI385Euein9vlfVqxc
         YUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754074269; x=1754679069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK9F1RiLyxBRk7x2ImhfvuGUVVv8TtKtiEni0Ha8RRY=;
        b=jWuPzSrgmiuXKoWzoxlrxeZWsO8bfYVgcfOAHqOjMYK5w79NsJnxFH3ZflQvOHQw2a
         6c3PS6xMaonkMPLz9mAja2bTSLpPIsl6Tux29hLs3Bwjmnz2KClpbrkHBhv88LuL+Ngt
         Sha5x97uGxfJhtQ5590/61uddkAzqeNOE72O1+tuC+4ZuTB6Y62wLNWsEJ97f/MtfsP0
         1TY36zrQn+odx74LJaixpb7T6KCfff7NGXGSCIpcR9P0rGATMywZkFXvt5wM/31wsqnJ
         r70niSIL9PRsRJUsnFVii/b8m20VTFYlWSdif2s/jcNSO/DNIJ5iFVX/5QalY+KquLIa
         WvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHokizxLjFzp2J++YN96Ih+pCc/9RvuBTf9vju7xqZOcTs6RkZsr1/oJntFTpL3B0BsVKTWpJWICHsiSm1@lists.linux.dev
X-Gm-Message-State: AOJu0YwANjxjLxB1mDWnyE0fPYEl6zQG1hU0UP2NC5bxeWr2aFLmi9qW
	2oPmkJZi7rdEfAzXHveUrtjAXVT6gk7gquSlWIJoDbhmjCz90ny3j7m8
X-Gm-Gg: ASbGncsByqgm2nT0AB6bg/z4muCd/M2E+ze1SpvA1SE9+azGaJDh5C6+YmXcgzNTNPl
	L5JqfDZRkbKOn0E+v4SfHrI1FhcArCxsgMH+M0hoyroF5KBAYdCWb4G5y+uAVo9fHDLlXrxTeeN
	msTGkNmCQ5FTkRyvTwEi330u1PXZFvaCUAiFjH5CEriTo4gAe9v0ljiiYyMDcy3muPTXHYm8d3L
	2vEXdkg00efe98IfBvWuYbEc3BTjdlVbiDzp0gi1OGMTRkGpo47CNDy19LIIE/I01xmd6e0z/MY
	bE0vQpONCKwFWw9RMpBctkIM+mpY363b7L/95kbComKvS2iyDT/joS7VwF8FwVegKuUn2J6/1wF
	/5o5rfNnRMF75vVAHtCbT531vYEupH3ogUuhMmUeiu4qeMNcQH0gOzSyEmYEFlA2F1A==
X-Google-Smtp-Source: AGHT+IHzu2OCBXlhfBQt056QzK8rnB23WlUCbZ2hbfwLiegFccJTuK4y21n6xhQsjPwJw9oOLIefxg==
X-Received: by 2002:a05:6000:1a86:b0:3b7:75e8:bd17 with SMTP id ffacd0b85a97d-3b8d9468cd1mr693243f8f.8.1754074268866;
        Fri, 01 Aug 2025 11:51:08 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453aeasm6981732f8f.40.2025.08.01.11.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:51:03 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:50:56 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org,
	bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
	fw@strlen.de, john.fastabend@gmail.com, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org, lkp@intel.com
Subject: Re: [PATCH bpf-next v3 0/4] bpf: add icmp_send_unreach kfunc
Message-ID: <aI0MkNvWlE4FXMV8@gmail.com>
References: <202507270940.kXGmRbg5-lkp@intel.com>
 <20250728094345.46132-1-mahe.tardy@gmail.com>
 <b36532a2-506b-4ba5-b6a3-a089386a190e@linux.dev>
 <aIiaB2QUxKmhvPlx@gmail.com>
 <7083544f-5b0c-432e-bec8-509ca733f316@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7083544f-5b0c-432e-bec8-509ca733f316@linux.dev>

On Tue, Jul 29, 2025 at 06:54:58PM -0700, Martin KaFai Lau wrote:
> On 7/29/25 2:53 AM, Mahe Tardy wrote:
> > > Which other program types do you need this kfunc to send icmp and the future
> > > tcp rst?
> > 
> > I don't really know, I mostly need this in cgroup_skb for my use case
> > but I could see other programs type using this either for simplification
> > (for progs that can already rewrite the packet, like tc) or other
> > programs types like cgroup_skb, because they can't touch the packet
> > themselves.
> 
> I also don't think the tc needs this kfunc either. The tc should already
> have ways to do this now.
> 
> > 
> > > 
> > > This cover letter mentioned sending icmp unreach is easier than sending tcp
> > > rst. What problems do you see in sending tcp rst?
> > > 
> > 
> > Yes, I based these patches on what net/ipv4/netfilter/ipt_REJECT.c's
> > 'reject_tg' function does. In the case of sending ICMP unreach
> > 'nf_send_unreach', the routing step is quite straighforward as they are
> > only inverting the daddr and the saddr (that's what my renamed/moved
> > ip_route_reply_fetch_dst helper does).
> > 
> > In the case of sending RST 'nf_send_reset', there are extra steps, first
> > the same routing mechanism is done by just inverting the daddr and the
> > saddr but later 'ip_route_me_harder' is called which is doing a lot
> > more. I'm currently not sure which parts of this must be ported to work
> > in our BPF use case so I wanted to start with unreach.
> 
> I don't think we necessarily need to completely borrow from nf, the hooks'
> locations are different and the use case may be different.
> 
> A concern that I have is the icmp6_send called by the kfunc. The icmp6_send
> should eventually call to ip6_finish_output which may call the very same
> "cgroup/egress" program again in a recursive way. The same for v4 icmp_send.
> 
> The icmp packet is sent from an internal kernel sk. I suspect you will see
> this recursive behavior if the test is done in the default cgroup
> (/sys/fs/cgroup). I think the is_ineligible(skb) should have stopped the
> second icmpv6_send from replying to an icmp error and the cgroup hook cannot
> change the skb. However, I am not sure I want to cross this bridge. Is there
> a way to avoid the recursive bpf prog?
> 

Thanks Martin for the review. Indeed the recursive BPF prog call is a
concerning issue. I'll take some time to think about it and hopefully
propose something.
