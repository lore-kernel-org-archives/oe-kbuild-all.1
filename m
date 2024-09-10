Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE319B3D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990058; cv=none; b=FKLANBm6wxi/n9/ZxAjci5p70H5XY2XNBQKbKi9BAknBUmsi8VKLx1PApk6QCDFEvpE6FyfDBRizifb1sGpDwKdKjjyt5wB8mo1lKedFAOYl1wAYAKHIF0knEbj/m7D2TbcUd+w8ZfXsY6JGS/HSqEngliG0mtf3hn6LKvXOySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990058; c=relaxed/simple;
	bh=Y5BFVWwAGNaN/6+LqhIBkQunwJLzvu1IrletRRXdq0A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=X0r2S70/j/faTJJOVnPZVrccSZpv1nglyRQyC1scyJbs51Xc44UUQ/0YOooqDBgKfxBVbtxG15MtcarMl1ODrATW2mY79nXne6mTqKJbrkzFnNpF31XXzlc8SuFB6T2EHvYmZZpW8uJg4PG4pnSAcVnZV/l6dvWrF/YEhYuTIrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=kPLVdU9j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="kPLVdU9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B281C4CEC3;
	Tue, 10 Sep 2024 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1725990057;
	bh=Y5BFVWwAGNaN/6+LqhIBkQunwJLzvu1IrletRRXdq0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kPLVdU9jVF9ruqeF09W7d1IaHHhYVcGjX+zojPd+ydRS+FHXi92jZhHYCH5NOAKV1
	 w00vxFQESo/meOF3tKu7uCuel4s6P61YAL3LDlnKCoQ9FrY88k7kc0Ob5PHllZAiaf
	 gHuH8CJjgJAsx0N96NzxfpJ1uyACUCW7dGO1/rg8=
Date: Tue, 10 Sep 2024 10:40:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Huang, Ying" <ying.huang@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [linux-next:master 10352/10516] include/linux/mm.h:101:35:
 error: 'MAX_PHYSMEM_BITS' undeclared
Message-Id: <20240910104056.343d7154134fb7fc6942075a@linux-foundation.org>
In-Reply-To: <87wmjkyshl.fsf@yhuang6-desk2.ccr.corp.intel.com>
References: <202409100913.RxkfrKU6-lkp@intel.com>
	<20240909204555.ab57c729531c83a0685cfa8e@linux-foundation.org>
	<87wmjkyshl.fsf@yhuang6-desk2.ccr.corp.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Sep 2024 13:42:30 +0800 "Huang, Ying" <ying.huang@intel.com> wrote:

> >>       93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
> >>          |                                      ^
> >
> > Thanks. "resource, kunit: add test case for region_intersects" is the culprit.
> 
> Yes.  Although the definition in include/linux/mm.h introduced in
> 
>   commit ea72ce5da228 ("x86/kaslr: Expose and use the end of the physical memory address space")
> 
> doesn't compile on m68k.  There are no users of PHYSMEM_END before patch
> "resource, kunit: add test case for region_intersects".  This can be
> fixed via the following patch.
> 
> ---------------------------------8<--------------------------------------
> >From 00d176e0cd07e3df1ea37a5e56ca576c819b585a Mon Sep 17 00:00:00 2001
> From: Huang Ying <ying.huang@intel.com>
> Date: Tue, 10 Sep 2024 13:20:40 +0800
> Subject: [PATCH] mm: fix PHYSMEM_END build error on m68k
> 
> 0Day build system reported build error on m68k architecture for missing
> the definition of MAX_PHYSMEM_BITS when defining PHYSMEM_END.  Fixed it
> via making PHYSMEM_END definition depends on MAX_PHYSMEM_BITS definition
> conditionally.
> 
> Signed-off-by: "Huang, Ying" <ying.huang@intel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409100913.RxkfrKU6-lkp@intel.com/
> ---
>  include/linux/mm.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 147073601716..62bb7e7e0a17 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -98,7 +98,11 @@ extern int mmap_rnd_compat_bits __read_mostly;
>  #endif
>  
>  #ifndef PHYSMEM_END
> -# define PHYSMEM_END	((1ULL << MAX_PHYSMEM_BITS) - 1)
> +# ifdef MAX_PHYSMEM_BITS
> +#  define PHYSMEM_END		((1ULL << MAX_PHYSMEM_BITS) - 1)
> +# else
> +#  define PHYSMEM_END		(-1ULL)
> +# endif
>  #endif
>  
>  #include <asm/page.h>

I'm not really understanding.  This patch (which I assume is against
linux-next?) requires the presence of ea72ce5da228 ("x86/kaslr: Expose
and use the end of the physical memory address space"), which is not
present in mm.git.  Yet mm.git exhibits the build failure.


