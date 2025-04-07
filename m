Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A9621766A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029571; cv=none; b=pbCocS/5w8kr+iJQ2HxDRdE3w+lXtO9LI+/0q46jO6g/FSe1sW58k8XjGX78vhh9tCqSrAEePUtJYmP5gmvLLRjqt3FLMeMlg1flhUj6rKTZmpLscvWqgX3KHxirTEiaW/KcWyrP8z2irfxCG/ZhJDy9dKww9chm6u320YRULCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029571; c=relaxed/simple;
	bh=gVwXd919qwdVvBnlix5/kGCGSDzwuyFY8SUtVZrZ+gg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JSsOcjIa7IzsVFhmj/pFexHa5bZvmGiFJFkZjWyn2FA2lNXnBChKryqMKaGwxxHSqNMxi6c/bijtITQqVzlwuyFYwItZJjshZ23SDjgkvUl7ajaXiAujwQEhfZ1n3iPRePyI7yRCV7zl9eGQqV4lEevUHa6f3smHpoEaiMM7rv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgTF5Av+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgTF5Av+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22409077c06so51499425ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Apr 2025 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744029569; x=1744634369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqcszFjiY+Y27P7zL5H3ARQuOUut/C9C9Lyd9JHvtz8=;
        b=lgTF5Av+mIDBxND1G0UKiK2rf3pCbgkHcORXDq/EB8ocj6qGeArtOqFTHhRAeToJ+u
         HGdkPHw44PYuwFcekywx3HPxrPV9dhi1BkSJnjwd+e2m5gh8/zd3tThA0IKSp7733TVO
         jvbbDTrDzyfMS7lt75NQcCNK58Uy9vFTYciufeXNSoZDTfa22ncH/qDEDmCZqgjAMd1N
         beh/FUJo4fee4kEw96bZClt0mDdmYXvhDZviecH64+pmSKh3x1pC1L40himVboC1R1j8
         0CbMPO+r4l5YxvOFfM0ZijdJ1rouw6fY+JWqACYks9QP8t5XwCyTrTDxX8OupOaYkoX9
         O3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029569; x=1744634369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqcszFjiY+Y27P7zL5H3ARQuOUut/C9C9Lyd9JHvtz8=;
        b=uy09G7q/mQFtfsqp9hx1Oxq7d8wen8aXe4XcCinp4uTdfWr2u1BTHtur0IHupt1+cY
         JjO/z/ecr9AdTKmQPDClPjrQ8cgPa1/CzDKHNxC4wIb6C0xgeG12yFJeR4jVf2qPHFff
         uV3RRJPyUGd7TSkaoJ/cn0ON72gg+DhcQtBjxD8BWPHhe3i7W4l2aUyXIeCdRnijuooN
         DmxoZQAOqMt9Yybtx7kyQPxoJns6KqkSwjaOmrvpx5nXqmNinxZxlf9b6kkAyKoNaJSk
         bowANPakP1KKsdeSa2hQGhOr/OR7QYv1E1dgUt0EZGj39NyqHt+bAR1Pm0qbUaMQnVl0
         qdQw==
X-Forwarded-Encrypted: i=1; AJvYcCX8R6v/a/xGbWYVlpXNBsDoQnIsarboLXQnTquZtZg/DoNnKshycLDEXNfx7r60iwu85jHviEetcUCFlNzi@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy/4Bl0idfKbaPer5sHBmYsUVOeW12lUTkDNUB/K57TkCqPZ3c
	O3uxkp5racuHdx3mFzMIaoEQpofKdWjZIW1BsekfvLvMbq+CZ9gA
X-Gm-Gg: ASbGncvfaZ2QigC3BXMZnfP9c9TZ0CX2Ch7hHxfQstKG+sa5xxt7oGZ+Mgu5YZNFLuY
	JPtCoOzbKrrmuzVKLnkJ5naXaA3VPsHRCzSUz7N/98opo2coEtcg+C61OA0v3H4Mjq2RgbDzGHZ
	6yYQ82L8WEMoFDvPgcp8ZsHyfzGZPUUwLaxoXr+SeWgulyl3+10+Gi49juJjs7SkAsZvHf+HGkv
	Hw4nPscEuGvuQTQxALMdxGBaGOv8fwF52RM9V/VKvTbw4rQHjlNpiBFRWhW+8L/6nGmI/dpWqa7
	YKHgMVciQFBhpGv8KcGqaQdGeD5uR3umCI8hOkx5ywL8blG4trXF1hn8WJtAy2h8qpcZ00oCi75
	Ot2xG1YLZsnX2vBRDhcPGpGCF7nX6pxNwuTGmN+9mAB0qXjVL+hu+
X-Google-Smtp-Source: AGHT+IFEVGUSoYS1JmDqtU019RQE7MA11l/maqzFklmFLnc6Zt4IppcP3qxlg0IP1WUL3SYihQNhrw==
X-Received: by 2002:a17:902:e541:b0:224:24d5:f20a with SMTP id d9443c01a7336-22a8a8d3173mr178795425ad.48.1744029569090;
        Mon, 07 Apr 2025 05:39:29 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978777259sm79456365ad.251.2025.04.07.05.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:39:28 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: lkp@intel.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v2] serial: sifive: Switch to nbcon console
Date: Mon,  7 Apr 2025 21:39:20 +0900
Message-Id: <20250407123920.14443-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202504060816.EWk91sJS-lkp@intel.com>
References: <202504060816.EWk91sJS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 6 Apr 2025 08:48:12 +0800, kernel test robot wrote:
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on tty/tty-testing]
>[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.14 next-20250404]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Ryo-Takakura/serial-sifive-Switch-to-nbcon-console/20250405-230051
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
>patch link:    https://lore.kernel.org/r/20250405145915.493173-1-ryotkkr98%40gmail.com
>patch subject: [PATCH v2] serial: sifive: Switch to nbcon console
>config: arm-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060816.EWk91sJS-lkp@intel.com/config)
>compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060816.EWk91sJS-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202504060816.EWk91sJS-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>>> drivers/tty/serial/sifive.c:155: warning: Function parameter or struct member 'console_line_ended' not described in 'sifive_serial_port'

Thank you for reporting.
I overlooked this... I'll add a description for it.

Sincerely,
Ryo Takakura

>vim +155 drivers/tty/serial/sifive.c
>
>45c054d0815b15 Paul Walmsley 2019-04-12  131  
>45c054d0815b15 Paul Walmsley 2019-04-12  132  /*
>45c054d0815b15 Paul Walmsley 2019-04-12  133   *
>45c054d0815b15 Paul Walmsley 2019-04-12  134   */
>45c054d0815b15 Paul Walmsley 2019-04-12  135  
>45c054d0815b15 Paul Walmsley 2019-04-12  136  /**
>180bb243de730c Lee Jones     2020-11-04  137   * struct sifive_serial_port - driver-specific data extension to struct uart_port
>45c054d0815b15 Paul Walmsley 2019-04-12  138   * @port: struct uart_port embedded in this struct
>45c054d0815b15 Paul Walmsley 2019-04-12  139   * @dev: struct device *
>45c054d0815b15 Paul Walmsley 2019-04-12  140   * @ier: shadowed copy of the interrupt enable register
>45c054d0815b15 Paul Walmsley 2019-04-12  141   * @baud_rate: UART serial line rate (e.g., 115200 baud)
>180bb243de730c Lee Jones     2020-11-04  142   * @clk: reference to this device's clock
>45c054d0815b15 Paul Walmsley 2019-04-12  143   * @clk_notifier: clock rate change notifier for upstream clock changes
>45c054d0815b15 Paul Walmsley 2019-04-12  144   *
>45c054d0815b15 Paul Walmsley 2019-04-12  145   * Configuration data specific to this SiFive UART.
>45c054d0815b15 Paul Walmsley 2019-04-12  146   */
>45c054d0815b15 Paul Walmsley 2019-04-12  147  struct sifive_serial_port {
>45c054d0815b15 Paul Walmsley 2019-04-12  148  	struct uart_port	port;
>45c054d0815b15 Paul Walmsley 2019-04-12  149  	struct device		*dev;
>45c054d0815b15 Paul Walmsley 2019-04-12  150  	unsigned char		ier;
>45c054d0815b15 Paul Walmsley 2019-04-12  151  	unsigned long		baud_rate;
>45c054d0815b15 Paul Walmsley 2019-04-12  152  	struct clk		*clk;
>45c054d0815b15 Paul Walmsley 2019-04-12  153  	struct notifier_block	clk_notifier;
>328ee9dbff3941 Ryo Takakura  2025-04-05  154  	bool			console_line_ended;
>45c054d0815b15 Paul Walmsley 2019-04-12 @155  };
>45c054d0815b15 Paul Walmsley 2019-04-12  156  
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
