Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780319;
	b=WvYqpTVwTx5vCH9aios+VFvfXh7jZvN4YvjkH1wGzsxEu5A2mRaQhA/rmBB4jB7UQdJt
	 eQYFWHaaIy64imkXo1VGEa8q1YysazBxiG7cuWpk/CbXC9+XpNva1orp81aL7CXvdsh+o
	 3wxlGzIPYoa0ypqBWAM3Cch28x5Vs+HCbr+3ooBsRzVT1hQwJ6HkdlwFlX4yHFQGInp7F
	 DJMSCOdEm0uCqjI7X1ONLuxSssuUYPcV9NIes5/ixnIDs2Q7gfPtwXXB3E6phZHh7qpGZ
	 cpq7DnDxaenX2d/G1KkiAeOAPeqXt4+ruX9BAgWF0ovCGYYs1Ms26x5YvC4Y4+KQUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CN9AKgF/hWkL3empD3c/LQ8/9rcmhykYPSIjXEPK8gw=;
	b=4xPRcBRem67rNfDtJqqaVxjsroaDoXJP6N8JX1CKpVPI1fXg4wM/dq8kGkT1chC7L9yt
	 n9Ffnqtcx4f9UWK1grP5L6H1sdMKTuaK/pCwVUQ4hbzdyEJAw2Gs0/QZ4T1uU8DlOrSOu
	 1/D3/4ZnaxrA7Pruf/mNJadY4yoUstdrv8YmP6Dinm/18esDoLrvD0Z8zau2kuLjCaNxn
	 mxGTsMjUUMBZ5+Qq5V7Uam7f/+fJDg54CVVxyzMouX/q4QPxmiUSwra4j7XC3B+OW2RHS
	 E8+KerMWzt6jCbqCGUY2zadWwtuwrGJSYuFgeKTuA3eHnn3bEtXNfSNSiaQlcMs1qOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="t/NZ0hhC";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7556D606A329
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 22:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7556D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t/NZ0hhC
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1582168f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 14:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794780318; x=1795385118; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CN9AKgF/hWkL3empD3c/LQ8/9rcmhykYPSIjXEPK8gw=;
        b=t/NZ0hhCht/SA66534wE8OXEs0XLBuPmD24+St/jMm4fPbIc8rnMNaSQ8jquJr39uy
         lgfI0WIz2wy3x+oRH66kEL7tEO1l69iXTf9FVwSfD8qVwX+8jCQNYg4VXm32lvZP8O6S
         BW7Gdwz5NS7tsHlzFDSt0NOJRpOqBTvcLXxou6fafVicYwYhdh85Nfw4DLx8ch66VGjB
         byrlJXUFyx2FRMUgWm0onNn3nMS1XPF/EHVInCXWVUuEvQI9zhSEbULvC0Ky9WqBCff+
         JleXMLHDCkRhA+UmOpqWjDzzRt0vrx8DNtph5RPV5GuMHemTlDTtAcu9Re1S6H7/Zp3y
         5Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780318; x=1795385118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CN9AKgF/hWkL3empD3c/LQ8/9rcmhykYPSIjXEPK8gw=;
        b=tYvsVahWabVbf4kPSTHVIkvMplZwOnLU+nhZfXtRZvLtawWX9GGbxm9jjSzO4CQvrG
         QeR5aCydl4GFCx9UTixJhVpBHQwGx5SsAzvwbiuqhxe/AzPCfxtRuON8Cay0UVP9EbDo
         U0iREiSRmjs67ahWzhcrmnOeN7WvDfr9FRUzyoou+X3UG+S+sK1qHOYVh4VolXLYdS2v
         8boFJVQlOL2m2n0TRYZTH07umoU1nuvPmVngJyK/1LJYY+EMUyH/531VZKgCniW/ZMCV
         qwyq6LwSLQKKqMnUz1fRyfI5jJJro0Gsh8kCVBxerlTnRrJ/uwqgs4Lf73ZuWK+blCmw
         k7Ew==
X-Gm-Message-State: APuU4Z9CoBh1RZMkiyyuy2wcUtw6xOcN4XE4Y1GGy7BwMxR4D+O2vM9m
	d2vc9vD6xH2L9sR+IhWaY6iMd2oDW09+p9kawRH4xLkWauOOaGIinlQiAa14lTA=
X-Gm-Gg: AYBFou0Ks4BQBZs6/q4Xcy5sfVeBqUY6LlSUV21r4xCvhhhbedOY67u1gyjOTWbMe98
	5Hk0tVh5rR5VpsW31VwZlfpxJTKpS3nbQBQzlpPRfcCCZ+mHug2+/J5rvbpKm45KHuJpE2rIP3t
	lG+QCwhZKGNN8ujWIYwqE+sm3FuJwTAnUpPG/DFwzBFIzj8C1KZAIU3v3sB0Gp9LGHI6eMNOsKc
	fc7LwF3jZlpQhibC0AB3HpcVpF77hZ47rrzKp/o2U4wVoF/OnhUg8oFspn+PSJEp5PNgZUsdHMQ
	X3IiLI8dpkMYB3oO4tqnhWr7MNLMBibVAsj8/qdnQKQL8VrPtG8ULd1sA7mbp9RkNznaLSVE25y
	vc5tkV7huzhN6ZAgM836xE9h+EgdYLAsMnXtDUBCQ+qngzqiXLdTfSWUJjz0sTctX7Hm0GHu1bN
	2t6ULsuOo3MmCqckzjIFslf8DBvdxTYKkIuLtXucIACi6wqB7Np9gIoMpi6iP+4zNuMq4DF3vAi
	zEeQpeqDeZZg0+QG1I+9ATnsjoqGcygUNVgyojUo29JrJJp69qXwXz9Ulvk9bqAoRVIf4PUTKBl
	U1VzHICpU3CcNTNnm0BlhYjO4BH8X4k3R7OWoCBEC2bkGwrqca49LxA8YgoZZ9VImz7rBjpZm+t
	CEQGI1Q==
X-Received: by 2002:a05:6000:455c:b0:48e:3c5f:a24e with SMTP id ffacd0b85a97d-49b01cf32damr18111293f8f.11.1794780317539;
        Sun, 15 Nov 2026 14:05:17 -0800 (PST)
Received: from lithos ([2a02:810d:4a94:b300:2305:4cfe:af66:fa99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm18659046f8f.23.2026.11.15.14.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:05:17 -0800 (PST)
Date: Sun, 15 Nov 2026 23:05:11 +0100
From: Florian Fuchs <fuchsfl@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: arch/sh/include/asm/uaccess_32.h:204:1: error: impossible
 constraint in 'asm'
Message-ID: <avosl5rcgpWCw0Ur@lithos>
References: <202611151925.SgXid5Fj-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611151925.SgXid5Fj-lkp@intel.com>

Hi Adrian,

On 15 Nov 19:44, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   23c62304dde29abe92013d85910d03a77dada35d
> commit: 8b5dba9ea4a3f5ed994f03d6ca7686c49491b426 sh: uaccess: Require offsettable operands for 64-bit user access
> date:   6 weeks ago
> config: sh-randconfig-r2311-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151925.SgXid5Fj-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 9.5.0
> sparse: v0.6.5-rc1-21-g84ec0658
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151925.SgXid5Fj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 8b5dba9ea4a3 ("sh: uaccess: Require offsettable operands for 64-bit user access")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611151925.SgXid5Fj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/export.h:5,
>                     from drivers/gpu/drm/drm_property.c:23:
>    drivers/gpu/drm/drm_property.c: In function 'drm_mode_getproperty_ioctl':
> >> arch/sh/include/asm/uaccess_32.h:204:1: error: impossible constraint in 'asm'
>      203 | ({ \
>          | ~~~~
>      204 | __asm__ __volatile__( \
>          | ^~~~~~~~~~~~~~~~~~~~~~~
>      205 |  "1:\n\t" \
>          |  ~~~~~~~~~~
>      206 |  "mov.l %S1,%2\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~~
>      207 |  "mov.l %R1,%T2\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~~~
>      208 |  "2:\n" \
>          |  ~~~~~~~~
>      209 |  ".section .fixup,\"ax\"\n" \
>          |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      210 |  "3:\n\t" \
>          |  ~~~~~~~~~~
>      211 |  "mov.l 4f,%0\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~
>      212 |  "jmp @%0\n\t" \
>          |  ~~~~~~~~~~~~~~~
>      213 |  " mov %3,%0\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~
>      214 |  ".balign 4\n" \
>          |  ~~~~~~~~~~~~~~~
>      215 |  "4: .long 2b\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~
>      216 |  ".previous\n" \
>          |  ~~~~~~~~~~~~~~~
>      217 |  ".section __ex_table,\"a\"\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      218 |  ".long 1b, 3b\n\t" \
>          |  ~~~~~~~~~~~~~~~~~~~~
>      219 |  ".previous" \
>          |  ~~~~~~~~~~~~~
>      220 |  : "=r" (retval) \
>          |  ~~~~~~~~~~~~~~~~~
>      221 |  : "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
>          |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      222 |         : "memory"); })
>          |         ~~~~~~~~~~~~~~~
>    include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
>       68 |  (cond) ?     \
>          |   ^~~~
>    include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
>       55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>          |                            ^~~~~~~~~~~~~~
>    drivers/gpu/drm/drm_property.c:484:3: note: in expansion of macro 'if'
>      484 |   if (i < out_resp->count_values &&
>          |   ^~
>    arch/sh/include/asm/uaccess_32.h:136:3: note: in expansion of macro '__put_user_u64'
>      136 |   __put_user_u64(x, ptr, retval);  \
>          |   ^~~~~~~~~~~~~~
>    arch/sh/include/asm/uaccess.h:72:3: note: in expansion of macro '__put_user_size'
>       72 |   __put_user_size(__pu_val, __pu_addr, (size), \
>          |   ^~~~~~~~~~~~~~~
>    arch/sh/include/asm/uaccess.h:20:26: note: in expansion of macro '__put_user_check'
>       20 | #define put_user(x,ptr)  __put_user_check((x), (ptr), sizeof(*(ptr)))
>          |                          ^~~~~~~~~~~~~~~~
>    drivers/gpu/drm/drm_property.c:485:7: note: in expansion of macro 'put_user'
>      485 |       put_user(property->values[i], values_ptr + i)) {
>          |       ^~~~~~~~
> 
> 
> vim +/asm +204 arch/sh/include/asm/uaccess_32.h
> 
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  178  
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  179  #if defined(CONFIG_CPU_LITTLE_ENDIAN)
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  180  #define __put_user_u64(val,addr,retval) \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  181  ({ \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  182  __asm__ __volatile__( \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  183  	"1:\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  184  	"mov.l	%R1,%2\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  185  	"mov.l	%S1,%T2\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  186  	"2:\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  187  	".section	.fixup,\"ax\"\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  188  	"3:\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  189  	"mov.l	4f,%0\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  190  	"jmp	@%0\n\t" \
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  191  	" mov	%3,%0\n\t" \
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  192  	".balign	4\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  193  	"4:	.long	2b\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  194  	".previous\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  195  	".section	__ex_table,\"a\"\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  196  	".long	1b, 3b\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  197  	".previous" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  198  	: "=r" (retval) \
> 8b5dba9ea4a3f5 arch/sh/include/asm/uaccess_32.h Florian Fuchs 2026-07-16  199  	: "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  200          : "memory"); })
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  201  #else
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  202  #define __put_user_u64(val,addr,retval) \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  203  ({ \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10 @204  __asm__ __volatile__( \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  205  	"1:\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  206  	"mov.l	%S1,%2\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  207  	"mov.l	%R1,%T2\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  208  	"2:\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  209  	".section	.fixup,\"ax\"\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  210  	"3:\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  211  	"mov.l	4f,%0\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  212  	"jmp	@%0\n\t" \
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  213  	" mov	%3,%0\n\t" \
> 0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  214  	".balign	4\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  215  	"4:	.long	2b\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  216  	".previous\n" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  217  	".section	__ex_table,\"a\"\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  218  	".long	1b, 3b\n\t" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  219  	".previous" \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  220  	: "=r" (retval) \
> 8b5dba9ea4a3f5 arch/sh/include/asm/uaccess_32.h Florian Fuchs 2026-07-16  221  	: "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  222          : "memory"); })
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  223  #endif
> 9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  224  
> 
> :::::: The code at line 204 was first introduced by commit
> :::::: 9b01bd9ee6408846c0553c03fb4b864353a845c9 sh: Split out uaccess.h in to _32 and _64 variants.
> 
> :::::: TO: Paul Mundt <lethal@linux-sh.org>
> :::::: CC: Paul Mundt <lethal@linux-sh.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

with the commit 8b5dba9ea4a3 ("sh: uaccess: Require offsettable operands
for 64-bit user access") reverted, the test results in a gcc ICE in
change_address_1, which was the initial reason for the fix.
So the "o" fix from the commit does fix some cases, but doesn't prevent
every case of a non-offsetable address to reach the asm.
I think we could fully fix it, by passing the address in a register, but
I need to dig more into that.

So it is not a new issue, but caused by the same root problem. The cases
that previously triggered an ICE give now sometimes a compiler error.

Regards
Florian
