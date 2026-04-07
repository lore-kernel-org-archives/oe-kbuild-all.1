Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C9737C901
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596940; cv=none; b=RROWYAQqjUHNaeAiSW0LH2DxfqyGG3gRLg8rYvW+lqSp1fw/IBeu36QOTwDxHfMP63Wl/JGvvvTqJTUxWtiCLk45kLR2w8hRhSB3OOLqO6OtcDyoVrFOZQokFBeXGNwiDW5amR7t8ru1iQCTofXXeXg9dx4nVLLdLBDkaHkHz5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596940; c=relaxed/simple;
	bh=oFXUOMCsWM0FVG3uwyZVORg9tvvv6jaX/JdVX69Md7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OWl+0tUolGFSDsnvSmDtAnIyowmvTpLTNuLgiEwTqmouLi6Prl/WFsssNZTmP2WYddun5eK4/EZH3GCX5G/xnzyQqgWr8IJJYUwXXVnj46l9bW2R5AvXry6MmNRg0giB8dvAzBTzP3Yx5+9+9VQM4ihb0HhKxCD9Uj0GWm+QMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TrkNQz+M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TrkNQz+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775596938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08oaNpMk0ZvV0Wt0jg05aCMOjVRxzil+ZF5ABphc55M=;
	b=TrkNQz+M8n5vNixQLPO6uXgt0+Jfa7NqoFl6BcBBabLecKDYIngO/jrP5rIT/xJ5YVOB6z
	/c2o+d0ZfnTHzEKBVAZcvEb3WNtC0txtkWqL1/weB0gYfyO2ZghiGX29rAc1nV3emj7Jhe
	HT51LlfkEIwn6hM9ThIcAdqpvbZ5ULs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-mQHGT6mpN9GXzYVFdNKmBw-1; Tue,
 07 Apr 2026 17:22:13 -0400
X-MC-Unique: mQHGT6mpN9GXzYVFdNKmBw-1
X-Mimecast-MFC-AGG-ID: mQHGT6mpN9GXzYVFdNKmBw_1775596931
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 534FF19560A2;
	Tue,  7 Apr 2026 21:22:10 +0000 (UTC)
Received: from fedora (unknown [10.44.32.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 5EEA4300019F;
	Tue,  7 Apr 2026 21:22:05 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue,  7 Apr 2026 23:22:09 +0200 (CEST)
Date: Tue, 7 Apr 2026 23:22:04 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kusaram Devineni <kusaram@devineni.in>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH] signalfd: don't dequeue the forced fatal signals
Message-ID: <adV1fCyvANv4h2dH@redhat.com>
References: <adKJMRkQJXEwHs-j@redhat.com>
 <202604080450.mkKRp9Mk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202604080450.mkKRp9Mk-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: QmHBCTODOKba5ChNjD-2qQmak0LmztvVDVxOdMjkkAY_1775596931
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04/08, kernel test robot wrote:
>
> kernel test robot noticed the following build warnings:

...

> sparse warnings: (new ones prefixed by >>)
> >> fs/signalfd.c:53:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct k_sigaction *k @@     got struct k_sigaction [noderef] __rcu * @@

...

> vim +53 fs/signalfd.c
>
>     50	
>     51	static void mk_sigmask(struct signalfd_ctx *ctx, sigset_t *sigmask)
>     52	{
>   > 53		struct k_sigaction *k = current->sighand->action;

I am going to ignore this new warning...

Yes, task_struct->sighand is __rcu. Not sure this annotation makes a lot of sense.

In any case. current->sighand is always stable. Plus task->sighand is stable under siglock.

We have a lot of (correct) non-rcu deferences of ->sighand.

I think that only lock_task_sighand() needs rcu_dereference(tsk->sighand).

Say, __exit_signal() does

	sighand = rcu_dereference_check(tsk->sighand,
					lockdep_tasklist_lock_is_held());

To me this just adds the unnecessary noise. I do not want to add another precedent.

Oleg.

