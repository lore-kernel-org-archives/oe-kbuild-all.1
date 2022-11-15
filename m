Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53732592
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668503340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojBLffwKMQ5rVID4Z1iY/wBuYEnsh9V8e1sz6MJA2HA=;
	b=I0kp9VjzRIzSNoiIOTWydm68a0aXGnAZoIkWC1ZoswnDjqLxf7QmiKPyhDWOepBqM34st7
	xegy5tniAHswYtSZ9fy6jk+kLWIZo3aTW2pKUcEvOcHM2N1pv1XZDCaVjxZ9Cf3T6nbjw6
	B3I6q57bg6VwpLjHoFc+Kqv4SbfD97M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-zouKz6OTOROOLLkY-7wFUg-1; Tue, 15 Nov 2022 04:08:57 -0500
X-MC-Unique: zouKz6OTOROOLLkY-7wFUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF73B1C09C84;
	Tue, 15 Nov 2022 09:08:56 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 137332024CC0;
	Tue, 15 Nov 2022 09:08:55 +0000 (UTC)
Date: Tue, 15 Nov 2022 17:08:52 +0800
From: Baoquan He <bhe@redhat.com>
To: Dennis Zhou <dennis@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	42.hyeyoo@gmail.com
Subject: Re: [linux-next:master 5002/7443]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_474' declared with attribute error: BUILD_BUG_ON
 failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
Message-ID: <Y3NXJF+hzp/s5FU4@MiWiFi-R3L-srv>
References: <202211120436.HzD1i2yQ-lkp@intel.com>
 <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
 <dda9e5fc-258b-bf67-c90a-f7fb23ab68e3@suse.cz>
 <Y3MR5ZA6DClG/2rC@fedora>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y3MR5ZA6DClG/2rC@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dennis,

On 11/14/22 at 08:13pm, Dennis Zhou wrote:
> Hi Vlastimil & Baoquan,
> 
> On Mon, Nov 14, 2022 at 06:58:13PM +0100, Vlastimil Babka wrote:
> > On 11/14/22 08:44, Baoquan He wrote:
> > > Hi,
> > > 
> > > I reproduced the build failure according to lkp report and made a patch
> > > as below to fix it.
> > > 
> > > From dae7dd9705015ce36db757e88c78802584f949b1 Mon Sep 17 00:00:00 2001
> > > From: Baoquan He <bhe@redhat.com>
> > > Date: Sun, 13 Nov 2022 18:08:27 +0800
> > > Subject: [PATCH] percpu: adjust the value of PERCPU_DYNAMIC_EARLY_SIZE
> > > Content-type: text/plain
> > > 
> > > LKP reported a build failure as below on the patch "mm/slub, percpu:
> > > correct the calculation of early percpu allocation size"
> > 
> > Since I have that patch in slab.git exposed to -next, should I take this fix
> > too, to make things simpler? Dennis?
> > 
> 
> I don't have any problems with you running a fix, but I'm not quite sure
> this is the right fix. Though this might cause a trivial merge conflict
> with: d667c94962c1 ("mm/percpu: remove unused PERCPU_DYNAMIC_EARLY_SLOTS")
> in my percpu#for-6.2 branch.
> 
> If I'm understanding this correctly, slub requires additional percpu
> memory due to the use of 64k pages. By increasing
> PERCPU_DYNAMIC_EARLY_SIZE, we solve the problem for 64k page users, but
> require a few unnecessary pages that can bloat the size of subsequent
> percpu chunks. Though, I'm not sure if that's an issue today for
> embedded devices.

Thanks for looking into this.

I guess you are talking about PERCPU_DYNAMIC_EARLY_SIZE will impact the
first dynamic chunk size of page first chunk, because the embed first
chunk will take PERCPU_DYNAMIC_RESERVE. And the impact is done in below
max() invacation.

static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
                                size_t reserved_size, size_t dyn_size,
                                size_t atom_size,
                                pcpu_fc_cpu_distance_fn_t cpu_distance_fn)
{
	......
        /* calculate size_sum and ensure dyn_size is enough for early alloc */
        size_sum = PFN_ALIGN(static_size + reserved_size +
                            max_t(size_t, dyn_size, PERCPU_DYNAMIC_EARLY_SIZE));
	......
}

> 
> I think adding parity to PERCPU_DYNAMIC_EARLY_SIZE with
> PERCPU_DYNAMIC_RESERVE is defined by BITS_PER_LONG is a safer option
> here. A small TODO item would be to make PERCPU_DYNAMIC_RESERVE be a +
> value instead of a max() with PERCPU_DYNAMIC_EARLY_SIZE.

Hmm, the below change may not take power arch into account. Please
check arch/powerpc/include/asm/page.h, seems the 32bit ppc could have
256K pages too. Adding PERCPU_DYNAMIC_EARLY_SIZE to 20K may cost extra
memory during boot. But th left space of 1st dynamic chunk will join
the later percpu dynamic allocation, it's not wasted, right?

Not sure if I got your point.


> 
> ---
> diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> index f1ec5ad1351c..22ce3271eed2 100644
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@ -42,7 +42,11 @@
>   * larger than PERCPU_DYNAMIC_EARLY_SIZE.
>   */
>  #define PERCPU_DYNAMIC_EARLY_SLOTS	128
> +#if BITS_PER_LONG > 32
> +#define PERCPU_DYNAMIC_EARLY_SIZE	(20 << 10)
> +#else
>  #define PERCPU_DYNAMIC_EARLY_SIZE	(12 << 10)
> +#endif
>  
>  /*
>   * PERCPU_DYNAMIC_RESERVE indicates the amount of free area to piggy
> 

