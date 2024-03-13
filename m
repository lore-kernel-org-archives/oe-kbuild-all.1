Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A36B51C49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 19:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710360001; cv=none; b=Z12x0roErqzXpnqa2B5A8IpMTmHYvd9maM9glbfVSqpNSAgkZJGxhid8aRdKOJwSl5zHNLszgWtEg93uA2zXaKuRblnpfy7zffG+t9uAf8Ki9Q7HpeqqtK24Z41PGmbMhQdp4MUFrmQNk+1XBAmRsH1U1YsR/mxFaNdJFdIJDyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710360001; c=relaxed/simple;
	bh=CGsygGu0YBuMPUFVylIGN3ngzXQKapZbUDBmXCxKlVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=esS+hQtYUHkMBrClrfsP4lPqbg8z4quYQHcL+m4JMHbt4sKHum834hoEvkikTV1GLi6cONV9Ljm9+cx2/R3OQhn8VgMkmoR/sRuCaVzjms9EKgHD0zT8NxP1LpSYCO6kT7IztxpsC0qkNdAwbvqoKvq3K+ON76YMyGC9+xw+UM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFSQfMUT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFSQfMUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710359998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OT/Y9QQ6Z08J3liv/tH6iPL5XyEglqP4zZ0zDaWC/as=;
	b=UFSQfMUTtczOHWZGctFw0RhfDG6c0L70cWvi+zwRn8jvFyLjIse7S5EftFVRK7DBrf9oUG
	tQjUocXmpAZZNEBMon7mZsYRLDkRFv5++GiXf3+XadCIToqb7OMrDqbhqO+E73kjIxERip
	yBx5RgCMxBMQOLXCde5IFofEkE7YTdw=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-L0M6c9F8OvS9cJdeSNJoXA-1; Wed, 13 Mar 2024 15:59:56 -0400
X-MC-Unique: L0M6c9F8OvS9cJdeSNJoXA-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7de0e459ecaso60745241.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 12:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710359996; x=1710964796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT/Y9QQ6Z08J3liv/tH6iPL5XyEglqP4zZ0zDaWC/as=;
        b=AQXnViz6iCC1qK2TqAbJ3L6bpwQwXzJU+C7XGE0Iw5qWBDrWtL5kH5VIHkO9N/uPRl
         2Lt//n2P7wqRDHGSETrmQOS1O6pf3PDnbzdqH0dYamsxx8v0VjK/68N5aiQqGzr3TT9Y
         yyqrjqTmwj+q6eLYl1rGZ+cHy1QSulqnzOkFSHwsIKDATtT3of9U8axq25YEmfSEUUJr
         V1QDQFCZxHcKTyWAQAJ1zsV+QKKSTXvI/ao1a1QhLm5K54Uvh5g4iGczU5Dl2agttlDz
         8PhX3Wk+ZFsBt+ZPoLEnh78ifJPY3cg5bZclqk/oOWjAyOR47cRQtIvjUtUhvDeReDar
         J2qw==
X-Forwarded-Encrypted: i=1; AJvYcCUV3iYhKEO9jPNUrn8L+EcuAcrGmrxFOMEZQ8yNblzpCfEWLO2/6Lew05GlbS5I60NQe2dqAZJ4l6LzK0Ge1LK88erdUNlKiVjspdSGmw==
X-Gm-Message-State: AOJu0YydkvOA+uDdr3NETCqOl4hVAi4N90jMSFN+b7opCCU8fN0HQcpI
	NZ8Waj0ZvnrwO6qpxr+fsNq9Qj9LAX1rnmk2A6XUCUK2IDwiqHObzup+xhisxZOoyefjtE0r7aP
	iZrEYEM5UUhzcE6HNObiSAJ+3DIQc6+q65ejWlCLu95aSSp78EhwX9BY+q3IZCd8=
X-Received: by 2002:a05:6102:75a:b0:474:c9ba:15c with SMTP id v26-20020a056102075a00b00474c9ba015cmr2603157vsg.1.1710359996089;
        Wed, 13 Mar 2024 12:59:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9zN0pmpVDmc5Gc6GXRnzX40ks1zjp2z6++GRPtEOQ4AjG21HR0RoEzC/HjYNFaQ9G99Tn4A==
X-Received: by 2002:a05:6102:75a:b0:474:c9ba:15c with SMTP id v26-20020a056102075a00b00474c9ba015cmr2603145vsg.1.1710359995684;
        Wed, 13 Mar 2024 12:59:55 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id p9-20020a0ccb89000000b00690f23c8605sm1828921qvk.23.2024.03.13.12.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 12:59:55 -0700 (PDT)
Date: Wed, 13 Mar 2024 15:59:53 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [linux-next:master 12265/12944]
 arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of
 function 'pud_leaf'; did you mean 'pmd_leaf'?
Message-ID: <ZfIFubXPrb7pLFSB@x1n>
References: <202403101607.a42gaLOS-lkp@intel.com>
 <Ze8vFNV9YSdgC2S7@x1n>
 <20240313120622.62c76d759cc06f80f0aeb48e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240313120622.62c76d759cc06f80f0aeb48e@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 13, 2024 at 12:06:22PM -0700, Andrew Morton wrote:
> > 
> > There's another possibly relevant report for riscv:
> > 
> > https://lore.kernel.org/r/202403090900.OwPqmRuI-lkp@intel.com
> > 
> > I think I messed up the nopmd use case.  Since this commit already landed
> > mm-stable, I assume there's no way I provide a fixup.
> > 
> > I attached a formal patch below, but I don't know how to test it myself,
> 
> What I do:
> 
> Grab https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/13.2.0/x86_64-gcc-13.2.0-nolibc-aarch64-linux.tar.gz
> 
> untar that into /opt/crosstool
> 
> And my crufty old script does, partly,
> 
> 	WHAT="$*"
> 
> 	...
> 	[ $ARCH = arm64 ] &&    CT=gcc-13.2.0-nolibc && XARCH=aarch64-linux
> 	...
> 
> 	PATH=$PATH:/opt/crosstool/$CT/$XARCH/bin export PATH
> 	export CROSS_COMPILE=/opt/crosstool/$CT/$XARCH/bin/$XARCH-
> 	export CC="/opt/crosstool/$CT/$XARCH/bin/$XARCH-gcc"
> 	J=$(grep "^processor" /proc/cpuinfo | wc -l)
> 	J=$(expr $J \* 2)
> 	nice -20 make -j$J CC="$CC" $WHAT 2>/tmp/log-$ARCH
> 
> setenv ARCH arm64
> crufty-old-script vmlinux modules

I'll keep these notes.

> 
> > and I'm not 100% confident.  Before I post a formal patch, can anyone let
> > me know how I can kickoff the test bot to test the patch (or help me do the
> > kickoff)?
> 
> Worked for me, thanks.

I will try to do better next time..

Thanks a lot for the help, Andrew!

-- 
Peter Xu

