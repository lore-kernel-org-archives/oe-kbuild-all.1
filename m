Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD293A473
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Nov 2022 19:08:30 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id k7so5367084pll.6
        for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Nov 2022 11:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/8r8Y1eiMtDrea4Bredv83OHEKoOW04VLm26sFfGLI=;
        b=HWAZluIAvvjnkxMgiq1Qzl+V26QBQ8YRf7JiCcztzqG490PhwSIhjFbHmPPhMSOkjF
         s4v5A0Hvl0RnLGeRYzpw41MQ3m/MXgm1rPQBrj0DIGKlzul42gHyOWucFaxuIMI5Tip3
         uZ9Q2Az4X2xVXpE+8KZpkokSLdqJSzRHNxkGT8FboMWBxIMyiFmhAlH8+FCKbs0a0w0o
         n/F9hgShe0wKwm3Wh5sBTPlI7kbuftA4Jd4Z2TIEAZoZGDSbwE5sdPJOPMCNQv02rTny
         qrJ8CuZJr0+ur3EXFVZrKhj5amxw0dfo6FrX2MKq8mNbyzdT6Z0FBukMOnZV8Xr8/2nl
         n22w==
X-Gm-Message-State: ANoB5pn4v7cFjOKfjkFN6FRx+lRi81T3aqkLVlV8H9F8As2Cxy+QQUqb
	0qtnZycptdObG3E6Q/2Qd8c=
X-Google-Smtp-Source: AA0mqf4xgOvIuy0PrG+CJHcSFjIJF5Y6ybarRduM5XmaJwvCAHUMIKgE1Gqn5+T8S8OeGVqMd3sdxg==
X-Received: by 2002:a17:903:228c:b0:186:8d12:f51f with SMTP id b12-20020a170903228c00b001868d12f51fmr810014plh.129.1668798509794;
        Fri, 18 Nov 2022 11:08:29 -0800 (PST)
Received: from fedora ([2607:f598:b99a:be1:7423:52fa:7f88:fa93])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902a50a00b0017f57787a4asm4093531plq.229.2022.11.18.11.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 11:08:29 -0800 (PST)
Date: Fri, 18 Nov 2022 11:08:26 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Baoquan He <bhe@redhat.com>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	42.hyeyoo@gmail.com
Subject: Re: [linux-next:master 5002/7443]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_474' declared with attribute error: BUILD_BUG_ON
 failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
Message-ID: <Y3fYKnMZ0d/jtoKN@fedora>
References: <202211120436.HzD1i2yQ-lkp@intel.com>
 <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
 <dda9e5fc-258b-bf67-c90a-f7fb23ab68e3@suse.cz>
 <Y3MR5ZA6DClG/2rC@fedora>
 <Y3NXJF+hzp/s5FU4@MiWiFi-R3L-srv>
 <Y3Pv0LwOhBdcnxfX@fedora>
 <Y3TKM38RpvbkloJJ@MiWiFi-R3L-srv>
 <Y3aKHQ83MmSE+m88@fedora>
 <97b6c8e7-36f3-1181-7ffb-d94e8a8d293e@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97b6c8e7-36f3-1181-7ffb-d94e8a8d293e@suse.cz>

On Fri, Nov 18, 2022 at 10:49:43AM +0100, Vlastimil Babka wrote:
> On 11/17/22 20:23, Dennis Zhou wrote:
> > On Wed, Nov 16, 2022 at 07:32:03PM +0800, Baoquan He wrote:
> >> On 11/15/22 at 12:00pm, Dennis Zhou wrote:
> >> > On Tue, Nov 15, 2022 at 05:08:52PM +0800, Baoquan He wrote:
> >> > > Hi Dennis,
> >> > > 
> >> > > On 11/14/22 at 08:13pm, Dennis Zhou wrote:
> >> > > > Hi Vlastimil & Baoquan,
> >> > > > 
> >> > > > On Mon, Nov 14, 2022 at 06:58:13PM +0100, Vlastimil Babka wrote:
> >> > > > > On 11/14/22 08:44, Baoquan He wrote:
> >> > > > > > Hi,
> >> > > > > > 
> >> > > > > > I reproduced the build failure according to lkp report and made a patch
> >> > > > > > as below to fix it.
> >> > > > > > 
> >> > > > > > From dae7dd9705015ce36db757e88c78802584f949b1 Mon Sep 17 00:00:00 2001
> >> > > > > > From: Baoquan He <bhe@redhat.com>
> >> > > > > > Date: Sun, 13 Nov 2022 18:08:27 +0800
> >> > > > > > Subject: [PATCH] percpu: adjust the value of PERCPU_DYNAMIC_EARLY_SIZE
> >> > > > > > Content-type: text/plain
> >> > > > > > 
> >> > > > > > LKP reported a build failure as below on the patch "mm/slub, percpu:
> >> > > > > > correct the calculation of early percpu allocation size"
> >> > > > > 
> >> > > > > Since I have that patch in slab.git exposed to -next, should I take this fix
> >> > > > > too, to make things simpler? Dennis?
> >> > > > > 
> >> > > > 
> >> > > > I don't have any problems with you running a fix, but I'm not quite sure
> >> > > > this is the right fix. Though this might cause a trivial merge conflict
> >> > > > with: d667c94962c1 ("mm/percpu: remove unused PERCPU_DYNAMIC_EARLY_SLOTS")
> >> > > > in my percpu#for-6.2 branch.
> >> > > > 
> >> > > > If I'm understanding this correctly, slub requires additional percpu
> >> > > > memory due to the use of 64k pages. By increasing
> >> > > > PERCPU_DYNAMIC_EARLY_SIZE, we solve the problem for 64k page users, but
> >> > > > require a few unnecessary pages that can bloat the size of subsequent
> >> > > > percpu chunks. Though, I'm not sure if that's an issue today for
> >> > > > embedded devices.
> >> > > 
> >> > > Thanks for looking into this.
> >> > > 
> >> > > I guess you are talking about PERCPU_DYNAMIC_EARLY_SIZE will impact the
> >> > > first dynamic chunk size of page first chunk, because the embed first
> >> > > chunk will take PERCPU_DYNAMIC_RESERVE. And the impact is done in below
> >> > > max() invacation.
> >> > > 
> >> > > static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
> >> > >                                 size_t reserved_size, size_t dyn_size,
> >> > >                                 size_t atom_size,
> >> > >                                 pcpu_fc_cpu_distance_fn_t cpu_distance_fn)
> >> > > {
> >> > > 	......
> >> > >         /* calculate size_sum and ensure dyn_size is enough for early alloc */
> >> > >         size_sum = PFN_ALIGN(static_size + reserved_size +
> >> > >                             max_t(size_t, dyn_size, PERCPU_DYNAMIC_EARLY_SIZE));
> >> > > 	......
> >> > > }
> >> > > 
> >> > > > 
> >> > > > I think adding parity to PERCPU_DYNAMIC_EARLY_SIZE with
> >> > > > PERCPU_DYNAMIC_RESERVE is defined by BITS_PER_LONG is a safer option
> >> > > > here. A small TODO item would be to make PERCPU_DYNAMIC_RESERVE be a +
> >> > > > value instead of a max() with PERCPU_DYNAMIC_EARLY_SIZE.
> >> > > 
> >> > > Hmm, the below change may not take power arch into account. Please
> >> > > check arch/powerpc/include/asm/page.h, seems the 32bit ppc could have
> >> > > 256K pages too. Adding PERCPU_DYNAMIC_EARLY_SIZE to 20K may cost extra
> >> > > memory during boot. But th left space of 1st dynamic chunk will join
> >> > > the later percpu dynamic allocation, it's not wasted, right?
> >> > > 
> >> > > Not sure if I got your point.
> >> > > 
> >> > > 
> >> > 
> >> > Ah, I'm not familiar with all the PAGE_SIZE and word length
> >> > combinations.
> >> > 
> >> > The first chunk is smaller in the embedded case with the assumption that
> >> > static percpu variables are highly accessed along with the limited
> >> > initial allocations.  While adding an additional 8KB is not the biggest
> >> > deal to the first chunk, this can cause the unit_size for subsequent
> >> > chunks to be larger. For example, x86 unit size jumps in powers of 2 due
> >> > to alignment and packing against an allocation size of 2MB. So if we're
> >> > at say 60KB for the first chunk, subsequent chunks could be 64KB. But
> >> > adding 8KB, we'd go from 60KB -> 68KB and a chunk size of 64KB -> 128KB.
> >> 
> >> I could have misunderstanding about the first chunk usage and percpu
> >> code. Below is my personal uderstanding about the 1st chunk size and
> >> how PERCPU_DYNAMIC_EARLY_SIZE could impact it, please help point out
> >> if I am wrong.
> >> 
> >> ~~~
> >> Abstract the definition of them here for reference.
> >> /*
> >>  * Percpu allocator can serve percpu allocations before slab is
> >>  * initialized which allows slab to depend on the percpu allocator.
> >>  * The following parameter decide how much resource to preallocate
> >>  * for this.  Keep PERCPU_DYNAMIC_RESERVE equal to or larger than
> >>               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
> >>  * PERCPU_DYNAMIC_EARLY_SIZE.
> >>    ~~~~~~~~~~~~~~~~~~~~~    
> >>  */
> >> #define PERCPU_DYNAMIC_EARLY_SIZE       (12 << 10)
> >> ......
> >> #if BITS_PER_LONG > 32
> >> #define PERCPU_DYNAMIC_RESERVE          (28 << 10)
> >> #else
> >> #define PERCPU_DYNAMIC_RESERVE          (20 << 10)
> >> #endif
> >> 
> >> From above definition, we can see that no matter how big
> >> PERCPU_DYNAMIC_RESERVE is , it's >= PERCPU_DYNAMIC_EARLY_SIZE as the
> >> code comment says. So the max() in pcpu_build_alloc_info() won't impact
> >> the embeded 1st chunk at all.
> >> 
> >> So, PERCPU_DYNAMIC_EARLY_SIZE can only impact the page 1st chunk case,
> >> namely when calling pcpu_page_first_chunk() to do that. In
> >> pcpu_page_first_chunk(), we don't provide dyn_size, so with the help of
> >> max(), it will get final dyn_size as PERCPU_DYNAMIC_EARLY_SIZE. This is
> >> the only place where PERCPU_DYNAMIC_EARLY_SIZE takes effect on percpu.
> >> However, the atom size of page 1st chunk is PAGE_SIZE, it doesn't have
> >> the issue of possible bloating unit_size by the atom size, e.g 2M on
> >> x86_64. Since pcpu_page_first_chunk() is the fallback of
> >> pcpu_embed_first_chunk(), if we decide to provide PERCPU_DYNAMIC_RESERVE
> >> as the current value, why we grudge setting it as the smaller value,
> >> 20K, whether it's 32bit or 64bit.
> >> 
> > 
> > I think I might be overindexing on the out of tree modifications here.
> > Currently, I think it's clear how modifying PERCPU_DYNAMIC_RESERVE
> > affects the system with the lower bound being dictated by
> > PERCPU_DYNAMIC_EARLY_SIZE. If we bump PERCPU_DYNAMIC_EARLY_SIZE, it's
> > not inherently obvious you can drop that value lower depending on your
> > system config.
> > 
> > Ultimately, it is only a few pages, so is saving it that big of a deal
> > today? Likely not, just a bit wasteful to potentially orphan a few extra
> > pages unnecessarily.
> > 
> > Let's just fix this now and I can massage this in the future if anything
> > comes up. I appreciate you taking the time to have this discussion with
> > me.
> > 
> > Vlastimil, can you please pick up this fix.
> 
> Sorry, got a bit lost, so do you mean the original uncoditional bump, or the
> modification with BITS_PER_LONG > 32 (or PAGE_SHIFT > 12)?
> 

No I've made this more complicated than necessary. Please pick up the
original unconditional bump.

There's a small chance you'll see a merge conflict in my percpu#for-6.2
tree:
d667c94962c1 ("mm/percpu: remove unused PERCPU_DYNAMIC_EARLY_SLOTS")

Thanks,
Dennis

> > Acked-by: Dennis Zhou <dennis@kernel.org>
> > 
> > Thanks,
> > Dennis
> > 
> >> 
> >> > 
> >> > If not `BITS_PER_LONG >32`, we could do `PAGE_SHIFT > 12`.
> >> > 
> >> > Thanks,
> >> > Dennis
> >> > 
> >> > > > 
> >> > > > ---
> >> > > > diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> >> > > > index f1ec5ad1351c..22ce3271eed2 100644
> >> > > > --- a/include/linux/percpu.h
> >> > > > +++ b/include/linux/percpu.h
> >> > > > @@ -42,7 +42,11 @@
> >> > > >   * larger than PERCPU_DYNAMIC_EARLY_SIZE.
> >> > > >   */
> >> > > >  #define PERCPU_DYNAMIC_EARLY_SLOTS	128
> >> > > > +#if BITS_PER_LONG > 32
> >> > > > +#define PERCPU_DYNAMIC_EARLY_SIZE	(20 << 10)
> >> > > > +#else
> >> > > >  #define PERCPU_DYNAMIC_EARLY_SIZE	(12 << 10)
> >> > > > +#endif
> >> > > >  
> >> > > >  /*
> >> > > >   * PERCPU_DYNAMIC_RESERVE indicates the amount of free area to piggy
> >> > > > 
> >> > > 
> >> > > 
> >> > 
> >> 
> >> 
> 
> 
