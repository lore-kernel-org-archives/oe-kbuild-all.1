Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84402749F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789850; cv=none; b=KD7u88VfNn2PE6dUmI8UhM722vCoTa5jStatxsrMUClQxDT6v+rZgOFPtQAutTEAwRr5upCaWXogfJF7h6q02dYqFiSCToPFbPwqSj+J85UVk7uLT+4VTd60cze5m99YdqM224597xmh7CDhHStZjQJVGMVek1w8DVJ4tH6V8yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789850; c=relaxed/simple;
	bh=34kgEp6THhg22B2MstEy/Z3Y/FxYpLpfyNbplG3EiJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uL9yB7AsmjgWzywNPQq8wuU+v5Qh9VTzQBBhNhN6REy7JLX94JyJlqweAdVKb2VCuhZ5hB6ek8kBnzpNdkVenzfY85tIWYafu7vC/Alx6fyYTJ/Tv556Mf4iVvonFz61LgQOox1BcLtuNNzleP918vdyLG83oA0fOMtf8nMroGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=AlslLA+A; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="AlslLA+A"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb78e70c5so171474166b.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 08:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1755789847; x=1756394647; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9yagdA1Artjpf1rIQmf0i3jStIgRUB/OZmAusmDEls=;
        b=AlslLA+ATfS8EyzVW63TiAhHU8298g+T293takhGE0s5mwJ2PPEvFMraDcrTy40o6v
         1/rN3IrKDAbhN16MA/eIMZWwzR8QSRmm8Gc7btFVhQMfNd8z5oYML97zh2keInU7QNCO
         SoLr7LKw1fzpkW/sj4tRZ8izzFY2uIal28LW6iTHPyna8ejRW9ccAbE9LdLfgWKb5n56
         i2hLH0Y+enA9ohJT61XczYZ4VhkQTjte077TluhSJz6vGIEEodp7wfF1nqVT4qAYf8yZ
         UO5x8KMgZJ89Txu1dj9SruK+PNrUqlP9OS6BJ3cHfRDlGh4GfTsgKKa9ZvUy//n7txqy
         VUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755789847; x=1756394647;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9yagdA1Artjpf1rIQmf0i3jStIgRUB/OZmAusmDEls=;
        b=ewC37RugAF9TutDgDhGSmB0402kl8xcPyx8W+ecMX5fvgjCFzVLSsK89fRZ910Q2fY
         TPKlJvPNY1EL5nZxcoi6TuVKpX/D146DoEQvQKOSNfKIloXv/f22UXspha4wPUO78mBW
         8BFoFI5oiRWU64tfEiNjl5JLEXzZHx10zuTtWmCd1bQYdEgGqXzHfTuPHVtD6dbRsKdy
         Y8t0TwkK/wbtEMy2nxvBLAU60zqM3GYKmSABJXB+5tCrzCQDPGry1+MCPf/c1oWJXRva
         jwAMAh+I7AgAvAmCwGrOvTtxz4A7BJxMtLoRc6z3BjBQDunTl9wnUDRXEwAQyicjVRgZ
         yWbQ==
X-Gm-Message-State: AOJu0Yx4FUtleBgFut6ArSSXZ3dRBr/d0zfpOxIOaOhFG9AZWHGrVNSK
	YclSRoVDnP4l7j7lSwOEAfGK0F+oujJwDPY3jfmWcGERQPzKLe5T0CEXiPslVhKvLR8BeINz6Ho
	oB/Xf
X-Gm-Gg: ASbGncuNkLraNOBpRkWJU9iBE0MypoiLYLkFtEUQ88yAbufGbJvtPCp92cfRycUnM+/
	vVumLSspFXAVF1CV4LOULz51LVYkhde2PDXOJJY+2wUq+SZ3pAfx8CiNB92fjiLHjeHgJEI/1YO
	oemzcVu1Koldg22h5q5ZMOGAj5uxIKgHDV+HrVOZ1X03l81Ajw/azkJYI9OEK+S6CU7mWbGA8E+
	El/r2XHnB/5EVq/CEbdoD1j5s2n6G5fDYr/PYLhjN/pGLodTiagx+DzAaJVXe1Ps+bVfLrSFibc
	F5vjJW+HKppOjZ1nBA5PF+Xf7NjeCufDcK3djvQbfxsB/tHzlUu5E4HSyk+OYx4NwngzoNaNZu9
	RquUnSVd+8F6VXSU=
X-Google-Smtp-Source: AGHT+IESeG/OREHOu8wJpqc/Xilz9zf0indLCvfSOYku5z0IamP+dWzKdAxSjsrvl0I/fcpZekEMOQ==
X-Received: by 2002:a17:907:b5a7:b0:af5:98b2:e098 with SMTP id a640c23a62f3a-afe07bbabf3mr195613166b.51.1755789846818;
        Thu, 21 Aug 2025 08:24:06 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:5063:2387::38a:71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2bc3e0sm418324466b.22.2025.08.21.08.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:24:06 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,  Martin KaFai Lau <martin.lau@kernel.org>
Subject: Re: [linux-next:master 2782/3950] kernel/bpf/helpers.c:1784:17:
 warning: argument 2 null where non-null expected because argument 3 is
 nonzero
In-Reply-To: <202508212031.ir9b3B6Q-lkp@intel.com> (kernel test robot's
	message of "Thu, 21 Aug 2025 20:53:28 +0800")
References: <202508212031.ir9b3B6Q-lkp@intel.com>
Date: Thu, 21 Aug 2025 17:24:04 +0200
Message-ID: <87cy8ozoiz.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 21, 2025 at 08:53 PM +08, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7fa4d8dc380fbd81a9d702a855c50690c9c6442c
> commit: 6877cd392baecf816c2ba896a9d42874628004a5 [2782/3950] bpf: Enable
> read/write access to skb metadata through a dynptr
> config: sparc-randconfig-r063-20250821
> (https://download.01.org/0day-ci/archive/20250821/202508212031.ir9b3B6Q-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20250821/202508212031.ir9b3B6Q-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508212031.ir9b3B6Q-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/bpf/helpers.c: In function '____bpf_snprintf':
>    kernel/bpf/helpers.c:1069:9: warning: function '____bpf_snprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     1069 |         err = bstr_printf(str, str_size, fmt, data.bin_args);
>          |         ^~~
>    In function '__bpf_dynptr_read',
>        inlined from 'bpf_dynptr_copy' at kernel/bpf/helpers.c:2910:9:
>>> kernel/bpf/helpers.c:1784:17: warning: argument 2 null where non-null
>> expected because argument 3 is nonzero [-Wnonnull]
>     1784 | memmove(dst, bpf_skb_meta_pointer(src->data, src->offset + offset),
> len);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/string.h:65,
>                     from include/linux/bitmap.h:13,
>                     from include/linux/cpumask.h:12,
>                     from arch/sparc/include/asm/smp_32.h:15,
>                     from arch/sparc/include/asm/smp.h:7,
>                     from arch/sparc/include/asm/switch_to_32.h:5,
>                     from arch/sparc/include/asm/switch_to.h:7,
>                     from arch/sparc/include/asm/ptrace.h:120,
>                     from arch/sparc/include/asm/thread_info_32.h:19,
>                     from arch/sparc/include/asm/thread_info.h:7,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/sparc/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/alloc_tag.h:11,
>                     from include/linux/workqueue.h:9,
>                     from include/linux/bpf.h:10,
>                     from kernel/bpf/helpers.c:4:
>    arch/sparc/include/asm/string.h: In function 'bpf_dynptr_copy':
>    arch/sparc/include/asm/string.h:12:7: note: in a call to function 'memmove' declared 'nonnull_if_nonzero'
>       12 | void *memmove(void *, const void *, __kernel_size_t);
>          |       ^~~~~~~
>    In function '__bpf_dynptr_write',
>        inlined from 'bpf_dynptr_copy' at kernel/bpf/helpers.c:2913:9:
>    kernel/bpf/helpers.c:1845:17: warning: argument 1 null where non-null expected because argument 3 is nonzero [-Wnonnull]
>     1845 |                 memmove(bpf_skb_meta_pointer(dst->data, dst->offset + offset), src, len);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/sparc/include/asm/string.h: In function 'bpf_dynptr_copy':
>    arch/sparc/include/asm/string.h:12:7: note: in a call to function 'memmove'
> declared 'nonnull_if_nonzero'
>       12 | void *memmove(void *, const void *, __kernel_size_t);
>          |       ^~~~~~~
>
>
> vim +1784 kernel/bpf/helpers.c
>
>   1754	
>   1755	static int __bpf_dynptr_read(void *dst, u32 len, const struct bpf_dynptr_kern *src,
>   1756				     u32 offset, u64 flags)
>   1757	{
>   1758		enum bpf_dynptr_type type;
>   1759		int err;
>   1760	
>   1761		if (!src->data || flags)
>   1762			return -EINVAL;
>   1763	
>   1764		err = bpf_dynptr_check_off_len(src, offset, len);
>   1765		if (err)
>   1766			return err;
>   1767	
>   1768		type = bpf_dynptr_get_type(src);
>   1769	
>   1770		switch (type) {
>   1771		case BPF_DYNPTR_TYPE_LOCAL:
>   1772		case BPF_DYNPTR_TYPE_RINGBUF:
>   1773			/* Source and destination may possibly overlap, hence use memmove to
>   1774			 * copy the data. E.g. bpf_dynptr_from_mem may create two dynptr
>   1775			 * pointing to overlapping PTR_TO_MAP_VALUE regions.
>   1776			 */
>   1777			memmove(dst, src->data + src->offset + offset, len);
>   1778			return 0;
>   1779		case BPF_DYNPTR_TYPE_SKB:
>   1780 return __bpf_skb_load_bytes(src->data, src->offset + offset, dst, len);
>   1781		case BPF_DYNPTR_TYPE_XDP:
>   1782 return __bpf_xdp_load_bytes(src->data, src->offset + offset, dst, len);
>   1783		case BPF_DYNPTR_TYPE_SKB_META:
>> 1784 memmove(dst, bpf_skb_meta_pointer(src->data, src->offset + offset), len);
>   1785			return 0;
>   1786		default:
>   1787			WARN_ONCE(true, "bpf_dynptr_read: unknown dynptr type %d\n", type);
>   1788			return -EFAULT;
>   1789		}
>   1790	}
>   1791	

Right. This happens with CONFIG_NET=n.

I think in the end we need a simple wrapper around memmove to stub it
out with -EOPNOTSUPP when CONFIG_NET is disabled.
