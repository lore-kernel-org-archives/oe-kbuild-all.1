Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D3277011
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715981; cv=none; b=B5AVAEtu3bDF9h0O6Xe9xA3Moy+rUxNQzmhiBUWd2e7sh2gia/tWhOY8u1rMeCC+iJ9hFyeh19zibGArOny5r07CTv9fnLdZrHPhK26ztirj5Be4/pL3VtQicPR+RT+UJZD2fiF6M/pAbW+78Tz79k46grVuZcNTv3AI1MtDhDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715981; c=relaxed/simple;
	bh=zOKtgqF4HJ8j8T0d2/Slahffx8Cb+tioUsRQW7/Z8ac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zu0nxnUb8dFbPH3ZyWSsXTVvLW6o0HIVutO7RiWQ0EvHOjvd+s6mc3cVD8HDR+qKW3mDsy0giRb38wff1SKWXzHua8A82WGcL9Q4uDpYPdS0+A7WXEIR3mv9Vc0lMzJf5f4ZlgYCMQTRzyDaSLUztG7Nu411OmmKvTgxkZ1N0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MBFBGKAw; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MBFBGKAw"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779ecc3cc8so8301365e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 01:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763715978; x=1764320778; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WeU48TgMuKpFqa0P1KRY9QRCZS9h5NtO6feKcbkigT4=;
        b=MBFBGKAwUqVsbVLtvMaPXOnfqCb3v8Z2RJPprtUUt8SgxfUI/54fHR4vC+L5MAAgAB
         thyePECBtnsvkFbaLz0RlCUFosM6d8g6c+kECOlnZORh+E/wdySmpSZ9dkmlR+9DrkvB
         B1V7BNu/eS6pMC2hGh4ob6Nq2ywd02UXfnRVnvJ3aIXbXo6xwFoHAdnfyINA2Obz9AFc
         0fujdO89DrQ0Xb6ptKWwRm32qkyWGPFLsG6lffO8p57lsODK9Ej63ONgIZffrUc4ZJn+
         5kZVNOJgExI3p0IAVMUcEko6i92gdrpcBTb7I7WKYP6r5zXNxjAVYFH4bW4Mify2RMQb
         w9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715978; x=1764320778;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeU48TgMuKpFqa0P1KRY9QRCZS9h5NtO6feKcbkigT4=;
        b=O98h0hY1e7hmxMQmu8yIH8Mq9EK3hDYu56cV5k4YC4INHjv2kA6hiMXQOBiF5fYqB+
         gjLMxjo/uDqVF2KcT2Srum6iyH5qXUaAji2ggSv2oDRSnh5BdVgVcREgDf5z2pEmNd3Q
         hDjnhY7Mr/Nep3Qnox61ZJqvzA/u2l1SNGDoyIUpL/wPpCiQ6uS/+ZwyE5QeeK/SN2IU
         WBbvFjVQ/fb0uqEX431MMJOJF7f4B7vYb/7XKq+ufGNWxmtS9ilupb2/WQHYhvGt4eN7
         pupupn439EhSjfJankLAM1WtLxzOzKC3tH9KZ7wX8rLWK8V+CFCqZmg2m2JlSluG87Mk
         7cmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcNiLp79c+LzhnfuiU8zkO4A8noOGsdTPsqQcBXPK1qBRRBo7DfyHRmpW+Sl32vYqKnShALPu2PJbmRhlY@lists.linux.dev
X-Gm-Message-State: AOJu0YxdlVm98wxJiMgrfii81I7tY8WtlCd4iYUZgWh/G3JrQ3O9n587
	YzKTQ1sq+KrXvKOFg77VLDL8x93QiiqNyf0qV7xyk0SI3J2yOyFJvUfQLktLvBLZ18kkFFi/k9s
	JKLZ/Rl5aR2QrXi5GfA==
X-Google-Smtp-Source: AGHT+IFi7Ro1buxMIwDHBU/1xLrbCnmwLUuJ2VcQkx7Dd6IbA9c6A9kXuy8l8eT1op8NAQZWhgpRwC85Zxzg+Ts=
X-Received: from wmfv21.prod.google.com ([2002:a05:600c:15d5:b0:477:9fba:50e4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b16:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-477c0203605mr15423305e9.34.1763715978389;
 Fri, 21 Nov 2025 01:06:18 -0800 (PST)
Date: Fri, 21 Nov 2025 09:06:17 +0000
In-Reply-To: <202511210649.lhQnt194-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202511210649.lhQnt194-lkp@intel.com>
Message-ID: <aSAriWs68Hlng-nS@google.com>
Subject: Re: [linux-next:master 2964/10599] error[E0609]: no field `dev` on
 type `drm_gem_object`
From: Alice Ryhl <aliceryhl@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Lyude Paul <lyude@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 21, 2025 at 06:47:35AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f [2964/10599] rust: drm/gem: Remove Object.dev
> config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210649.lhQnt194-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210649.lhQnt194-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511210649.lhQnt194-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0609]: no field `dev` on type `drm_gem_object`
>    --> rust/kernel/drm/gem/mod.rs:231:57
>    |
>    231 |         unsafe { drm::Device::from_raw((*self.as_raw()).dev) }
>    |                                                         ^^^ unknown field
>    |
>    = note: available field is: `_address`

I tried reproducing this on commit d3917368ebc5, but I got this error
instead:

	error[E0432]: unresolved imports `core::sync::atomic::AtomicI64`, `core::sync::atomic::AtomicU64`
	  --> <linux>/rust/kernel/debugfs/traits.rs:12:27
	   |
	12 |     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
	   |                           ^^^^^^^^^ no `AtomicI64` in `sync::atomic`              ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
	   |
	help: a similar name exists in the module
	   |
	12 |     AtomicI16, AtomicI32, AtomicI32, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
	   |                           ~~~~~~~~~
	help: a similar name exists in the module
	   |
	12 |     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU32,
	   |                                                                                   ~~~~~~~~~
	
	error[E0560]: struct `bindings::drm_gem_object_funcs` has no field named `vmap`
	   --> <linux>/rust/kernel/drm/gem/mod.rs:188:9
	    |
	188 |         vmap: None,
	    |         ^^^^ `bindings::drm_gem_object_funcs` does not have this field
	    |
	    = note: available fields are: `kernel_vmap`
	
	error: aborting due to 2 previous errors

This was with ARCH=um SUBARCH=i386 in my make invocation and the
provided config.

Perhaps this config is just not working in general?

Alice
