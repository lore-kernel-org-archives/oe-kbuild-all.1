Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410430FC11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768775604; cv=none; b=nsjrjNlnw77k984UzJisQtr9BLCuTspWPr5Mj+wEkSFRuLGDZvvd3wzFP66zKbLnk5QgiL79rEGz+qlcTWFHs+K03wWqTxWtNbmmYm4ssL60SVK/MlRjJYo51I8bH60TKqQc+V5saW0XBwJpTn1g7UsN6OzXkGMuRgFClsBKSJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768775604; c=relaxed/simple;
	bh=2SA9QQ673KUOqHEy3/rqWkEDcs6dfPbhevlhyfQOLDI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qc5r67GBb8EtUYVhwdn0CqdKmoYGC2Abc2N3BXoq8efDL2Pzh8FhbrWe4hc6DrX1fUuySPPvmc2Azr3CBuS+E3k59keW2hTjkJQvjKkblLVTr/ROCve7B87GaLdFrnnJ0S7PNnyBbhYqUNm4ah2aiIcjEdz41Gp90WVuo/Maj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQa6KpMM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQa6KpMM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so3228683f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 14:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768775601; x=1769380401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx9QpyQrvnFrvxngyHgURZOAcKI8WngXTJ0q+cPiikY=;
        b=AQa6KpMM5rHpGln3eFhDy0YP21WcYYMQdMDMRMBRLdAuTAkgDNdEEBmf+egT83IVln
         p0FEwvKW3Qr2KPTc2Oq1eKlUlB2hkIhdRDfsMDOYd59diTOR+5fHZUXtZ+MP/MTNEoB/
         4s3Si6yYR7Fw5spcC7uGrTU/uUz00nEtv4r/1Oet72E/9CqrS31pYCSEtJ3ez/684/9+
         ND14GI/nnnrn9wKCpII3ACXq9bTQYbYi+JKOGCWJUNTY2DXM9HzpZuoxPQ8ZiBrNKqkc
         uhtx0qy6PEad5VeRrX9rqDOneMGfmmAZ1MLgLVtl9LD9P7N9wP9m3NqHfWIVtqH2+AxM
         tE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768775601; x=1769380401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cx9QpyQrvnFrvxngyHgURZOAcKI8WngXTJ0q+cPiikY=;
        b=lm7NTKqucCZSD8KzgN3h8kgyfuhL1iEDEI2fxFQeXKfcPPJuwRfC5l+jqaL7Hs5XIL
         R8ut6KBrl7xK9h/n92/OPtAJryfcVnqqzrTa0TYjYR7KEPyKVajpwXpCYegTR7aWWLpj
         9o0cWGfLOH/TAyaYxMYQBNFcermnkoguOf4XQMKMq6V0IMbiieRNAFxjZDuZEpxtDwNO
         qrG+WzjGLEG99wxgApGwFXnG0S3c1Zc1r/OcLKjLQ6olHOCpK9pNSVtd+YBY2uX/3jzS
         XrnuHXfnvcP8AtkE1qo4WZMhAFQHrZTncXmOZKG17CW/5AAINeg2R6t62+qYF466AoB4
         +4qg==
X-Forwarded-Encrypted: i=1; AJvYcCVw4aNfbQK5hvtjHHUqq+P2JY9iKv5WM8uqOueg6VXklxel7m/VNnCuDF+2FkAqRj2RLbHy9cectjaHSKqk@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+LpLc75RmGSA7hjqdC6RJ1TLmPhFaFEImbN2XqNw+P5Y8rN7w
	kPPvQJag8HtBDvgaqnFZycqXJrh1CucZlx+jWY88v7urhdq3bo3aWF/d
X-Gm-Gg: AY/fxX65Yspd93So7jEt0yUkIQI95gWakLocAzeuLdWKvmDl/zR7bOhpZoiYVW3tCYr
	RUkWW7ybgoYNAgzRUriTdEoN5gZDB+f8c+3qBHkROwm15Uxcvitdyk8b7RvdtDVxThCU/x5qtJM
	CEBjOIJETTN5Fo20UNLJ6KH2D8tETaWk2mWcoErpYZrAmOJ0bKBD2LNEKS4wKcPVr1dpWkvEYms
	C89Jd0ivCKQ5NqgzXm7aLIHKSA4iwO+lX29Heyiy2ak1F9bpnmRNnZL8OYrAuN0XZexaa7y69OE
	m+GZah7HITsNvtEB+9mXsX7kHtKFsj4OVwGBibEzbyVAZnhb/8e4w4DdN/CaPSWSZiyLrRBb1Lj
	ILBauVdSPY/Ov6pfdg6UwCkscSKKBEyA+S5w3P9ppCMP86HmoQBsB3nTCyurF0tYK+eiJtEmuL+
	cJ4pzEvoVfVEV6CUlEjzHFrV27ta5BWaTbfW/8vEtCKaEyiFtzoZxklbG9xSx3Okg=
X-Received: by 2002:a05:600c:474a:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-4801eb14b36mr116131045e9.35.1768775600441;
        Sun, 18 Jan 2026 14:33:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b2672d6sm218823515e9.14.2026.01.18.14.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 14:33:20 -0800 (PST)
Date: Sun, 18 Jan 2026 22:33:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>, Paolo Abeni
 <pabeni@redhat.com>, Nicolas Pitre <npitre@baylibre.com>
Subject: Re: [PATCH] compiler_types: Introduce inline_for_performance
Message-ID: <20260118223318.7a3e3837@pumpkin>
In-Reply-To: <202601190247.dDAvbbMH-lkp@intel.com>
References: <20260118152448.2560414-1-edumazet@google.com>
	<202601190247.dDAvbbMH-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Jan 2026 02:36:18 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Eric,
...
> vim +/__arch_xprod_64 +138 include/asm-generic/div64.h
> 
> 461a5e51060c93 Nicolas Pitre 2015-10-30  125  
> f682b27c57aec2 Nicolas Pitre 2015-10-30  126  #ifndef __arch_xprod_64
> f682b27c57aec2 Nicolas Pitre 2015-10-30  127  /*
> f682b27c57aec2 Nicolas Pitre 2015-10-30  128   * Default C implementation for __arch_xprod_64()
> f682b27c57aec2 Nicolas Pitre 2015-10-30  129   *
> f682b27c57aec2 Nicolas Pitre 2015-10-30  130   * Prototype: uint64_t __arch_xprod_64(const uint64_t m, uint64_t n, bool bias)
> f682b27c57aec2 Nicolas Pitre 2015-10-30  131   * Semantic:  retval = ((bias ? m : 0) + m * n) >> 64
> f682b27c57aec2 Nicolas Pitre 2015-10-30  132   *
> f682b27c57aec2 Nicolas Pitre 2015-10-30  133   * The product is a 128-bit value, scaled down to 64 bits.
> 00a31dd3acea0f Nicolas Pitre 2024-10-03  134   * Hoping for compile-time optimization of  conditional code.
> f682b27c57aec2 Nicolas Pitre 2015-10-30  135   * Architectures may provide their own optimized assembly implementation.
> f682b27c57aec2 Nicolas Pitre 2015-10-30  136   */
> 5f712d70e20a46 Eric Dumazet  2026-01-18  137  static inline_for_performance
> d533cb2d2af400 Nicolas Pitre 2024-10-03 @138  uint64_t __arch_xprod_64(const uint64_t m, uint64_t n, bool bias)
> f682b27c57aec2 Nicolas Pitre 2015-10-30  139  {
> f682b27c57aec2 Nicolas Pitre 2015-10-30  140  	uint32_t m_lo = m;
> f682b27c57aec2 Nicolas Pitre 2015-10-30  141  	uint32_t m_hi = m >> 32;
> f682b27c57aec2 Nicolas Pitre 2015-10-30  142  	uint32_t n_lo = n;
> f682b27c57aec2 Nicolas Pitre 2015-10-30  143  	uint32_t n_hi = n >> 32;
> 00a31dd3acea0f Nicolas Pitre 2024-10-03  144  	uint64_t x, y;
> f682b27c57aec2 Nicolas Pitre 2015-10-30  145  
> 00a31dd3acea0f Nicolas Pitre 2024-10-03  146  	/* Determine if overflow handling can be dispensed with. */
> 00a31dd3acea0f Nicolas Pitre 2024-10-03  147  	bool no_ovf = __builtin_constant_p(m) &&
> 00a31dd3acea0f Nicolas Pitre 2024-10-03  148  		      ((m >> 32) + (m & 0xffffffff) < 0x100000000);

Can that ever have got compiled?
Won't the compiler complain about 0x100000000 being out of range?
Lots of alternatives...

If u128 exists this should probably just be:
	return ((u128)m * n + (bias ? m : 0)) >> 64;

Which is probably the only alternative an architecture might provide (none do AFAICT).

	David
