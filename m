Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FFC2550B3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471032; cv=none; b=qik6QeA+6rgCav7HXUdzTPWE6qjJmvPC08d7abmXKS4rzvmfxK+wK1PppdX/PI8m2jhYBgHx+oF7FJIqpImh3/LRwqLylRCFU4/F2eybABcfZ2wUbJNh9EE34o6/fkYM5sDmP37cl5Z98Euuk5Rixm9dwJl3kLxYymomEqycoOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471032; c=relaxed/simple;
	bh=TY5zNAutl0m3oIw2/b9oWsgPeIA5NU3jWJazKcUAVDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9VaCCljahMyX7zGRuQhf6MEgViPDd7JWgQV37FV9fX/sAE/gbs0UizhCvp8GoNOwqHu4zJ2zT93Kyw0SfiqirDnH0DTpjy4lLv1hhhgE8+aDOMej1sxyRxtF9pLsE4RJIKpKcLq250f7TMMABltYVm5rT+WxHdIl8gwTXGJ7SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HDT8lDri; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HDT8lDri"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so50205855e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Jun 2025 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749471028; x=1750075828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6N5f/+GPbCJ5uQVBP6ORFTMRuOc+3h+Og7u+CemS5s=;
        b=HDT8lDribtvcP9bUudGKpMn9gjXW/lW0F1xNFqlyFxOOD6FWfdXGyPCYCntWMwfv0N
         1Fq9TyfcSD1sQF1gxrZDOGHsd9qjxS4sOiPNFMimmXt4tINBfnGHPGUyhCSjD9FsH6JJ
         kkNYXF2Yzg2CWV3ecZflaoldxpgOl4uOW62LwmWh4pEzAHOjHp0sCsJIU64jA1Fp07S8
         NmD4PAuJRX5hLYnYciOhjq5MAJm+RleBBcOWuBc+GA49HKM4D4W37FvZK8S35Qtv7Ouu
         7w2IRCsf8QNfAW4A02DQ+5/lKb4JWMsuJQ3JuOwC4tkTuMfG75bcWbO3RtvaoCcoZ4Mt
         0Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749471028; x=1750075828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6N5f/+GPbCJ5uQVBP6ORFTMRuOc+3h+Og7u+CemS5s=;
        b=vJu6CV881KotIs7HYd0z/mXOjERNJDka/6gWcxbBryvPr67RQgDNuNWUdZ+avpqJr6
         Jcpp57GSWL3vh8OlIO8mTnTteIu3tIJHL/zd/PLfObMxXiS84UqPSRhbq4JP+CO35pGa
         5S0ItrhjycW8kXVVLUqfMJuPu46I8AuB/EOI2yLoo1gqMKEliPnBHbmwyvdPYapDB7vM
         8aojM4kT5tfsuc3CljvScFf9Y3hrxQEeC8z+iVP0qXZNuvFPeUEB8BUM4MfwzTg3iocp
         xMg1mErEZ1SIvwezCrTjnOaennCRByEj0dgbuKVilwiCZkBVi12dBk74UT1RcWqSJFtp
         pCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBQDXhLYJTNuygz5/OB6A4ew9cT5ixWYcHQ0URWi+SP4OcHMkMXK9BDxXtL2RqtqwKKC9KNyo1ca8DiBqm@lists.linux.dev
X-Gm-Message-State: AOJu0YwhSNIe22hqLBhLfY8+nBTHSI1H9n0veSQGqP+W7IsmIlfWgLrB
	trTJ7QjpWYMDNz4uJzUQN7n8qE0AxKDP7UDL+yByMP+zgRF7DkGNMm99hGUESM32kWE=
X-Gm-Gg: ASbGnctGRzxuJFiUa5MOxdcwIweTo+aCAbXRQER3Y1HIv2DqI7lieXX5AcMcvbp4/qS
	AUhpbSuCervKYIPtpaaAv77QGz6lNkc8D0w8MRBZM2kBbbjMoCJTxuPqjKCJkJk4XgxentWg/UH
	3f/1riiNhGvAyggLUMXu2xfDFh1B4qP1MAonh5DGzPNc9dEyDcoBhxr7/pVsaBWNc/MdAhEJCyV
	9U8yjVG7cHXqQF4jogDwaQdV/0hp/6ZT6sWKb4p0w8s5XRBeaPqWssHmKTDOvAAAcedk8LBBKnG
	mIxpbMZqQ2X3rQ3XaEQPKEm6AvXLxpDwsEfluMUgvoG/JcKD//OITC4hCjQi/tyS
X-Google-Smtp-Source: AGHT+IEx4Ye29a424Oycvt0TTSzkDEp16kZB0ZMd8N7KGHi65ZlLyVud1xJwUXJ9t230L/eyg7P9hw==
X-Received: by 2002:adf:f147:0:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a531ce1495mr9228500f8f.45.1749471027883;
        Mon, 09 Jun 2025 05:10:27 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078941sm53232035ad.7.2025.06.09.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:10:27 -0700 (PDT)
Date: Mon, 9 Jun 2025 14:10:17 +0200
From: Petr Mladek <pmladek@suse.com>
To: kernel test robot <lkp@intel.com>
Cc: Raul E Rangel <rrangel@chromium.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: init/main.c:753:(.init.text+0x7a): relocation truncated to fit:
 R_ARC_S25W_PCREL against symbol `__st_r13_to_r16' defined in .text section
 in ../lib/gcc/arc-linux/8.5.0/libgcc.a(_millicodethunk_st.o)
Message-ID: <aEbPKan7PwHZfZvk@pathway.suse.cz>
References: <202506080718.Q9VUfXsm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506080718.Q9VUfXsm-lkp@intel.com>

On Sun 2025-06-08 08:01:08, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8630c59e99363c4b655788fd01134aef9bcd9264
> commit: 17b655759e83fd5e28931a0ece96fa9c2ab718e7 init: Don't proxy `console=` to earlycon
> date:   8 months ago
> config: arc-randconfig-r113-20250607 (https://download.01.org/0day-ci/archive/20250608/202506080718.Q9VUfXsm-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250608/202506080718.Q9VUfXsm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506080718.Q9VUfXsm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    init/main.o: in function `do_early_param':
> >> init/main.c:753:(.init.text+0x7a): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r16' defined in .text section in ../lib/gcc/arc-linux/8.5.0/libgcc.a(_millicodethunk_st.o)

It might help to add -mmodel=medium or -mmodel=large into CFLAGS.
Something like:

diff --git a/init/Makefile b/init/Makefile
index d6f75d8907e0..83966686dcd3 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -6,6 +6,10 @@
 ccflags-y := -fno-function-sections -fno-data-sections
 
 obj-y                          := main.o version.o mounts.o
+ifeq ($(CONFIG_ARC),y)
+CFLAGS_main.o                  := -mmodel=large
+endif
+
 ifneq ($(CONFIG_BLK_DEV_INITRD),y)
 obj-y                          += noinitramfs.o
 else


Unfortunately, I can't test the compilation for ARC architecture easily...

Best Regards,
Petr


> vim +753 init/main.c
> 
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  749  
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  750  /* Check for early params. */
> ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  751  static int __init do_early_param(char *param, char *val,
> ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  752  				 const char *unused, void *arg)
> ^1da177e4c3f41 Linus Torvalds    2005-04-16 @753  {
> 914dcaa84c53f2 Rusty Russell     2010-08-11  754  	const struct obs_kernel_param *p;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  755  
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  756  	for (p = __setup_start; p < __setup_end; p++) {
> 17b655759e83fd Raul E Rangel     2024-09-11  757  		if (p->early && parameq(param, p->str)) {
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  758  			if (p->setup_func(val) != 0)
> ea676e846a8171 Andrew Morton     2013-04-29  759  				pr_warn("Malformed early option '%s'\n", param);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  760  		}
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  761  	}
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  762  	/* We accept everything at this stage. */
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  763  	return 0;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  764  }
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  765  
> 
> :::::: The code at line 753 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
> 
> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
