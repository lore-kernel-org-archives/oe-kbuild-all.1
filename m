Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE002441AF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754058709; cv=none; b=tgGxHHyt0nr6g8TkyYqnzFYi70461IuvZ2Qs9p8GPygDMoK69y4qUGGCtLxR5CIVaq8G+MirZmEYqhNZbTPHwDzQGXUX8dDgxAa+Ld0xHyoPmKvsuSXspWtE17ILt/WoKhlhEVmCyJw5/kgW4/wdlcUymNJkz4xxnb16lq2q8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754058709; c=relaxed/simple;
	bh=FK0vyelFnv1mUU8CyGh29LkgK4hFNqWbgWNw58bAiUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ndOQwlQeBcX3mnPN7w8KcUt5rghVGomNpc26RStdMCwFg8c3u9XYRIs9zG8IybOa8H+hOT7d+sZ+mKv//OfjhMlaGK8hOxwfCRW5PvMvNx+v7EbKg/pkxMFFQmwgxnrNY5zaq0QUxDoRv1Q7qpYWCr9JJmU9PmnaVypA9ZvCjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x2NMSZ5P; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x2NMSZ5P"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4589180b266so11950955e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Aug 2025 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754058705; x=1754663505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AieFr6QqT2maFLAJIA2s1XsjLSFuKHyndgzoToJrS2E=;
        b=x2NMSZ5PBbLjlDcdqOgUE54cfZ0SR7XS1mlR6rw8s6slAgPn+BOMQGLFDwODt4PiiV
         hpzQaPvAhsCjDqo2rLUKmTw63kwc3Ml4HEoxms7I21TBr3/nmMMTbSoaRj8sPZRIzpui
         PU5CwfDcD9H3MvvCH/TLcZ5NaAXsFeuSjLCR7T610UYPVsk7JFKvw6E+5Bm4AieQL4C4
         w0d2HNLtV1WdkKvew+oKUFIEm1wVSL3Stg/Q636+VgLN33fXar/Llv/yrUKgxg0iS0PE
         P4hC/57KGpO+QxUro8mzgEXXENJsayCLgrFsnI7PYGZvCcNv4nHikXupRdZJrwiLjUAU
         qbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754058705; x=1754663505;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AieFr6QqT2maFLAJIA2s1XsjLSFuKHyndgzoToJrS2E=;
        b=otYWWFvE8xu6V7pL22ecz/gcawZ5ZJG3L+NXuGsxa4b2YnDamtlUBvjL/JhcUgDtY0
         lIZDeK3XtsfdQ8ANjqzcklcgOCismQqpK8Bf8CvKLyKNeoICiiJqgugOnXKqdmDQuRNv
         L6Ns1tCUQpystlHZMvFCZswvgJXWjJR08v1xgGBnC28JYihgsbmANf0jDk7UTAtki1s3
         x3ppmnRU1MqLEsK5czKvuipULbAYUz8pi83dvfWd+voxzRJfap8hywWgewxqBOdrQV2V
         AkAeKyx/mp8FH0qU429h/dYt40B6RDLBOf0QCgROjP45FEifLJyps2tjgaUCfH/5s1eq
         3evQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs8/qpAe2CKVAE2nl/xHwJ6ykDgXE56hJ4/mRFiNyVfGybcsF2+etVAa3K7PCghiX4kilqlOkjABe5WbKs@lists.linux.dev
X-Gm-Message-State: AOJu0YxmvQtAmGMHhX4lJXFdf6As6NP6q/RcGH+fnltNO9NsJR4hYq9J
	tGG7a4blBM59voYk4XtapGPNTSUb9bBsBbWsVOUgzo8WuK6G+Qt0VdlH45+B6/jOvMY=
X-Gm-Gg: ASbGncu63dAdfC5hdcx1TEGqbupVmlKGCQe+xOae72ZzUQjeVXPvnF8rPLvGiKeL+mR
	uCQK/UZ6K6pyWicoj+hTX5DSB2J1G6Q9evhCY0LL7V5nt5uupXo4x661xJemIbAMIxQHFCKW1yo
	EskHsUnXEa63h8vB+y4XPqUpXIkGVSSaP9+tT3TxH63ETfrLVyT43OOLQjEfLgXqLxtdxiCmV/a
	SAGP7PppiQ7/ivEyvGZoHQuwyzcuoXM/30zEnPxrU6XzTmsIjPFk+oPdRvBxjCYYSXvjhpuejtK
	UI2/q8xTEYpKmGpsq5WaF6gN/q8ziBlLx9/Z4vhhHkcRvSKrXm31HGGE2iag1vHvFas5IzpsFWd
	ChfcHTnah6hS5mtHzbZByknxPTF6HUx3YMFU0ug==
X-Google-Smtp-Source: AGHT+IFsFT3WFtGw9qAky7zYLbRwPgM0Lo6AQ8+E1AcAZECTEtITCALi3O2SmSLsaNNNGaGdYR0uiQ==
X-Received: by 2002:adf:e047:0:b0:3b7:9c28:f856 with SMTP id ffacd0b85a97d-3b79c28f954mr4079994f8f.48.1754058705140;
        Fri, 01 Aug 2025 07:31:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48a05bsm6129217f8f.69.2025.08.01.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 07:31:44 -0700 (PDT)
Date: Fri, 1 Aug 2025 17:31:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
	gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, WeitaoWang@zhaoxin.com,
	wwt8723@163.com, CobeChen@zhaoxin.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] usb:xhci:Fix slot_id resource race conflict
Message-ID: <b5ab0f46-0fde-420e-97a2-136d3074b59c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730152715.8368-1-WeitaoWang-oc@zhaoxin.com>

Hi Weitao,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weitao-Wang/usb-xhci-Fix-slot_id-resource-race-conflict/20250730-183802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250730152715.8368-1-WeitaoWang-oc%40zhaoxin.com
patch subject: [PATCH v3] usb:xhci:Fix slot_id resource race conflict
config: x86_64-randconfig-161-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010850.Bqd6wf47-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508010850.Bqd6wf47-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci-mem.c:913 xhci_free_virt_device() warn: variable dereferenced before check 'dev->out_ctx' (see line 878)

vim +913 drivers/usb/host/xhci-mem.c

0b5ed80150eb59 Weitao Wang    2025-07-30  868  void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
0b5ed80150eb59 Weitao Wang    2025-07-30  869  		int slot_id)
3ffbba9511b414 Sarah Sharp    2009-04-27  870  {
3ffbba9511b414 Sarah Sharp    2009-04-27  871  	int i;
2e27980e6eb781 Sarah Sharp    2011-09-02  872  	int old_active_eps = 0;
3ffbba9511b414 Sarah Sharp    2009-04-27  873  
3ffbba9511b414 Sarah Sharp    2009-04-27  874  	/* Slot ID 0 is reserved */
0b5ed80150eb59 Weitao Wang    2025-07-30  875  	if (slot_id == 0 || !dev)
3ffbba9511b414 Sarah Sharp    2009-04-27  876  		return;
3ffbba9511b414 Sarah Sharp    2009-04-27  877  
0b5ed80150eb59 Weitao Wang    2025-07-30 @878  	if (xhci->dcbaa->dev_context_ptrs[slot_id] == cpu_to_le64(dev->out_ctx->dma))
                                                                                                          ^^^^^^^^^^^^
dev->out_ctx dereferenced without checking for NULL

8e595a5d30a5ee Sarah Sharp    2009-07-27  879  		xhci->dcbaa->dev_context_ptrs[slot_id] = 0;
3ffbba9511b414 Sarah Sharp    2009-04-27  880  
d850c1658328e7 Zhengjun Xing  2018-06-21  881  	trace_xhci_free_virt_device(dev);
d850c1658328e7 Zhengjun Xing  2018-06-21  882  
2e27980e6eb781 Sarah Sharp    2011-09-02  883  	if (dev->tt_info)
2e27980e6eb781 Sarah Sharp    2011-09-02  884  		old_active_eps = dev->tt_info->active_eps;
2e27980e6eb781 Sarah Sharp    2011-09-02  885  
98871e9470a50c Felipe Balbi   2017-01-23  886  	for (i = 0; i < 31; i++) {
63a0d9abd18cdc Sarah Sharp    2009-09-04  887  		if (dev->eps[i].ring)
63a0d9abd18cdc Sarah Sharp    2009-09-04  888  			xhci_ring_free(xhci, dev->eps[i].ring);
8df75f42f8e67e Sarah Sharp    2010-04-02  889  		if (dev->eps[i].stream_info)
8df75f42f8e67e Sarah Sharp    2010-04-02  890  			xhci_free_stream_info(xhci,
8df75f42f8e67e Sarah Sharp    2010-04-02  891  					dev->eps[i].stream_info);
5aed5b7c2430ce Mathias Nyman  2022-10-24  892  		/*
5aed5b7c2430ce Mathias Nyman  2022-10-24  893  		 * Endpoints are normally deleted from the bandwidth list when
5aed5b7c2430ce Mathias Nyman  2022-10-24  894  		 * endpoints are dropped, before device is freed.
5aed5b7c2430ce Mathias Nyman  2022-10-24  895  		 * If host is dying or being removed then endpoints aren't
5aed5b7c2430ce Mathias Nyman  2022-10-24  896  		 * dropped cleanly, so delete the endpoint from list here.
5aed5b7c2430ce Mathias Nyman  2022-10-24  897  		 * Only applicable for hosts with software bandwidth checking.
2e27980e6eb781 Sarah Sharp    2011-09-02  898  		 */
5aed5b7c2430ce Mathias Nyman  2022-10-24  899  
5aed5b7c2430ce Mathias Nyman  2022-10-24  900  		if (!list_empty(&dev->eps[i].bw_endpoint_list)) {
5aed5b7c2430ce Mathias Nyman  2022-10-24  901  			list_del_init(&dev->eps[i].bw_endpoint_list);
5aed5b7c2430ce Mathias Nyman  2022-10-24  902  			xhci_dbg(xhci, "Slot %u endpoint %u not removed from BW list!\n",
2e27980e6eb781 Sarah Sharp    2011-09-02  903  				 slot_id, i);
8df75f42f8e67e Sarah Sharp    2010-04-02  904  		}
5aed5b7c2430ce Mathias Nyman  2022-10-24  905  	}
839c817ce67178 Sarah Sharp    2011-09-02  906  	/* If this is a hub, free the TT(s) from the TT list */
839c817ce67178 Sarah Sharp    2011-09-02  907  	xhci_free_tt_info(xhci, dev, slot_id);
2e27980e6eb781 Sarah Sharp    2011-09-02  908  	/* If necessary, update the number of active TTs on this root port */
2e27980e6eb781 Sarah Sharp    2011-09-02  909  	xhci_update_tt_active_eps(xhci, dev, old_active_eps);
3ffbba9511b414 Sarah Sharp    2009-04-27  910  
3ffbba9511b414 Sarah Sharp    2009-04-27  911  	if (dev->in_ctx)
d115b04818e57b John Youn      2009-07-27  912  		xhci_free_container_ctx(xhci, dev->in_ctx);
3ffbba9511b414 Sarah Sharp    2009-04-27 @913  	if (dev->out_ctx)
                                                    ^^^^^^^^^^^^
Can dev->out_ctx be NULL?

d115b04818e57b John Youn      2009-07-27  914  		xhci_free_container_ctx(xhci, dev->out_ctx);
d115b04818e57b John Youn      2009-07-27  915  
a400efe455f7b6 Mathias Nyman  2018-03-16  916  	if (dev->udev && dev->udev->slot_id)
a400efe455f7b6 Mathias Nyman  2018-03-16  917  		dev->udev->slot_id = 0;
74151b5349266b Niklas Neronin 2024-02-29  918  	if (dev->rhub_port && dev->rhub_port->slot_id == slot_id)
74151b5349266b Niklas Neronin 2024-02-29  919  		dev->rhub_port->slot_id = 0;
0b5ed80150eb59 Weitao Wang    2025-07-30  920  	if (xhci->devs[slot_id] == dev)
326b4810cc9952 Randy Dunlap   2010-04-19  921  		xhci->devs[slot_id] = NULL;
0b5ed80150eb59 Weitao Wang    2025-07-30  922  	kfree(dev);
3ffbba9511b414 Sarah Sharp    2009-04-27  923  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

