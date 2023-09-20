Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030AB4122F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 20:16:33 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c5bbb205e3so1783005ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695240993; x=1695845793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZNTVebEDl/TB/efWujh7uyYjDL/PWAYwl5qIIXPhMU=;
        b=NkV3PFsn8+LGMuRdrljYQ06miapank3fIkeCSCcmLkpWn1vUKKQDRrjs4O76VTI5aW
         CaFnGXoZKT/W2GOEtjijch7qA4G/U4k2XgFsZW+NAG94g5L7ogv4Pir8Y1Mm8agRRjb1
         MJGN3J3H+1tvrYc+oItXq92tQl5V2zXbjwWM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695240993; x=1695845793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZNTVebEDl/TB/efWujh7uyYjDL/PWAYwl5qIIXPhMU=;
        b=vwhnUPUHr3yZR6bTvsf6qCq9wXWFAHPFw4cfKcMVT04A3IvLutXijGH+Bb+k7yCitV
         HjNWTFMWCOQHQFxYu9bktZ7O3r5ASLlsAe0GIlPlTBMR8SjL0scVwk50oCDxAr0OQ1aO
         Urbkgb1WEnZ2n48zSaQqDnodFYL6hQerX3r2338kda9OUUjPYo9Iry3Un71EzxnGiPGl
         ozDBvXE0Y8ZQnfVlc/lQLCMZ+DYRmR/LQ6ZjRTiNwFb96u7WJCZM0ZvECtG0t1U3GZQE
         0BqX7dPZP//JtEpfnLo2WhsGTWegijA4anCM7ISEB0iGb0rhe/VrcIiYQzdE0IT3JA4D
         eF4w==
X-Gm-Message-State: AOJu0YzKDWFXWy7yKj9N4j3ElZUbFO2AZztsspEFYtIHPKDquwmZzvjJ
	P/gYJ5u3yMfh4HBeWnyuQ6FWLw==
X-Google-Smtp-Source: AGHT+IFUEirLE2h/qwt8Nm+SaBIaePeE70ZXdji1RcrHm2EwifpvouM0T3zXNtCRduYsYxp7j6Yu8A==
X-Received: by 2002:a17:902:ec87:b0:1c3:3dae:5869 with SMTP id x7-20020a170902ec8700b001c33dae5869mr4237183plg.63.1695240993177;
        Wed, 20 Sep 2023 13:16:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902b28500b001c07110f3ccsm12241844plr.247.2023.09.20.13.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 13:16:32 -0700 (PDT)
Date: Wed, 20 Sep 2023 13:16:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: kernel test robot <lkp@intel.com>, Mirko Lindner <mlindner@marvell.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: include/linux/dma-mapping.h:416:36: warning: array subscript i
 is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'}
Message-ID: <202309201315.7208E4C@keescook>
References: <202309191958.UBw1cjXk-lkp@intel.com>
 <202309200904.CEED70DA33@keescook>
 <20230920102934.595b755f@hermes.local>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920102934.595b755f@hermes.local>

On Wed, Sep 20, 2023 at 10:29:34AM -0700, Stephen Hemminger wrote:
> On Wed, 20 Sep 2023 09:09:33 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > On Tue, Sep 19, 2023 at 07:27:26PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   2cf0f715623872823a72e451243bbf555d10d032
> > > commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 kbuild: Enable -fstrict-flex-arrays=3
> > > date:   4 months ago
> > > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230919/202309191958.UBw1cjXk-lkp@intel.com/config)
> > > compiler: loongarch64-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191958.UBw1cjXk-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202309191958.UBw1cjXk-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >    In file included from include/linux/skbuff.h:28,
> > >                     from include/net/net_namespace.h:43,
> > >                     from include/linux/netdevice.h:38,
> > >                     from drivers/net/ethernet/marvell/sky2.c:18:
> > >    drivers/net/ethernet/marvell/sky2.c: In function 'sky2_rx_unmap_skb':  
> > > >> include/linux/dma-mapping.h:416:36: warning: array subscript i is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]  
> > >      416 | #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
> > >          |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    drivers/net/ethernet/marvell/sky2.c:1257:17: note: in expansion of macro 'dma_unmap_page'
> > >     1257 |                 dma_unmap_page(&pdev->dev, re->frag_addr[i],
> > >          |                 ^~~~~~~~~~~~~~
> > >    In file included from drivers/net/ethernet/marvell/sky2.c:41:
> > >    drivers/net/ethernet/marvell/sky2.h:2198:25: note: while referencing 'frag_addr'
> > >     2198 |         dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT];
> > >          |                         ^~~~~~~~~  
> > 
> > The .config has:
> > CONFIG_PAGE_SIZE_16KB=y
> > which makes PAGE_SHIFT == 14
> > 
> > #ifdef CONFIG_PAGE_SIZE_16KB
> > #define PAGE_SHIFT      14
> > 
> > ETH_JUMBO_MTU is:
> > 
> > #define ETH_JUMBO_MTU	9000
> > 
> > which forces "ETH_JUMBO_MTU >> PAGE_SHIFT" to be 0.
> > 
> > I think the right fix would be:
> > 
> > dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT ?: 1]
> > 
> > Thoughts?
> > 
> > -Kees
> > 
> 
> This is old driver, I don't have the HW anymore, it went to Free Geek.
> Most of this code was based off of code in other drivers.
> 
> The assumption is that the first part of the data will be received in the
> skb itself, then pages are used for overflow.
> 
> static unsigned sky2_get_rx_data_size(struct sky2_port *sky2)
> {
> 	struct rx_ring_info *re;
> 	unsigned size;
> 
> 	/* Space needed for frame data + headers rounded up */
> 	size = roundup(sky2->netdev->mtu + ETH_HLEN + VLAN_HLEN, 8);
> 
> 	sky2->rx_nfrags = size >> PAGE_SHIFT;
> 	BUG_ON(sky2->rx_nfrags > ARRAY_SIZE(re->frag_addr));
> 
> Assuming PAGE_SIZE of 16k and MTU of 9000.
> 
> 	size = roundup(9000 + 14 + 4, 8) => 9024
> 	sky2->rx_nfrags = 9024 >> 14 = 0
> 
> Which means no skb frags will be used.
> 
> This is probably suboptimal since it will endup calling alloc_skb()
> to get a 9024 skb. Which in turn causes a call to kmalloc() of 9024.
> 
> Not really worth fixing if not testable.

Should we drop the driver? Getting "allmodconfig" to build again
with 16k pages is an easy fix here, though. I could just use

	min(1, ETH_JUMBO_MTU >> PAGE_SHIFT)

too...

-- 
Kees Cook
