Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96CC1805E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653458; cv=none; b=aq3IAnw5WlB7Na6UOB2rzTZ7r18s6JLzImUcUD9sUQd/8Ros57Jt0yJvcMQcJFZL17Nv89+Oq8u+26QKRuSHcsj06krevdDfkqsSbdHOEvwV6UJZ7NPxdMukp3bHiq2wFCaTEnvwa+pYNI+gPlF/1CK1/senn3soy39F3oPf2fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653458; c=relaxed/simple;
	bh=7g0Jc6teL0geHR3zKsDtngEybkClT4ktVUBeOc2MAxI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R2AwKvOaUumwHxhE7cZbdn8t0pwJc+037liaTrC5qRfFxQisrmzu+hR03m+FkuPzfLvxKnOLC8uRxncWoBFHKFLXInDla2zmBnnVV9Me6cne4rPHb5RMrrODXBt1xqyjNPkVAs9Uh3UDWKe54OUDShsLbAX0JZVWCflbm0TR7y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VgWbEA4I; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VgWbEA4I"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477771366cbso6517295e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 07:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763653455; x=1764258255; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7R/jcRhio/BOBSfmr70oitl3J9fEryzYjRsvPMYCQrI=;
        b=VgWbEA4IAeVjZHjOxNJRvUABBIoZOAEVpdxzDapkPl2HHvn4F1bKiMKd3Z66SozYWf
         ESSq+4QX5V+q4g0cEWNj/6g7/dGVmh5QyMnLkzWZu9BddEPgsrkMjO/m3E/J5BlpaZpG
         a2or92rsE+tBQdV0i2Mc7jTYhUcrwLSYaDd5Kqs30pLFII57yHzs00RnyTk0ju+x8YcI
         XfPfySSIRPunXP9zZGUHeg+KyAvrrGuflj7j3LWHhcNh9Nq5ugzCWEluqk1tEYKQulpD
         julhUAZ/X38FRfIaOK5H+nQqeHbdVT5FmGbmkz8SjCKipA84srZk3bGCoAfIp3SR1De6
         Pq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763653455; x=1764258255;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7R/jcRhio/BOBSfmr70oitl3J9fEryzYjRsvPMYCQrI=;
        b=IwlGDH3tEWKY5aHZk35YtV9gdgecjNlabypC++ROt8iAikn/c0w/qpD/AGzmC81cV3
         1l6soO01m6KhYQ86D+DPC7gBkCSVRTkpxN81Ld9GinY7tlXxnYCsi/TtJuRLoFHnjPS/
         +5ZYhAfYBk1iQgP5By4tHUzlcTTRY+GOrp2IlYENhtCAwIRjl0zJx8+dqFN2fw/HJYIl
         VJk9rosx3My9jbnlPOG9fOfv36puxTHJtiJWiBk17GI0ydmPxPt2DjRWU072zUX8sFWN
         drLblMvqZKD04ctTN8nkD9EdEnVWb1EVaGq46vi0Qkf2j/QNK/KC31EpQqTV02AF25uq
         Swig==
X-Forwarded-Encrypted: i=1; AJvYcCVCUUzRVw6a9p++aZFT2LX3vu7yRiAGDpwjJaY1u13UuKAypwlsoGutguBZrvN33SivcJ1VMp/8uvuqk3SH@lists.linux.dev
X-Gm-Message-State: AOJu0YxDEMYUJB7uzBSnSDLD2PNGdEeCUvgNn2aOyohgptkOyKybE+P4
	b6VQ8Vl/Qqta7Kh9vafT6vGJTZfrX9IM6hHcm+MS8hBN0+fGvZBE90avtvpgbfrSA4D6yyd6Rb+
	boSKioiyJuIYhIElPmA==
X-Google-Smtp-Source: AGHT+IHmU9BLDuNTWW1AqTuCXcIgwbDH1e0RCZ9YZOWiqio3t/RtoA6HYEwkpAGgObOQi93T/yGQuZXZ1+5bE/o=
X-Received: from wmna5.prod.google.com ([2002:a05:600c:685:b0:477:a0cb:7165])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4507:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-477b9dec15amr30352945e9.14.1763653455202;
 Thu, 20 Nov 2025 07:44:15 -0800 (PST)
Date: Thu, 20 Nov 2025 15:44:14 +0000
In-Reply-To: <202511202005.7GzetV3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202511202005.7GzetV3D-lkp@intel.com>
Message-ID: <aR83TotAs7G-o5Pf@google.com>
Subject: Re: [linux-next:master 7315/10599] ld.lld: error: undefined symbol: _copy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: kernel test robot <lkp@intel.com>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 20, 2025 at 08:52:07PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> commit: d99dc586ca7c7729450af2ed39ca1483c0eb7b5c [7315/10599] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
> config: loongarch-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251120/202511202005.7GzetV3D-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202005.7GzetV3D-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511202005.7GzetV3D-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: _copy_from_user
>    >>> referenced by uaccess.rs:306 (rust/kernel/uaccess.rs:306)
>    >>>               samples/rust/rust_misc_device.o:(<kernel::uaccess::UserSliceReader>::read::<i32>) in archive vmlinux.a
>    >>> referenced by uaccess.rs:306 (rust/kernel/uaccess.rs:306)
>    >>>               drivers/android/binder/rust_binder_main.o:(<kernel::uaccess::UserSliceReader>::read::<rust_binder_main::defs::BinderWriteRead>) in archive vmlinux.a
>    >>> referenced by uaccess.rs:306 (rust/kernel/uaccess.rs:306)
>    >>>               drivers/android/binder/rust_binder_main.o:(<kernel::uaccess::UserSliceReader>::read::<rust_binder_main::defs::BinderFreezeInfo>) in archive vmlinux.a
>    >>> referenced 24 more times
> --
> >> ld.lld: error: undefined symbol: _copy_to_user
>    >>> referenced by uaccess.rs:458 (rust/kernel/uaccess.rs:458)
>    >>>               samples/rust/rust_misc_device.o:(<kernel::uaccess::UserSliceWriter>::write::<i32>) in archive vmlinux.a
>    >>> referenced by uaccess.rs:458 (rust/kernel/uaccess.rs:458)
>    >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
>    >>> referenced by uaccess.rs:458 (rust/kernel/uaccess.rs:458)
>    >>>               drivers/android/binder/rust_binder_main.o:(<kernel::uaccess::UserSliceWriter>::write::<rust_binder_main::defs::BinderVersion>) in archive vmlinux.a
>    >>> referenced 15 more times
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is a known issue:
https://lore.kernel.org/all/20251118173250.2821388-1-aliceryhl@google.com/
