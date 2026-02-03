Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92C36CDF7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 22:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159580; cv=pass; b=UF+B/rMpIKUVNM/7d/s++usICuPa60MhdfxGZWn7QuliZrXdI72CUFuTi5rOk0/Xza1caX0H3U+/JXhQAPIf6OESDha/qFi+BzJx+3vXY4x9noAcNPexXGhwOQG5pA8bylIUBR2M/xNXfixs9jV2kZkECS2QjAPRrUqfeWBA6Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159580; c=relaxed/simple;
	bh=qIL9fF6THfh6d3EYllL8+79oZt2gf/G1X5WQxRkyDT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7GTECMvMRidvC+bjeszhvZv0TjBrlqxRy2JvX1f6b9bxRe+8VusbzbmuxyJery9P0sKNvchGYdjMkA2U+Ps6zQgqoLfjelKsEQNVV5Mbz/Hn/OCkPUPCI5lYypoYiiHGNi6pxnA69Io1+bzpOrmE+GvFj9ZwtsW+TEVPTKFp4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lTXKjSeH; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lTXKjSeH"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1248d27f2b9so7694131c88.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Feb 2026 14:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770159578; cv=none;
        d=google.com; s=arc-20240605;
        b=K1F/jPxYlkVgM43wewu5y3ddKIs+OcjEhnEXUU5Y+A03V93hBdKz97z6dfUvx9KUE9
         dYkoZRsAhyz4N871Io+faReCekgOMpdPYU6Y7ZiX+JU4PrvxQAR9jM6sEOXtg4xIihwX
         BtaDH/H3itMbm3anKGb0/ArvhiuScV9E6X33S2rYB5xTbnkdUE9kbG2BJCscULg2CgUL
         rFwnHuHDIJ1pdjAILEo54n+yk1CYtgKDhDETREZ3u26uG345vHFG0btRfBqkBf2KXB5G
         ejbii9f5EjeASe3k+VZb2gu0z+utjUzrt1UV9ZXD6BWJlTjP2dLvAUHAmDQS31dc2GTO
         NYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V0WywR8lqfGgOoec3bx0jqpIWLj40R7e4eAn55JBiPo=;
        fh=oBEgOeAtJaOZ9LCmk758GqKWyehMpcXy/2rtcoXjxQk=;
        b=cDm/LspL66rgaOQujF4qibWXG0N7vCM3tuvQrlAGnFqN/nCBkimuuK4bZ/woQBD11L
         ZXkqyMUo+7PvtPr3MHdt3nOc7Hy8AkjakmKVF+AAscnkaiwBaGwtKMVh20/N4lq7YaWw
         a9ioC9T+uP9X0B5HV2PZz54O/PdQkBlqccOkigNhf2i9Iw1a/+ax+KAnT1Fsvkajn3Yd
         Dya2hikpzQHLKdPCH6xCgRHVkyXywpzBolOy0xrR8+auDGb0SprpTGpCyOwhvi37NyLw
         RJtFBW/S2tasmmrUq0+msbX4RHd9prlCaLjZg2NoRdHo3BPMiokunq6nUHJ15Ysd9zOc
         Mg1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770159578; x=1770764378; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V0WywR8lqfGgOoec3bx0jqpIWLj40R7e4eAn55JBiPo=;
        b=lTXKjSeHQOMvVuYL8zQEk/ahc59z9Kgfs2vjszAh5Lk9gFdfC+WIDBByaIPwG6bf+y
         ytbgrr6dKmLdWP2sYI1EKpe3gIvgGDrX00VmeZzxkNYWXmmC6028yvhJs1iioMv1KCv6
         jYCCYkHWbUr1OYW7ol9hPbbcc3r+/vF2sHvljUJqibt1SjupyJR2t06iPAW6lXxl16F7
         sDoMysW8ax1ipvnEZ4mXKI7/ezYDEVzTrzAPZEtn9EDg8SIXPArq6VC6oE1T3aC1D12s
         q4tgjuft3BSE3/XHeTDSX1IVyCFs2d9iERUoX6zDwJtmfxHDe6tlqPpY8BTebNoNdlSH
         K/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770159578; x=1770764378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0WywR8lqfGgOoec3bx0jqpIWLj40R7e4eAn55JBiPo=;
        b=CzfV7Coarx66F7KymZ50CHXGsJUamDIiHXLd78NLI7wIQlX4vDEFSK51OKOMeMMbo2
         W4067qWMcf4SCzL6Zs61TFunnP9/pyElhTmXTQD0kI+H4XohE7IO+IZJ9b8lFFSyhtKS
         fhVDpMtAihuYFgVwMAJDniTq139CpgLFQIqLtEPDR27gB3v9gifv0Q/TsPOdvxEwk+ET
         xK1wB4HV7ylX10VYypgN3Cwn9vMsjlUe7s2IY4hI42n66j+z4XmHsTqN6ESCMW/2jxP1
         u2Wg/K/kcYNQWtgzhCb8ZEmRui1/HLJJGWpA96RPKAYilVSzu/RPgA2Yvs71VEOPw8lO
         nOuA==
X-Gm-Message-State: AOJu0YzpfX3pf3nmyr35czR+KTdI3K0JNffj48OUTnqsT21wshzdcKie
	sgemHAeu61MtIE9UnKkyWWvPVEVxNfMpHWZnBkh7FsKK1uwgWi3C6llgNBvwH+PLm1TFB/6OS3s
	tniOejGoWHLG/4s4JcLVmloFc1AZrX4/t/m36nLJc
X-Gm-Gg: AZuq6aJXFaFAvd0iu2cWUaCjWQdYIIkLV+HgbbIWMuDi/4XltuOB3FtW1ySffryA3c7
	7FHN/XR+fgtgFPApI+XLG607Z+dQfFvJNjYk5dYc2ZLgRDgf1xTPJX+8Gj1sFF1br//OeVZa3rQ
	OcWys/o3tn6QsbhaEct6Rs4HXYyoxMZUhV4HLt6o5PTfV2Ed7JYlReSgD95QYWaHXG65+VeHDBg
	oNCNJ449B6m2z/zmTpPVVGASn0H+Gr+zJQJj+eGFThjURlWXOySFriCxPnAkafj7B7kw57E3nGx
	l3Q42fLGzcyOHqXRNHzh02ARRg==
X-Received: by 2002:a05:7022:606:b0:122:8d:3680 with SMTP id
 a92af1059eb24-126f47d9c22mr505674c88.40.1770159577822; Tue, 03 Feb 2026
 14:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202602032101.dbxRfsWO-lkp@intel.com>
In-Reply-To: <202602032101.dbxRfsWO-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Tue, 3 Feb 2026 23:59:00 +0100
X-Gm-Features: AZwV_Qhnf6dGIsZejmAJjt_tmFiQBt0Oa5pt5BzpSrKLnwWCR_KfLYzSvOyhLrs
Message-ID: <CANpmjNNsYagL4eoZFFrcFzgXgVy6TXAJ2FNQP5JW6_vLL5rXUg@mail.gmail.com>
Subject: Re: [tip:locking/core 27/43] ld.lld: error: undefined symbol: _raw_write_trylock
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Feb 2026 at 14:27, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
> head:   451c3a0356099483218535aed17fcf94ab5764a3
> commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/43] compiler-context-analysis: Remove __cond_lock() function-like helper
> config: s390-randconfig-r051-20260203 (https://download.01.org/0day-ci/archive/20260203/202602032101.dbxRfsWO-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032101.dbxRfsWO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602032101.dbxRfsWO-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: _raw_write_trylock
>    >>> referenced by rwlock_api_smp.h:48 (include/linux/rwlock_api_smp.h:48)
>    >>>               lib/test_context-analysis.o:(test_write_trylock_extra) in archive vmlinux.a
>    >>> referenced by rwlock_api_smp.h:48 (include/linux/rwlock_api_smp.h:48)
>    >>>               lib/test_context-analysis.o:(test_write_trylock_extra) in archive vmlinux.a

I think this should fix it (and hopefully not break anything else):
https://lore.kernel.org/all/20260203225114.3493538-1-elver@google.com/
