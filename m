Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1250D5CAD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 12:49:41 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id w3-20020a17090a460300b00218524e8877so2545349pjg.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 04:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iDgEMkQKaoP0nhYxIU0Ohu7ZkC7Py1Uf1KZ5o6BJIpE=;
        b=cSFNYKR4V0VfYoA8CgFHjvGHHYmkUa1gf2ZJHnciB89Sa8TItaXxWSUVX/AVZO68qM
         oWk7S9MK3rWvdhrf6TQcxCpYT4ZD4ROGOi7Ab1ZaH8RJhYKhBUS/u4KJ9oyNsJvlNOcW
         zGo3wP7Wto5CTAPNTCDchCjDaFFjEWkVqccV36B4jDVMoAWB9RsDTpwEe+9MERdstdHE
         v/+8evhd/FzM7JmBoW1QHDxKTfgV4Q4LeFonSTQSg5GK4yrDTYkkabLpzghfcXoOSe2V
         7zQQQUuHg8sg7kCPsSQPiitfvWgkuafdx7legzqPHNENa/SOWuuAAV+BA/3c2VVLyHwm
         FjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDgEMkQKaoP0nhYxIU0Ohu7ZkC7Py1Uf1KZ5o6BJIpE=;
        b=K2i3TeoTpVnEc8tsHPhUfcJyIfFnpqArIUt16SEs3BulSkiUB0svTH/zm3/d8ZVefc
         azlESHCnGSC9w/OnI5/+1JVAuy9cDqICXqOWke28hc3VHV9qqbXwxVbEc+tygnO3RRnt
         9Yy5G9znxwOMeazb32k11uTb2H5pV+PyNKX6a+bzyU5es382qcc7MLwX0iZhclFV2ucF
         2gCl9DFqm4Gpz26Wpc6ibRjiyNQh90z2iKKL/oh4ak1W4rx7WrDHU6InEyCeybA7T7Qo
         5CE/CoVvgkGhqY5u+ECRocSoxije+2mF/t9OPdxjt456sLoFepMG6i8qakl6q6yj5/JR
         aSmA==
X-Gm-Message-State: ANoB5plY19tbaeNEAfALzQ2rMh8j33qj9ba08uUDbyWtnRA1As3cy0zp
	IDF+eFfa5ZykSnlmspZH8lQ=
X-Google-Smtp-Source: AA0mqf4LlK5FsbuLksuV7PPLsN3QTZCjVycQLJFPpkJlNvfNGAyWVsHlNefE1gf3jYFNJ+V3vmzG+w==
X-Received: by 2002:a17:90a:718a:b0:205:a550:e529 with SMTP id i10-20020a17090a718a00b00205a550e529mr3663353pjk.25.1668602981324;
        Wed, 16 Nov 2022 04:49:41 -0800 (PST)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b00186881e1feasm12208114plh.112.2022.11.16.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:49:40 -0800 (PST)
Date: Wed, 16 Nov 2022 21:49:35 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Dennis Zhou <dennis@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5002/7443]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_474' declared with attribute error: BUILD_BUG_ON
 failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
Message-ID: <Y3TcX6+iORV3YwRT@hyeyoo>
References: <202211120436.HzD1i2yQ-lkp@intel.com>
 <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
 <dda9e5fc-258b-bf67-c90a-f7fb23ab68e3@suse.cz>
 <Y3MR5ZA6DClG/2rC@fedora>
 <Y3NXJF+hzp/s5FU4@MiWiFi-R3L-srv>
 <Y3Pv0LwOhBdcnxfX@fedora>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Pv0LwOhBdcnxfX@fedora>

On Tue, Nov 15, 2022 at 12:00:16PM -0800, Dennis Zhou wrote:
> On Tue, Nov 15, 2022 at 05:08:52PM +0800, Baoquan He wrote:
> > Hi Dennis,
> > 
> > On 11/14/22 at 08:13pm, Dennis Zhou wrote:
> > > Hi Vlastimil & Baoquan,
> > > 
> > > On Mon, Nov 14, 2022 at 06:58:13PM +0100, Vlastimil Babka wrote:
> > > > On 11/14/22 08:44, Baoquan He wrote:
> > > > > Hi,
> > > > > 
> > > > > I reproduced the build failure according to lkp report and made a patch
> > > > > as below to fix it.
> > > > > 
> > > > > From dae7dd9705015ce36db757e88c78802584f949b1 Mon Sep 17 00:00:00 2001
> > > > > From: Baoquan He <bhe@redhat.com>
> > > > > Date: Sun, 13 Nov 2022 18:08:27 +0800
> > > > > Subject: [PATCH] percpu: adjust the value of PERCPU_DYNAMIC_EARLY_SIZE
> > > > > Content-type: text/plain
> > > > > 
> > > > > LKP reported a build failure as below on the patch "mm/slub, percpu:
> > > > > correct the calculation of early percpu allocation size"
> > > > 
> > > > Since I have that patch in slab.git exposed to -next, should I take this fix
> > > > too, to make things simpler? Dennis?
> > > > 
> > > 
> > > I don't have any problems with you running a fix, but I'm not quite sure
> > > this is the right fix. Though this might cause a trivial merge conflict
> > > with: d667c94962c1 ("mm/percpu: remove unused PERCPU_DYNAMIC_EARLY_SLOTS")
> > > in my percpu#for-6.2 branch.
> > > 
> > > If I'm understanding this correctly, slub requires additional percpu
> > > memory due to the use of 64k pages. By increasing
> > > PERCPU_DYNAMIC_EARLY_SIZE, we solve the problem for 64k page users, but
> > > require a few unnecessary pages that can bloat the size of subsequent
> > > percpu chunks. Though, I'm not sure if that's an issue today for
> > > embedded devices.
> > 
> > Thanks for looking into this.
> > 
> > I guess you are talking about PERCPU_DYNAMIC_EARLY_SIZE will impact the
> > first dynamic chunk size of page first chunk, because the embed first
> > chunk will take PERCPU_DYNAMIC_RESERVE. And the impact is done in below
> > max() invacation.
> > 
> > static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
> >                                 size_t reserved_size, size_t dyn_size,
> >                                 size_t atom_size,
> >                                 pcpu_fc_cpu_distance_fn_t cpu_distance_fn)
> > {
> > 	......
> >         /* calculate size_sum and ensure dyn_size is enough for early alloc */
> >         size_sum = PFN_ALIGN(static_size + reserved_size +
> >                             max_t(size_t, dyn_size, PERCPU_DYNAMIC_EARLY_SIZE));
> > 	......
> > }
> > 
> > > 
> > > I think adding parity to PERCPU_DYNAMIC_EARLY_SIZE with
> > > PERCPU_DYNAMIC_RESERVE is defined by BITS_PER_LONG is a safer option
> > > here. A small TODO item would be to make PERCPU_DYNAMIC_RESERVE be a +
> > > value instead of a max() with PERCPU_DYNAMIC_EARLY_SIZE.
> > 
> > Hmm, the below change may not take power arch into account. Please
> > check arch/powerpc/include/asm/page.h, seems the 32bit ppc could have
> > 256K pages too. Adding PERCPU_DYNAMIC_EARLY_SIZE to 20K may cost extra
> > memory during boot. But th left space of 1st dynamic chunk will join
> > the later percpu dynamic allocation, it's not wasted, right?
> > 
> > Not sure if I got your point.
> > 
> > 
> 
> Ah, I'm not familiar with all the PAGE_SIZE and word length
> combinations.
> 
> The first chunk is smaller in the embedded case with the assumption that
> static percpu variables are highly accessed along with the limited
> initial allocations.  While adding an additional 8KB is not the biggest
> deal to the first chunk, this can cause the unit_size for subsequent
> chunks to be larger. For example, x86 unit size jumps in powers of 2 due
> to alignment and packing against an allocation size of 2MB. So if we're
> at say 60KB for the first chunk, subsequent chunks could be 64KB. But
> adding 8KB, we'd go from 60KB -> 68KB and a chunk size of 64KB -> 128KB.
> 
> If not `BITS_PER_LONG >32`, we could do `PAGE_SHIFT > 12`.

You may want to use #ifdef CONFIG_SLUB_STATS.
That's primary reason that makes SLUB require bigger early percpu memory
area.

> 
> Thanks,
> Dennis
> 
> > > 
> > > ---
> > > diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> > > index f1ec5ad1351c..22ce3271eed2 100644
> > > --- a/include/linux/percpu.h
> > > +++ b/include/linux/percpu.h
> > > @@ -42,7 +42,11 @@
> > >   * larger than PERCPU_DYNAMIC_EARLY_SIZE.
> > >   */
> > >  #define PERCPU_DYNAMIC_EARLY_SLOTS	128
> > > +#if BITS_PER_LONG > 32
> > > +#define PERCPU_DYNAMIC_EARLY_SIZE	(20 << 10)
> > > +#else
> > >  #define PERCPU_DYNAMIC_EARLY_SIZE	(12 << 10)
> > > +#endif
> > >  
> > >  /*
> > >   * PERCPU_DYNAMIC_RESERVE indicates the amount of free area to piggy
> > > 
> > 
> > 

-- 
Thanks,
Hyeonggon
