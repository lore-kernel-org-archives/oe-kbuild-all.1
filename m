Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961B636F903
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525529; cv=none; b=qpDnLrge14BI2B15EHMw1VAJyKL+QxiVpXR314Pqs2px7+yPfIL046Y+ZNz2g46u4uXoB/RjxFxJ77RsJFFXiSTTFdANLktbEgQ71RgWeVWsXvpaAqznV+BxUC9CC0jiQDrE2YG0E5esh1L14LWAakDjM/8V84yGcCjvLJhkSNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525529; c=relaxed/simple;
	bh=rtJUv4iZDaCzEUrSRD2Rsgtlx4m18MDf7E65kBmgxFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IrNh2IUY4ccsulxNNOy7V98A9LXaKReQWFhldDumtFtfoZnokg4sLJTNCvzV7Td3g/cp+vZJdT0/BXVIw8MzfQCSwtrv42RNbFYrlezpSPITt+SqBU4v8J5fmEa+nWOOL03gT+xACJLGzp2CRoog1VrJmUXSrJ8MNLrJwL0pzb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=caa/ycOD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="caa/ycOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783525526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VUswxolQH+G7Pvrkxx/sNgz3/Sf530ro9ZtzpYrttA8=;
	b=caa/ycODKtSG7TI9wLxA5e0rltqfCue1j0wEVvnvLS3bVnOnBz2JatTF5VBDnFKhDYNTpk
	cEWeBNfe0uttlmt4HVEMcvsmk6syLDyiYo8uVt14mG8tZYrkWWrN3PmHOz8YxpcyGFFd5s
	xOP35IqIfgbw3k4XsF30dfQM1dXsaOo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-84uXnu2wMhG3oO4ksUDIVQ-1; Wed,
 08 Jul 2026 11:45:23 -0400
X-MC-Unique: 84uXnu2wMhG3oO4ksUDIVQ-1
X-Mimecast-MFC-AGG-ID: 84uXnu2wMhG3oO4ksUDIVQ_1783525521
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3045519560B7;
	Wed,  8 Jul 2026 15:45:21 +0000 (UTC)
Received: from fedora (unknown [10.44.33.83])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1F0CF195606C;
	Wed,  8 Jul 2026 15:45:17 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  8 Jul 2026 17:45:20 +0200 (CEST)
Date: Wed, 8 Jul 2026 17:45:16 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Bradley Morgan <include@grrlz.net>
Subject: Re: [tip:timers/core 2/31] kernel/time/posix-cpu-timers.c:1307:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <ak5wjJSOyqpXKBdj@redhat.com>
References: <202607081829.RPQBe6Fs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202607081829.RPQBe6Fs-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: Q1nVbhKHp4K_jGVef1Tf4Ma4jDCeeaJroWtrKPiOPec_1783525521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/08, kernel test robot wrote:
>
> sparse warnings: (new ones prefixed by >>)
> >> kernel/time/posix-cpu-timers.c:1307:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    kernel/time/posix-cpu-timers.c:1307:9: sparse:     expected struct spinlock [usertype] *lock
>    kernel/time/posix-cpu-timers.c:1307:9: sparse:     got struct spinlock [noderef] __rcu *
>    kernel/time/posix-cpu-timers.c:1367:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    kernel/time/posix-cpu-timers.c:1367:36: sparse:     expected struct spinlock [usertype] *lock
>    kernel/time/posix-cpu-timers.c:1367:36: sparse:     got struct spinlock [noderef] __rcu *
>    kernel/time/posix-cpu-timers.c: note: in included file:
>    include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>    include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>    include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>    include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>    include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>    include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>    include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>    include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
>    include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
>    include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
>    include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *

IMO, we should remove this __rcu annotation, it doesn't really help.

Oleg.

