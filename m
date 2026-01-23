Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0312D8DCF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769159007; cv=none; b=mt1kDnZ7J6kATpO3BGeWb+QZy4R5Y5IwdKZDunZhZylchMDgsYJEf41zH6XC+2FUyLDYkW25ROgta/CwFvssraY79KfA8lbfNJM4BoHLdFeUA9ibmJar1mIm5/rnPeFGsvfp9rmhp+WijL15Sv8n2EARSFrDL9lW5530IQO63yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769159007; c=relaxed/simple;
	bh=bbqxYhYGxkC5JL0V89QuLxDMBP/f3awNsdweWU5aayc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cayO1mAsA1yfMT6/DFNVX+gL/affjAVtNa9ZZ1QQTYmfU5OKHLSuVcaoHQWfIA2ytRFDT7mY7cfTgoByGrDfkQaB2T/sEs4IL0iSfps86NYsNjEQCxNAdfBYnK0wN9WZWjcZZNXofT8+1WlY4JpQCzftZ1ZWXnZaV17zq41vBdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ce2yN1uN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ce2yN1uN"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1232566f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769159004; x=1769763804; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Knn5SBgkpZ52KCcD1YUV1VO9W7IJFnPx6sGNM5G1rnc=;
        b=ce2yN1uN5hZTC51DQOufSyqKcA7F5nMBoA3tz3nL/rLYSxkS8QXSHGdISSog6ZpaAJ
         fDKN0zU7Laneh+qpwre942hsWdonEyswiujhIeyb5ThwALKS21Zrou21WCcRitFE2rQd
         GT8wnA5wSuOyEpfI5KC0IPLu56avHUYElGGEVCmvWVzQ0BwJuPKObzIZFrU1jeQdVzXT
         7PP5oMnrfR5PK6fhTsei4ZRQJ0bt8NMZbSEbwjkXPSDnq1Qydrb+J9BYTRhESaPJREgZ
         CYDXjJPGhQeS5ReioO2Dgvrn2Afuq1LlP93Tx5xtnZisp6oWsj7KW7PCGcDznjpcQm7z
         NzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769159004; x=1769763804;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Knn5SBgkpZ52KCcD1YUV1VO9W7IJFnPx6sGNM5G1rnc=;
        b=EfHDu7p0Vl9FoYoOjMi/fbzas59c+05yfOcX/pnQsZJEeNNl+6lE0hz6KsIqJ6z+L4
         IaRrZI7fCfy7Ce+tbxeYiYk8Ui1qMTA/P71aPfI2V0da3jqrbpk0nx2gsjkZ1Tq79D1q
         ZeX7WWeCeSLQWd/QfbJhi121t7duV/grshvnltqIZhXXd9+BpTbIgu5c0ACLhO7L6E0v
         c+kEHVP/tm7/pOTTSGAHuQlk0OjLQXQlZKEJTAbnYde6XbCKOWqp6PgYUCFAJF3Fggu+
         l5cnQYer/hqfT8M0Nge128ZaDKVVijmc24wLNtF5hJpwLpx/yPBia3lt1YPBc0rmmw+g
         F2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDSVx9mAOBA6iLgLuPF0Wgf/hw4dZL/CXcaUZIXerQd3yX9wewB77Vi3O41Ke4qgyGR1y5242uPfWCIuw+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu6AYxztXmUDl4v1mE+gac18LRY2Cs5KW1oUphwmvx1Y0IPjEb
	RZMuGXxa4rqx9GWNkOcHt7yoKUZkQcr+UFQH4N7fndEjnwTACpGaXrXQXlVf1q8gD0jCjjTrho/
	hVFcZwQKX0A==
X-Gm-Gg: AZuq6aKdIEtgKctz5ndsddIMZjWsNl6cSJPn6Hp+KJwjA+J9abTXogSF6lWc/3dlvaB
	KEsc3JivEXwOc0r/xTk/Q/XZu7UjxkTzjTsJ00enfdLJWrdtVhrWe2luHzIkQoRW+mk+z6Ekeb0
	HCQsJVL2jo6yCFyJCorXICSJabMKHYLr4xM++nAuFHhYIceN1cJjGz7aEJ86cHofQuCxdZkWnNq
	VBxOQIZUQs2A/UkIPR+E3dFW9ZWKReDLgbYTfegUnt74Z7unKNGASSFK6eUzEcX8X5Y4AIgE5W7
	/iscakRfo0HyzSjwVgwwjgvTz22I7Ud6PbvYUcR7D7v5Pp89pOHdTFpg3ubQd8PaCX/ULSOv60C
	jnqmQFRtoqdMAsa0XlwFH/qj/j3TGNQlTcsoRDe8nY3G2BuxIlVxGIMhFQ2Nk6El+k0lmZXkV9T
	nHX/MiN962nXzfwBS0
X-Received: by 2002:a05:6000:400b:b0:432:84ee:186f with SMTP id ffacd0b85a97d-435b162cdaamr4175501f8f.33.1769159004032;
        Fri, 23 Jan 2026 01:03:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f745e6sm5061787f8f.33.2026.01.23.01.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:03:23 -0800 (PST)
Date: Fri, 23 Jan 2026 12:03:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [axboe:for-7.0/io_uring 20/21] io_uring/io_uring.c:2741
 io_uring_sanitise_params() warn: if statement not indented
Message-ID: <202601231651.HeTmPS8C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.0/io_uring
head:   82dadc8a494758093e775336390cb31033c6f9a3
commit: 5247c034a67f5a93cc1faa15e9867eec5b22f38a [20/21] io_uring: introduce non-circular SQ
config: alpha-randconfig-r071-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231651.HeTmPS8C-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601231651.HeTmPS8C-lkp@intel.com/

smatch warnings:
io_uring/io_uring.c:2741 io_uring_sanitise_params() warn: if statement not indented

vim +2741 io_uring/io_uring.c

92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2733  static int io_uring_sanitise_params(struct io_uring_params *p)
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2734  {
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2735  	unsigned flags = p->flags;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2736  
712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2737  	if (flags & ~IORING_SETUP_FLAGS)
712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2738  		return -EINVAL;
712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2739  
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2740  	if (flags & IORING_SETUP_SQ_REWIND) {
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20 @2741  		if ((flags & IORING_SETUP_SQPOLL) ||
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2742  		    !(flags & IORING_SETUP_NO_SQARRAY))
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2743  		return -EINVAL;

Something missing here?

5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2744  	}
5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2745  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2746  	/* There is no way to mmap rings without a real fd */
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2747  	if ((flags & IORING_SETUP_REGISTERED_FD_ONLY) &&
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2748  	    !(flags & IORING_SETUP_NO_MMAP))
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2749  		return -EINVAL;
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2750  
92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2751  	if (flags & IORING_SETUP_SQPOLL) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

