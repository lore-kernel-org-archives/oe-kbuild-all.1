Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F1211A37
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820910; cv=none; b=gdho7gHwNC9v3sSvkA437Wt6MBG93GdgJeUFzZlqt3HxFwEtHlkiETCJb+KQe9MS1F+0zsmN/8ynGa50Ts3WfqIG5xLABOo545bxMLvzrCannHV+4mah3MC/CwIEZzG6HAnLTdT4msODoNvjc0I2vfzCEqO+aRSw3F0NQ/4GhRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820910; c=relaxed/simple;
	bh=V5EjEqLAI6VF4m0ym14G0zP2Lk1AAeOTupEjRA2/fhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVe8wHYQ2qQRSQctxrIXe/DlyRnL8JledLj24Ndk7lOMZlhN+QI7nitYybrlGiqL0ZfMFg+S5fB+Cl6XzjdKMLIcDYJiRWuSkiPKP9Jd4VEbfqd6e9qg+WN7rpQbY+I6T0Q5EeSxf7fGQkelvXfr021mt6/d8pm+Z9F+Acu7b8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VkHiNQwi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VkHiNQwi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso62875e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 09:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744820905; x=1745425705; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcKONrIAwY+Efjpusl4unIszUT6B68ir1oyM8EH1UJY=;
        b=VkHiNQwiZ6xut/cbGHZ1zz1nxZf8IIBZCs+2wquWAsl2GzoWhgeV3hAt6UswJAk1J1
         1VfYp6wj37jPl6YaaKd7DpP5k5ArRBYuQ/xABP1nSr1ZAo8aqS9d85SlkKlOpuZpiNUA
         v/rE1tf5mk0JmP77BZOSpjVZjZyY06zkB3Yap5KtGwwQeuY3it5xEST4c1CihBZJbuxr
         TYYTM2aD7+IudxmGA08FXGz/bpisv0h6nIY5znj6FqESRr/ijUH/vcVPJmxSVMCUkO6t
         ieY81L1Mh1S9QPWW+mP0I+RTQ2MW7qgAIZG27Kqkc1y03IV5P+dNygw6lL0/i4h7Hj3M
         URJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744820905; x=1745425705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcKONrIAwY+Efjpusl4unIszUT6B68ir1oyM8EH1UJY=;
        b=Q6ST3xbbZRZExQ1wmLlw7oXhC4gP+BuVLdacT3DcG65+ca2YcWPbDS+6yJRU22kmSl
         I+zwkeDZ/5YKveLOzXfrwohLi3kt6m4o7f5eDSml61j8bWCUopbobcWvxaadoEnX1mKx
         s9zKhJaC3GcFnooU7icOhH6RNbkkMBAdwwQFN20vqNbgivduQfOeGoT+W7N5QOa5nAlQ
         2CzwceIejVZJECAd+3jpyLzgALDwCJdF9J12/939TfIA42oToEzYj423avtpfDDvHtn3
         WTdgArgrHsyhZQu626+1+9RR0v0KQ2nfDfJlLqj1Xoi76CqDPdlspEMeMjJJwD7LV6ZB
         gP0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvv7Xxuu+815+E7cTGvjxW+AMp8Z+Qnwos9y3fjwip1uPSQu+SlNUsMz9geNPUPaJJ1hpMtSVHYJvFvqi5@lists.linux.dev
X-Gm-Message-State: AOJu0YwQoWMnAaUe/6cXJ1s+7uNvcya9+rbev+FuTSEiM34g4kh4YANK
	OvoxXiOaGR0U6ZKtbUNpBY5xD89kFG1zL+tjzlYmfCxT47kmHQuYL9EeX8Pqjkhnvl1Dru5w2nP
	7ZJ/T33XrLLnYXUUe/FNNELEVWU1Umx2/uBH5
X-Gm-Gg: ASbGnctfcLHNxBNBaG1/Npysd/ZJHuT6ycwjc384Boaa6s3UC16HdJlZrqqBCIETjxu
	Yu4PJnR6K0q/SikxwP3/iprwphqK18pAjIzZTr/RvnL/VKGKBkaw4BTbDLy9cik93rwEeYPggnX
	AQOscRoLbw8+SHwbeHMvMQFtakALKufgtLW2l4OiSv5ctcAjapF+ge
X-Google-Smtp-Source: AGHT+IECcvlnv6xPe9UB0/XJHO7q92sQEEqdeeGFlPVCn4BZ/toc+Qo3v9Dc1e4mY/RgIEckbUeu3UbXyA3ppO6oN3o=
X-Received: by 2002:a05:600c:6a87:b0:439:4a76:c246 with SMTP id
 5b1f17b1804b1-4405d26eadcmr1009515e9.6.1744820905359; Wed, 16 Apr 2025
 09:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250414225227.3642618-3-tjmercier@google.com> <202504161015.x2XLaha2-lkp@intel.com>
In-Reply-To: <202504161015.x2XLaha2-lkp@intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 09:28:13 -0700
X-Gm-Features: ATxdqUFoAbnFhGEzvGofJporgvqMuSJROlNX-nlFC0ORBP_b5Axo3RH1otfUvlU
Message-ID: <CABdmKX16QttfxRYHaq1B92U8nw+S6Gte+mFVhOTnCy4H3cLFcA@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: kernel test robot <lkp@intel.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, jolsa@kernel.org, mykolal@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 9:43=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Mercier,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/net]
> [also build test ERROR on bpf-next/master bpf/master linus/master v6.15-r=
c2 next-20250415]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/dma-bu=
f-Rename-and-expose-debugfs-symbols/20250415-065354
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
net
> patch link:    https://lore.kernel.org/r/20250414225227.3642618-3-tjmerci=
er%40google.com
> patch subject: [PATCH 2/4] bpf: Add dmabuf iterator
> config: i386-buildonly-randconfig-005-20250416
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df=
0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=3D1 build):
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504161015.x2XLaha2-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: dmabuf_debugfs_list_mutex
>    >>> referenced by dmabuf_iter.c:44 (kernel/bpf/dmabuf_iter.c:44)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:53 (kernel/bpf/dmabuf_iter.c:53)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:26 (kernel/bpf/dmabuf_iter.c:26)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>    >>> referenced 1 more times
> --
> >> ld.lld: error: undefined symbol: dma_buf_put
>    >>> referenced by dmabuf_iter.c:45 (kernel/bpf/dmabuf_iter.c:45)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:90 (kernel/bpf/dmabuf_iter.c:90)
>    >>>               vmlinux.o:(dmabuf_iter_seq_stop)
> --
> >> ld.lld: error: undefined symbol: dmabuf_debugfs_list
>    >>> referenced by list.h:354 (include/linux/list.h:354)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:0 (kernel/bpf/dmabuf_iter.c:0)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>    >>> referenced by list.h:364 (include/linux/list.h:364)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is due to no CONFIG_DMA_SHARED_BUFFER. Fixed by:

--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -53,7 +53,7 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
-ifeq ($(CONFIG_DEBUG_FS),y)
+ifeq ($(CONFIG_DMA_SHARED_BUFFER)$(CONFIG_DEBUG_FS),yy)
 obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
 endif
