Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EABB13FEE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766631063; cv=none; b=jwwM5dy2Jf6sG7N83y1xs99oyw7+5KsjtjIaj4MJV8E+iyr95slOiRQb3hf1jnQe6g/WJ8aYh1vfYetN4lSvQzXAYN/8ttLp2VAIRButWln4IYPCwmKZ/g7jhOW3wM3Pv+4BzL75RcJ8YpNUP32nDXEphSVvrEoIlkrTI6bGlB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766631063; c=relaxed/simple;
	bh=55ck1oHqhN2qBmKLozdN7SOIeXOnVv8WKIaEBwOKOw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JesX3SQ6aUFlvlatMyKySHFShmUAtAIZgi0vIzC9lYfuZrdsC9Fqi0MmeCgnMUvkf7ZoJefSpFaPNMHFvXCuzktA+vtXUlw+ZQZ1xF75LBYEkcvIP33IR5WqVNudJeKPUFwOTImWYyIjan+soltmSWPh7M2aI80PN0ccR3erkXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so4038931b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 18:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766631060; x=1767235860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTH731S+fF2qOOFwpKHOlb14Z6sAgj5l1ztE5RiRSTY=;
        b=E6QCAh0HDS0/+9JHt0QOnI5AXXIBDh1/GctvWRyc5DD8BM5UNEvMX5bsZ4xFRe/2/e
         LJjhskn8xf512EiBX9l9wTioPEqDAslUTQvjrDDBrYoFMPYVwIpLz2yvnzXU6Tv3OBB0
         E+hQaQWYNrBgexY2q9iAtx3ej98gJT2CIQHU+qrz3SJBpqtfkiD3uXkpyJFCgWR9etc7
         23CvTbYQMwruNkTYnCS8f6w8MwUhVE+3BvvvTbMqOUd9scN2kz7NVZHScKD+20ymbZWa
         xvOYY4Vdc3TpDXCWhaOqKCT/y+38bxrf97Acrr3/IHA1wnhxtIkvqCohlJAbpTes+qga
         NnVg==
X-Gm-Message-State: AOJu0YzNFBLhjlw4Me2y6DorTmoMS9cd/epjh5jsZ6Upodm5PH6CFY/K
	9G7sraFODnPzLJ3KJS0uHQ+zlPo96aNrhLQOlxEX4Yg9o6D6NPzn0dtq
X-Gm-Gg: AY/fxX40TFQJtWLkSHRrlrqtDkDMvWMscWtyRcb0ws3Zh+/C60M2vc9VqyqyUaLlkem
	avQrZTonmAOpSGPkqKxv1oZET0kbxaR7G1diuzxmQoULDKUZleKB4OUDLRoBYnkWlwGR/JuLBnh
	60V0RxYT3lAOdoYowlaeCpag/8fTxKECLJKZJry3q4JrbWs+Ajwlf+7K9Nn1YeHFYMTTpt/X1rI
	/xlIRPD4Oynmfg5CXAbkJM4HXUAxO1DvIvxykC3oEe42uU7W5X7+Zrpw7zUHnPiWzdh9X5Mpj57
	XHNlBVccW8L4Ll4Ha9tjKLp1mO/VggL/ESyAU5Bh6uRh+BhUO62qM1BJ7InKqtrGKtXAmUutecp
	sl6yL8xon4NvZZ1jenWvLFV/y8NPIek745cFMbRj4hvp0pk04nDDyyRLPBGlP8ZHRUGzkZCi4e1
	XVk7ktauBKjY5JSzjEiA==
X-Google-Smtp-Source: AGHT+IF2rQuHzleHs4KUg49Pc4qjAM+mILzAe8F9dgTPG4qum4wYi2LAS9xkhUf5t3++oqkInN9YNQ==
X-Received: by 2002:a05:6a00:a90a:b0:7e8:4587:e8d3 with SMTP id d2e1a72fcca58-7ff66a6ecd2mr17208084b3a.70.1766631060477;
        Wed, 24 Dec 2025 18:51:00 -0800 (PST)
Received: from [10.0.10.3] ([195.245.219.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19besm17858679b3a.40.2025.12.24.18.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 18:50:59 -0800 (PST)
Message-ID: <3afc06c8-f4f9-4d38-9247-57df783afe5c@kylinos.cn>
Date: Thu, 25 Dec 2025 10:50:53 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
To: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
References: <20251224081315.729684-4-sunke@kylinos.cn>
 <202512242153.r68Pb25u-lkp@intel.com>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <202512242153.r68Pb25u-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'll fix this rustfmt formatting issue in the next version, along with 
addressing other review comments.

On 12/25/25 04:58, kernel test robot wrote:
> Hi Ke,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 9448598b22c50c8a5bb77a9103e2d49f134c9578]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/lib-vsprintf-Export-ptr_to_hashval-for-Rust-use/20251224-161946
> base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
> patch link:    https://lore.kernel.org/r/20251224081315.729684-4-sunke%40kylinos.cn
> patch subject: [PATCH v3 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251224/202512242153.r68Pb25u-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242153.r68Pb25u-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512242153.r68Pb25u-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>     INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>     /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
>     make: Entering directory '/kbuild/src/consumer'
>     make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>>> Diff in rust/kernel/fmt.rs:30:
>      use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
>      impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
>      
>     -use crate::ptr::{HashedPtr, RestrictedPtr, RawPtr};
>     +use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
>      // Special handling for Pointer: default to HashedPtr for raw pointers.
>      // This overrides the default Pointer implementation for raw pointers to use hashing,
>      // which is the safe default behavior for kernel pointers.
>>> Diff in rust/kernel/fmt.rs:30:
>      use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
>      impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
>      
>     -use crate::ptr::{HashedPtr, RestrictedPtr, RawPtr};
>     +use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
>      // Special handling for Pointer: default to HashedPtr for raw pointers.
>      // This overrides the default Pointer implementation for raw pointers to use hashing,
>      // which is the safe default behavior for kernel pointers.
>     make[2]: *** [Makefile:1871: rustfmt] Error 123
>     make[2]: Target 'rustfmtcheck' not remade because of errors.
>     make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>     make[1]: *** [Makefile:248: __sub-make] Error 2
>     make[1]: Target 'rustfmtcheck' not remade because of errors.
>     make: *** [Makefile:248: __sub-make] Error 2
>     make: Target 'rustfmtcheck' not remade because of errors.
>     make: Leaving directory '/kbuild/src/consumer'
>
