Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482645;
	b=RzprqzJID5SO20lQm8BxBurX7wr6nLbbKFL8iyKpwdMvhLxTbjps/3O9yDvFmSpjUwcq
	 4YKY1ixYT9SsVZEf1q0eUcQ2kc2xKTx86YJJ9lZ8UoP4SSzl82jf7uso2r8fukx++u0TR
	 kyas9RQZdUrPE2vVQPnYm2nGG5YnB9Ie4mN0w64Uhoo8P/jt5vLfhov6PFa0P7yS4SpQM
	 a2dyoAtoAkZxThQhcI4CzD5PCyMZgWv97xgQJOxXwIgMS6YWVr4haAZgl4Ik7ZZh7MD9t
	 N+mTkk59FDE4ihUCgkxHscQ8VY2qpbqnBg+MD23SepSFIoZYy1RV9vAfJNYvjGshesw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
	b=ktKcwRK8KvvmJqzv3QAOhVwIEmCE8qObPwhBxi/YcLTb36+a/6JZUX8Eu+At7GQkW7vx
	 mgZ//GviCZLZLAONDqpiHhjzHU8PqklwALPJi5SmKtINSsv8K0yrDKKhUJMwKC/nSOa53
	 7//K0vJBFKfdLtIhiFs6ei9U80Zn5X4IClEvP3WPnFYWtQtwAMvwoTI/0rLxSztP/5V6K
	 ekJVSb14z7bDgo8lnaG0LuZp0kAxDwwwb8sWEnXLxW5ZrkcNH+14XAVjN0kzk21Rf9xFr
	 IRgCxosmAkvqi3cNeWQwFUyv/z+cORahE4mhfq0sBc07chVDjXAWdx0jsQMCfLI9cwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oaTUK6MU;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B44606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 07:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B44606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oaTUK6MU
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1757138f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 00:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792482643; x=1793087443; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
        b=oaTUK6MUPy1poFSN1qe95LcBIXtUhnN2xNEdUVZIeKLJ1e3BQrkMqu3YM5rc0PXmsy
         qMcbAOAwCfdRAl/ji3zpsPg17ZEzuX0shY845Uh7ZO8TXrjYb3BqRhSv46oJsiwBr7in
         xdr4Mij7549wW7y/lE8wS6OKtENJQRvyCqTxkfcwB8kqVLfoOcDKuEWpz6Uy404UxBbn
         QnFaWJXbOV7qrpgGO1kQNLThOS0TaEcTp/4K+dAIxCcl8/ufqFT5ijBe3WME86hPTtkN
         RxqfrR0RylJnGeqBVXDwIloK9m7Fpp+WmEKb4Vg075RLs+FzeJ6NC15+8BABy8dVVd0x
         xcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482643; x=1793087443;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
        b=hWNfgg8msgcdaRAbtauRkXl6GZKQX1Ba6i8JsHbPO9z4qYxUY0spfF4pugmBrRjO1C
         4YEs0B0XnGylwO/Eb4kLm0dZImiZCkJpE3En1mgrstqcIUEOMwSKXjRV4c+jSO4fFU74
         PVsOEdUFIwnFp3B4M4sB7zdDHvVFvuM0Bgatwj6ih3YU1QtQFA3KsMoiOAF9yNa804r/
         cuCubb166lnp2Bombx/vYLnCsvE6TdEDynXSBBSz+khzDJEUqzTudATWGqHMoAwTZLSc
         CsU5h+s+fmA31nYLCPMsA4n+EIzrNlIJWrx4efalmn9UEAJ0+FHk88wkbSmd6pfOWFTQ
         xPrA==
X-Forwarded-Encrypted: i=1; AKwUvByBZfR5dJOSe5LYjH/RlNZD/52pCD3bONhSN2VUeg55idb9nw2C04GDjuNQFH1BJtKsvi5u9Bl137pv33IG@lists.linux.dev
X-Gm-Message-State: AFq9FYJPf3SB7nv0nRf9DhIyq095qyma0K/xRiJFXQA0u37I/gsUij2C
	6BHRX3YIEP46usvzuiAXNO3vp+NH6OHanzIPtVPS9niWOqcXugQXIJ3B
X-Gm-Gg: AYBFou2ewdd8Wed+0VqpuGemX0ZZVEf7RT6rwld5NN8zOKIfvh9M3Fe3I/5MbZp4BiM
	25FGMuLNp1QYUbGo0C/u9fDgn4CARnoq3bxglj/67MCw3e7LTQqKie5NRkRF28ym8Zwpwt5ZbPY
	kfZo9YufvJW+4DHFFFrF6jd41qsQ+FnUMEi0iNwSotQA1SSFnExxSEeW3oqjpelzwk29QZGkp9V
	PekoLTxXSvqkMXKH6iMD2G1XsoG4gtT9kV2P0NMXD/tYtZllysY36jDXVXU6WM0snY4lfq3j4uH
	4WBqhQf82OWj5CPtEC2Ysprm5YciIBduYKWZ0H99Xqgq5CInP8Hn9W2HVN7/AxrrSuMHLCs0x+G
	6iJnJ14cspTvCML5OeAyF4nEcC5RGc6ByRiFAu/HYUnCeotwZ20qHNN7WAyHLcna9ozwqqyEpQF
	vwK9/ku+a1QZwPTgZYlyYCSL2NnYaFqH1xRBdXlrjF5hhXFLs1UqlAOJwxdmHQBTzJ2UzEbFvVe
	ddxgDPR/SvOrneVdNo0zAYaguHPdeU2VdM4llzG7NQO9/h8aHL5o7LoHOJ0iW/xeoZi1k+Mdow2
	LsVTR3w80Ugr+05YafKTg2dtwtj+NT6phIwpEp/QLyeim2z+7R1yg9cYCRZo/NFDuT7r4fel/mG
	9gTwrhGtQ5IBTlWmNPsXAkfeUEzwWj0zNBeRWxa5tqhkI8lJjnzqBtTNRTXxQqF8ZDd7nqWgfF9
	L3B35s
X-Received: by 2002:a5d:6391:0:b0:48d:c178:f6e9 with SMTP id ffacd0b85a97d-48e07bbd618mr15587418f8f.20.1792482643365;
        Tue, 20 Oct 2026 00:50:43 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8185d2sm4581409f8f.28.2026.10.20.00.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:50:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:50:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] iio: osf: avoid a large stack frame in osf_core_init
Message-ID: <20261020095039.00004c88@gmail.com>
In-Reply-To: <fc593496353a60a15fd5ef1a2786d41dd9bdff3a.1792403576.git.kimjinseob88@gmail.com>
References: <202610191514.fRYyu0HX-lkp@intel.com>
	<fc593496353a60a15fd5ef1a2786d41dd9bdff3a.1792403576.git.kimjinseob88@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 18:58:49 +0900
Jinseob Kim <kimjinseob88@gmail.com> wrote:

> Clang reports a 1344-byte stack frame in osf_core_init() for
> hexagon-allmodconfig, exceeding CONFIG_FRAME_WARN=1280.
> 
> The aggregate assignment materializes a temporary struct osf_device on
> the stack and copies it to the destination. With the mutex and caches
> added by the IIO support, this structure is 1328 bytes in the reported
> configuration.
> 
> Clear the destination directly, then set dev and initialize latest_lock
> as before. This preserves zero initialization of all other fields,
> including when the core is reinitialized for a new session, without the
> large temporary object.
> 
> With the reported Clang 24.0.0git compiler and Hexagon configuration, the
> frame decreases from 1344 to 8 bytes and the warning disappears.
> 
> Fixes: 7329986669f2 ("iio: osf: add IIO devices from capability reports")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610191514.fRYyu0HX-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
