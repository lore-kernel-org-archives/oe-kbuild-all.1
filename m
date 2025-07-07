Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B215D1BD9F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751860389; cv=none; b=aUkwooNYHTf6ZK3MrATBiIAYvpQ68E2BlbFAKFzM+br85ZQVdG1WKVxPskBSAOSKZVedA0Y0F7v6Hs6gftmGYnccvGd+0ZqFngxEUi5sCSMgbOWGBulUIkdjo4kMXl3CbDE6kubknFFBZjw6X8PiWX3QtFY4tgrTTX+gAH8Q4IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751860389; c=relaxed/simple;
	bh=/fve97GTd9bXitqStqnzD3wq1Emy4aKwuUyvzEethf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyY+1TgxgD0lSw0ET4SrbPxg4UJSNWNQhJE2MRSYf6j9mOLpUH64qQUQIXQE3+M1BUCAGqd59ln0S55MKFm6PRHK9inWQo0VoUWBnNC3DAZPYde7ZzcRpyYplmkCOKq81LxCv3KVpdfYPxKoUQGtfagiKtsB5WYjkEqIaGU8t9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lo1efuAQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lo1efuAQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso1387218a12.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 06 Jul 2025 20:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751860387; x=1752465187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mub7PjK+ZQMm18cy8qNtEOXQgRqk+RrTOpKNrinRMis=;
        b=lo1efuAQosQmJOv6C4oJR9WRjac3mmjdU+PNPv/3xvDV/N5Sy6DhrMTJ6ZGMJ/wUyE
         eFAJ1Up2GfHGVeNN1v+0B/ODW35is/5EXkeSErA5cSvruCSVyDEzxPWub3pl+R+g6DD9
         MVyhhnWDMilYh1KpAAcuG6cQTHaACjiloNIzpgcAZRZ8KicFHdB4EvDWz7J39yFfov1L
         E3lpOat+WDq+FKyKu3HZ6+77b3B9HxT8fZSkvzYBGaMZekSbS8xwOZ3ZaQS41xCRLTuR
         KY/rP2Ji5+4OYq3c6vzuKCqHb6hv3UthHz5K6PDzLeBUCSn680vL7m1e0O3+Hag5xorD
         yk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860387; x=1752465187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mub7PjK+ZQMm18cy8qNtEOXQgRqk+RrTOpKNrinRMis=;
        b=JNnrZqNtpU+XYpZ7C/jUYZUCAI/o7Ll6H5T9y8HURK+5csPvb6Lbp2Znl3Co+j5c3y
         oqBNv2MZWMgCDEH8Zo3W2rgm2XbJaZBbetR4RI/tzFG80cLusOskZS7nHszoTjQV42eD
         +s9UIP42z4OgvC61hsBVKom43EIqQUM+UqfwgMi3fdLX7a3psZfGVW1EpCSPUqQr2xRM
         DqZHq03l/teyGF3zEHcBBa5524gpO3Uh/x4rNsZ3fYTMfZkurd8Q4eznpr6vY5n6qKbL
         bF4pu4LTkOfqmoCa0Mk1IbgQvp3aT+pLUFnCd+bJCoj7Yhj2TkAbKYOBYJwURkhHkrIt
         c9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV5ikNvRxJlgxPow8pYXyPNS/m4RUSHKnmyFq9yuJg/28tyZJ1tyfzghFHYHPPo9SVH8CldRXcjvgCMYjzZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywexo/sULX17fOmb9fspqDRpifmnLNpPLvcRo0vEcCSGiAk9MCS
	Ib1w/Hu8Zy64yJ8qbB5tHV28l2+4u3DJQrm3od0MqTjTS4kHB5JKkdddfiKnhhuycRE=
X-Gm-Gg: ASbGncucMIu35zucalk/gDTLt4ZgmFOSja2sgr3QiJ4WKdP0i4mzLFG59GUShySUBae
	4+EWaXLWB6uRDLhwYb66wVJzaQhclpyDhzz2xYyWCytvVW53mkj7H/bxsS/QqN6/t4+5RpH/9SX
	uN1KHxcGZiYGO7ZaZzPLuNpe4N/xjj6JbqDczzXs+D3p4ViZK53c8VrUAEwcACTJV4Gk4GI+iug
	eBZpVidUg7ysL/hdUJoidR0gbmlspufDMDm6w+GNs2OgojfE5yh8BcH/Ie8rwD3KeeUmq2mRcWT
	7SgSJe7rFEpoahQcI5diuyFDB/FwyAAxhXhtyn0ICbojtXVRnRvVt5H99dhLn5eKe1Zt2fFjhLB
	MRNhUwzXLmvmU5XyM5aajJYE=
X-Google-Smtp-Source: AGHT+IFtHyTBc6qEYu6hdCH6cigb35sVn8qLgWaMfVrg0MupVPG7/z/yW4uRvdyfX28do9yc+RvdzQ==
X-Received: by 2002:a05:6a20:6a0d:b0:225:defd:26f0 with SMTP id adf61e73a8af0-2260c92da99mr18422851637.32.1751860387103;
        Sun, 06 Jul 2025 20:53:07 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee74cf48sm7538658a12.77.2025.07.06.20.53.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Jul 2025 20:53:06 -0700 (PDT)
From: lizhe.67@bytedance.com
To: lkp@intel.com
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	david@redhat.com,
	jgg@ziepe.ca,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	oe-kbuild-all@lists.linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v2 1/5] mm: introduce num_pages_contiguous()
Date: Mon,  7 Jul 2025 11:52:59 +0800
Message-ID: <20250707035259.61640-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <202507050529.EoMuEtd8-lkp@intel.com>
References: <202507050529.EoMuEtd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 5 Jul 2025 05:19:34 +0800, lkp@intel.com wrote:
 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/sh/include/asm/page.h:160,
>                     from arch/sh/include/asm/thread_info.h:13,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/sh/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/mm.h:7,
>                     from arch/sh/kernel/asm-offsets.c:14:
>    include/linux/mm.h: In function 'num_pages_contiguous':
> >> include/asm-generic/memory_model.h:48:21: error: implicit declaration of function 'page_to_section'; did you mean 'present_section'? [-Wimplicit-function-declaration]
>       48 |         int __sec = page_to_section(__pg);                      \
>          |                     ^~~~~~~~~~~~~~~
>    include/asm-generic/memory_model.h:53:32: note: in definition of macro '__pfn_to_page'
>       53 | ({      unsigned long __pfn = (pfn);                    \
>          |                                ^~~
>    include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__page_to_pfn'
>       65 | #define page_to_pfn __page_to_pfn
>          |                     ^~~~~~~~~~~~~
>    include/linux/mm.h:200:38: note: in expansion of macro 'page_to_pfn'
>      200 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
>          |                                      ^~~~~~~~~~~
>    include/linux/mm.h:221:33: note: in expansion of macro 'nth_page'
>      221 |                 if (pages[i] != nth_page(first_page, i))
>          |                                 ^~~~~~~~
>    include/linux/mm.h: At top level:
> >> include/linux/mm.h:2002:29: error: conflicting types for 'page_to_section'; have 'long unsigned int(const struct page *)'
>     2002 | static inline unsigned long page_to_section(const struct page *page)
>          |                             ^~~~~~~~~~~~~~~
>    include/asm-generic/memory_model.h:48:21: note: previous implicit declaration of 'page_to_section' with type 'int()'
>       48 |         int __sec = page_to_section(__pg);                      \
>          |                     ^~~~~~~~~~~~~~~
>    include/asm-generic/memory_model.h:53:32: note: in definition of macro '__pfn_to_page'
>       53 | ({      unsigned long __pfn = (pfn);                    \
>          |                                ^~~
>    include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__page_to_pfn'
>       65 | #define page_to_pfn __page_to_pfn
>          |                     ^~~~~~~~~~~~~
>    include/linux/mm.h:200:38: note: in expansion of macro 'page_to_pfn'
>      200 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
>          |                                      ^~~~~~~~~~~
>    include/linux/mm.h:221:33: note: in expansion of macro 'nth_page'
>      221 |                 if (pages[i] != nth_page(first_page, i))
>          |                                 ^~~~~~~~
>    make[3]: *** [scripts/Makefile.build:98: arch/sh/kernel/asm-offsets.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1274: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +2002 include/linux/mm.h
> 
> bf4e8902ee5080 Daniel Kiper      2011-05-24  2001  
> aa462abe8aaf21 Ian Campbell      2011-08-17 @2002  static inline unsigned long page_to_section(const struct page *page)
> d41dee369bff3b Andy Whitcroft    2005-06-23  2003  {
> d41dee369bff3b Andy Whitcroft    2005-06-23  2004  	return (page->flags >> SECTIONS_PGSHIFT) & SECTIONS_MASK;
> d41dee369bff3b Andy Whitcroft    2005-06-23  2005  }
> 308c05e35e3517 Christoph Lameter 2008-04-28  2006  #endif
> d41dee369bff3b Andy Whitcroft    2005-06-23  2007  

Thank you. Let's move function num_pages_contiguous() below the
definition of page_to_section() to resolve this compilation error.

Thanks,
Zhe
