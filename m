Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8F2032D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757981595; cv=none; b=uMXi1lCOgzIgUrCXR/iBsj/R8mmeseM+a7NT+R3LYTN3GL2zWClPRNF+ZhV43eGdVQ935gln5TunJ2C9MVkGpHq2JDpRkz6dwgUyyLfoDHAhCwvH3ZHaLjz5jtAdHtziQDGU+NUVNWLIBERD+mzcoE+GxSbt6Y/leatAcxF51gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757981595; c=relaxed/simple;
	bh=zibqQZwr3QxoYQRF0TRmInD5aMK8ZHuiAa9z79hkNqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCKBcwGydl7YUUsp3qUBN1r5O9xs9CoXxvzK42bag2RzkS1hjZFbofl0erXA1UuRQCnyuvdINBJPP0ME6BoSVFJDS0wTS7gi9ux6ilWQ/0YVPeSRVBfoHiWvK1wRpn1bF1BRbgezzqHtctlJDHBgOvepWjJ5X21YiZnuoLQwy1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBPcxNUY; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBPcxNUY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b7a40c7fc2so19769471cf.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 17:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757981593; x=1758586393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSYsYYKKYH9Hg+eGr/P9u+apnCaWPbzhHHRAnteKM/M=;
        b=bBPcxNUY4BsicD8vhjjy3u7it51CB9mP55VJoaHT7bGHCJi9+1dT5bllSQ0SrNdir8
         EvCoPIs3V8g1VsBt03dkQTDXGDpN6xtzDo2Ks+nl81CagIEkrSOgoCztBCK8FAvfB7uw
         siCs37l2xAmOzwFW0mOZiDC8jjojrpbiEQ9xMTl8a5cLDrc4BfSQBetbyKbFwohLjF3A
         shglKoyG76qkhlsV2sboqK4eBVr5wQSWjQZ2XALMwgu0ZzrBlMTIj/lq0um5l49+eF9Z
         TK5A8BYwjqW5zuUOa2UpuDTiCoxOCzdb0qN0gtmG8KfSpk+Kuw2rPbRXHcrAneK1NesF
         OFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757981593; x=1758586393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSYsYYKKYH9Hg+eGr/P9u+apnCaWPbzhHHRAnteKM/M=;
        b=c02Qd8pyabyie1IRvWiNOXO/x5pDyEIB+axcQnZxNFb999liOIYWygw8QPhdF0FgpI
         6WhPDMKwquQIB1SM5NJkvHusdlYK/pX4DCIee8/5NRe+rhdyiIaL6i15zGSDVSRq+eAQ
         z8qWy+6bejo9bnU3WTVWoqbPDrSc/wbq+U/qSm3/aWuCfGJvHbVxysHFlhi3dB836xjC
         lq0M9fLxPSIwNlO7Ou2OpZw4GuX87gOBr18KLgF3uKNdnjjzQ3C+Gzsr+a7Q7/PBVpuh
         NL89YBo6zng+rPU2P2uLmf1uI5sPIeRDQZ4+Djrhj7Q8tKF1xbeH4ErF2dzJ/gghRZhV
         JC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU73BF+2o10fxqGrBhxveF2gOSc7JqdHm9OPCdCfbkbvPBadR+9pFW8D2zN5vxxHFUxnWlLaY3RejsTBSzN@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1jpSYhm9qzoqTkGI1P4b0GGpfWv8R4tPFz0uNg3ojuI5NarAy
	0i7Dko0yhMMOBKE+2zn3fztZqma39Tn4VqDwR77oCe/6q5L7zadhOn5MjhtCNw==
X-Gm-Gg: ASbGnctEHFripE3YhGoY3+KrDsgqdB0b82hhHW0BkrjqghgFPRWwi7vWVaTq6iF6EFU
	k3EaepkEmr9IElZXfjzpF+BEr4eTAsYqtXgXACfuTLve9IKTQiPFeJRQ9iC5LSDKq0PqiPVfUY0
	dnkQN0h14SnMpWtje8FucfHLBLLNWx2yTvuIlfsWKWA5IMm8m2SA3RFlN8fQC+uhFUmC83Ygw2+
	0a4uh9Q4sD7/oLUlbviv+KfOrmNLxOO9CD6+MmlQ0NdPZt/f017iWiDkzgMdYb0CletEfSERGN4
	gopDL6veTpz6pka+vVyNomGCK8VS6JQS64Cj6VgfSClrRv1ca7vsgyS12g3o8QvJ0JZ9xtz9fEC
	/21wvCIt1AXk+N1zp6uWcy1UnZ7dK1VJa9ibIXB8chQLsfzT/bLG8KJsDoaBHzPjMAzPHyk+QkA
	EfvoPupff1AFqJqUJrXtGtnH0UCgLm+9+IgQ==
X-Google-Smtp-Source: AGHT+IH1If5tReFM+HcO+eSAEzoMaBd512hWMkh3DGEw+t26FV4IqgXegxg+fJcc7U3Bg9kjLo4PrQ==
X-Received: by 2002:a05:622a:494:b0:4b5:e524:4e6f with SMTP id d75a77b69052e-4b77d0aa6d7mr149555031cf.80.1757981592800;
        Mon, 15 Sep 2025 17:13:12 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639b98927sm73574821cf.1.2025.09.15.17.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 17:13:12 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 11977F40066;
	Mon, 15 Sep 2025 20:13:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 15 Sep 2025 20:13:12 -0400
X-ME-Sender: <xms:l6vIaDLPl1qcHt50T4nUfNFM1KP49zC-8AcDxYVpahzDXHacJIfsvw>
    <xme:l6vIaBxUYtYYp4Mn-JVmVd3N8lt59bLdyaN8OspcxuBgpz2kty2P9sre8btAQisXa
    LBI17njMmpDiN--PQ>
X-ME-Received: <xmr:l6vIaBuu4IKm2E6mqm7adk_m_Cw22MT50fN3zrJSXpJzgBXd9DcDsPPpY6l6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefledutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepjeffgeeijedvtdfgkeekhfejgeejveeuudfgheeftdekffejtdelieeuhfdvfeeg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthho
    pehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegvlhhlvgesfigvrghthhgvrhgvugdqshhtvggvlhdruggvvhdprh
    gtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:l6vIaMBfAUqCmTl922DpXe_aHKX8j0G42WzDlOpSpwrhMtBrNTssmA>
    <xmx:l6vIaLEraPuUtBKkyvyDUfq6FcWNsqyV7u_NaxIvyd7jjs5dk7xJjg>
    <xmx:l6vIaEDZbdsXwMq3cfS7in5mu2T3SZUdhGdIcx6DMQjBdAMyyUqEVg>
    <xmx:l6vIaJkBahbjeIfz7xMf82wvo5Qka1ZVkPMzfCKequDqZGjO3fj6SA>
    <xmx:mKvIaCP8u0u9U0ovTCH1HXBK5yAypQpnmfxFk_35LVVnCWuIgUUvQt-h>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 20:13:11 -0400 (EDT)
Date: Mon, 15 Sep 2025 20:13:10 -0400
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>
Subject: Re: [tip:locking/core 1/13] error[E0425]: cannot find function
 `atomic_add` in crate `bindings`
Message-ID: <aMirlpnVNLqvwdCu@tardis-2.local>
References: <202509131610.IPwv7fy3-lkp@intel.com>
 <aMWMVQiZxE_mv7va@tardis.local>
 <20250915073345.GR3419281@noisy.programming.kicks-ass.net>
 <20250915074133.GF1386988@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915074133.GF1386988@noisy.programming.kicks-ass.net>

On Mon, Sep 15, 2025 at 09:41:33AM +0200, Peter Zijlstra wrote:
> On Mon, Sep 15, 2025 at 09:33:45AM +0200, Peter Zijlstra wrote:
> > On Sat, Sep 13, 2025 at 08:23:01AM -0700, Boqun Feng wrote:
> > > Hi Peter,
> > > 
> > > On Sat, Sep 13, 2025 at 04:00:27PM +0200, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
> > > > head:   502ae97746ab6d7b7b48d54b6a85a11815f390d0
> > > > commit: eb57133305f61b612252382d0c1478bba7f57b67 [1/13] rust: sync: Add basic atomic operation mapping framework
> > > 
> > > I think we are missing this patch:
> > > 
> > > 	https://lore.kernel.org/rust-for-linux/20250905044141.77868-2-boqun.feng@gmail.com/
> > > 
> > > in locking/core. It should be applied before all atomic patches.
> > 
> > Ah, let me go fix things.
> 
> I've no idea how that first patch went walk-about. But hopefully I got
> it right now..

Yeah, tip/locking/core has the right version now, thank you! Of course,
tip/master needs an update ;-)

Regards,
Boqun
