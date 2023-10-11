Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D3524A16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 22:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YppYA4DU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697064535; x=1728600535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2x5rQiQtIy/ec+OCgxqaM5fKFj6epXR6upHx+gE2Y0=;
  b=YppYA4DUyQFJpKnz2vf9q9MJBqzvm/gZHxoq9CoHqutPkE2WA8GFYH7W
   AVO62qhZpbqjRnokR4tm2qakA8BQ3sy5FCJ1/UShk+1kTMKzKKVEQa7Nt
   gRjBtZ5xCq4zuSQJTRE5jKkaUKC2FJsz5v5MXpzHU0XeM44reJuHKUumq
   X5Ki+njG7bkFXtq8jeTHfS7XwvckMRxvgfHPdt7MQq3AmlXumIxzdzyRv
   vL4/Xx5pZd5ECK/u3641S7K/Tbq8r3BIt3CLuHf+Ua15XAR4XimvZkzpS
   LH4uMblyVrQmTxyk7FrKOhSUBa9VThtIAPMIi9zwaBPDNBFKIjYD06rLR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3372098"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="3372098"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 15:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844745058"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="844745058"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 15:48:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqi0W-0002oE-1I;
	Wed, 11 Oct 2023 22:48:48 +0000
Date: Thu, 12 Oct 2023 06:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 189/30000]
 drivers/usb/cdns3/./trace.h:258:19: warning: format '%llx' expects argument
 of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka
 'unsigned int'}
Message-ID: <202310120630.JDY7bfKw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b9fb0731451db7abb8c3d554d88b37cd07d107c3 [189/30000] MLK-18579-1 usb: cdns3: using upstream multiple TD driver
config: arc-randconfig-001-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120630.JDY7bfKw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120630.JDY7bfKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120630.JDY7bfKw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from drivers/usb/cdns3/trace.h:446,
                    from drivers/usb/cdns3/trace.c:11:
   drivers/usb/cdns3/./trace.h: In function 'trace_raw_output_cdns3_log_aligned_request':
>> drivers/usb/cdns3/./trace.h:258:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     258 |         TP_printk("%s: req: %p, req buf %p, dma %08llx a_buf %p a_dma %08llx, size %d",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:360:29: note: in definition of macro 'DECLARE_EVENT_CLASS'
     360 |         trace_seq_printf(s, print);                                     \
         |                             ^~~~~
   drivers/usb/cdns3/./trace.h:258:9: note: in expansion of macro 'TP_printk'
     258 |         TP_printk("%s: req: %p, req buf %p, dma %08llx a_buf %p a_dma %08llx, size %d",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:394:
   drivers/usb/cdns3/./trace.h:258:54: note: format string is defined here
     258 |         TP_printk("%s: req: %p, req buf %p, dma %08llx a_buf %p a_dma %08llx, size %d",
         |                                                 ~~~~~^
         |                                                      |
         |                                                      long long unsigned int
         |                                                 %08x
   drivers/usb/cdns3/./trace.h:258:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     258 |         TP_printk("%s: req: %p, req buf %p, dma %08llx a_buf %p a_dma %08llx, size %d",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:360:29: note: in definition of macro 'DECLARE_EVENT_CLASS'
     360 |         trace_seq_printf(s, print);                                     \
         |                             ^~~~~
   drivers/usb/cdns3/./trace.h:258:9: note: in expansion of macro 'TP_printk'
     258 |         TP_printk("%s: req: %p, req buf %p, dma %08llx a_buf %p a_dma %08llx, size %d",
         |         ^~~~~~~~~
   drivers/usb/cdns3/./trace.h:258:76: note: format string is defined here
     258 |         TP_printk("%s: req: %p, req buf %p, dma %08llx a_buf %p a_dma %08llx, size %d",
         |                                                                       ~~~~~^
         |                                                                            |
         |                                                                            long long unsigned int
         |                                                                       %08x


vim +258 drivers/usb/cdns3/./trace.h

   236	
   237	DECLARE_EVENT_CLASS(cdns3_log_aligned_request,
   238		TP_PROTO(struct cdns3_request *priv_req),
   239		TP_ARGS(priv_req),
   240		TP_STRUCT__entry(
   241			__string(name, priv_req->priv_ep->name)
   242			__field(struct usb_request *, req)
   243			__field(void *, buf)
   244			__field(dma_addr_t, dma)
   245			__field(void *, aligned_buf)
   246			__field(dma_addr_t, aligned_dma)
   247			__field(u32, aligned_buf_size)
   248		),
   249		TP_fast_assign(
   250			__assign_str(name, priv_req->priv_ep->name);
   251			__entry->req = &priv_req->request;
   252			__entry->buf = priv_req->request.buf;
   253			__entry->dma = priv_req->request.dma;
   254			__entry->aligned_buf = priv_req->aligned_buf->buf;
   255			__entry->aligned_dma = priv_req->aligned_buf->dma;
   256			__entry->aligned_buf_size = priv_req->aligned_buf->size;
   257		),
 > 258		TP_printk("%s: req: %p, req buf %p, dma %08llx a_buf %p a_dma %08llx, size %d",
   259			__get_str(name), __entry->req, __entry->buf, __entry->dma,
   260			__entry->aligned_buf, __entry->aligned_dma,
   261			__entry->aligned_buf_size
   262		)
   263	);
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
