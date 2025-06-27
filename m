Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99512AE6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026746; cv=none; b=vAODnmmXdebY+T8VNvel7JMZYZUDmL+sx+s+trWyKF3/q/t6kYx8b6BqahK+oVc5pVLLPRkEn6Q9dfZu1zdjNEqug8eicjFwSKNJJf3pRfYz/RjCjfSCUueJne2dJuzJoHDXlk4FJR4FUKss1MedUOTm4AiZtrLHLYff/6UZC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026746; c=relaxed/simple;
	bh=slF6+o5/m2p6wak/qyv3aOZ7QF/BqfaTzzXLO2276P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=R+GQjMSrgTIWnaoBbuCw2A4SbjPHOj0qh3pJcL7SVCQVYZM1dAKb7iAugsPL59HxTUGX4vrpsAdiPLKZG+b4/W14OyzYGBtevEbYvnboitKGFa3sQABW4kLLUGJeRzzKc1C5ZhYOqawDHdhCCEhEr5rpF2uc876RGk+H6y2wz8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GaI2qGrF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GaI2qGrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751026743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6jJXeMQ/vnhzBrzmpUv0seoJn2P/YNLb2Myi7IvEQY=;
	b=GaI2qGrFmyhMCsUobRpcVgSMBIghAs6UgFIGCWIS4rIa63KR26NyhXA1TiWT6FOj6tsanC
	Q8qtJx0t/CUKhJYEqcT+6f1KL3OLByUyd+MLrsCtuym4ivJJK+aoVSRmh0fC/Xpj2JbNHK
	gQ+2TON4lG3OI4xQHCcuC0J+/SMo5AU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-luIuVzTyPfm55ScGo0NXeA-1; Fri, 27 Jun 2025 08:19:02 -0400
X-MC-Unique: luIuVzTyPfm55ScGo0NXeA-1
X-Mimecast-MFC-AGG-ID: luIuVzTyPfm55ScGo0NXeA_1751026741
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4532ff43376so15698755e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 05:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026741; x=1751631541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6jJXeMQ/vnhzBrzmpUv0seoJn2P/YNLb2Myi7IvEQY=;
        b=JkRrO8WzDupBIXL4Y/UjnHdcqMTudwciLxMkhgFx98VXh8ycmAWcbfyi+sgmKPGXHr
         xpGuCjWjUK9LFAPmWr8kuzrLRdAVL0JkwvfFpKv6N9oPxh3bIDBetqmH7X140zgsSnja
         bPFAxojwQxh+5JncC+tuxd0Zlug8gsOKzE8K0nLJGvDikA1AwJZbD+4wQxBNoUogx+U5
         loPX4P64ktbsiTJkfW0FfodLOqrzj4/zfdx6PwPZXfMGaOhF6LCi2fyxWgodL3VqZGI9
         0hmTNeN+u7lixxBWTIH44XAa9MlXk7m/Uf/WciQgVQGHJePq8v2Le9pFfhI/++MNRMoR
         XlLw==
X-Forwarded-Encrypted: i=1; AJvYcCUj0rd+7chpGXr/XfzFHODPh/qMllvRBqQSKJD/qUpUcTeOt/SV8xhgZXm5X4s1FQGO9+B3UOqXZg+VJ+78@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+LvDbpoBlU21vO5rDFurTyGog71mqGQsDivG0poI3FJmojiMA
	OjSRPG0ZyAObScf2OG+T0OR3WrbJaiZ8SND2MWoCV5J6I/T6AfZUBQJxIAbHr6sGowUD9lqhjYF
	3YH7Hx69UsCQ1uziqVSNxRCqXLq8JjwyeShZGRb10JVO6biEfrF250Gq+j93wWbTmOtUZ+Ww/wW
	0=
X-Gm-Gg: ASbGncspjIEXyAAfx+6rIS+MuMYQg8ny6o1TG5I//lIZ3eAZU90T6a3ba5b95pW0fPL
	Fb6zWJxT8RivWRMRptp9kQREhKZiXNxpipaGRd1LMOdXhWraVGx3SQnnuaoSykZtTq+MWLGOwwd
	YLC5b4DSZIL+XW9FIRZ6bdN8l2EJAy13noLqE1gS5KJAN3RxyeNJqL5DWK+jT9M/ZPUEc+epm5E
	wJEr9rIhz61i1PYPTVWwJYeu3qwblOpQ6k+y6DGfvFj4wp+wPxQIswpPcny13+ZyMwLu6mCMJji
	antrnrLfZ9cMenpC
X-Received: by 2002:a05:600c:5309:b0:453:8f6:6383 with SMTP id 5b1f17b1804b1-4538fe82d3dmr27458855e9.15.1751026741069;
        Fri, 27 Jun 2025 05:19:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8Y0sn1jx5MdC9w7dDN0iUWZm6OaT49+ak5Q8EkEy4A0S52w62hSdkOIT68jNHQ/zLuYwgmg==
X-Received: by 2002:a05:600c:5309:b0:453:8f6:6383 with SMTP id 5b1f17b1804b1-4538fe82d3dmr27458465e9.15.1751026740617;
        Fri, 27 Jun 2025 05:19:00 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390d3fsm50138915e9.1.2025.06.27.05.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:19:00 -0700 (PDT)
Date: Fri, 27 Jun 2025 08:18:57 -0400
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
Message-ID: <20250627075441-mutt-send-email-mst@kernel.org>
References: <23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni@redhat.com>
 <202506271443.G9cAx8PS-lkp@intel.com>
 <d172caa9-6d31-45a3-929c-d3927ba6702e@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d172caa9-6d31-45a3-929c-d3927ba6702e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ryzMbiqx4T0-dvF2NXwPuEOOkvRRUOk7ichV3jYc81w_1751026741
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 12:28:00PM +0200, Paolo Abeni wrote:
> On 6/27/25 8:41 AM, kernel test robot wrote:
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on net-next/main]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/scripts-kernel_doc-py-properly-handle-VIRTIO_DECLARE_FEATURES/20250624-221751
> > base:   net-next/main
> > patch link:    https://lore.kernel.org/r/23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni%40redhat.com
> > patch subject: [PATCH v6 net-next 4/9] vhost-net: allow configuring extended features
> > config: csky-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 15.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506271443.G9cAx8PS-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from include/linux/uaccess.h:12,
> >                     from include/linux/sched/task.h:13,
> >                     from include/linux/sched/signal.h:9,
> >                     from include/linux/rcuwait.h:6,
> >                     from include/linux/percpu-rwsem.h:7,
> >                     from include/linux/fs.h:34,
> >                     from include/linux/compat.h:17,
> >                     from drivers/vhost/net.c:8:
> >    arch/csky/include/asm/uaccess.h: In function '__get_user_fn.constprop':
> >>> arch/csky/include/asm/uaccess.h:147:9: warning: 'retval' is used uninitialized [-Wuninitialized]
> >      147 |         __asm__ __volatile__(                           \
> >          |         ^~~~~~~
> >    arch/csky/include/asm/uaccess.h:187:17: note: in expansion of macro '__get_user_asm_64'
> >      187 |                 __get_user_asm_64(x, ptr, retval);
> >          |                 ^~~~~~~~~~~~~~~~~
> >    arch/csky/include/asm/uaccess.h:170:13: note: 'retval' was declared here
> >      170 |         int retval;
> >          |             ^~~~~~
> > 
> > 
> > vim +/retval +147 arch/csky/include/asm/uaccess.h
> > 
> > da551281947cb2c Guo Ren 2018-09-05  141  
> > e58a41c2226847f Guo Ren 2021-04-21  142  #define __get_user_asm_64(x, ptr, err)			\
> > da551281947cb2c Guo Ren 2018-09-05  143  do {							\
> > da551281947cb2c Guo Ren 2018-09-05  144  	int tmp;					\
> > e58a41c2226847f Guo Ren 2021-04-21  145  	int errcode;					\
> > e58a41c2226847f Guo Ren 2021-04-21  146  							\
> > e58a41c2226847f Guo Ren 2021-04-21 @147  	__asm__ __volatile__(				\
> > e58a41c2226847f Guo Ren 2021-04-21  148  	"1:   ldw     %3, (%2, 0)     \n"		\
> > da551281947cb2c Guo Ren 2018-09-05  149  	"     stw     %3, (%1, 0)     \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  150  	"2:   ldw     %3, (%2, 4)     \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  151  	"     stw     %3, (%1, 4)     \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  152  	"     br      4f              \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  153  	"3:   mov     %0, %4          \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  154  	"     br      4f              \n"		\
> > da551281947cb2c Guo Ren 2018-09-05  155  	".section __ex_table, \"a\"   \n"		\
> > da551281947cb2c Guo Ren 2018-09-05  156  	".align   2                   \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  157  	".long    1b, 3b              \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  158  	".long    2b, 3b              \n"		\
> > da551281947cb2c Guo Ren 2018-09-05  159  	".previous                    \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  160  	"4:                           \n"		\
> > e58a41c2226847f Guo Ren 2021-04-21  161  	: "=r"(err), "=r"(x), "=r"(ptr),		\
> > e58a41c2226847f Guo Ren 2021-04-21  162  	  "=r"(tmp), "=r"(errcode)			\
> > e58a41c2226847f Guo Ren 2021-04-21  163  	: "0"(err), "1"(x), "2"(ptr), "3"(0),		\
> > e58a41c2226847f Guo Ren 2021-04-21  164  	  "4"(-EFAULT)					\
> > da551281947cb2c Guo Ren 2018-09-05  165  	: "memory");					\
> > da551281947cb2c Guo Ren 2018-09-05  166  } while (0)
> > da551281947cb2c Guo Ren 2018-09-05  167  
> 
> AFAICS the issue reported here is in the arch-specific uaccess helpers
> and not related to this series.
> 
> /P

I think it's due to code like this in your patch:

+                       if (get_user(features, featurep + 1 + i))
+                               return -EFAULT;

the specific arch might have a bug that this is unconvering,
or a limitation, I can't say.

Seems worth fixing, though.

Poke the mainatiners?
-- 
MST

