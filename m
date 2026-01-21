Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BF030E0F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768984274; cv=pass; b=tV37DuYEq55vckUDjQmEwVR9eqN9R42JtAm2b/usv+9oRa5m4RZeTqEywAKKecySVOo6XajAbtZF+rlq3SZdejpqx0ppJQsIWRFrRuU2FDZPOIAvN9zGe3mteR+RFtPc49HHpn8EhV2NjYwiOE9mbz3/nwz6CspaJ6xlMgr86Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768984274; c=relaxed/simple;
	bh=XFctc9YUZofxB3tz/N/xWCk2r/4c4qsA5rmg4d5qxv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0c7b3li7zkTHeNHxrAf39eL474KAXsJkKiPvQC889FlbUzBclI68xdAaBmGISTI6HAvFhIuhSBKN/KtLQDCxDbVUKy9X1Zrd3pDVa3cJDHQPvg5o7jo6KtY6KcE5QHcfDLQOQ2QPXVMHFhATjkcGFtY99ozAE25x2LLLxneP9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lvR1bTKA; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lvR1bTKA"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1233b172f02so7744934c88.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 00:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768984272; cv=none;
        d=google.com; s=arc-20240605;
        b=SM0B1R+4ebD0CzxZ/Wr3aHMDyeq95gxlbK8kfTy/vqG1em4beOTXJjZbIoZSHa5Q6/
         bwXlgznZTinSs5Hdoc+NwHyTW9xwGr4fmLnuBzrcV5byzEPFdTE8offYnpbgxv+9eE/y
         FZX8FeGZTuOn7KGyploh+SbMXEXB1OXTD8W7257tQYgwhZAjHyqxuMZBR3NoxAWd2Ecx
         1D81YsVdZmL6DKbQxtilh/DlYHz3iBuQP2MrufVt0fOPYGLhGRtO2EynulKv2SvJdIRD
         YJ32CiNk0CysfnS6wPNjnjpdwiR5SEa1Y1iK21FS8TcaOXoMndlJekHtqc8i+eMSj5wZ
         eKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P42aspcTRdBvvY2weJyVYtPiuSH8JxKCfznzt5gGMzI=;
        fh=BEX3FTvHzSz5wiVWCIxYesnRjf+E43xF/ZXbpBnTa8o=;
        b=eRKWgGPVUTcWZoneG8nqzOY87VjOps/EGrHSsFbJrYjcahb6ZlvSbMLaEqRz+HeRc7
         /vpM5mTmplY2Mu/+bFFbj2o/50wL3TEU1NWjm73NdOnPLv2LpWKdBq7v7m6DybBl1pIq
         afvHJ3tErhc1cmQyfx4v0GfMSpSCm6rhiHnP9GK8RqRybEt4u79CSomhddV1Nkw9Fq6k
         /rwkcLzsxoGmjhR8k6aTAS8sjq9xnbb7TBO+m1HMCtji3q/vXLmJwejmGSOUuW5KNUUI
         uUDA416AdaBT5AWUId18if8U8JvakoKGbV9eNv88KxkDeBb7EDt3pot0+svFYzDIB0Rt
         Q8gg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768984272; x=1769589072; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P42aspcTRdBvvY2weJyVYtPiuSH8JxKCfznzt5gGMzI=;
        b=lvR1bTKAiNzTSY+HbA8WAnwfhWd5Yvl1G+tQFBEQbLnxg2Y2OWie696KS5c7OpgyP2
         eNmL1ZOJeq3A5SueL5KPtYXdDdE7U8CHTOMznmqvXZRdu1E52ip6oclYT3h1Ot0hc7CA
         Q6aAySl+tuHjkMhyVrqt5HkAmR2NRNh61quAIgMtnSy2L4rjdeo6dyk2bX2a2L7e89jf
         QqGaDmOAn7zugRyFfK4TlewJ24LrlPJW57MHr0M0QZMcBwTL6Lb6GOGBBKjM7ZCyHL2S
         9YPNzk8jzypw7s87YZW1ITJ4pRJ0PAqgXnG8sMMMOC0QwzV9Pd0kQRf9xLAH4cTrFpaE
         tuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768984272; x=1769589072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P42aspcTRdBvvY2weJyVYtPiuSH8JxKCfznzt5gGMzI=;
        b=RbqBAWGFzwzCs7+0YL+RA0LXrF/m+boKO6UJhzgLklME2NHvvwS/ZuQkiFJ/VWXeee
         NCeeOTm9KGHbCr3HZ6iAlaDDT+wdXFxVTFk6hrperQH85CojlPjJD0cYAz0ZbhOOeyf6
         2eIO3BOPoA/N0OWzQ6Vzdsxjc3KCcgQBZCgN0HPQ4t19h1xtvzSExnBY/vztH/UgmX8E
         4XLDm/FCFd9gPGAFqpu6t3sauXCdSH5djaYFrpqCWuC7ISMgYLhMp0iMBLhoYWMaZ5Ti
         V6hndwPhUbu9unWhTv+tr8A3682fiXjPM3f0891gMe2deHnxFOUAGy0HKTm6vVmVwi6z
         nhKg==
X-Forwarded-Encrypted: i=1; AJvYcCWMM40Lp+T9Cu29HO7LPyTjt3d4IrZPiyRELf8N+Iysyq3N9xFpaim52qmBTnIbx56PN0EFlR4ALWc6cz++@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ+tiDC15s/XxLVfHmxmvfkFrL2E6XUfxGXzg6Gonj7FYX/1FB
	F7FCIMmXyT/PujYglSnTCIFxKIj6BYGNP1mILZtdYCJHt1Ns5vvMYzXOb9nXf6DqUJ0n+aM7WMq
	2aMoahjTJbnYrioRyYSh1kwA3zBODi+4mtP8EDBh4b4/RvqX0Uu1fEl88Jc8=
X-Gm-Gg: AZuq6aJ/fTNQGsTVGTKRQcZCDR8yO1Q8asaUt0Lag7j/dGZ/StMNyI3ilmXdzM6z6f5
	OsN9YDqYwYAgqj46vmgxjCr0XlCO9GGPOjiHxLO33/RAXkr+M+eihIz4ps0NEekH00ie0FY2lQc
	drSD02Vc6nyt9UerQ7J8EhR1a38kAD5CRF8z0vGg4xCNO/4xpgFgr5/BXhba8mGJ7x8mv9HrYNi
	bDrdZjoFzrYZhycrO4dOVL8UUzmj29PPti50+4V+TW4IGXiWTpBSO2S28GcSdk9vzz1ZrL4n+bG
	FSgIW1gezHBURnMwOEGSAjcGDg==
X-Received: by 2002:a05:7022:394:b0:11b:923d:7735 with SMTP id
 a92af1059eb24-1246a9583ecmr2889558c88.1.1768984271429; Wed, 21 Jan 2026
 00:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601211136.rAqSN4rF-lkp@intel.com>
In-Reply-To: <202601211136.rAqSN4rF-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Wed, 21 Jan 2026 09:30:35 +0100
X-Gm-Features: AZwV_QgziV2Y0oUsHCXWDkVLLE1tcXx1ZQ5AONgUo0HiZEfFrVHEcJbtRDBbvQ8
Message-ID: <CANpmjNOCwW7K2iWZh4g6y+DV8edb9noRULKBeP+Q7oa4NOFRiA@mail.gmail.com>
Subject: Re: [tip:locking/core 20/43] include/linux/rmap.h:123:1: warning:
 rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jan 2026 at 04:23, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
> head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
> commit: e4fd3be884cf33a42c5bcde087b0722a5b8f25ca [20/43] locking/rwsem: Support Clang's context analysis
> config: s390-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211136.rAqSN4rF-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211136.rAqSN4rF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601211136.rAqSN4rF-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    include/linux/fs.h:1083:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
>     1083 | }

This is a CONFIG_WARN_CONTEXT_ANALYSIS_ALL=y build; that option
depends !COMPILE_TEST, which is not set for this compile test it
appears.
So this seems to be WAI.
