Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24283164AA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149546; cv=none; b=syNZ4vBZxuGgkB7J5HbND44GLO/y/AW4GFtyHCrE5M6JusHKmX878pErazO/Pnf422QdJtN+NO2AU8ILUwXsjHWp9a9gISxaUevXinMke7qCWu0NFF8XPG8YPRInbFYk0I4w+w6TbI9808i9+fjSWwDwFqd2ZjR6vU19T/Te6xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149546; c=relaxed/simple;
	bh=Zo8OAngOh0P8c1OR78bqc8BgST7jOqfQbaCLKvgsal8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbyxRYQ7zRu2oSnbPCRraCA3zx89/2oRWzFqeG1Nlmon1+oUG5awABIe9HlgaC9pPtTWlDV8m/XXqUNsvyp6str3DM0d0cNidZX/3YccdrWE5TiCOBccUi12T+p+Up9xl+rqFn5weM/B6Of307eRq2vQEyMkrKOiD3tfELrhKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui8m/ob6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui8m/ob6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so8439425e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Apr 2026 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775149534; x=1775754334; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ96XmrvwmNmdc1Ry2/PJXAWh8krLD6ljIYp6nVbJmg=;
        b=Ui8m/ob6JHdMEpe2Vz+C1/cgFylHV3gKsP9Cl77+NOk0HUAVenbuMTqvHTDPCNdXaL
         3YxdGEkd94d22JHG01w3IivNHwJFdQOJGkJrBGXA6mIl6Pp98YFVj0SCzqqJCOqAkbnk
         QqKLGTVhDQEXUfkutd5qwV37LcTcQ0RsD/LeQxb3z9IPotiO0FftgmjUMU9BVstGgQr2
         1lUSWkNDQ4IgQbk/N47WTHraMxNKm+8jjWe3sqNowfIuT+1O8bc/T/whuHH2dIHXOy2V
         NTjahu15+hdPbd+sVgje5cye00KZ1L8jXEXV5b7xaIFdXNfrotVdhn5Uf3uFH3QpOJrk
         jukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149534; x=1775754334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJ96XmrvwmNmdc1Ry2/PJXAWh8krLD6ljIYp6nVbJmg=;
        b=ByAH0P2iO3lOsNTNbqXqNaaMBa+vVkEeBpPTvQM1s4tSZx2Rbi86dZdEWlAwm+LM2R
         q7OXUT52mwNC20SmvGTBVTatgCXF/4uzk5X40HqArCaOwZf0gSSc4q6Ko9vqKAuJRM/7
         ttlX/JK3yPU6+eq59OQW3j73u05QgkjUm/BM39unREq8RZpRyfXMqlvArw5RjAlwLu+H
         V0HxHmIa8UtbQG6REWxBlYX2w4yuNIWR5uiv0KYq04X7PHCzV7M8M4sdVUNieOgf7fPO
         as4w/sZhVd01jOAN3XVHrB6reCF8SYzRSvrVKEz6IjAlS0noFgxt+sHUJ8twXK7KMEW+
         p4xA==
X-Forwarded-Encrypted: i=1; AJvYcCUae9Uv4m9eU5t+XJKQgq8PlXsidtgdXkJDCMFZascUOjj2PvqnZ3blEOSDYzBFhQRMSI5+nYWiuAAQqQ1r@lists.linux.dev
X-Gm-Message-State: AOJu0YxRe1zXn/9vdUPVEcKplx/wBCGrlPHsecW5xV/B6PtRI0RsI6Sn
	EkNWjuvBQrQJ5bInJOOsVC78xAUp47gpuC4Pbo5duOSXf4ov1xYZv4Vn
X-Gm-Gg: ATEYQzyZJnH3irdLs17Sdlc4B2Eo97enYSZ+HWaC4CX3dQfeRdv5aSy3uOkPznCv5PN
	w+D36rlREuiiw8357imqoy+O7pESdxTOAWT3zUX8pZ5H3bIZf7rZc5JWZt+b6VVqEZYfK44CjwN
	jqTmnyM5sLobx3k0+nFNv42uKJDsWseRbNhKjXAbe/F/oMeAqJctRTs2U2S2A3izdaWdOAKfs8S
	2tYA3Ee1Fk/m3MC0UH1Sl2SJgS/mDQTMeRN3KndkXdy/azbwJ6zRTzxM1OfL/ILPOeg1MJIYezl
	7gegaT9Lv2nlyOVHbg95NoQD1eDVd5wKPNoVUXBRnyRekGO1gQZfmgpmYESLYEFcIM7ElH/xZmy
	0dhgRuIeE/vNaGSnH15mtH8h4KhDdGHLS/7TjOjtMTdHxuY7XAek+8vLsQCSheQnm5iF7Q0S9Mj
	PJQyptjK4KWBxcAIGRosQ=
X-Received: by 2002:a05:600c:3b0a:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-4888e09ba82mr46503895e9.10.1775149534150;
        Thu, 02 Apr 2026 10:05:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm265992305e9.3.2026.04.02.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:05:33 -0700 (PDT)
Date: Thu, 2 Apr 2026 20:05:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <ac6h2jF-KJ5pm1WM@stanley.mountain>
References: <20260331111240.153913-1-elver@google.com>
 <202604020400.jEq32K95-lkp@intel.com>
 <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>

On Thu, Apr 02, 2026 at 03:48:20PM +0200, Marco Elver wrote:
> On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
> >
> > Hi Marco,
> >
> > kernel test robot noticed the following build warnings:
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> > patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> > config: um-randconfig-r072-20260401
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > smatch: v0.5.0-9004-gb810ac53
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
> >
> > New smatch warnings:
> > drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> > drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> 
> How is this related to the patch I sent? Did the <linux/slab.h> change
> force rechecking of all these files and it found latent issues?
> 

Oh, crud.  It turns out that for this check Smatch allows
integer_array[sizeof()]so long as we know that the index is within
bounds.  What happened is that your patch renamed the kmalloc()
function so Smatch stopped knowing the size of the buffer.

For these zero day bot warnings, the emails are automatically generated
so I don't have any context outside what's in the email.  I saw that
Kees wrote the code, but I figured maybe you forwarded it or something.
Sorry about that.

regards,
dan carpenter

