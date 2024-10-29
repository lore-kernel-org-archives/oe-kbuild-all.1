Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12261F4FA8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 04:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730176943; cv=none; b=C3oZicDi6zkVDgRGfRqcl0dP9vrwOj5n6ZTloJyBKRM2OW8+c8xw4gWOYgUVBpLMLnwzp2udY75Uh7EOvov9q7088mr3BM9pTQu8Q8acWSjI5izVVAsM+BM0mdNjMERAO4GaHFsivqkn+1G2w/W4+qG0TuApjZD7/Zc9E/OiVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730176943; c=relaxed/simple;
	bh=CiB8PdUxgE2SSWDDmPtzZYlJTn0oJ8d/Vqg4vuRgxGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcHkAy796sAWpvepmg+uroNg5wPln0+OLraHtfTXYLv5buJEkTqs1FGda8ezSRIq5Laq++RxzfidfMN/gUN7/CfieAbzSZL354ZVwMWoe9gXqntFvGRol8qzLuYH6AY9f7XJzfG/KEZkRxYvkqhUaq7mhrIlEKG6o/GrtldMsw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdZTrF+d; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdZTrF+d"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b13bf566c0so306439985a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 21:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730176940; x=1730781740; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCDuYnGCVDfYfMTEaNcdXNBa6KERcUJLKMaVLvH9fgM=;
        b=IdZTrF+dnTBRLKf3klR/23sp5YFWfWUj3NyJvIdxRzMoX+sYa4ENyalEZdYWoHttCo
         b7eLjwDWGBbOz6fUnmuSlt7tFnuOHIlGvgMeyLiOayxdvooM2ucBTnKvwMRDu2shXlIc
         2SbipOK+jXnCGj14vDmwYq/r1jcq2X/+L+thb+o9fxf7AxoreqpxmiJPhWpKMvGOYGpU
         McruwFDxehlwtNj61dr4VrXxnXmfZNJIrJOl7I9/iudFMldeZpqADoQgnRL/3iVLlgNE
         Rf5iphejT8+RuDiwL4TbHCkjiSx59PWLonEiR+0N7JgBgxTWoW2WZEcWFRMV6M2Rw5mn
         3mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730176940; x=1730781740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCDuYnGCVDfYfMTEaNcdXNBa6KERcUJLKMaVLvH9fgM=;
        b=GLEFv9npsMQZIaD+pUFqvk/dBv1yuMS/htmvCQJ3uxfE8x3N/i534J9Vy4BRyPeK+6
         PUqvntU+EwcwhvNOb1XfjPU9x6zs17bsdw41yzKplzGVqQuOEugmOwvLfVnfhzW4/Rxs
         Q9c8Mt6d7uIS1q2iHw7fj+kl/LssQdYLv+3Zbl7Q5VwjRdU4BBC6ERvFOtb7zUUWXo+W
         IcdcA0DhzWwB6mE++/s08ClHhdbg7ilU4uRn/Er8kdfjYj1wHrky63p4iayTcriWn0uG
         MRLw3YVDQOm3n4A13pyMM1w7AjzcKqJWKGo0cmAKdEylWCZceZ4BDlD2EHlq3DG6sLMt
         5UMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMrLxtVLUCREc03oNN4JZdTeTWXM9y6j4kpfz6w7CN4QHMxvSUW3WP1OaBWgLwKV/V3uPOQnp3HRHtLr2F@lists.linux.dev
X-Gm-Message-State: AOJu0YyVQ6ffC+pCNCQgVvEN+AZZsOREsR27LK4J2tkCYva7NkNPagFu
	Sth8ki1p4HNbEqxLEKZxUjwE+xVahiaNwuvnDUW9MtYMS8YHzf+Q
X-Google-Smtp-Source: AGHT+IH5Fuoo7UvhdyIn+/1zNRvGW32cGzgVo0mpYat+WhPhJk1+IO+WW4lGkFX1mNOHGQz1yEpL8w==
X-Received: by 2002:a05:6214:448a:b0:6cb:f744:e3f1 with SMTP id 6a1803df08f44-6d1856f193bmr175571186d6.4.1730176940324;
        Mon, 28 Oct 2024 21:42:20 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d1798b195esm38890326d6.42.2024.10.28.21.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 21:42:19 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7A48D1200043;
	Tue, 29 Oct 2024 00:42:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 29 Oct 2024 00:42:19 -0400
X-ME-Sender: <xms:q2cgZ-JQEDYNhBmhP-4egJ2k4od9_4WhfIFaZl8B-kWB-cFQ9njR-Q>
    <xme:q2cgZ2KY64FEVoZnBNxEB0U7667zJHTbD_EW1TP21XjHmi4qaGM_0d1Bh2NGVw0uo
    tkPZ9CxEDx1xUE1Yw>
X-ME-Received: <xmr:q2cgZ-tF8Gl9C7osvC67-8inYIAeGfImEx49JX9R_FsXywfdYjyfu7r1AImd2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdektddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefh
    hffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:q2cgZzZTpn0UGN0Oe4nVQt4lpFJWinOhzrcvuL6uZ5ehI2sbR3Ukew>
    <xmx:q2cgZ1a2n7Sr2USK7sKqPxAa11lMKvox_lPE4h5wsxY7k-lavcZd-w>
    <xmx:q2cgZ_CCAJJhxDQZIbYxdDoUid7XqSfn8-K5DHUowdN7hmSofLGWaQ>
    <xmx:q2cgZ7bxuOdXpwNXqY5ZuDEofyMQDMBTq4Vn4Xq7O0Fe-Fn1oJcBDg>
    <xmx:q2cgZ1o7YYPs5yQVXtdDzzAdC0okMns-k0D_CQ6W996HEKINou70uWN1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Oct 2024 00:42:19 -0400 (EDT)
Date: Mon, 28 Oct 2024 21:41:17 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Alice Ryhl <aliceryhl@google.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [boqun:lockdep-for-tip 5/5] error[E0599]: no method named
 `try_lock` found for struct `Lock` in the current scope
Message-ID: <ZyBnbZXDo8KlJ3vC@boqun-archlinux>
References: <202410291211.4JnU6G41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410291211.4JnU6G41-lkp@intel.com>

On Tue, Oct 29, 2024 at 12:22:05PM +0800, kernel test robot wrote:
[...]
> >> error[E0599]: no method named `try_lock` found for struct `Lock` in the current scope
>    --> rust/kernel/sync/lock/global.rs:90:31
>    |
>    90  |               inner: self.inner.try_lock()?,
>    |                                 ^^^^^^^^
>    |
>    ::: rust/kernel/init/macros.rs:822:9
>    |
>    822 | /         $vis struct $name <$($decl_generics)*>
>    823 | |         where $($whr)*
>    824 | |         {
>    825 | |             $($fields)*
>    826 | |         }
>    | |_________- method `try_lock` not found for this struct
>    |
>    help: there is a method `lock` with a similar name
>    |
>    90  |             inner: self.inner.lock()?,
>    |                               ~~~~
> 

Ok, I should have noticed this one depends on try_lock(), but it won't
be a problem since I plan to rebase on v6.13-rc1.

Regards,
Boqun

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
