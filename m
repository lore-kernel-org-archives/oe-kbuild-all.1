Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0F2FAF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 00:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KLlqzg9G"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d84f18e908aso280362276.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 17:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1697760273; x=1698365073; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RZE3cc6e0ypcAqaFcINIc2gZj+EhE8lhjLqWQSkY/ho=;
        b=KLlqzg9G/wcXF+7yTDq0vfV+ZKTfs1VzBiUk2WEct43Db0nFHL9ACtmX1UnupWm1vR
         XGUUDhoLm4hLxY/SnPgE1PS11OycQQU3sEPKKvyTfatC7gRAImsDSmGhq45HNLY0wr2j
         4ZGJ+Cu1K0LkPpy5pE4aeUk2HH4HLzBK5lNdrDAaYw1JDnd9Z24eKSH5kqwRjLedO82t
         7pl0gGEWEgOnkaXMAifPNOb7BVQmKbvrSXMIx/FsvZ/OrE5R709QFe2ymRAYM2BxcFAN
         8oKOmI2UNw0YgDmWqpGLRk3w6Lmwxa1v7koo8SnYVvj0cqjsIvWedca4Dlwk/lhzqzO/
         cR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697760273; x=1698365073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZE3cc6e0ypcAqaFcINIc2gZj+EhE8lhjLqWQSkY/ho=;
        b=dXpN62X6RXmbL5kWvuYYPeFOmL4hL1kfYwGHyNdcwzOjT7TzZ8OdlHjzrKFM0FfUmY
         ZBEUaqJCZ4DLRJ9sVl9kwsVyHq2/FZnpT9P6UlDDH7DyY3UZ4Qr1cbwwwykq0xpFLMgR
         dNFYgNY/oMSn5o97sUgEV9O4KjX5zHzDoErf5ZLAnV8aS2j6Il8AlzpcqUDxXqZZDemq
         xFH3brXrm7aS5US6tpcTjTTO0WXgYoEft41Ip/VV1bPDjalD3t5F5uxcSMptIIRWFslW
         hEOHNyZ4n9ro156vhkSK4VYIiA97Wop5+o7MZYxGz1p5xvFmxYBIIt3dDFYL9+INGo8y
         lvWg==
X-Gm-Message-State: AOJu0YzuSwlNZ7TIxyLY7hMpTY6Yhhm/whH9uyBhgcMDVjqb5dIVpxPI
	0qmIU3zMj31q/LGqEisc7MZXSA==
X-Google-Smtp-Source: AGHT+IH+iL5kcJERANbI1DhlZ2XbKBVAv5uNec+m11U5QkIoDBYLOjxKEvLjBXzzp8CGx/TuA7DQig==
X-Received: by 2002:a25:d650:0:b0:d9b:e407:663f with SMTP id n77-20020a25d650000000b00d9be407663fmr366426ybg.15.1697760273484;
        Thu, 19 Oct 2023 17:04:33 -0700 (PDT)
Received: from ziepe.ca ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id p85-20020a254258000000b00d7e339ada01sm173990yba.20.2023.10.19.17.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 17:04:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qtd0A-003Fme-A9;
	Thu, 19 Oct 2023 21:04:30 -0300
Date: Thu, 19 Oct 2023 21:04:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bob Pearson <rpearsonhpe@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array
 subscript 0 is outside array bounds of 'struct sg_table[0]'
Message-ID: <20231020000430.GE691768@ziepe.ca>
References: <202310192300.lurP44yG-lkp@intel.com>
 <57edd968-91d7-41f9-8a29-e86d8f583efa@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57edd968-91d7-41f9-8a29-e86d8f583efa@gmail.com>

On Thu, Oct 19, 2023 at 11:22:00AM -0500, Bob Pearson wrote:
> On 10/19/23 10:33, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   dd72f9c7e512da377074d47d990564959b772643
> > commit: 592627ccbdff0ec6fff00fc761142a76db750dd4 RDMA/rxe: Replace rxe_map and rxe_phys_buf by xarray
> > date:   9 months ago
> > config: sparc-randconfig-c023-20211015 (https://download.01.org/0day-ci/archive/20231019/202310192300.lurP44yG-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192300.lurP44yG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202310192300.lurP44yG-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_fill_pages_from_sgt.constprop':
> >>> drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array subscript 0 is outside array bounds of 'struct sg_table[0]' [-Warray-bounds=]
> >      106 |         __sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    cc1: note: source object is likely at address zero
> >>> drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array subscript 0 is outside array bounds of 'struct sg_table[0]' [-Warray-bounds=]
> >    cc1: note: source object is likely at address zero
> > 
> > 
> > vim +106 drivers/infiniband/sw/rxe/rxe_mr.c
> > 
> >     98	
> >     99	static int rxe_mr_fill_pages_from_sgt(struct rxe_mr *mr, struct sg_table *sgt)
> >    100	{
> >    101		XA_STATE(xas, &mr->page_list, 0);
> >    102		struct sg_page_iter sg_iter;
> >    103		struct page *page;
> >    104		bool persistent = !!(mr->access & IB_ACCESS_FLUSH_PERSISTENT);
> >    105	
> >  > 106		__sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
> >    107		if (!__sg_page_iter_next(&sg_iter))
> >    108			return 0;
> >    109	
> >    110		do {
> >    111			xas_lock(&xas);
> >    112			while (true) {
> >    113				page = sg_page_iter_page(&sg_iter);
> >    114	
> >    115				if (persistent && !is_pmem_page(page)) {
> >    116					rxe_dbg_mr(mr, "Page can't be persistent\n");
> >    117					xas_set_err(&xas, -EINVAL);
> >    118					break;
> >    119				}
> >    120	
> >    121				xas_store(&xas, page);
> >    122				if (xas_error(&xas))
> >    123					break;
> >    124				xas_next(&xas);
> >    125				if (!__sg_page_iter_next(&sg_iter))
> >    126					break;
> >    127			}
> >    128			xas_unlock(&xas);
> >    129		} while (xas_nomem(&xas, GFP_KERNEL));
> >    130	
> >    131		return xas_error(&xas);
> >    132	}
> >    133	
> > 
> 
> Jason,
> 
> Can you make sense out of this? The marked line (was 106, now 101)
> seems completely innocuous.

I think this is the key:

> >    cc1: note: source object is likely at address zero

So something is wrong with the call chain passing sgt into this
function, at least the compiler thinks it is an empty allocation.

Jason
