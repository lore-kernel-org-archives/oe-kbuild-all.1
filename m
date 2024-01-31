Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437015224
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 02:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706666838; cv=none; b=NGQYZ5kuX8Srdom/4mesj1cloi5klrgptmPImCLPNdcDJUK9HRAoDXT/GLIKtsH+vjAeCDWkKPQZNa/be64JpvCvfth2Vnsjku15BQVODGtV3DPcXusZ1GbOJtGpYEDaAkMoaIsukQgvSTc2p01vm2HDHPIR/0UAeBsS0TIEdV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706666838; c=relaxed/simple;
	bh=kS8eWcXtVFcQD84dcjMTbxInQmJnAJtHrWFBzz44fHM=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pW28T/1bXwpJ6PXtZse9FNx1+K8QZq4DQLWKjwHjFK4Fr2VNnVlQ4BsnQW8Cbq9vyFkkCc79rs15XPEevZeGOK5IuIIV+FaGQW87QQdNazcqmLahGkJqg/kqAYSmqwwUxb7Rp2Cnjh2lDcbD+nGRfUpEtZwheLJW/TLvt4VZzbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7PyzADF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7PyzADF"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ddb129350cso2827489b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 18:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706666836; x=1707271636; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GS/u9gYulxw+dEBCQ6ICNp3Acl6tR/VjReBUtlUaAqo=;
        b=D7PyzADFC+O1qdX3VCknXwOLK0kol+oVFwH7ZdKNMazKKAFkpoVkU7x8D6uQ9kUj4r
         6ssrC3OtDlGCs+qHWECNEIFU7ilBA3vjYS8i8fvcWXAYJf4HRv8No2BvOLH8MRlA0Sth
         mLUhWBuiOQZ3W2nI3HUr/UxjcTT2mwtd5XpzGOw67HKaw6q/gqv9WJsuXhNDzY83Qal6
         GKwmMd2ldwZ4lw9l1fgt2C3iznHd2mgbMVdPzG9ypVuPggy1w29S/fT4G240plkmMxQC
         8f3SeglSqQIz7GpCY9fJmTH1TzPr28wbn8dMXc5VDRk3GT9JjjM+iBSK3APsPPQdE+eE
         S6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706666836; x=1707271636;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GS/u9gYulxw+dEBCQ6ICNp3Acl6tR/VjReBUtlUaAqo=;
        b=J9cvmRG9m2orLa7zB6jqtHvIzZKpRRZiaPuRZgzqmvYIplL4EM/fYNgNncse4I2lPC
         d2dAj5Fokvz8Sp6y/FWUzTcXSZV/mHEB0cCSlmMI8Pv6FBPUoa7XQngAwih6Nz2F3nIy
         Z/U3TGUkLFh1exZ2s1CnL0EJ9YThKezdBPKFRsVOHRU5W/zokagtnRY/qjgrklCBgRpE
         GvkE//iFJKxGojJShQ03pBsP/6UK4eOAzX5RG3XlnCMDLDHf7V9oQXKl/2WqkRwilDQ3
         4vv7K3DxI8Kc8FM5EKe+o/L4afVs1HtJcPNMdpTB9abk6fEhWIbayI7CDQUxo4pEAMaC
         XuZw==
X-Gm-Message-State: AOJu0YxkcRFV12uRlcfHvYtICP/MO6UUjA+xZj3AT2zFvFwtG8pvgH4E
	KJDc0LISipVrB98Ccj+pE8GWHJiFjE1VUIdqOuzJ+S4FmaJi0moN
X-Google-Smtp-Source: AGHT+IED/bFhsZl/rZcroUv15mH78zX/pUCIqgwb11fN+V1d6Ue1w0kRWwXLpzlhpzx8lh5n9+OnYQ==
X-Received: by 2002:a05:6a00:b84:b0:6d9:999b:3785 with SMTP id g4-20020a056a000b8400b006d9999b3785mr464543pfj.30.1706666836122;
        Tue, 30 Jan 2024 18:07:16 -0800 (PST)
Received: from [10.1.1.24] (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7804d000000b006de39de76adsm3448246pfm.139.2024.01.30.18.07.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jan 2024 18:07:15 -0800 (PST)
Subject: Re: [cip:linux-4.4.y-st-rc 1078/1809]
 arch/m68k/kernel/signal.c:867:29: error: 'tregs' undeclared; did you mean
 'regs'?
To: kernel test robot <lkp@intel.com>, Finn Thain <fthain@linux-m68k.org>
References: <202401310920.sBSI4BHj-lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ccdc3701-bcd4-3030-d38c-798e9ace31e1@gmail.com>
Date: Wed, 31 Jan 2024 15:07:09 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202401310920.sBSI4BHj-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

incomplete patch backport? This patch needs commit 4bb0bd81ce5e9 as a 
prerequisite, I suppose?

Cheers,

	Michael


Am 31.01.2024 um 14:48 schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
> head:   4daf8df4558b5aae717516f7e941014c463772c2
> commit: 9cabe0442a98d77cc23fb8b8cd2549d5c8e8995a [1078/1809] m68k: Move signal frame following exception on 68020/030
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240131/202401310920.sBSI4BHj-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310920.sBSI4BHj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401310920.sBSI4BHj-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arch/m68k/kernel/signal.c: In function 'setup_frame':
>>> arch/m68k/kernel/signal.c:867:29: error: 'tregs' undeclared (first use in this function); did you mean 'regs'?
>      frame = get_sigframe(ksig, tregs, sizeof(*frame) + fsize);
>                                 ^~~~~
>                                 regs
>    arch/m68k/kernel/signal.c:867:29: note: each undeclared identifier is reported only once for each function it appears in
>    arch/m68k/kernel/signal.c: In function 'setup_rt_frame':
>    arch/m68k/kernel/signal.c:947:29: error: 'tregs' undeclared (first use in this function); did you mean 'regs'?
>      frame = get_sigframe(ksig, tregs, sizeof(*frame));
>                                 ^~~~~
>                                 regs
>
>
> vim +867 arch/m68k/kernel/signal.c
>
>    850	
>    851	static int setup_frame(struct ksignal *ksig, sigset_t *set,
>    852				struct pt_regs *regs)
>    853	{
>    854		struct sigframe __user *frame;
>    855		int fsize = frame_extra_sizes(regs->format);
>    856		struct sigcontext context;
>    857		int err = 0, sig = ksig->sig;
>    858	
>    859		if (fsize < 0) {
>    860	#ifdef DEBUG
>    861			printk ("setup_frame: Unknown frame format %#x\n",
>    862				regs->format);
>    863	#endif
>    864			return -EFAULT;
>    865		}
>    866	
>  > 867		frame = get_sigframe(ksig, tregs, sizeof(*frame) + fsize);
>    868	
>    869		if (fsize)
>    870			err |= copy_to_user (frame + 1, regs + 1, fsize);
>    871	
>    872		err |= __put_user(sig, &frame->sig);
>    873	
>    874		err |= __put_user(regs->vector, &frame->code);
>    875		err |= __put_user(&frame->sc, &frame->psc);
>    876	
>    877		if (_NSIG_WORDS > 1)
>    878			err |= copy_to_user(frame->extramask, &set->sig[1],
>    879					    sizeof(frame->extramask));
>    880	
>    881		setup_sigcontext(&context, regs, set->sig[0]);
>    882		err |= copy_to_user (&frame->sc, &context, sizeof(context));
>    883	
>    884		/* Set up to return from userspace.  */
>    885	#ifdef CONFIG_MMU
>    886		err |= __put_user(frame->retcode, &frame->pretcode);
>    887		/* moveq #,d0; trap #0 */
>    888		err |= __put_user(0x70004e40 + (__NR_sigreturn << 16),
>    889				  (long __user *)(frame->retcode));
>    890	#else
>    891		err |= __put_user((void *) ret_from_user_signal, &frame->pretcode);
>    892	#endif
>    893	
>    894		if (err)
>    895			return -EFAULT;
>    896	
>    897		push_cache ((unsigned long) &frame->retcode);
>    898	
>    899		/*
>    900		 * Set up registers for signal handler.  All the state we are about
>    901		 * to destroy is successfully copied to sigframe.
>    902		 */
>    903		wrusp ((unsigned long) frame);
>    904		regs->pc = (unsigned long) ksig->ka.sa.sa_handler;
>    905		adjustformat(regs);
>    906	
>    907		/*
>    908		 * This is subtle; if we build more than one sigframe, all but the
>    909		 * first one will see frame format 0 and have fsize == 0, so we won't
>    910		 * screw stkadj.
>    911		 */
>    912		if (fsize)
>    913			regs->stkadj = fsize;
>    914	
>    915		/* Prepare to skip over the extra stuff in the exception frame.  */
>    916		if (regs->stkadj) {
>    917			struct pt_regs *tregs =
>    918				(struct pt_regs *)((ulong)regs + regs->stkadj);
>    919	#ifdef DEBUG
>    920			printk("Performing stackadjust=%04x\n", regs->stkadj);
>    921	#endif
>    922			/* This must be copied with decreasing addresses to
>    923	                   handle overlaps.  */
>    924			tregs->vector = 0;
>    925			tregs->format = 0;
>    926			tregs->pc = regs->pc;
>    927			tregs->sr = regs->sr;
>    928		}
>    929		return 0;
>    930	}
>    931	
>
