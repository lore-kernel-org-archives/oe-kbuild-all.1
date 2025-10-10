Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32C1531C1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082477; cv=none; b=JJi2AjlfIlCh/OJy7srl8RgQsgRSkbImteOwj6me/PRn/1XK1SP/buhXPmW7L7seCvswnVmSjwlABhz1dYTVEGwlGFC1Sce+5ZGmz62Qf7HjLvGTNERsxtLLdqtCZ+rMnMu/bpGeUQP7SVc+lZZHIt1BhTrO2uFdXf9w9V+qliY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082477; c=relaxed/simple;
	bh=lTdqN4W06cqsRZCpguUFBBlurf0JEQrgsDoESRmTflU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3XGxS9MB+YghRDbfDf4LcPu+kOpukodHl7Fldp7YBlvYfTSn4hwBTooVZ19+HMtUbSxhYMT5Dk3Xqe4tCX9sIcoOm+Hb4Xm0TYbccgzq8ryPR3qgpZHWyxptewjXnm2Mn2aDu5BQ0JLugSM+PbYv2jcWn3BMB1jTIYAaP6n1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2YMBHOl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2YMBHOl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2697051902fso2765525ad.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 00:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760082475; x=1760687275; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7tgKV3i4gBxvB8UJSlpuDPvU/XCbTanFqWCRDwu8uk=;
        b=O2YMBHOlzVMRoDWnqho+ZRHDw1udEn2UlaI2tqSg/wVKjX4i8Avf1rZIWbUexZVICY
         ovKsDpz8oxvpibDwPU3i/kK+EepPeBsTzRxEA98ya2ESpJB7HKDQtr/0a6Hhb3c8U/vW
         eEoRNmf5wKVqBjy2FhLfFx5BkExhmqmJk89ZRyJkTmpI0C0yvhCRKuBJcDbjvSJN2uKn
         dRtP7YxEesOfb8O8j6DMF3qY3lmk41Sdvm6ZX/1D1cQizpvsSWIT7ibM5NDtDnCBoDBT
         yDRNMFtdknG+3natu2LxlRzM0FTyDT0H9lrT3L6vSCgLroEt0HGH9iDJONn3UIGWEWlz
         ucwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760082475; x=1760687275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7tgKV3i4gBxvB8UJSlpuDPvU/XCbTanFqWCRDwu8uk=;
        b=RNrOZhMHhlDigi9CLwP0g6u0WwkEXtS+CB0bCCxBBMJjeaLH4XxHM9PVQfPtkU4cc/
         PAYxiYR8EeLIwstJvRt0XxbMZe4tyuWAPOU2fFZBiB2UMLJbX75/nKcEXf7ORoArXsyV
         pnJ800kieQij04QHne79RqCOwhraepck3oNeDpKrFGLC6iOqX2RH4RvUJDzHnMNtQoQk
         /z6zEWhzlWO8HRavh8F0UoE+JBwnFEl52urE2YkJYSQDfZkZRLYndP8Vj42f4QVz5OQE
         AiBCJNUSBQ/FjfAko9VmetVjVcQJ6Tdlb68AsddN/wm38u3scIhknBg3pzfSIQAy9mft
         lIWA==
X-Forwarded-Encrypted: i=1; AJvYcCWDh+eHAIN9dzNRGLXeHhFv3gVNnxsteMHkCoXYBLVzcULFG+afABUsoLb5uaJfRokRChrrSxrXt0EOmmSV@lists.linux.dev
X-Gm-Message-State: AOJu0YzhMWWqK6YJBFzwSx6avjqSCrz0MEoIdcpmAFGtzo/l1Blp4Ss8
	wlMRnel8WfA+gsAjlkjXfzzylaBLV2opCACr327ASmKlVh6mLA8p/Pw3qun+FmR1ZZY8//HlWMG
	+IUOAEPbmRG2Y/Cx7pdcKh1xSWLw2am8=
X-Gm-Gg: ASbGnctagyCBTuD7UKnSPFi4RhtHtP1VCI501346k0LKOmXWrVK40pvugJjYm2USUvV
	F3H/g71lhfGI62tW237Su/a/hcRMyXjtLQJHZpHVfhFGm9OYZ1/ZiH3lA7KvmrzeUAX8F7Jh/XR
	2CF+rCYVDJ2hFezW8RMC2tJnvRR6Rh9dZTUY/oBPhC6Lo9Wh0AW/JkzQShu+wvTe0aS/SHq+Usx
	0VpJP5fK9t0yn7Y92SOXOJVEZVI5OZeqGc+FLa4SGh2L+ykJxmDKlw9WaIcUb6uhqiNhxsqul7e
	o4ZRW84w2gOPOtQvNRuUhUXCx9WcgA5j+/di8M4fnQLq
X-Google-Smtp-Source: AGHT+IF+PAy5+0R9xjwAdCX870LznTDZ75a10wuLP3ZbEbiT5C6LExmHWXb24zDjqzKozZ/dOKHCNkmycyxUZF7jcyI=
X-Received: by 2002:a17:902:d2ca:b0:288:8c30:f08c with SMTP id
 d9443c01a7336-2902723c5f1mr82403495ad.2.1760082475519; Fri, 10 Oct 2025
 00:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
 <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com> <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
In-Reply-To: <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 09:47:43 +0200
X-Gm-Features: AS18NWCk8eQuqVKsTgaADHERDP4d4Ljx9EM9bs-HZednvRDMU1KzwVAaxbIbeeQ
Message-ID: <CANiq72=bMmDdVMgTAtThciUNQND4cqW42+Udzk6s_X7XZZZpVw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 8:59=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The best would be to use C23-like `enum : unsigned long { ... }`, but
> sadly we don't have a recent enough GCC as a minimum in the kernel
> (GCC 13).

The `mode` attribute also influences the `enum` constants -- doing
something like:

    enum { ... } __mode(pointer);

will make `VM_MERGEABLE` either `long` or `unsigned long` depending on
the compiler and version.

So with:

    #ifdef __clang__
        #define __unsigned_long_enum : unsigned long
    #else
        #define __unsigned_long_enum __mode(pointer)
    #endif

And then using it like:

    enum __unsigned_long_enum { ... };

I can get quite close: old GCC will use `int` for smaller constants
and `unsigned long` for the bigger ones, and everything else (new GCC
and all Clangs) will use `unsigned long` for everything.

Perhaps this may be useful on its own for C in some cases.

Cheers,
Miguel
