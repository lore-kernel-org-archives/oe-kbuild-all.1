Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746B8AAD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 20:00:20 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id b21so14125095plc.9
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 12:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUPcxz67kkweeebuGKEe2rhTN/W7CPDaGvYR4N7R0oY=;
        b=cIRNTi3hG8XicPbAfq2nwB9lxlT0Pu2RaViQWdr6qYG/D9WQrt7JeXvXz74Ff6aKM8
         t8cBS1aXk684f7jbpe5mG3iXBA1eubms7dA9S78DabAWGyTO5eGIIXO0dhQ04fPjSPbE
         tLJj1dY9ntHehwAi7FBsQ3g/lHcw0YLxsx2DDIrFFMoY/GYGtuDJ3dB4GBtd9KzpNiFo
         2+9s0vgxyQ9E6zB6JxGkEKCQS332eP2Lnk7ZA9GOy0fDiGS0v48E6gYl9riQSZjt24TP
         TSn03aKP88JUQm+PMCeNrUKT2s/okvyxRP4IEIDV66EjbDZj97+1W5SM/0d9n1iJtSYC
         JcYw==
X-Gm-Message-State: ANoB5pk+WNyKd087PoFLOYHY/EZaMU78K/o+NOZtf/y/KD6BPDGSafem
	VZiCRuHqOLDeTzRLyWz8ybo=
X-Google-Smtp-Source: AA0mqf6N8HbUSNV7IZxv0BLjsgEfM7drTGH32McnaDWbZ5cwVzuNAc5c2lnKP9QEdR2Xlz9PSZPhzA==
X-Received: by 2002:a17:902:76c7:b0:185:46a5:1c73 with SMTP id j7-20020a17090276c700b0018546a51c73mr5545488plt.157.1668542420034;
        Tue, 15 Nov 2022 12:00:20 -0800 (PST)
Received: from fedora ([2607:f598:b99a:be1:dfa7:eed0:45ca:de3c])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902ce0d00b0017f5ad327casm10269287plg.103.2022.11.15.12.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:00:19 -0800 (PST)
Date: Tue, 15 Nov 2022 12:00:16 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	42.hyeyoo@gmail.com
Subject: Re: [linux-next:master 5002/7443]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_474' declared with attribute error: BUILD_BUG_ON
 failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
Message-ID: <Y3Pv0LwOhBdcnxfX@fedora>
References: <202211120436.HzD1i2yQ-lkp@intel.com>
 <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
 <dda9e5fc-258b-bf67-c90a-f7fb23ab68e3@suse.cz>
 <Y3MR5ZA6DClG/2rC@fedora>
 <Y3NXJF+hzp/s5FU4@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3NXJF+hzp/s5FU4@MiWiFi-R3L-srv>

On Tue, Nov 15, 2022 at 05:08:52PM +0800, Baoquan He wrote:
> Hi Dennis,
> 
> On 11/14/22 at 08:13pm, Dennis Zhou wrote:
> > Hi Vlastimil & Baoquan,
> > 
> > On Mon, Nov 14, 2022 at 06:58:13PM +0100, Vlastimil Babka wrote:
> > > On 11/14/22 08:44, Baoquan He wrote:
> > > > Hi,
> > > > 
> > > > I reproduced the build failure according to lkp report and made a patch
> > > > as below to fix it.
> > > > 
> > > > From dae7dd9705015ce36db757e88c78802584f949b1 Mon Sep 17 00:00:00 2001
> > > > From: Baoquan He <bhe@redhat.com>
> > > > Date: Sun, 13 Nov 2022 18:08:27 +0800
> > > > Subject: [PATCH] percpu: adjust the value of PERCPU_DYNAMIC_EARLY_SIZE
> > > > Content-type: text/plain
> > > > 
> > > > LKP reported a build failure as below on the patch "mm/slub, percpu:
> > > > correct the calculation of early percpu allocation size"
> > > 
> > > Since I have that patch in slab.git exposed to -next, should I take this fix
> > > too, to make things simpler? Dennis?
> > > 
> > 
> > I don't have any problems with you running a fix, but I'm not quite sure
> > this is the right fix. Though this might cause a trivial merge conflict
> > with: d667c94962c1 ("mm/percpu: remove unused PERCPU_DYNAMIC_EARLY_SLOTS")
> > in my percpu#for-6.2 branch.
> > 
> > If I'm understanding this correctly, slub requires additional percpu
> > memory due to the use of 64k pages. By increasing
> > PERCPU_DYNAMIC_EARLY_SIZE, we solve the problem for 64k page users, but
> > require a few unnecessary pages that can bloat the size of subsequent
> > percpu chunks. Though, I'm not sure if that's an issue today for
> > embedded devices.
> 
> Thanks for looking into this.
> 
> I guess you are talking about PERCPU_DYNAMIC_EARLY_SIZE will impact the
> first dynamic chunk size of page first chunk, because the embed first
> chunk will take PERCPU_DYNAMIC_RESERVE. And the impact is done in below
> max() invacation.
> 
> static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
>                                 size_t reserved_size, size_t dyn_size,
>                                 size_t atom_size,
>                                 pcpu_fc_cpu_distance_fn_t cpu_distance_fn)
> {
> 	......
>         /* calculate size_sum and ensure dyn_size is enough for early alloc */
>         size_sum = PFN_ALIGN(static_size + reserved_size +
>                             max_t(size_t, dyn_size, PERCPU_DYNAMIC_EARLY_SIZE));
> 	......
> }
> 
> > 
> > I think adding parity to PERCPU_DYNAMIC_EARLY_SIZE with
> > PERCPU_DYNAMIC_RESERVE is defined by BITS_PER_LONG is a safer option
> > here. A small TODO item would be to make PERCPU_DYNAMIC_RESERVE be a +
> > value instead of a max() with PERCPU_DYNAMIC_EARLY_SIZE.
> 
> Hmm, the below change may not take power arch into account. Please
> check arch/powerpc/include/asm/page.h, seems the 32bit ppc could have
> 256K pages too. Adding PERCPU_DYNAMIC_EARLY_SIZE to 20K may cost extra
> memory during boot. But th left space of 1st dynamic chunk will join
> the later percpu dynamic allocation, it's not wasted, right?
> 
> Not sure if I got your point.
> 
> 

Ah, I'm not familiar with all the PAGE_SIZE and word length
combinations.

The first chunk is smaller in the embedded case with the assumption that
static percpu variables are highly accessed along with the limited
initial allocations.  While adding an additional 8KB is not the biggest
deal to the first chunk, this can cause the unit_size for subsequent
chunks to be larger. For example, x86 unit size jumps in powers of 2 due
to alignment and packing against an allocation size of 2MB. So if we're
at say 60KB for the first chunk, subsequent chunks could be 64KB. But
adding 8KB, we'd go from 60KB -> 68KB and a chunk size of 64KB -> 128KB.

If not `BITS_PER_LONG >32`, we could do `PAGE_SHIFT > 12`.

Thanks,
Dennis

> > 
> > ---
> > diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> > index f1ec5ad1351c..22ce3271eed2 100644
> > --- a/include/linux/percpu.h
> > +++ b/include/linux/percpu.h
> > @@ -42,7 +42,11 @@
> >   * larger than PERCPU_DYNAMIC_EARLY_SIZE.
> >   */
> >  #define PERCPU_DYNAMIC_EARLY_SLOTS	128
> > +#if BITS_PER_LONG > 32
> > +#define PERCPU_DYNAMIC_EARLY_SIZE	(20 << 10)
> > +#else
> >  #define PERCPU_DYNAMIC_EARLY_SIZE	(12 << 10)
> > +#endif
> >  
> >  /*
> >   * PERCPU_DYNAMIC_RESERVE indicates the amount of free area to piggy
> > 
> 
> 
