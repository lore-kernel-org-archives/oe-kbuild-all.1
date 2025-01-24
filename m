Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B732236F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737744198; cv=none; b=u+7jOhfoStbNsHeB/YI5vwMUEPF6eer7QLztYvf78Qh/APKr0fGI9pcsk5ACwYt7HTm3XIZKcTg8NofH6X+l3HgSPIjjGyZ4zacAM955IeEtt4+x+rcXfXMFm8iKwcr7vEW2iMYRmOE/HwgEwUsNe9n4jwrfM8coO10D8Uq0RwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737744198; c=relaxed/simple;
	bh=E6ro15Rdkh1EjMnx0YxrFTlmPBXvD5/CvbMHiPHKM4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=r7FuVlbkiKf8uO37gICQZqFLVzAp9+hrlo+7i7t8mzcUz8WrTH4knu/kE9GRf6/aMM4E755egr+vgMJJ8fcQb+B1KRCOcSZE/K1N9hBDwXjRw8xU+v1kzjHzigpq8QbJtn+vhA4j77gykbpJBAaOMLLat2yZAz9dcqhjHvf6vFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KIcCIbSv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KIcCIbSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737744192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oqP93IEyNiqxaVkRzdBD14FzWHz6Qk4+0A2lcHdruh8=;
	b=KIcCIbSvFMudhBkZ81yvTQFWFHf7/V6tEXid4Ohpuoe0uFVZ7dYcHttN3DgdjgBjufcQF1
	EnUc0qgDZHfgSLyBfIp+J2FX7aIjlKdMOtiIFoYIt7daHDRjVYso47xP856G41wu7do8dy
	95FQDyxU/8qGodtJTqgmANKKcipUeho=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-zbvNNdPkM--PBjfAHEJfmw-1; Fri, 24 Jan 2025 13:43:10 -0500
X-MC-Unique: zbvNNdPkM--PBjfAHEJfmw-1
X-Mimecast-MFC-AGG-ID: zbvNNdPkM--PBjfAHEJfmw
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467be89d064so27690691cf.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 10:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737744190; x=1738348990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqP93IEyNiqxaVkRzdBD14FzWHz6Qk4+0A2lcHdruh8=;
        b=at95GIs3BeDZVnI01yNXYtQELei1qhOcxRe6BFEFj+NATXWsAv/kclHrSaLaM6SvWW
         coNgyuWiNweVzQlm7uvhi54HVRDbhuJ5qbTALfYXbkEUZdNS2n5kLJPwUWvmGiYEP12D
         SSiTiWmjFg3QlJvzgIn5o1S0Xaec0yAaIi94sOU4o0UJfFQbcIE/jiSHx8NEemkHECuQ
         bDZhQ9m8yhyJ+xGDqnvt+qt/xZw6XThv7j7/xmunsCItI4WxkiHlyAPQuKqAAo9UPBrT
         Cdw6wxEXK91Y4zS4PaMTnFhLfidL++pW53mHFJ1he+OGxcyD2kFbnN73jKFMSNl8O4ta
         76Hw==
X-Gm-Message-State: AOJu0YxD8O45ixA6GkCm629o+2cBa7XO/m5c/NHmxjRJL0KBl+Z5SWNQ
	Tv6WjPFHCNPaa9b+FBpgveRhpP2MJqU6hF7WjeJV7rxOtgjoBwLYtun63hJXzKKpkdesI6iZYKW
	MfFVRl5KAdSZGlIc8jNHnaJPoX9X0YM0zmYj+aAoxi6M7+Gg7/QgOjpFnmmTqoCs=
X-Gm-Gg: ASbGncs9LmqJCxCE2EJvMbiY/koZwJSZiTxPsqohEcLzWlnbQVVrkpZMr+eat9Rthrl
	2fNrsAdoR5VLi+F0wKhjeWQ3Dcj374v990ZQLflaYr8f1NVpXnE6hMqCt4pfUjb2rDrjGixYwSs
	o7U8EHtjuD5yGVtHdEkoLwAbuLyeaiq6T8bKkHLOWPJgUmOgiILQBUdx4/lTdSxwuULr7yjNlEv
	6MiIJFOirMoZmAWi5hPFyMnWFXiLHzvYMcNUd0jAHOy7ttTYuJ5HBmbpPi0t8pAawRELmUAGXzV
	Bj0bJhHJoV6XACVaPQYg3TGY57Vo9D0=
X-Received: by 2002:ac8:7d52:0:b0:467:70ce:75e9 with SMTP id d75a77b69052e-46e12a96eacmr451131271cf.23.1737744189953;
        Fri, 24 Jan 2025 10:43:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBfjwlQTNorfux/EB0BQpnnWz1g5Icksygxw6u3hdARhf1/RKjg+NOxCMXv7X52TnMiXVBeQ==
X-Received: by 2002:ac8:7d52:0:b0:467:70ce:75e9 with SMTP id d75a77b69052e-46e12a96eacmr451130801cf.23.1737744189439;
        Fri, 24 Jan 2025 10:43:09 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e6687e3b0sm12639361cf.21.2025.01.24.10.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:43:08 -0800 (PST)
Date: Fri, 24 Jan 2025 13:43:05 -0500
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>
Subject: Re: mm/gup.c:778:15: sparse: sparse: cast to non-scalar
Message-ID: <Z5PfOZ1D6dNKTzw6@x1n>
References: <202501240922.a4YzQD7u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202501240922.a4YzQD7u-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -bzK_aR225a4bwcNrHshUadcxyZZPBdD_hyvu3uQJIs_1737744190
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jan 24, 2025 at 10:01:40AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   e0b1f59142746f74476a03040f745329c8355a7e
> commit: e6fd5564c07c3c749ff3d1b2aa35540b4047e395 mm/gup: cache p4d in follow_p4d_mask()
> date:   9 months ago
> config: alpha-randconfig-r112-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240922.a4YzQD7u-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240922.a4YzQD7u-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501240922.a4YzQD7u-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> mm/gup.c:778:15: sparse: sparse: cast to non-scalar
> >> mm/gup.c:778:15: sparse: sparse: cast from non-scalar
>    mm/gup.c: note: in included file (through include/linux/mm.h):
>    include/linux/pgtable.h:315:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:315:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:315:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:315:16: sparse: sparse: cast from non-scalar
>    mm/gup.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
>    include/linux/page-flags.h:241:46: sparse: sparse: self-comparison always evaluates to false
>    mm/gup.c:682:9: sparse: sparse: context imbalance in 'follow_page_pte' - unexpected unlock
>    mm/gup.c: note: in included file (through include/linux/mm.h):
>    include/linux/pgtable.h:322:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:322:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:315:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:315:16: sparse: sparse: cast from non-scalar
>    mm/gup.c:911:18: sparse: sparse: context imbalance in 'get_gate_page' - unexpected unlock
> 
> vim +778 mm/gup.c
> 
>    769	
>    770	static struct page *follow_p4d_mask(struct vm_area_struct *vma,
>    771					    unsigned long address, pgd_t *pgdp,
>    772					    unsigned int flags,
>    773					    struct follow_page_context *ctx)
>    774	{
>    775		p4d_t *p4dp, p4d;
>    776	
>    777		p4dp = p4d_offset(pgdp, address);
>  > 778		p4d = READ_ONCE(*p4dp);
>    779		if (p4d_none(p4d))
>    780			return no_page_table(vma, flags);
>    781		BUILD_BUG_ON(p4d_huge(p4d));
>    782		if (unlikely(p4d_bad(p4d)))
>    783			return no_page_table(vma, flags);
>    784	
>    785		return follow_pud_mask(vma, address, p4dp, flags, ctx);
>    786	}
>    787	

There's one more similar sparse warning here, both reported today:

https://lore.kernel.org/all/202501241212.q9AAshQc-lkp@intel.com/

Firstly, I reproduced this sparse warning locally. And yes it yells about
that line, and even one more similar case of READ_ONCE().

The question is I thought READ_ONCE() should be ok to be used on things
like p4d_t, even if they can be structs / non-scalar types.  At least from
sparse POV I cannot trigger similar sparse on non-alpha.  So looks like
Alpha has something special.

Then I noticed that Alpha indeed has a custom definition of __READ_ONCE()
which is probably needed due to the mb():

#define __READ_ONCE(x)							\
({									\
	__unqual_scalar_typeof(x) __x =					\
		(*(volatile typeof(__x) *)(&(x)));			\
	mb();								\
	(typeof(x))__x;							\
})

I didn't obviously see yet on how that could affect sparse, if READ_ONCE()
works for non-scalar somehow on most of the rest archs.

I tried to switch to the default __READ_ONCE for alpha build (it misses
mb() so it isn't correct, but trying to figure out whether it'll trigger
similar sparse warning), then the warning is gone.

Then I found that this change can also work for alpha:

diff --git a/arch/alpha/include/asm/rwonce.h b/arch/alpha/include/asm/rwonce.h
index 35542bcf92b3..0d61183ff764 100644
--- a/arch/alpha/include/asm/rwonce.h
+++ b/arch/alpha/include/asm/rwonce.h
@@ -25,7 +25,7 @@
        __unqual_scalar_typeof(x) __x =                                 \
                (*(volatile typeof(__x) *)(&(x)));                      \
        mb();                                                           \
-       (typeof(x))__x;                                                 \
+       __x;                                                    \
 })

I had a feeling that sparse somehow thinks the "typeof(x)" isn't the same
struct v.s. "__unqual_scalar_typeof(x)" above, even if IIUC the macro was
only trying to tear down type qualifiers.  Especially in Alpha's case IIUC
p4d_t is a struct (in my case, STRICT_MM_TYPECHECKS=n):

        typedef struct { pgd_t pgd; } p4d_t;
        typedef unsigned long pgd_t;

So I suppose __unqual_scalar_typeof() should do nothing on a non-scalar
type.

So even if above oneliner seems to fix this specific sparse warning, I
don't really know how it worked.

I copied Will (who introduced both the alpha's __READ_ONCE, and the unqual
macro for generic code) in case he has some thoughts..

Thanks,

-- 
Peter Xu

