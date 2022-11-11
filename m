Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A46624F4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Nov 2022 17:24:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8DB9A5C00BE;
	Fri, 11 Nov 2022 12:24:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 11 Nov 2022 12:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1668187449; x=
	1668273849; bh=QOTcA21cqcsITqBw5icVaday++ZbfwJipST7wujq1g4=; b=q
	W1XHnivRerh4IMnxtUFj1omHbt5v2AEbPb6Ly+t3/2sWJMdpGKBcMLE3k5klFqPc
	5qYl6w2fUz+BiYV8DakEX5H+/bnjxs70RWvr+cQwYHhnqNnLjj3u5GLU3NVHg/Xo
	+jY5oBBBn/fyrNkcggzwjs6SkbLUzqoqwHK10RZqb2LbPtg8qVPn2sk6qPjrzyy7
	mN9P93uw68XAHVtqVS/+6mRmEAv9A4B/9GfVBvW5C5FiSlJh/NHuUYWq1Rq7bMAo
	HrFIWEErcjXukWw1y15y45bdjzQN5Gv83vFbRWMIXf9EzjldlIVXb/p/ucUpOse/
	Dg4BmZE5TEs3uQxwVzYbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668187449; x=1668273849; bh=QOTcA21cqcsITqBw5icVaday++Zb
	fwJipST7wujq1g4=; b=C9aygfG1oadu1cYfvsEP5MNyRiYXbbeYB3SfrjbI3/Zy
	svxxK+rGrt3lsGFJJOh8dSTn/aAVORd4MvkEGru7WtkFcJc79D90eOtwcb+W3VT/
	eidVM9xbkuelBv9arFclAoCCBwIxAEE128hxISeI2ZsmZnMG7UJP7XAoqggOQkBD
	c7LLcqTsPWdio4eiYpJlU8Pc52+r7DZSNHh96QYfV26AKj3CkSeX9GT6YPqQ9vWQ
	8za7/JKc5/R2OIqev553S8Rn8Umac8lAennohSJ5NB/oOI1aH8v3Ca/kMD3IYEbS
	yOHWPkcDS0RoboGsEXu19dgxbthp7/m676j6/ZN3iA==
X-ME-Sender: <xms:OYVuY-8Me23H-P5641jHFuCsIckoZDjtLHZhk49mMUV5oVBWRRNSMw>
    <xme:OYVuY-tXTaFfuyjjkVkOriFRvMK19dq0ed3KMRUhq1tYkRmXtuntaesIjfnUzZux2
    Z6VnXqtDNXV82SuJuQ>
X-ME-Received: <xmr:OYVuY0Dp7_izdWV52NFRvzWgDiWB3ls0oGI9iy3e3zC6nK4MhCT_2tWacXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeigddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheplfhoshhh
    ucfvrhhiphhlvghtthcuoehjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeehhfekuddtgfdttefgleejgeduhfffledtvdetfeejveejueet
    vddvkedtgfehgeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehj
    ohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:OYVuY2c8mVWe8Xf_JgBk0_awfhQDftynwkH9UhwENJ7OO5RzGTzO6g>
    <xmx:OYVuYzMGu1tcnKxRCoSQTrqHNZK0GVLsFcvagREEWtxqNwrvZLSr7w>
    <xmx:OYVuYwkSHohXPLOh2F2IQKMYTT136vyqPVS5B5-YsDoQ3_sfsOBiCw>
    <xmx:OYVuY53NfgS5iNnCkFk7H-KrtH0qfu77HvCZ-v62sfDPhnGJDwQm0w>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Nov 2022 12:24:08 -0500 (EST)
Date: Fri, 11 Nov 2022 09:24:07 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: Vlastimil Babka <vbabka@suse.cz>, oe-kbuild-all@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Subject: Re: [lkp] [+5395 bytes kernel size regression] [i386-tinyconfig]
 [b7c8731082] Deprecating and removing SLOB
Message-ID: <Y26FN02o7jhV87wl@localhost>
References: <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz>
 <Y25E9cJbhDAKi1vd@99bb1221be19>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y25E9cJbhDAKi1vd@99bb1221be19>

On Fri, Nov 11, 2022 at 08:49:57PM +0800, kernel test robot wrote:
> FYI, we noticed a +5395 bytes kernel size regression due to commit:
> 
> commit: b7c873108294f0fd19c7e4d6b038a05375b3cd33 (Deprecating and removing SLOB)
> url: https://github.com/intel-lab-lkp/linux/commits/Vlastimil-Babka/mm-slob-rename-CONFIG_SLOB-to-CONFIG_SLOB_DEPRECATED/20221111-183529
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
> patch subject: [PATCH] mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED
> 
> 
> Details as below (size data is obtained by `nm --size-sort vmlinux`):
> 
> e1e3de44: Merge branch 'mm-nonmm-unstable' into mm-everything
> b7c87310: Deprecating and removing SLOB

This patch has the net effect of switching tiny over from SLOB to SLUB,
which causes a 5k+ size regression.

I *absolutely* appreciate the value of removing this much code, and I'm
not going to propose keeping SLOB for the sole reason of being 5k
smaller; it's not worth keeping a whole allocator for that. I also
wouldn't be surprised if we get *some* of that back by simplifications
this change enables in the rest of the kernel.

But I'm wondering if there might be any low-hanging fruit that could
slim down SLUB to the tune of 5k or so, that has been previously ignored
because SLOB served that use case? For instance, largely self-contained
bits of SLUB functionality that could be omitted on the tiniest of
systems?

- Josh Triplett
