Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522245;
	b=4Tuq9nxpeaBobqu3baMSyQxNHS4/pS+LO2326nnQLmoS4SdSzrCIUf0VTwcVEBjKwMgw
	 MfwC00bOULZfQJhKwLUGgequvi8EBx3jQl4rGQUGgSXbDAqZimDkMpToKBFPRk78M1LBk
	 K617j/bTlNX3+FVOXtp824hQ8rSGE/xQIMsrpt0E5uCG+8Y/vJNniok2xuWRFQCBCx7Ds
	 YTKSUXKX/2qVji+joc+/Ytx9Wr6pCsx66zr5aiHG8hii5nQvn1D8NOhu2TQZZGpqNOGOw
	 p3IUTEbpgXzHnOJQ0cWYW0H3RmdCkqX1pl2WsmTOePgOdXgK/PL4yo+xUHHcxwATRkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=MGTyoJ4w4UC//vspsrfPAmUKOLM7Od1PMLiSnVaNqr0=;
	b=B64R5z0TCsebN/h/Nia7avjyddGEhqruPa7on1tvghw/kfQNDL5H89C83DciCtquw0E+
	 iVPPSVJo4j0jngJf/5bV7oJUYtKKykJgZltkqlawNwUP3ihR3U9pDRaDRe974O/NGltgj
	 03tBfv3NrmMeNhM6FTpk7eqyXktd1aJDc0IknNFQouitUYmKYm9iMzT4lPdLMiPqsLiMc
	 cvoODJpriJythFJPHR2DVjTewm975WS+VIwjavvJRO3U9MT2xGWo6vye91uu1MW+HWIh/
	 PTMvhE56gE3IaOyxnN3g7aLER+rwmnq0xkeMr/anMaRuXf5yoPvmiUviW04OfaXJt2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mWyLYzYo;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA92606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 12:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACA92606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mWyLYzYo
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a9be758734so2720968f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 04:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795522243; x=1796127043; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGTyoJ4w4UC//vspsrfPAmUKOLM7Od1PMLiSnVaNqr0=;
        b=mWyLYzYow0Rjaks0x8Q4mpGpGAIc9l+JwEI6TGuOp0J6/XQUS8JyfNPeWmarQECBrM
         KObQLsDWZ8h8pW6q16Q6rt9QVUW4jS9OMfSG0mA44+sDjRIdXcS832LiZXrLFjOMuqq3
         itZYg+exulpTOY+Zw2AsGe99svEWPkY6E+NqGLfwpx4P4yR1D3Tth5oXEIew2FmEpyDN
         12NpO2stRhQaQcnFPPEAqNMQQc1CtbgyjdBCgwf775bgJ5ACMmSfiS8QwtwmdT1aVViJ
         crrzr1WsdlXGY++WegkmiBmPxotzDdlxuabsXQnB+ZVf2sXX9fTJSWpZwMR+wZVLHFsc
         YAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522243; x=1796127043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGTyoJ4w4UC//vspsrfPAmUKOLM7Od1PMLiSnVaNqr0=;
        b=AVWGoKH/ABCkQ8+CtS0QyvEkZoCmKCttihuf8P11HIF0UtIHAN2si4dRvZEVzRW3pp
         xHdhc5znidHudnxbbKd97FxFiUD7J3845klJjxN5mBcDAmqMn+X58YiaoF/2pzb8Mh8i
         r7dCG8zqdUHcgYwgVfuJRezzSZcfHcIG5v2B7jSQ5O1cvv3204gVNOfLVYy/YSi7ODwy
         JhEfjw1uYc/1nPHpHkZ7hx9cfBkFdHhkmuFpSqazUN19NtWm+H73ViLAyQ29Z/jjVuqa
         8Ehs5bjI5PY7RmJA1c5ew6BPO7PZEWm7uQKw0p1Ktu8Js5OFzimttCbeEDS5MIdENxbp
         vaZg==
X-Forwarded-Encrypted: i=1; AL+hErFA8CZraHysKMo2GS/uANeoQPSNl0rtzzsnBAZ23wa7lXttqg4RFVGNFs5k+4BKYOmNbc/dBavOwngb2oo3@lists.linux.dev
X-Gm-Message-State: APuU4Z+HK1uQ0ORHjiu2MvXOkMVKiMpx59MDciGEl2uZEzOrrItd5sZv
	PTgIUgZWiWDK+C5S8g1Fa4hkbQkI9QuZQmNuvPVmEoAdEH5o/2zxz4aLsC/JzzUSJ3fFR+cqxuD
	lqqQhlx0+
X-Gm-Gg: AZFdTZdEuvC3vZ3dFr2c7JV7uX5dgjzLJpZGNrHR83tJplFzWoPvutvTFwYknB9ls3o
	+4hhFys93j7ys8LT5Ez3rt5XennFUxvNLbFXy5e1fxqgdIY8GZRa68Xx4t2UNqxP3jVdb17IQU1
	orRsL0WwiDAZM51MF2vIIbzph1bZT+UXxqxiRnyiD9KptojUCTpvGvoC5+dMlUBTVSwNfjuSlPC
	woXxUdcO9fOaG1hEgbm2Ut77CrPXOVbSPGPGeZHFKTxXmKKTXT9TCcVPpqDGvEcUfDSB36LkPA9
	66yVFyuDX/dQNPHS9b54AS28h+rnvd4eVJPUdWd6z17ky3BTKuLCDTVRL0n5lp411qeOuyZmoZV
	3SmVJMfboQ5l5uyP5meCUmXZwGD3jAaawdYmIj8yoT2dOSXBZUHvqVGhvgq9yMlxDoyTSrlBqVd
	hEEUvRJG8BSttzQVRBmZX5wqgBcEHP0W/l0BLz/b4x9VlqtDCzhK7+Z6i577H7i/QC8m5rsVR2I
	3TSgtsudLdyFsgbW0qsFvLx8S6SYFtA8hmYdrip765VMZfanGv42J5L8YoZ2HVIJdcFdrzbqmMk
	EoQzrOYpRCesE2XJGL1MsZ16Q7Snf2PPcHPZues8JeEm4zC+nbZpRBUuspVWilIB8ngFswD3EOO
	48z71yg==
X-Received: by 2002:a05:6000:2503:b0:4b7:8178:f7ea with SMTP id ffacd0b85a97d-4b78178f825mr2770598f8f.51.1795522242442;
        Tue, 24 Nov 2026 04:10:42 -0800 (PST)
Received: from google.com ([2a00:79e0:288a:8:d01b:9df4:1123:37e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm28418386f8f.2.2026.11.24.04.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:10:42 -0800 (PST)
Date: Tue, 24 Nov 2026 13:10:37 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: kernel test robot <lkp@intel.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9036/10560] security/landlock/cap.c:108
 hook_mmap_addr() warn: always true condition '(addr >= 0) => (0-u32max >=
 0)'
Message-ID: <awV-vbDGqKjknlyj@google.com>
References: <20261121123703.ufHSg06x-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261121123703.ufHSg06x-lkp@intel.com>

On Sat, Nov 21, 2026 at 12:42:12PM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   909ef7a9a30fa139e69e555e3606680f5cca7726
> commit: 25590e68c40753e28e4713d2dbfde6ba10a7daeb [9036/10560] landlock: Mediate CAP_SYS_RAWIO for mappings below mmap_min_addr
> config: m68k-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121123703.ufHSg06x-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 8.5.0
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/20261121123703.ufHSg06x-lkp@intel.com/
> 
> New smatch warnings:
> security/landlock/cap.c:108 hook_mmap_addr() warn: always true condition '(addr >= 0) => (0-u32max >= 0)'
> 
> Old smatch warnings:
> arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'
> 
> vim +108 security/landlock/cap.c
> 
>     93	
>     94	/**
>     95	 * hook_mmap_addr - Restrict mappings below dac_mmap_min_addr
>     96	 *
>     97	 * @addr: Address of the new mapping.
>     98	 *
>     99	 * cap_mmap_addr() requires CAP_SYS_RAWIO to map below dac_mmap_min_addr, but
>    100	 * calls cap_capable() directly, which skips hook_capable().  Check the same
>    101	 * condition against the domain.  commoncap runs first, so this only sees
>    102	 * mappings that commoncap allowed.
>    103	 *
>    104	 * Return: 0 if allowed, -EPERM if CAP_SYS_RAWIO use is denied.
>    105	 */
>    106	static int hook_mmap_addr(unsigned long addr)
>    107	{
>  > 108		if (addr >= dac_mmap_min_addr)
>    109			return 0;
>    110	
>    111		return check_cap(current_cred(), CAP_SYS_RAWIO, CAP_OPT_NONE);
>    112	}
>    113	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

False positive


dac_mmap_min_addr is defined as

    unsigned long dac_mmap_min_addr = CONFIG_DEFAULT_MMAP_MIN_ADDR;

so it is just your specific kernel configuration where that condition
is unconditionally true.

—Günther
