Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE607321B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvYnSjmj"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ce2b6cb933so464896a34.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697732522; x=1698337322; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8Z8b47IL35J0M8IzMmQ/m6Z3gKcDDxbyFomY62RCb8=;
        b=WvYnSjmjxxJdMFfTWYkbObD37vSgYsl1u6ulooeE2ub/VgQCLdof6iGDfdWExGwl92
         3MR3X6336D8EjDD7d8cm/Whcjhi6SjTDNTGJR2naWfrsFdJP9prZRfeM4ipLYRfr93np
         7vB92aHDeEH5Wot67TY5/25qCZQkkiynZ6PAOpCkf18jpCddwp+QKgWGkmroyYbVAtTn
         1Gqy9d6u7gEZc8Cju6ootdRK0aJ8RqYbXzkH7yRLW0kepFbkw4DiZ3Fyii4dXZ4qqIbS
         iVzcZdXUAxSZScKyG0rwV8rEOqdeH9Q+p9j4svLt+XsHnA34Pr4gac+DYXdlBPCyL2L1
         fRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697732522; x=1698337322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8Z8b47IL35J0M8IzMmQ/m6Z3gKcDDxbyFomY62RCb8=;
        b=I3c5mYGJ3PHAnj11rhKkD3xk0FrQza176QsN8adYBWQBSmtXY8AICLI29RFdrxRT/+
         fmRQA3Ijt/auY5y38+vP3yhQDhV4Db0C59AC/ZyzXcljqkYTX9LOpbvra8VDM4ICyzve
         p43dxH0quDqRlGOThDjBdaw0mO5/lYH3n05P0mP3p/XMo1rREAdkn4jw688I6x3BXzDI
         MC6OV+thRbwZv0UIn4HfhGfAk9LuH7H2cXHmhaoAGBoUdnMpSd59IB9hkh2ZGlsyHlGL
         WjOK4ute1VGpH/YCsLoYP+4ghJ1JV6f8uvQJJBpnNcrIcgD0KmIBe3tdZDGzcY1Cy97z
         TGLw==
X-Gm-Message-State: AOJu0Yzg3zqLYd/vfpNtxj9wb6vIrdo1e2Wpc6BZo+mECm/OBwTbwydC
	2PH8MfXWBD5za9ccrX50jCYVYj0ZW1U=
X-Google-Smtp-Source: AGHT+IEl8pPGIlMQIftnWiLzIBTyF12kFWseLWTw3rt22qly96DW3/+9l09R2o/4R3ur2kg0rrhXaw==
X-Received: by 2002:a05:6871:600c:b0:1d6:567c:deb4 with SMTP id qx12-20020a056871600c00b001d6567cdeb4mr3451672oab.42.1697732521863;
        Thu, 19 Oct 2023 09:22:01 -0700 (PDT)
Received: from ?IPV6:2603:8081:1405:679b:1569:5535:218a:c00c? (2603-8081-1405-679b-1569-5535-218a-c00c.res6.spectrum.com. [2603:8081:1405:679b:1569:5535:218a:c00c])
        by smtp.gmail.com with ESMTPSA id ec44-20020a0568708c2c00b001e9dc5c73e4sm1214937oab.31.2023.10.19.09.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 09:22:01 -0700 (PDT)
Message-ID: <57edd968-91d7-41f9-8a29-e86d8f583efa@gmail.com>
Date: Thu, 19 Oct 2023 11:22:00 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array
 subscript 0 is outside array bounds of 'struct sg_table[0]'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <202310192300.lurP44yG-lkp@intel.com>
Content-Language: en-US
From: Bob Pearson <rpearsonhpe@gmail.com>
In-Reply-To: <202310192300.lurP44yG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/23 10:33, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   dd72f9c7e512da377074d47d990564959b772643
> commit: 592627ccbdff0ec6fff00fc761142a76db750dd4 RDMA/rxe: Replace rxe_map and rxe_phys_buf by xarray
> date:   9 months ago
> config: sparc-randconfig-c023-20211015 (https://download.01.org/0day-ci/archive/20231019/202310192300.lurP44yG-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192300.lurP44yG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310192300.lurP44yG-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_fill_pages_from_sgt.constprop':
>>> drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array subscript 0 is outside array bounds of 'struct sg_table[0]' [-Warray-bounds=]
>      106 |         __sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: note: source object is likely at address zero
>>> drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array subscript 0 is outside array bounds of 'struct sg_table[0]' [-Warray-bounds=]
>    cc1: note: source object is likely at address zero
> 
> 
> vim +106 drivers/infiniband/sw/rxe/rxe_mr.c
> 
>     98	
>     99	static int rxe_mr_fill_pages_from_sgt(struct rxe_mr *mr, struct sg_table *sgt)
>    100	{
>    101		XA_STATE(xas, &mr->page_list, 0);
>    102		struct sg_page_iter sg_iter;
>    103		struct page *page;
>    104		bool persistent = !!(mr->access & IB_ACCESS_FLUSH_PERSISTENT);
>    105	
>  > 106		__sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
>    107		if (!__sg_page_iter_next(&sg_iter))
>    108			return 0;
>    109	
>    110		do {
>    111			xas_lock(&xas);
>    112			while (true) {
>    113				page = sg_page_iter_page(&sg_iter);
>    114	
>    115				if (persistent && !is_pmem_page(page)) {
>    116					rxe_dbg_mr(mr, "Page can't be persistent\n");
>    117					xas_set_err(&xas, -EINVAL);
>    118					break;
>    119				}
>    120	
>    121				xas_store(&xas, page);
>    122				if (xas_error(&xas))
>    123					break;
>    124				xas_next(&xas);
>    125				if (!__sg_page_iter_next(&sg_iter))
>    126					break;
>    127			}
>    128			xas_unlock(&xas);
>    129		} while (xas_nomem(&xas, GFP_KERNEL));
>    130	
>    131		return xas_error(&xas);
>    132	}
>    133	
> 

Jason,

Can you make sense out of this? The marked line (was 106, now 101) seems completely innocuous.

Bob
