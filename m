Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC496FA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 14:48:43 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so83856441fa.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693406921; x=1694011721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0s5rdZ1FiTFkxNksF6bbHJ9HKt0mAK3Fjc6AoSjYvk=;
        b=aepMBraP2HgmKe04W7h8HE6NGWx8AWwTzjBkJZ797DkCEvhYj4asWWb9wWedSOuINX
         FeuvnzdlxEuuFlIybx5ZWWL8Sa4y5nolieW0ZbwsjPRHkYEKKp3oFj9F4CoZKb4B27oy
         kMDXZv6K+xY90jYehgLLRus8B41U5dSbigYNQgOZtvUrhZqbWd+CBedueEium3LWh0oC
         MxKByu/WM3Ri9Zs2td8N14rMuquw3ZxePjBSbcNBvmB7Z7qtVoACDbNeEMa0UQBKafDu
         nAKena2HKMkU8yxu9TCS93Tw24v3jXF11EvB1+sKfk0tbdkwQxmc4Rv3uvhcycbmvHts
         HLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693406921; x=1694011721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0s5rdZ1FiTFkxNksF6bbHJ9HKt0mAK3Fjc6AoSjYvk=;
        b=lx05TIalkCCpJhgH+b5J+uZzSy/XDOgqdIdgNp2jveoOvEJUrJPHSlKJyxic44TxMm
         ZjJmsFLRNzmYhWGmrmbLFHdA7Mh570iFOnuzs/eHNSExG/JR4yWDYKCsxrPrJ2QhG1OZ
         TpBOi/zJnDUcHiCXGa+ARTXQgz3pIgQEXUdSzjHWF/HwAYpOqeXmxmMqDohR67YleqOr
         Hrb9cPSJ5FcyqTy1oNV6104y+8RIhlyY0b3zOJIqKsSg2mxNZb5XK7duAIPPnYl5lgZM
         USxLnF0EJyRCN84jg0O5hgmqAx/MGbGa0PZo1tWqj7kVbXPcNgP8Uh64m72RLes40zRx
         ZYiQ==
X-Gm-Message-State: AOJu0Yy7KxlEAFGksOV+p365MvQ9pLMwAc0czU3Fy+eCQizQhTtIcaji
	jn4GjovrkP5w4k6l4/dF6fA=
X-Google-Smtp-Source: AGHT+IENIjdVHjEuVjroRVntHbePkfsyv+44mTXRHE3Eb7WYnwxYJ/210xRyEX6YKYcVkcvqFZs7+g==
X-Received: by 2002:a2e:9d8d:0:b0:2bc:f41a:d9c6 with SMTP id c13-20020a2e9d8d000000b002bcf41ad9c6mr2012590ljj.0.1693406921097;
        Wed, 30 Aug 2023 07:48:41 -0700 (PDT)
Received: from pc636 (host-90-235-3-170.mobileonline.telia.com. [90.235.3.170])
        by smtp.gmail.com with ESMTPSA id z4-20020a2e7e04000000b002b9ff8450aesm2574689ljc.91.2023.08.30.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 07:48:40 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 30 Aug 2023 16:48:37 +0200
To: kernel test robot <lkp@intel.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Dave Chinner <david@fromorbit.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH v2 4/9] mm: vmalloc: Remove global vmap_area_root rb-tree
Message-ID: <ZO9WxbYUVDfak/5H@pc636>
References: <20230829081142.3619-5-urezki@gmail.com>
 <202308292228.RRrGUYyB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308292228.RRrGUYyB-lkp@intel.com>

On Tue, Aug 29, 2023 at 10:30:19PM +0800, kernel test robot wrote:
> Hi Uladzislau,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v6.5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Uladzislau-Rezki-Sony/mm-vmalloc-Add-va_alloc-helper/20230829-161248
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20230829081142.3619-5-urezki%40gmail.com
> patch subject: [PATCH v2 4/9] mm: vmalloc: Remove global vmap_area_root rb-tree
> config: csky-randconfig-r024-20230829 (https://download.01.org/0day-ci/archive/20230829/202308292228.RRrGUYyB-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308292228.RRrGUYyB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308292228.RRrGUYyB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/vmalloc.c: In function 'vmap_init_free_space':
> >> mm/vmalloc.c:4506:45: warning: ordered comparison of pointer with integer zero [-Wextra]
>     4506 |                 if (busy->addr - vmap_start > 0) {
>          |                                             ^
>
Right. I will fix it. We should cast the busy->addr to unsigned long.

--
Uladzislau Rezki
