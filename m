Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92972D9783
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028460; cv=none; b=b48IoLzrFQkXvYD+Zw1v5aaKyTyekJggIeJdyPT3sRy0mYp1N6C3QAlHGB9oju7P7ze7F9Y/e/hP52gefj76yNgFtujgWL7tVa+lHFK7KyCSOEIdn/yr+s9T+jJ8WOxsRBmHhYWbWiudzAe4bCnq7DmrzH6ikXzXisgWeG0rQtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028460; c=relaxed/simple;
	bh=YzO9lzcMZx5ZVzHXbC/1bcWurfwyo0tGtzxv3bUSrgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GiAImBn6tS/JiCt8D1ku7r1mc37DqLHjvEM1epWSiZhSiF2znnn/JCSp7YzV9Nr/goTeJIQpUx5UszA3bK99DJE4icRdQBbiTpkPrcd3VAZg1fD3iMrU6t4hyqUm6zaXhsdwxw1kb5PXU2ucVx+LpEUsBBAO/NEeQJj/2id/lF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bl5CI+0z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bl5CI+0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751028456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/eYTTJEaJLfHv1U3pikBNK+wlV0fs5+s9yGDmraYV8=;
	b=bl5CI+0zitzrwxS+nsCv+00bAao5D+epJl4/y867RNZ6CPv+PckJ2fgj8nh3Nqg1SMDYJb
	uFXXV/s66NppmP43kcO23wamvCILPfhJXXvlLCWCvFaT1HNRDICgJTT7R87fz/sXVgXyQ0
	sc7BYylL2SqEjW6Pbi3E03u6vLfEMHE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-sVjjrEMvPlWe5KoSsb4xrA-1; Fri, 27 Jun 2025 08:47:35 -0400
X-MC-Unique: sVjjrEMvPlWe5KoSsb4xrA-1
X-Mimecast-MFC-AGG-ID: sVjjrEMvPlWe5KoSsb4xrA_1751028454
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d22so13526705e9.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 05:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028454; x=1751633254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/eYTTJEaJLfHv1U3pikBNK+wlV0fs5+s9yGDmraYV8=;
        b=E1IRrE62TwMotfgOkSugOYxWvRV5MWfHVBWGZGPlzwtE2cn1o6G1EkIP9Kftk97dwQ
         Cd1iKVeqX34zpC42uGpgwvttG4wq9cL3tK1JWmGfJNYNsI+4bUxUWKvvDELQaHxo72Ra
         qtoAbW3vSctSHP+Ts+ndIM46VV3jr6Jdr3VAlxgIpO+kiFBGkz+mcWlJf7vzjUE0Dqee
         LoU3pXDnKOKfmKLFqGidtFOnHyA+glKMcDlShshwjtVxgHipPFjqJ6N4qCtc6usvGPvh
         VTw0mXP+hR9xdN9PVRv/pjjdEhO7+kmz5i78H3uvjjpVc3W3vnUKSX9N50zRMcMIyh9Y
         Gsnw==
X-Forwarded-Encrypted: i=1; AJvYcCUPCYQrjlHbVi5T2zo6rsiqZYDDJ5TlKUh/5PN1j9nL6IF9TOpUe1WsL74WHSQnMw0EPh8eUPvnbJ7q0q9o@lists.linux.dev
X-Gm-Message-State: AOJu0Yzocv9RjE4fJujV2waY2AgyDbF03PwxDriGTb7vIFNB/HqmZZXC
	/NHQSTPclemwtiHNzs1mhk/OY1LLJoSPsbfeWoOqyWRSXNsSjlNw9ffA1MIGa1VmvhBkHAY2u+6
	Ov6Zyqe2jAS0+QiocfmNSiLAlmmtrNhDyOKRpiRES0Fl+PWS8GY+h/YRmFGTheDGwpfI=
X-Gm-Gg: ASbGnctjcerFoQfuyFDBxCBrL9WI4/w+tYWG3ukAMDkB6hLpAO1X0WEhr413RDPdjSM
	nhUuj73my8jxANtVetKJXWrX6w8Xyw39X4Rn4NQ9lcpv4z7tgbZ6wHYtKHo8g33P41qaL+RVGh3
	5yR3QtZFYAeUr7XZN5juOXftJQ2rBZtPvAsuc9Oce4/UrpjWO9g5JCV38o1VVbG1TAM76ja9zg7
	hpNMy+0c4yDs7kh7b7+PAd9H3reDCTJ7PGaItcehsoHhZyLcpgsfdkwuoqy0qkESZE4LBxUE6DS
	hAZTOWeyzOVJFT1d
X-Received: by 2002:a05:600c:4fc5:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-4538f88349amr25368025e9.32.1751028454111;
        Fri, 27 Jun 2025 05:47:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqBBo/ETPyAG0ubYyPc657XTXAWXf6jKMcCZuPs4wtr31/0bf0CIVT2TF4HlpwgXaPbmbLGQ==
X-Received: by 2002:a05:600c:4fc5:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-4538f88349amr25367625e9.32.1751028453566;
        Fri, 27 Jun 2025 05:47:33 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm79981635e9.5.2025.06.27.05.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:47:33 -0700 (PDT)
Date: Fri, 27 Jun 2025 08:47:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
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
Message-ID: <20250627084609-mutt-send-email-mst@kernel.org>
References: <23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni@redhat.com>
 <202506271443.G9cAx8PS-lkp@intel.com>
 <d172caa9-6d31-45a3-929c-d3927ba6702e@redhat.com>
 <20250627075441-mutt-send-email-mst@kernel.org>
 <9a940f1d-da2e-4400-909b-36c5d72c950a@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9a940f1d-da2e-4400-909b-36c5d72c950a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sG1ka2JJNRrcXCKrqWNmFBFIF-9aYxBX4TBD-WXceHE_1751028454
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 02:44:42PM +0200, Paolo Abeni wrote:
> On 6/27/25 2:18 PM, Michael S. Tsirkin wrote:
> > On Fri, Jun 27, 2025 at 12:28:00PM +0200, Paolo Abeni wrote:
> >> On 6/27/25 8:41 AM, kernel test robot wrote:
> >>> kernel test robot noticed the following build warnings:
> >>>
> >>> [auto build test WARNING on net-next/main]
> >>>
> >>> url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/scripts-kernel_doc-py-properly-handle-VIRTIO_DECLARE_FEATURES/20250624-221751
> >>> base:   net-next/main
> >>> patch link:    https://lore.kernel.org/r/23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni%40redhat.com
> >>> patch subject: [PATCH v6 net-next 4/9] vhost-net: allow configuring extended features
> >>> config: csky-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/config)
> >>> compiler: csky-linux-gcc (GCC) 15.1.0
> >>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202506271443.G9cAx8PS-lkp@intel.com/
> >>>
> >>> All warnings (new ones prefixed by >>):
> >>>
> >>>    In file included from include/linux/uaccess.h:12,
> >>>                     from include/linux/sched/task.h:13,
> >>>                     from include/linux/sched/signal.h:9,
> >>>                     from include/linux/rcuwait.h:6,
> >>>                     from include/linux/percpu-rwsem.h:7,
> >>>                     from include/linux/fs.h:34,
> >>>                     from include/linux/compat.h:17,
> >>>                     from drivers/vhost/net.c:8:
> >>>    arch/csky/include/asm/uaccess.h: In function '__get_user_fn.constprop':
> >>>>> arch/csky/include/asm/uaccess.h:147:9: warning: 'retval' is used uninitialized [-Wuninitialized]
> >>>      147 |         __asm__ __volatile__(                           \
> >>>          |         ^~~~~~~
> >>>    arch/csky/include/asm/uaccess.h:187:17: note: in expansion of macro '__get_user_asm_64'
> >>>      187 |                 __get_user_asm_64(x, ptr, retval);
> >>>          |                 ^~~~~~~~~~~~~~~~~
> >>>    arch/csky/include/asm/uaccess.h:170:13: note: 'retval' was declared here
> >>>      170 |         int retval;
> >>>          |             ^~~~~~
> >>>
> >>>
> >>> vim +/retval +147 arch/csky/include/asm/uaccess.h
> >>>
> >>> da551281947cb2c Guo Ren 2018-09-05  141  
> >>> e58a41c2226847f Guo Ren 2021-04-21  142  #define __get_user_asm_64(x, ptr, err)			\
> >>> da551281947cb2c Guo Ren 2018-09-05  143  do {							\
> >>> da551281947cb2c Guo Ren 2018-09-05  144  	int tmp;					\
> >>> e58a41c2226847f Guo Ren 2021-04-21  145  	int errcode;					\
> >>> e58a41c2226847f Guo Ren 2021-04-21  146  							\
> >>> e58a41c2226847f Guo Ren 2021-04-21 @147  	__asm__ __volatile__(				\
> >>> e58a41c2226847f Guo Ren 2021-04-21  148  	"1:   ldw     %3, (%2, 0)     \n"		\
> >>> da551281947cb2c Guo Ren 2018-09-05  149  	"     stw     %3, (%1, 0)     \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  150  	"2:   ldw     %3, (%2, 4)     \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  151  	"     stw     %3, (%1, 4)     \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  152  	"     br      4f              \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  153  	"3:   mov     %0, %4          \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  154  	"     br      4f              \n"		\
> >>> da551281947cb2c Guo Ren 2018-09-05  155  	".section __ex_table, \"a\"   \n"		\
> >>> da551281947cb2c Guo Ren 2018-09-05  156  	".align   2                   \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  157  	".long    1b, 3b              \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  158  	".long    2b, 3b              \n"		\
> >>> da551281947cb2c Guo Ren 2018-09-05  159  	".previous                    \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  160  	"4:                           \n"		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  161  	: "=r"(err), "=r"(x), "=r"(ptr),		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  162  	  "=r"(tmp), "=r"(errcode)			\
> >>> e58a41c2226847f Guo Ren 2021-04-21  163  	: "0"(err), "1"(x), "2"(ptr), "3"(0),		\
> >>> e58a41c2226847f Guo Ren 2021-04-21  164  	  "4"(-EFAULT)					\
> >>> da551281947cb2c Guo Ren 2018-09-05  165  	: "memory");					\
> >>> da551281947cb2c Guo Ren 2018-09-05  166  } while (0)
> >>> da551281947cb2c Guo Ren 2018-09-05  167  
> >>
> >> AFAICS the issue reported here is in the arch-specific uaccess helpers
> >> and not related to this series.
> >>
> >> /P
> > 
> > I think it's due to code like this in your patch:
> > 
> > +                       if (get_user(features, featurep + 1 + i))
> > +                               return -EFAULT;
> > 
> > the specific arch might have a bug that this is unconvering,
> > or a limitation, I can't say.
> > 
> > Seems worth fixing, though.
> > 
> > Poke the mainatiners?
> 
> FTR, I tried the boot reproducer locally, and does not trigger here.
> 
> The above statement is AFAICS legit, and the issue, if any, is present
> into such arch. I would not say this patch is 'uncovering' anything, as
> the relevant pattern is very common.
> 
> Possibly the test robot added support for csky only recently?
> 
> I will ping the arch maintainers, but I suggest/argue not blocking this
> series for this thing.
> 
> Thanks,
> 
> Paolo

OK.
Still sick sadly, so I took  more time off through end of month.  If
this can wait with thorough review until then, maybe the arch
maintainers will respond.

-- 
MST

