Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8A43BAD8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168370; cv=none; b=dX1yG7XAph9td+eTg6c2pWoWa5SaqYUyvDI7+PQsqQdRgJjvz8M9n92IHI+BA+mozRo9ULrGhrVyPgGLXjHjSCzr1MhtkT8k0yn36M2QkPgsgYfe66Ol8nziobMNx6+nK0QLJR5EGBBzKycJ4BAmrXMn5OfrZyWX8bn2BFitiEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168370; c=relaxed/simple;
	bh=NNmb7nIu8orrtSEUZJR5J0qd2Gkj3Q2XLIm3WPGBnL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffiGolErKlLrUvaWzGJKh+SLlc1Zpz6TqfAx6EjZh+7slVAtGT6k1Zbnc8AqwNfk/E5nGXKvX+qWgY2GZlgyvltmomTcvkfIqZNeTT5DlEDKxEOKq0iLceipFsCMmdIzHuv/R8S4pzAw7932XS5yrROywcKhthM40fm+vHhT0Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bY8u1K55; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bY8u1K55"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9157b949fc7so828223085a.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 01:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781168368; x=1781773168; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbD+dNU3/p7RKZb43yjMctw6jjSoT/XuklLlBnk5ImY=;
        b=bY8u1K558DelFCBGeWWknT5jKiC4IWwNxxMluvzu603+/+OMDb0iieQmVYBgwXkvUb
         dACP3ADQ+LHdGVp0NYvNL1yDkXIZLf2Dsq5MNXP/DpuBF+GwA7sWZ6u/ZPfBGZBFnqGW
         LdxR7Y2AEkheUhZTWLtftmCzVwSRsexRY0NuweSX96Fw2YXc9na4Lu/eixV3/ssWVUGP
         pNGmAD79rwCWBW/IXl6z8eXoBmxgtkWkeLzIE+OXooF08Fn7TQ4fN1FjKRuKam/tHcz9
         vCk6X0YQVaZpI1ImcxjS8uaLXWw/9J7mhW107deyly6VEyVhGL8j2xmyJ5VwECOENNiT
         /EDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168368; x=1781773168;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbD+dNU3/p7RKZb43yjMctw6jjSoT/XuklLlBnk5ImY=;
        b=effU1oQmukhzW7msr6bxuXWQZhB5CdwIryhxItCyPu6uhdrJRhi0q5NEd6CUm0ifKn
         W1jQMWIlOG0rIE7Ygr+kclP3/p90mzbKjgWzhmN2W5ni/GLzFcXBXuGO5PgyqsIaWI02
         0WWoB2IfiSokAHdznBKit/6P4dGBZ3u0+f6D05YLFEeq/xVDO/wembrSuI9XgrXAPUeO
         1kXkdn4PxdT5attwyjA7uK/wuoxILKVVdIWk8fk541hdqSu9vIn1/Ogfk8QDfX3hOF+p
         OWoIb9C94itf+lU98XdDXK6Mm4ACV/VDLojAR6DegM1ZQcBrV6tn/h2duO4PaV8r6xjm
         WJMw==
X-Forwarded-Encrypted: i=1; AFNElJ9oGwn8n0GVtZvWM1ss8UacHrY8UCA3/i81aFE1OvwJvbfGAskrdlx71kmfToUQuhMtmXWCb1ijLUBNl/WR@lists.linux.dev
X-Gm-Message-State: AOJu0YyWI5UrvKT3MALOvdkC72dWIAcMB3KLEVBslvojddrRVfmqqBsA
	WDu4sHH90bNo2kfRjAF9IhHe3i9ophVUjXaGdhLyXHmSB1usNdl62qOe
X-Gm-Gg: Acq92OEiu7R4DzQsK0PPEXLO/g4oHs+GvxAkGjSOfIoUCJReF4+Kv7329EeYbcFuD0l
	HSqTl2fRBlkQdqPHbiWyyz7ec4l85gJHF0+yfTWgiVIRcLU2phJak23aex8gOtlW3oZv4lfzpY+
	d+xpX/Hyoh4oocCkkEOdXr8FsZtYd2TTQ/4CKaioxa6t1dG93Q8RklvSofLOz9qXCGCKX3MBddm
	+2ilwZyMB8OmOPf4ERXT0kqYxd72lp3QeJWmZOCtU/M1Z5iSIDi/zvYRVB+9bts4j1xQJPFf2Xw
	z1ie36NU8YsFecqeJLz9bT8Y8TBH+jeWBcJ5z9UmkJJkTNNycgljuB+i8d/ZvzEaTeKqi/FeOwA
	J1lxwOHMaLdhvji72qAyBwn5l1QGV931Hx7F2YZsN+6+oJwsJsUAQE/oUFb5jS/n7oVvWYH8P9L
	M2Sw6lCLcRtVBnQSt1GMccfTZm4SE=
X-Received: by 2002:a05:620a:3909:b0:915:d443:e6e1 with SMTP id af79cd13be357-9160ad97737mr250356385a.26.1781168368329;
        Thu, 11 Jun 2026 01:59:28 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160b0446f1sm126596485a.41.2026.06.11.01.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:59:26 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:16:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Marco Elver <elver@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	"Harry Yoo (Oracle)" <harry@kernel.org>
Subject: [linux-next:master 4283/12670] drivers/dma/sun6i-dma.c:792
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line
 793)
Message-ID: <202606110958.2CPRMnM0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce [4283/12670] slab: support for compiler-assisted type-based slab cache partitioning
config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606110958.2CPRMnM0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606110958.2CPRMnM0-lkp@intel.com/

smatch warnings:
drivers/dma/sun6i-dma.c:792 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line 793)
drivers/dma/sun6i-dma.c:873 sun6i_dma_prep_dma_cyclic() error: dereferencing freed memory 'v_lli' (line 874)

vim +/v_lli +792 drivers/dma/sun6i-dma.c

555859308723d8 Maxime Ripard       2014-07-17  783  	dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
9aa48806edb8c3 Samuel Holland      2022-04-24  784  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24  785  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
9aa48806edb8c3 Samuel Holland      2022-04-24  786  		sun6i_dma_dump_lli(vchan, v_lli, p_lli);
555859308723d8 Maxime Ripard       2014-07-17  787  
555859308723d8 Maxime Ripard       2014-07-17  788  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
555859308723d8 Maxime Ripard       2014-07-17  789  
4fbd804e009ae9 Maxime Ripard       2014-07-30  790  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  791  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @792  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
                                                                                                ^^^^^^^^^^^^^^^^^
9aa48806edb8c3 Samuel Holland      2022-04-24 @793  		dma_pool_free(sdev->pool, v_lli, p_lli);
                                                                                          ^^^^^
freed and then dereferenced to get the next block.

4fbd804e009ae9 Maxime Ripard       2014-07-30  794  	kfree(txd);
555859308723d8 Maxime Ripard       2014-07-17  795  	return NULL;
555859308723d8 Maxime Ripard       2014-07-17  796  }
555859308723d8 Maxime Ripard       2014-07-17  797  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  798  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
a90e173f3faf29 Jean-Francois Moine 2016-04-28  799  					struct dma_chan *chan,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  800  					dma_addr_t buf_addr,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  801  					size_t buf_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  802  					size_t period_len,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  803  					enum dma_transfer_direction dir,
a90e173f3faf29 Jean-Francois Moine 2016-04-28  804  					unsigned long flags)
a90e173f3faf29 Jean-Francois Moine 2016-04-28  805  {

[ snip ]

a90e173f3faf29 Jean-Francois Moine 2016-04-28  868  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  869  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  870  
a90e173f3faf29 Jean-Francois Moine 2016-04-28  871  err_lli_free:
9aa48806edb8c3 Samuel Holland      2022-04-24  872  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
9aa48806edb8c3 Samuel Holland      2022-04-24 @873  	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
                                                                                                ^^^^^^^^^^^^^^^^^
Same.

9aa48806edb8c3 Samuel Holland      2022-04-24 @874  		dma_pool_free(sdev->pool, v_lli, p_lli);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  875  	kfree(txd);
a90e173f3faf29 Jean-Francois Moine 2016-04-28  876  	return NULL;
a90e173f3faf29 Jean-Francois Moine 2016-04-28  877  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

