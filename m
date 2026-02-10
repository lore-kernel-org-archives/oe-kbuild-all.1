Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7293A8F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727068; cv=none; b=g0v/nwrdKiEoH42HZAlPna8vYCOW6BOEBswiYkrFSAYy1rYCkRGbR2ljP/brbsQk6ySBnWvNbCjAJoJ3K6KW5beIcYyJNFgpF2PrdCqP6AawkLpzY6G5nyn3Y/D4H9GUqI1l92aZkmvQNK5kDWkY5TGKrivMZTo/wRGYFVJxEeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727068; c=relaxed/simple;
	bh=IbCCH/qMfJLKfOLwFhVbf97oA+ZtKYvjO3MnaQAX7lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AE6ZswC8vreDVVvR/D28GQxL3HN2hk3JmPKb4lqB0zCBWhts2h2pYaOCZZXlqm2EKa9dOAmCbQzsRVxofTq3mK41d4+h+bPEX4Djv9Wjd1+Eojrzsa4QZeUs8IoNBet/t0wEQGBG6XYSn7IwY5CkJ0MSLvxgnpm0PoxyZDdJqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZCcCPPYV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZCcCPPYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770727066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ5XqYi9hbhtIZdDVO8LtQUYo/tpJtt6XsZklct3ueo=;
	b=ZCcCPPYVFl9epeevIwczCZkkXAZ3NeyFcflQmbBOPiEhfg2K5je0c2KaUjkYOuD7KcpHNS
	VowB1iy3uohd47RnlkL7+MkllLkrlx1dWmtGOf3MAJHdHgPRoIwRkx+iRv/p6UnXh0s8ZX
	1cKYMu9VMpBezedsTPuYqkh0VqTEZAI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-EPSx7WXbMsGk3H0OYNK4sQ-1; Tue, 10 Feb 2026 07:37:43 -0500
X-MC-Unique: EPSx7WXbMsGk3H0OYNK4sQ-1
X-Mimecast-MFC-AGG-ID: EPSx7WXbMsGk3H0OYNK4sQ_1770727063
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3e7722f1so1806334885a.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 04:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770727063; x=1771331863;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJ5XqYi9hbhtIZdDVO8LtQUYo/tpJtt6XsZklct3ueo=;
        b=vm5ojMLdp5FR9Kji9idCB/iNOoxB9OX9xbiKvvg/F4zyZG+q2s4mWo2rJf04P5+1Wx
         e+Rk53mGTPJLdjKJgEhp9/1azVXPiHam67na+dHQUZg2QAwJUVWAdAmU5zlSa4iCXjv/
         dLqyc6SnnMsd6vyQ+jTHoOk50OnBXElo/P3tw3BaCjUuI4OZX6gT/Rc2BucZ3H91bAAz
         Q2McvRA7hMCZino2+vJs8w97nd4ZuzigmhkTmH+b0jd1PA0BHkY098PMxpM9xkQnvEPh
         Soz4imigukp9nr7k6g3iActakzSBhwN0o6cbQrRNlQNAPebXvE04eb+LI4N5Q1J9F7CK
         eGwg==
X-Gm-Message-State: AOJu0YxjqDkhCZj2+eW051TW+2DrN1UVAmSWvaaULzO1DSlmMGj22CsD
	ux5nR2fYZ405Dc9+xHy1RoTgMFX3WzZasWxTp37EEQP8gNTCiFhAAkc8XlfhNFrcqX9kwm3yemp
	PZL6+7c9L3oDslr151MjCVMCvAvh5+xzqS/0gRVGVwL9Hq7tCI4brrpLzo0X0VbjeOp0=
X-Gm-Gg: AZuq6aL37LABdKQD0W2GQeo20e157HZi6NFtHyraPfS9YS6pHZ2LGKajdcGYVHkOEID
	k+uQM56ZOZjliqzEnoLW/vQv1NkkRuwvf+t8tfPvQW3ibAMC5GfzcqvRDLOm6pqorNYhHXwEm6O
	t8qP+4Dp0JTdGS9ywGd3hIHtoAGn9Kk5tptdfVemNAHK0UWsvVlW97fP6N8kCHpKOvl51Wm8OQk
	lEqig3ORXvYh9xxaVuSr9TzpQIsg3FzQ1POokOxfMGFxvBd28lQKKm8Y6efwJ9rcuPe689DSCmd
	LjRBSSWhu/qtEFcrPPJTuultrxtG6vK4UDqCzNQOLwduGZDoBG6i8pGcT9U+lJM43FTfuuFosUW
	s5ISXWfdM07yAryzYHl1YVPAinZr+xwrd2+y0RYgrGtKDg1J43uizOEsL
X-Received: by 2002:a05:620a:1a93:b0:8c6:e258:3e30 with SMTP id af79cd13be357-8cb1ef32c8bmr239911685a.27.1770727062678;
        Tue, 10 Feb 2026 04:37:42 -0800 (PST)
X-Received: by 2002:a05:620a:1a93:b0:8c6:e258:3e30 with SMTP id af79cd13be357-8cb1ef32c8bmr239908885a.27.1770727062291;
        Tue, 10 Feb 2026 04:37:42 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7be4257sm1014057385a.19.2026.02.10.04.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:37:41 -0800 (PST)
Date: Tue, 10 Feb 2026 07:37:39 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9883/12313]
 include/linux/entry-common.h:33:34: error: 'SYSCALL_WORK_SECCOMP'
 undeclared; did you mean 'SYSCALL_WORK_EXIT'?
Message-ID: <aYsmk1D96sCo64kP@redhat.com>
References: <202602100954.BAVYq6aC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202602100954.BAVYq6aC-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XxVtt_D6l-ChscO8pbrahY7a2ODQfKdz9IUoLyR5dG0_1770727063
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

On Tue, Feb 10, 2026 at 10:00:22AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   132737e360b4c0daa7f473faf0f55cb04ee3e15c
> commit: 026d70dcfe5de1543bb8edb8e50d22dc16863e6b [9883/12313] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> config: um-randconfig-r134-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100954.BAVYq6aC-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100954.BAVYq6aC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602100954.BAVYq6aC-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 132737e360b4c0daa7f473faf0f55cb04ee3e15c builds fine.
>       It may have been fixed somewhere.

Can you back out these two patches from your tree in linux-next, and not
send these to Linus?

clk: microchip: core: allow driver to be compiled with COMPILE_TEST
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=026d70dcfe5de1543bb8edb8e50d22dc16863e6b

clk: microchip: fix typo in reference to a config option
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a6ab150deb4b740334721d18e02ad400a9d888f5

The COMPILE_TEST patch shouldn't have been picked up per my cover
letter. I'm sorry for the confusion.

https://lore.kernel.org/linux-mips/20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com/T/#m13591b71e0ac2ab0ffafb7bae6c1ffc92aa07a5c

Once the include MIPS include files land in Linus's tree via the MIPS
tree, I will send out patches for the different pic32 drivers that will
all go in via their own subsystem trees that fix some issues, and allow
compilation on all architectures.

Thanks,

Brian

