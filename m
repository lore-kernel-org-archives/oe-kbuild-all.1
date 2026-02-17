Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1813B7A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326316; cv=none; b=C1qUu1w4yMURy9/g2Xt3iYxWWIUQUPeeiM4pAUBTNUJFg+8jG8+RfsC/w1I1VgCmrl202HkerhAB4aUB8RuG/+/Yrys5isu9QCBLmKeUHnU0OaybY71DeS5uI8CGM+LelD+qRl1c72qG7Wv67J9ix1IyyA5NWa+iU9J5jJrxSnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326316; c=relaxed/simple;
	bh=uDBiU2C7+3Rgh9Df39HuQ5kfSjmQotATp66mNAM7j+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvjJoJHx9zcfnmKNoKsGu8Es0QC2FquevjtwR66oRT6fCR9eyJLyaXsW5bk+cZvj3x51LtEQspgrelMQdKUIpZK8TVS8TypiewKi1ww6/Vfc3IruOusu5gA3Ik+JN45qke/LYJSkUa1DFAzxHQGrI9KDWBKu0En5kPOCZWnTsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwIodV8X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwIodV8X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483703e4b08so32559815e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 03:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771326313; x=1771931113; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DdieY3TeFCCP2lBrqX6SK0NNMt0g0Rj48YaZz/Wekss=;
        b=JwIodV8Xyvn6YZQpVZ56XkxgBH3+bvuAC42i5Qp17MSxYqeBjChzljLLEzFP1cm8Bl
         csp9ZUBxUUpvOsE05GRbyN3H5ucSTTkIk1W6HY9QsAEXVgwFyQUaziB15r2p/r0PrJRz
         qetu6CHvX4Pxbd0/I59HCgMn2pNZcd3VmOc65oaVoYCbyp1X5uW+/VU6eBB86G/WY7N9
         mxnaIKsjFtmJBDPHFJOf2FrW9It1D0nwfj7XZTcY5jdjaQPFoZafGU2BcI9uDmN+kzXV
         ++d7FJLzj30q+uv7mKRnIIcqWpsLVu8d1O5YFD9c2dZ57how/n/Fw89tGSK3Yr7+/19P
         ydqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326313; x=1771931113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdieY3TeFCCP2lBrqX6SK0NNMt0g0Rj48YaZz/Wekss=;
        b=uc+uYBpJbEXxkxpI1KuXMbJ9TqX7XnNY54tGtQMoYqQK35q4XKqxULl/t4glcjp6W8
         CcW1Ki1wanBwbEjtSnwyeB0AH7uqtr2bmJ5bc/l7IuCuzCwcjhe4qIGIwHaYJH6S2Cc7
         1F9FQFUZDbkVsxDoBwI0HiCi4n/TPbWVqjyFgo/0zrxLszqqNZoTRrxKaxFLrr4YM7u4
         OWkPc1j0E4nNIebuIs++Zm/CowFbJwUUC4A3DwGIgv8kpcZ+MNXTwxNk5IXCIBNAQN28
         CJWjA4c6iOJ7cNK9k0Bx/SvkKWI5egn7Dtd83klugsaB0/fWHptlW6upqscMRDipk30r
         BnRw==
X-Gm-Message-State: AOJu0YwU+Q0xpRl3CwXgvzK/oGA56zadB1lFyWZZyycmY8XOjYJP71I/
	Nk88hUIaMap8Le6UAiomVHXUriAEpyyij3848gDatoba1EIV0q89pW9G
X-Gm-Gg: AZuq6aKUILjGVy6KvPGrFtuMkFawoxufLF4GmHYRvLqBjAtk61sYt8p7aFmQ4eyhpzp
	V3ndnUxMnjFk9k3nqsvz4m1xXzMWGZfbX3hBFF34HvB+O6kJ5wg15c0W1usyb69MTkU1AH8X3DR
	rwm+45xfIFAN+3VbTwhevvhnhARlMGGgAeMmhbTTptF+syyWxE2pcU/nFkoMQcdSSjsglonPmAx
	mDYKjzGZCfZADSGDejL7zIyoTYHFxKxFWMgHbLhJojX96oh1enk9JUjQatWj7lwLV7KtB2mFdrZ
	Tpz569AttKAiy4aYnIozHR24d17WHOdZhRfmbAqPSTRwJ1WMm1WZEGH8IEYlyOZngt6+GeIrjrU
	bqVa6wtF+ZVNztGwu2FNssONIBeWWk6gE2774JVunFUt6XelMKVeiQus1K4tDCAgenSU4xoYxwk
	6KFuRC9UJNh1AlXBl+pAwVSvTTO2Sys455rsF3ggIzrnsbsPsV/mlpUCKlEjlHu47lGrTaltFRc
	eFvUO+RicohXyTrDJXSWU0BoGsk38riTzJ/MizjQIbIL1Hr/sA3Ali5zrD729hXPo4kU4t4kfzH
	Og==
X-Received: by 2002:a7b:c356:0:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-48378d4f631mr137622535e9.1.1771326313228;
        Tue, 17 Feb 2026 03:05:13 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837b68e5adsm310486565e9.9.2026.02.17.03.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:05:12 -0800 (PST)
Message-ID: <47684e50-d7c6-4f20-9206-366c9c343eb3@gmail.com>
Date: Tue, 17 Feb 2026 11:05:10 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] io_uring/bpf-ops: implement loop_step with BPF
 struct_ops
To: kernel test robot <lkp@intel.com>, io-uring@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, axboe@kernel.dk,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <ec7d21e6e16c49165fa1e8af2aa09d01c111ea97.1771260487.git.asml.silence@gmail.com>
 <202602171315.iJKYSSFe-lkp@intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202602171315.iJKYSSFe-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/26 05:24, kernel test robot wrote:
> io_uring/bpf-ops.c:45 bpf_io_btf_struct_access() warn: always true condition '(off >= $expr_0x7fb415932650(30)) => (s32min-s32max >= 0)'

Got me confused at first, but it's the first field => offsetof() == 0,
and after type promotions it compares an unsigned type with 0.

I think smatch is too strict, and it's better the current way,
i.e. handling all fileds in the same way, but I'll respin to
silence smatch.

> 
> vim +45 io_uring/bpf-ops.c
> 
>      37	
>      38	static int bpf_io_btf_struct_access(struct bpf_verifier_log *log,
>      39					    const struct bpf_reg_state *reg, int off,
>      40					    int size)
>      41	{
>      42		const struct btf_type *t = btf_type_by_id(reg->btf, reg->btf_id);
>      43	
>      44		if (t == loop_params_type) {
>    > 45			if (off >= offsetof(struct iou_loop_params, cq_wait_idx) &&
>      46			    off + size <= offsetofend(struct iou_loop_params, cq_wait_idx))
>      47				return SCALAR_VALUE;
>      48		}
>      49	
>      50		return -EACCES;
>      51	}
>      52	
> 

-- 
Pavel Begunkov

