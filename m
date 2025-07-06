Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3DA1AAA1C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751787204; cv=none; b=pU6z+sZmlRLzfvwwmbK4/lBbk0wxSFMrYImmp6I+QEnF6TlqT7kRi7TUpQzq3t/pAIfjQxdUWBtRKkdbF0HG6aIquffild7y+cg5YenIdqtowNXFO6NYodndF64RD5oNxzzyt6BLsLPcV61YtRltTyQft4ugu7gt/IOyWYe59rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751787204; c=relaxed/simple;
	bh=buNIGFf1lCBRvWJHK8Ks2oaVbbxjToutmKFJesXy8Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iNqWr/9HT9r9h0D4k0i01f+tfYE4wRhVrGO1RIkySKnkzZNYLEjo/2hEHEsfCgcEv8wd4TIzGLVEl81M+OJwSostpMEh6zuwFdEp2bYXNJIwfwwPwCaYab3VDcD8ecb9nY5x0wJWIYjlloD34e8YgjF5w/VKJyFro50wRRzUR0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K3JWObOH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K3JWObOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751787200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8nB4u3VvYj2b+Y+Hwszg9Nkd9mXoAr8FE8T9wmkbC1U=;
	b=K3JWObOHaxPJrh00RaFFPvSUSdUHp4hrN6Y4zYIfyC6S2t1v7BJ+PRKjF587paLM+09+6x
	RUMda6iER2Ne/M3OmP1e3EUXnmRoIsB4VbafPVs4CcWEpZO8HcmQ+bDTwoMFT+Iq8aiD4l
	HUt/clNvIgCKHg7UJVf+wep6XL+dE1M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-PKBHgcB-PUyJAqbx94zSjw-1; Sun, 06 Jul 2025 03:33:18 -0400
X-MC-Unique: PKBHgcB-PUyJAqbx94zSjw-1
X-Mimecast-MFC-AGG-ID: PKBHgcB-PUyJAqbx94zSjw_1751787197
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae0a3511145so136127366b.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 06 Jul 2025 00:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751787197; x=1752391997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nB4u3VvYj2b+Y+Hwszg9Nkd9mXoAr8FE8T9wmkbC1U=;
        b=Nn7O3/AxPXt6UJxzPOp2k4viYmH9LJfn9NQt2qfVo5grsicN1nGNEqcQnXQx8/dAbK
         WHRR7KShR1oxgGym82Sa8Z08EgBoQ8Y+Dzqt3XqWCyeUn7NkEWYJMwL7FdI92XHt7f+J
         8PcKpVDji1OmkYVthI1Cby4fxCy/q/deF92cfE6HcAwa+atepTCJ7kWr2XhIw4FVYIcY
         FavaQSoNIQlAEOi9mELGp9kkWHotYrmGMxMNMbBlLaRvLODd6+WiIlOJh8ADf3gQfZft
         jhGXz/Hd5wC88WkNOXj3S4qHGctvSOL8KMwQ0h+PUrmdRrJZhKTOF7FnLTTjG6uF2mkU
         s69w==
X-Forwarded-Encrypted: i=1; AJvYcCU2g9o5EiIyifsJ0LDy0RGww+apxNtOclKIjCA0aiiVLOREbhj5rK+SN2neB2Z/lqcVY//VPCzq/Lrs+rb4@lists.linux.dev
X-Gm-Message-State: AOJu0YzF+QFnqBf5S7VS5SsAaoYo8bfL5Jn1dMYIU5K820fyqsAdQpgv
	noJ3rC5zNGJNUz3AneoCuGd8eFAyGMv3pXex3vatI4bvxc/gAAG7wn4ImCqn9afjZ+0T7CV5W2+
	ZwtKm2H3MKG1Nl3XVoykWDAwiL8bqrkf4eD5KaPaBh79zq2WlJGNcyWxL51HEbMAaevU=
X-Gm-Gg: ASbGncsuEfSrN7TeR4drVS8hlUyfpBhHTIxmXYaKiwwJTCRwf8Qgf6v/GAbWmahG768
	DzLwJC8pjGtPxoiJpwly0mVLAR17hwkMduTIa8Aso5qD+9y3OxSS/BBuP2AEHq4lsgU1ay9sBAO
	8atRtyjuWyKsoh/q7kvPYpX/Ql5p5UjQXHy6vamx4bGCHRRmklY9kXXOOUXllldNophunLbqa2q
	FF/v4+DOdxMtYdz+Vr3O4DGBdyNym/ymoeiDvrKWf6wAXdW2L3VK3Xq5JbLCpenQjfdjKbYX3qi
	B05WsjUU+iY=
X-Received: by 2002:a17:907:7b89:b0:ae3:6bd5:ebe7 with SMTP id a640c23a62f3a-ae4108e67e2mr471999666b.54.1751787197014;
        Sun, 06 Jul 2025 00:33:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdZ/RWKxvyH+k3bokX/8Ejj0weppgHWahqBm0Uq3RrWgxm0cO5cbf+Z5pa5I7Iul+H4ix2hw==
X-Received: by 2002:a17:907:7b89:b0:ae3:6bd5:ebe7 with SMTP id a640c23a62f3a-ae4108e67e2mr471995966b.54.1751787196403;
        Sun, 06 Jul 2025 00:33:16 -0700 (PDT)
Received: from redhat.com ([31.187.78.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e839sm470754566b.157.2025.07.06.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 00:33:15 -0700 (PDT)
Date: Sun, 6 Jul 2025 03:33:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 net-next 4/9] vhost-net: allow configuring extended
 features
Message-ID: <20250706032944-mutt-send-email-mst@kernel.org>
References: <23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni@redhat.com>
 <202506271443.G9cAx8PS-lkp@intel.com>
 <eca0952c-d96c-4d80-8f07-86c8d4caae0b@redhat.com>
 <27f1275a-aaff-4cc2-896c-b2c34f08ab73@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <27f1275a-aaff-4cc2-896c-b2c34f08ab73@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X-o08yg1LUFPkbA7t0ey998_OqV5AC0LJeoFQfdIvj4_1751787197
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 04:36:14PM +0200, Paolo Abeni wrote:
> On 6/27/25 3:11 PM, Paolo Abeni wrote:
> > +csky maintainer
> > On 6/27/25 8:41 AM, kernel test robot wrote:
> >> Hi Paolo,
> >>
> >> kernel test robot noticed the following build warnings:
> >>
> >> [auto build test WARNING on net-next/main]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/scripts-kernel_doc-py-properly-handle-VIRTIO_DECLARE_FEATURES/20250624-221751
> >> base:   net-next/main
> >> patch link:    https://lore.kernel.org/r/23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni%40redhat.com
> >> patch subject: [PATCH v6 net-next 4/9] vhost-net: allow configuring extended features
> >> config: csky-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/config)
> >> compiler: csky-linux-gcc (GCC) 15.1.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202506271443.G9cAx8PS-lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>    In file included from include/linux/uaccess.h:12,
> >>                     from include/linux/sched/task.h:13,
> >>                     from include/linux/sched/signal.h:9,
> >>                     from include/linux/rcuwait.h:6,
> >>                     from include/linux/percpu-rwsem.h:7,
> >>                     from include/linux/fs.h:34,
> >>                     from include/linux/compat.h:17,
> >>                     from drivers/vhost/net.c:8:
> >>    arch/csky/include/asm/uaccess.h: In function '__get_user_fn.constprop':
> >>>> arch/csky/include/asm/uaccess.h:147:9: warning: 'retval' is used uninitialized [-Wuninitialized]
> >>      147 |         __asm__ __volatile__(                           \
> >>          |         ^~~~~~~
> >>    arch/csky/include/asm/uaccess.h:187:17: note: in expansion of macro '__get_user_asm_64'
> >>      187 |                 __get_user_asm_64(x, ptr, retval);
> >>          |                 ^~~~~~~~~~~~~~~~~
> >>    arch/csky/include/asm/uaccess.h:170:13: note: 'retval' was declared here
> >>      170 |         int retval;
> >>          |             ^~~~~~
> >>
> >>
> >> vim +/retval +147 arch/csky/include/asm/uaccess.h
> >>
> >> da551281947cb2c Guo Ren 2018-09-05  141  
> >> e58a41c2226847f Guo Ren 2021-04-21  142  #define __get_user_asm_64(x, ptr, err)			\
> >> da551281947cb2c Guo Ren 2018-09-05  143  do {							\
> >> da551281947cb2c Guo Ren 2018-09-05  144  	int tmp;					\
> >> e58a41c2226847f Guo Ren 2021-04-21  145  	int errcode;					\
> >> e58a41c2226847f Guo Ren 2021-04-21  146  							\
> >> e58a41c2226847f Guo Ren 2021-04-21 @147  	__asm__ __volatile__(				\
> >> e58a41c2226847f Guo Ren 2021-04-21  148  	"1:   ldw     %3, (%2, 0)     \n"		\
> >> da551281947cb2c Guo Ren 2018-09-05  149  	"     stw     %3, (%1, 0)     \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  150  	"2:   ldw     %3, (%2, 4)     \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  151  	"     stw     %3, (%1, 4)     \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  152  	"     br      4f              \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  153  	"3:   mov     %0, %4          \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  154  	"     br      4f              \n"		\
> >> da551281947cb2c Guo Ren 2018-09-05  155  	".section __ex_table, \"a\"   \n"		\
> >> da551281947cb2c Guo Ren 2018-09-05  156  	".align   2                   \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  157  	".long    1b, 3b              \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  158  	".long    2b, 3b              \n"		\
> >> da551281947cb2c Guo Ren 2018-09-05  159  	".previous                    \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  160  	"4:                           \n"		\
> >> e58a41c2226847f Guo Ren 2021-04-21  161  	: "=r"(err), "=r"(x), "=r"(ptr),		\
> >> e58a41c2226847f Guo Ren 2021-04-21  162  	  "=r"(tmp), "=r"(errcode)			\
> >> e58a41c2226847f Guo Ren 2021-04-21  163  	: "0"(err), "1"(x), "2"(ptr), "3"(0),		\
> >> e58a41c2226847f Guo Ren 2021-04-21  164  	  "4"(-EFAULT)					\
> >> da551281947cb2c Guo Ren 2018-09-05  165  	: "memory");					\
> >> da551281947cb2c Guo Ren 2018-09-05  166  } while (0)
> >> da551281947cb2c Guo Ren 2018-09-05  167  
> > 
> > The intel test report reported the above compile warning on this series:
> > 
> > https://lore.kernel.org/netdev/20250627084609-mutt-send-email-mst@kernel.org/T/#md788de2b3a4e9da23ac93b5f1c773a6070b5b4fb
> > 
> > specifically, in patch 4:
> > 
> > +                       if (get_user(features, featurep + 1 + i))
> > +                               return -EFAULT;
> > 
> > AFAICS such statement is legit, and the bot points to some problem in
> > the arch specific get_user() implementation. Could you please have a look?
> 
> Out of sheer ignorance on my side, I fail to see how the csky get_user()
> could work correctly without something alike the following (which indeed
> fixes the issue here).
> 
> /P
> ---
> diff --git a/arch/csky/include/asm/uaccess.h
> b/arch/csky/include/asm/uaccess.h
> index 2e927c21d8a1..ae0864ad59a3 100644
> --- a/arch/csky/include/asm/uaccess.h
> +++ b/arch/csky/include/asm/uaccess.h
> @@ -167,7 +167,7 @@ do {							\
> 
>  static inline int __get_user_fn(size_t size, const void __user *ptr,
> void *x)
>  {
> -	int retval;
> +	int retval = 0;
>  	u32 tmp;
> 
>  	switch (size) {

Given there's no reaction from the arch maintainers,
I see two options:

- go back to copy_from_user - nothing wrong with it, and the code
in question is off data path.

- go ahead and include this patch in the series, even though
  I'm just as unsure it's right as you are.


Up to you really, but I think it's one of the two.



-- 
MST

