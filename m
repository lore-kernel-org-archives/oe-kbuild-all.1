Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1631A5A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 17:29:37 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-274d3ff35e5so2799104a91.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 10:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1695230977; x=1695835777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2kSqjbE4R4s9y9PfagLdxTPyk6OQBps7KGlApfLIXc=;
        b=xM5cQf8tGTPv+sjhuiIQ04+eIL7LIVm5GPpKs+nw+/rMA3DSYL/meOVSTeSWD4hhv7
         dcn2dST0J43I3ODYjCYXVVjOjkC66ev8KgZxdzSjJkTB6FUXZgQ9Tg/WgEh8f6IIMwbr
         L8884EQRJuVmK0g7d0l3dhGjHbOJLLFZA+tRTQaqmvepJhtIGksGfYlW2158bbXfcLEV
         iavBV+//JlvlK6QeJiWeN6mx2PEGIziCDnoJXghINHsXbJV9tP4DQLT5TbxAz1tHc0iR
         e4NyVpDfk99Hiu9+2OoPnqXWjjj8ZoppjEmk3wNQ85nej9lKHqwHeBhGyuRpYABcmOvD
         coQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695230977; x=1695835777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2kSqjbE4R4s9y9PfagLdxTPyk6OQBps7KGlApfLIXc=;
        b=QVCwAj9VtBt55keFBw5hNp/KssX8eE6x92fJpXGqpcUip+9OWBNv9oiCdVYj9R+Fzx
         v2pw6s+wfBvoQOm2MvQYnmkJL3t15FB+ai8gP5QayfVQMQ3uM3du81s1hBETjC2PGPbZ
         RaIjdyvjbafT8Y/By+mBuC7fK1ElOcd08hBHvaoQ05G3lyoF0j4njTNCrwhVrDOwzvM7
         9dwmmBjBGcwZx+K6374xDv4pcRJnFxoGcLO4t4PVuf6qYSOI+ZXDLpuELaHL+dBKvwTD
         Py/st3gzbls621ocfHUsYHbgO7DdDSk2tqDe9Brm5Tzk6QNL2ieXB8a+vTIfTEllQZQC
         Mbjw==
X-Gm-Message-State: AOJu0YzcsgQ34+xns2mVNSm2W1k8B40Kq9el0p3R4qy4+C6laa4HCCF5
	G9ApYqbfEeqM7x90T7VZv3EEGA==
X-Google-Smtp-Source: AGHT+IENxeIO9GsbP5Nbf4A5wYx4U8iUO+I6y0wMlt3QBuQ04m3lMwzoskKgzx6T3xCx7qIkJBoaEQ==
X-Received: by 2002:a17:90b:1b03:b0:26b:4ce1:9705 with SMTP id nu3-20020a17090b1b0300b0026b4ce19705mr3390551pjb.38.1695230977427;
        Wed, 20 Sep 2023 10:29:37 -0700 (PDT)
Received: from hermes.local (204-195-112-131.wavecable.com. [204.195.112.131])
        by smtp.gmail.com with ESMTPSA id oj15-20020a17090b4d8f00b0026b3ed37ddcsm1591518pjb.32.2023.09.20.10.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 10:29:37 -0700 (PDT)
Date: Wed, 20 Sep 2023 10:29:34 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Kees Cook <keescook@chromium.org>
Cc: kernel test robot <lkp@intel.com>, Mirko Lindner <mlindner@marvell.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Subject: Re: include/linux/dma-mapping.h:416:36: warning: array subscript i
 is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'}
Message-ID: <20230920102934.595b755f@hermes.local>
In-Reply-To: <202309200904.CEED70DA33@keescook>
References: <202309191958.UBw1cjXk-lkp@intel.com>
	<202309200904.CEED70DA33@keescook>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 Sep 2023 09:09:33 -0700
Kees Cook <keescook@chromium.org> wrote:

> On Tue, Sep 19, 2023 at 07:27:26PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2cf0f715623872823a72e451243bbf555d10d032
> > commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 kbuild: Enable -fstrict-flex-arrays=3
> > date:   4 months ago
> > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230919/202309191958.UBw1cjXk-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191958.UBw1cjXk-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202309191958.UBw1cjXk-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from include/linux/skbuff.h:28,
> >                     from include/net/net_namespace.h:43,
> >                     from include/linux/netdevice.h:38,
> >                     from drivers/net/ethernet/marvell/sky2.c:18:
> >    drivers/net/ethernet/marvell/sky2.c: In function 'sky2_rx_unmap_skb':  
> > >> include/linux/dma-mapping.h:416:36: warning: array subscript i is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]  
> >      416 | #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
> >          |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/net/ethernet/marvell/sky2.c:1257:17: note: in expansion of macro 'dma_unmap_page'
> >     1257 |                 dma_unmap_page(&pdev->dev, re->frag_addr[i],
> >          |                 ^~~~~~~~~~~~~~
> >    In file included from drivers/net/ethernet/marvell/sky2.c:41:
> >    drivers/net/ethernet/marvell/sky2.h:2198:25: note: while referencing 'frag_addr'
> >     2198 |         dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT];
> >          |                         ^~~~~~~~~  
> 
> The .config has:
> CONFIG_PAGE_SIZE_16KB=y
> which makes PAGE_SHIFT == 14
> 
> #ifdef CONFIG_PAGE_SIZE_16KB
> #define PAGE_SHIFT      14
> 
> ETH_JUMBO_MTU is:
> 
> #define ETH_JUMBO_MTU	9000
> 
> which forces "ETH_JUMBO_MTU >> PAGE_SHIFT" to be 0.
> 
> I think the right fix would be:
> 
> dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT ?: 1]
> 
> Thoughts?
> 
> -Kees
> 

This is old driver, I don't have the HW anymore, it went to Free Geek.
Most of this code was based off of code in other drivers.

The assumption is that the first part of the data will be received in the
skb itself, then pages are used for overflow.

static unsigned sky2_get_rx_data_size(struct sky2_port *sky2)
{
	struct rx_ring_info *re;
	unsigned size;

	/* Space needed for frame data + headers rounded up */
	size = roundup(sky2->netdev->mtu + ETH_HLEN + VLAN_HLEN, 8);

	sky2->rx_nfrags = size >> PAGE_SHIFT;
	BUG_ON(sky2->rx_nfrags > ARRAY_SIZE(re->frag_addr));

Assuming PAGE_SIZE of 16k and MTU of 9000.

	size = roundup(9000 + 14 + 4, 8) => 9024
	sky2->rx_nfrags = 9024 >> 14 = 0

Which means no skb frags will be used.

This is probably suboptimal since it will endup calling alloc_skb()
to get a 9024 skb. Which in turn causes a call to kmalloc() of 9024.

Not really worth fixing if not testable.

