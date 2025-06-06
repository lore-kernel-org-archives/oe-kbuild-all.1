Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B52520D4E3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 19:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749237830; cv=none; b=pik8gpaD8CnVwr/Ztd0SfK+lQXhaDvXZNRTFcns6Lp1dGsMm7cT79iIe/UPDEvKzO9ONO3RqZs5l3m0Xx/2rnYgsEBUIDOX4++EGEi9tzZBglmIVcd3UTsjyjj0PIZwLgEZv2mMUSAdHZnltcqCt/1Gbmk/uTo8qHNNHr9TVAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749237830; c=relaxed/simple;
	bh=I5wr2Yi8lLNbdm988OzLtJEX5WfMRVIUhXHX5RYKvEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uga1l6rYoCGIrp252pOCGdP3dW+T9Xk0g+Q1lKBkrQvEIjfFM1Z9fH/vHyfNNHGhRlFLUGXbPEKVMBqptHxeTHXqwwcQk+sh6gzWEfqIg9UzOrBsnqESDO7uxGruAHQI4M+jaeMM6LLbeRSi6kObCqoiWs9ZkPSuPj1K0sbizAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXo6A00C; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXo6A00C"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e40e3f316so18467807b3.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Jun 2025 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237828; x=1749842628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqQ/zcvbPdp6A7pyU4L8ztg/UtBL60Hxd9tSiPIjUzU=;
        b=LXo6A00CDW1X1uJfWqMGMjA2WXgp6aYXZx2T1f2wa3lBTIF3jem7mcefnrM6RAlcbW
         ubfE1Mq/LYXJErQWkfLYm5hiYr4Bzt1fwX+2fKBYo08hm6pe3MgpNVYy+t5pG4j5AO7w
         K+FqIfvhgcQYnpFGzb/aAPkw0o2z3HD73qhKo2VvPmCGzZd2RmFx4a/u5jIsGKS9P2DD
         8fPtb22vttfHlU8mvTU6tR0Vs7rW8tWzGgGEOA2zn6/GO4ONebHVs85w1krEBSPN+vRQ
         ikAAJ1WB5l86aJ1CTRlsypKKrL+UPuSH7Uk509JeOe4p9FR9U2goWfN7lJZugXIdpKqK
         BWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237828; x=1749842628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqQ/zcvbPdp6A7pyU4L8ztg/UtBL60Hxd9tSiPIjUzU=;
        b=NR2V3tJn5OMsRybsIsDw8Cb4AVhF5uDI9a3PaKTm5oRY5kGxIow5jDG2qzL2BmdVF6
         aIfLS2GJKke7fNUwJsj/G3yuXGcC44ZLZilQ2NnehrRrarOSNm7lGQe5vZQUiLj/KQsi
         bBftkkIVzU8mltgK/1bd38CJ4uDRdq8qzqcGMYPqmyyFJh7yS5BdOtttBQHY0ZluF+YD
         X/bOAL0vJjPVDifX5GXQtDyK34h0OO6R6SZJcnmkocwybc4HrQizbpbvH95j/Im+w0vJ
         JXatzay4vr/0aK9cfYjs2fSVIUl6XyCkFbZzaxwzn0rvc382miNxBqfOn2LiVepoCYj1
         0i1w==
X-Forwarded-Encrypted: i=1; AJvYcCVC5Os3EnMiEnXlVFLSiQPdBm6U77Sh8dww5IEJXCb3vfBtRO8R53sRRGX5QNOVX6g75pix4ojvSKKlkkg5@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ2Gjaq0QQ+p125XI6jjdc2ELtU7NIQWwrG8JQYoHKN6Xoa2Dk
	qUtJpcuvu0d9ySqkowx0J1mkABOaBp0d45YLyBb/0wltowwtTy3HdRcw
X-Gm-Gg: ASbGncsk+xII4/OYY+BpjcGCor8Sab1UOn/CYWSdgL0ZbBlmQYfqDztgDUU/xZbCFxL
	JmeNH+7sBdHVE7LZ02406NaxLU3ANJUYhD68KfNSUS6sk+ODo3tL2g5GdP8sAt8kKlF/vOQvAEj
	+HzRMDAxZIZOT42jh+hYiIwgbqmPKe/Jp46zefqjyrOgJBbjhhGAltSAmkecZ3r4HUReTZsMQbx
	DAszAP1Xp4Z4hXJ7K0awbDd2Q1JDv5K8SuSBi3uFvlH5etM/XG/4wnVBvKkOgEnnQQ3SWGNT1j2
	ZTJAwoaUgtWKQMsZlKpW0C4EQMAmw8TfrpvpfGh0bO/AjUBtENs/u+RFF7Lfjg==
X-Google-Smtp-Source: AGHT+IFGb3uDxAv2h38tlgnumCIU/bedcMQ7x8nYpWSiVRUEgMfnHPiE0TBuxyal9rWa7F/gazzaAQ==
X-Received: by 2002:a05:690c:620e:b0:710:e8a8:771d with SMTP id 00721157ae682-710f770f5e4mr66524407b3.24.1749237828001;
        Fri, 06 Jun 2025 12:23:48 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:4a::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a0e6efsm3578727b3.89.2025.06.06.12.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:23:47 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [akpm-mm:mm-new 61/87] drivers/cxl/core/region.c:2437:22: error: invalid use of undefined type 'struct node_notify'
Date: Fri,  6 Jun 2025 12:23:45 -0700
Message-ID: <20250606192345.3440658-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <202506070030.otNokpsc-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 7 Jun 2025 00:19:17 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Oscar,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   b9f05ab60cb240a64e898221de50a037553840c7
> commit: 7bd79eaa2076cde601d828532a09ea50e20a976f [61/87] drivers,cxl: use node-notifier instead of memory-notifier
> config: loongarch-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070030.otNokpsc-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070030.otNokpsc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506070030.otNokpsc-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/cxl/core/region.c: In function 'cxl_region_perf_attrs_callback':
> >> drivers/cxl/core/region.c:2437:22: error: invalid use of undefined type 'struct node_notify'
>     2437 |         int nid = mnb->nid;
>          |                      ^~
>    drivers/cxl/core/region.c:2440:46: error: 'NODE_ADDED_FIRST_MEMORY' undeclared (first use in this function)
>     2440 |         if (nid == NUMA_NO_NODE || action != NODE_ADDED_FIRST_MEMORY)
>          |                                              ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/cxl/core/region.c:2440:46: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/cxl/core/region.c: In function 'shutdown_notifiers':
>    drivers/cxl/core/region.c:3487:9: error: implicit declaration of function 'unregister_node_notifier'; did you mean 'unregister_module_notifier'? [-Wimplicit-function-declaration]
>     3487 |         unregister_node_notifier(&cxlr->node_notifier);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~
>          |         unregister_module_notifier
>    drivers/cxl/core/region.c: In function 'cxl_region_probe':
>    drivers/cxl/core/region.c:3528:9: error: implicit declaration of function 'register_node_notifier'; did you mean 'register_module_notifier'? [-Wimplicit-function-declaration]
>     3528 |         register_node_notifier(&cxlr->node_notifier);
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>          |         register_module_notifier

From what I can see, it seems like struct node_notify is conditionally
defined under #ifdef CONFIG_MEMORY_HOTPLUG, but the callsite unconditionally
declares struct node_notify *mnb = arg.

Sent using hkml (https://github.com/sjp38/hackermail)
