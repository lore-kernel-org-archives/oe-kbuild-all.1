Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0CC8ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 16:09:35 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-690bfd4f3ebso1974459b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695226174; x=1695830974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZPdmXl4ZwuGt3eSBwgMVSxnCz69SpDGNBEX3pNmeW4=;
        b=YR3XiB4wfuInn8C7GJqEgcRvxPtAZsKi1b0mb/fbRijHOIkDisDJE00/NdfAAasnbs
         quOmZ/27fWlabkfDhv9/P5WCDhoFbmPHs82Ea6PclewiTHGmASa64c9Y8M9Nx1UarBj8
         tQZjFQ5KUwqtsSbKT2K9X67B9r74tq+m6LHOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695226174; x=1695830974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZPdmXl4ZwuGt3eSBwgMVSxnCz69SpDGNBEX3pNmeW4=;
        b=bu2G36+8V5YwWUXZKdlyIsWLMFO9cUsRxIP355jYm4R18/zxmv7cPZPwkenottBLX/
         Kpl72Sb1VQ9SeaWdgpGADchSkbP8SbMU2K9YmpARkLFYuLJ/d7ZTgBwdGgRJSIO0DuAK
         VMGMGFK2/LfCDmOuwojloSCdwQ9lW5HVObLdE0xyWs2Py8ZlP54LVL4QYI96GLa6nsbK
         P432ziQhqRjQ+qMcSLQgvy/7lJACEc+gSaD3R1YM+id6XpLMVUq3g5kKwRfG1Jxpb/ls
         lPoU6XXvJs4WaBvlIjiaNGOf/PnJySUvPJuwVuTidBtJ5NfFKWMMUqK01BSZONNsXeJn
         Kvug==
X-Gm-Message-State: AOJu0YzkXBcWwZ79jAeLNsWa1WxCvfLU0mcJpxVBPpRgCBoZHYRya7Cx
	YBSMo7vwdAxodAnf5FG6z7FJng==
X-Google-Smtp-Source: AGHT+IFZEbhAj0VF0cfiwS9CwelgZgX4SNQUZu5W0XXu7LEGDZAj+oplpFNBiJANw/y7//sKSq9U9w==
X-Received: by 2002:a05:6a00:8087:b0:690:f6a1:ae62 with SMTP id eh7-20020a056a00808700b00690f6a1ae62mr1544166pfb.23.1695226174549;
        Wed, 20 Sep 2023 09:09:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x23-20020aa793b7000000b0068bbf578694sm10668960pff.18.2023.09.20.09.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 09:09:33 -0700 (PDT)
Date: Wed, 20 Sep 2023 09:09:33 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>, Mirko Lindner <mlindner@marvell.com>,
	Stephen Hemminger <stephen@networkplumber.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: include/linux/dma-mapping.h:416:36: warning: array subscript i
 is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'}
Message-ID: <202309200904.CEED70DA33@keescook>
References: <202309191958.UBw1cjXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309191958.UBw1cjXk-lkp@intel.com>

On Tue, Sep 19, 2023 at 07:27:26PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2cf0f715623872823a72e451243bbf555d10d032
> commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 kbuild: Enable -fstrict-flex-arrays=3
> date:   4 months ago
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230919/202309191958.UBw1cjXk-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191958.UBw1cjXk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309191958.UBw1cjXk-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/skbuff.h:28,
>                     from include/net/net_namespace.h:43,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/ethernet/marvell/sky2.c:18:
>    drivers/net/ethernet/marvell/sky2.c: In function 'sky2_rx_unmap_skb':
> >> include/linux/dma-mapping.h:416:36: warning: array subscript i is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
>      416 | #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
>          |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/ethernet/marvell/sky2.c:1257:17: note: in expansion of macro 'dma_unmap_page'
>     1257 |                 dma_unmap_page(&pdev->dev, re->frag_addr[i],
>          |                 ^~~~~~~~~~~~~~
>    In file included from drivers/net/ethernet/marvell/sky2.c:41:
>    drivers/net/ethernet/marvell/sky2.h:2198:25: note: while referencing 'frag_addr'
>     2198 |         dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT];
>          |                         ^~~~~~~~~

The .config has:
CONFIG_PAGE_SIZE_16KB=y
which makes PAGE_SHIFT == 14

#ifdef CONFIG_PAGE_SIZE_16KB
#define PAGE_SHIFT      14

ETH_JUMBO_MTU is:

#define ETH_JUMBO_MTU	9000

which forces "ETH_JUMBO_MTU >> PAGE_SHIFT" to be 0.

I think the right fix would be:

dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT ?: 1]

Thoughts?

-Kees

-- 
Kees Cook
