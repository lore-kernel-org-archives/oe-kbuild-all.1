Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799E321A455
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 22:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695575; cv=none; b=BHp2w+m+3oN+gQkPQd0ZlhZCNR3QMYyI148Hsagcr8x7XoSeWDdo5t3AssqzFTAzp79G15fYMblChF59DbYcfQWi7lyhUZ7KEEujZYBbyjMkg3BJ/Rcs73QF4ImUhQHf0AyMiuAzEPyZiy0upqrDMTYAK2qCaNi4b5IuWKHAt4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695575; c=relaxed/simple;
	bh=8iKBEaeTULtgFafUr0Ol7MTdi0PE6fIG33lV9AUp8Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO3FyrlzLiTdbTcoFi8YO5b+8m4vwAU7L8Vv4j1gkDEcwE8ESgrCajqgFm5L3UwRR0NkaWxOQhZihPHWVpagVpMSBIFSW1u2dikZAJf92I2bgH+YD4OPzMqTeY0/hyM56HnZycPHCjZzuYz4yO21b2yACt8NBM/o2K7O26DGnn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PnfMhyFU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PnfMhyFU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c336fcdaaso39280135ad.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 15:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747695573; x=1748300373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjbz2nd71z1cnZ9EhJ650XuasmqZlHIIfAB+H50JTUQ=;
        b=PnfMhyFUiAQZ0e6WliOJ3Fw5H0AKXIbZTLKbkxafXsvPSkiti7yzKCF8+A5kgJPMN4
         fg2I08Hd7NXmBDm6OqEcnrEdER0HSqnpmMGb0MHKj8Qyso2Mxr0no2P66BAKa0Pzm25F
         NhvEQ3FXp2x3Utlui7cTci0GZlluMAk740/80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747695573; x=1748300373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjbz2nd71z1cnZ9EhJ650XuasmqZlHIIfAB+H50JTUQ=;
        b=VqC7UWWJPc2gufJh7ahtN56uvpTE3u+z6uKmoPehQAQoPxjHZ6w5ekROF2VS2bcj+l
         TYiEFhMIod9j80evnRJ1pj/hBZxyf9RUQsCgPV8agkSjmC37AVWYyqNaqKJTjnxv0F/d
         hAoQbFXOLOXLjOeuHD/h3o+nWHmg6nkMB/u9xXXsCsU7WOKidejHwlnkgrhmbQnHW9Cu
         Bc2Wy9HLGVe5ADRg9zkEba7OGEwcTEK0eTP6pHgULnG0huY0wz06vOodllcx3l/3065p
         H8t8sHFKd8BKddf3tgHNa/5UdAdp7CxJ6/iDG0O6RO/DXnjFL9M0QehAuXvfgGoGOwFC
         ErRg==
X-Forwarded-Encrypted: i=1; AJvYcCVhzQCfdDZ6iUyeNI9RFtFI+O2ARMHr5CgKJ291DGkcRbbGRaLRzENvLXe8gKd9kd+V6uRyiO8SA4LxRkfG@lists.linux.dev
X-Gm-Message-State: AOJu0YwufLXKIewzlkbV157V+9duGRvCDHUO45SQ53RDLpefiMogcviB
	GA9PUTkwZz94j4XcQjHNLlvWYTaJHguqynhp4SSpyGuPsEw4Mzjd8SOsKs884mJPmQ==
X-Gm-Gg: ASbGnctU/yYWM6Uf9QBCUbZ6mYuIqhCFXaOlkJD3bpa01ZOesZyvbMg9qR+vl3grLhz
	Xme3qLR/OE9KynGTjYq9oO93wne3ttyOq56z8yOKMHLt2H8XD4VjISZcpcHrqmOJ7wAXRX/6nV8
	t52oms4A1MVSqqkBxQndMgG+NM/eBqsawGHHxd+nHoV3nZmhG5SIC57gT09OH0MdExYRDSM01S3
	vMxNODyyJ8TrAYzEERy/DoJXIpk8xqLXojxMNSOZxzV9saimxjk+2yeqCQCK06FqHRlB7RCV0Ak
	JxNafMLbLj9Cw0Df8pb1x6uay8ttAi5MYLnop4KF+0tt4F89i8LRNyU2OaZSDAqahntcKm5JPbs
	YPBSrCmI4+arUCA==
X-Google-Smtp-Source: AGHT+IFKa6iooFD5GeLGECJwMU3VFaa0UYPWSz+Gr1JGX91aZOI98Hgy8lFsH9A2ZRwAhwprY6+N+A==
X-Received: by 2002:a17:903:24f:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-231d43d9c8bmr188174925ad.5.1747695572726;
        Mon, 19 May 2025 15:59:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:379b:e49d:8d8d:4983])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-231d4e978e2sm65330445ad.125.2025.05.19.15.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 15:59:32 -0700 (PDT)
Date: Mon, 19 May 2025 15:59:30 -0700
From: Brian Norris <briannorris@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] genirq: Add kunit tests for depth counts
Message-ID: <aCu30rOFY5vL1AU6@google.com>
References: <20250516183213.848182-1-briannorris@chromium.org>
 <202505172307.yTjulMhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505172307.yTjulMhx-lkp@intel.com>

On Sun, May 18, 2025 at 12:13:47AM +0800, kernel test robot wrote:
> config: arm64-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505172307.yTjulMhx-lkp@intel.com/config)

Ugh, that config manages to have this combination:

CONFIG_IRQ_KUNIT_TEST=y
CONFIG_KUNIT=m

I assumed that "IRQ_KUNIT_TEST depends on KUNIT" would rule out that
combination, but I see that's not true. I feel like I relearn Kconfig's
language every time I step outside the simplest of dependencies.

> >> ld.lld: error: undefined symbol: kunit_binary_ptr_assert_format
>    >>> referenced by irq_test.c:54 (kernel/irq/irq_test.c:54)
>    >>>               kernel/irq/irq_test.o:(irq_disable_depth_test) in archive vmlinux.a
>    >>> referenced by irq_test.c:54 (kernel/irq/irq_test.c:54)
>    >>>               kernel/irq/irq_test.o:(irq_disable_depth_test) in archive vmlinux.a
>    >>> referenced by irq_test.c:81 (kernel/irq/irq_test.c:81)
>    >>>               kernel/irq/irq_test.o:(irq_free_disabled_test) in archive vmlinux.a
>    >>> referenced 5 more times
> --
> >> ld.lld: error: undefined symbol: kunit_try_catch_throw
>    >>> referenced by irq_test.c:0 (kernel/irq/irq_test.c:0)
>    >>>               kernel/irq/irq_test.o:(irq_cpuhotplug_test) in archive vmlinux.a

I guess I'll need to squash this in:

--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -146,7 +146,7 @@ config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 
 config IRQ_KUNIT_TEST
 	bool "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
-	depends on KUNIT
+	depends on KUNIT=y
 	default KUNIT_ALL_TESTS
 	imply SMP
 	help

I'll sit on it and send v4 eventually.

Brian
