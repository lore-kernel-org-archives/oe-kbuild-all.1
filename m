Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573411BD515
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730395725; cv=none; b=Jxjja7kI7YVMdojIcjQGyx6sfRFU2DTM1/faMHvbyXSFb8H9C/CCpAtc5LU/nYQIvPLPBfp+noJhWOQTb5hJ5/l7oKMddqC6EiESrxMKnQbN41dl43SozB5keJF3aloR47kPDa1V+7A1sN87rJhV49EwDb/jT+cst4SRb/DGi8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730395725; c=relaxed/simple;
	bh=nOkBizFODnuPh3t6rBWT8dEl6qNzSmgsej3bHfzGqJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HG+V1vr9GQLYFtPCJhfb83Qdb+V5kd6molWqUcINeHC0Z+xgWQ5BQzk9TYLLZbqAprZN0QZcrJm7xoAM6knMTFPTev/HnyfOCH/qVdKxpLyCy7ZE0n1jd4oGRUfwbu3s/QVUnvkUp0o9tlFx5+y9Bh7OsN0pqH0rIORFIbqSnr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3/ctqqI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3/ctqqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730395722; x=1761931722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nOkBizFODnuPh3t6rBWT8dEl6qNzSmgsej3bHfzGqJ4=;
  b=W3/ctqqIe8SXgPpuEW7e7/yOWBIZNyC0svjqMrIUM2eh5jWkYNAfC8Vd
   nqkfOAs9f1fuTCLexKJrVpDQD3b5EAQ62EbR9MNN5AIZTdxgi1906QNjS
   sobimeYrvJBY3nu7Ht1AUr03/7qaj4SLO6TCI2rDTKvJRHvjXWVYXMvyQ
   O6zSQ5ZHM3ytXAFmlzGfWySOIyOCAnP+fJJh9/frKb5FsfgvgLwBhv2Wj
   y/H6VnBsB9iVQmBlKR2uwcd6y/EeVQzc/+C4USOprAoJVhSyUen5wDokT
   xls3YUgl0DV6Bd/rsd8EZaoVGw9xu5a4X7cdUJN9m1ElmDXjthAcPnqgr
   g==;
X-CSE-ConnectionGUID: Wyv1haKNSA+RKWnBNvkkIg==
X-CSE-MsgGUID: oOb3zf/fRw+55IOaPIS/Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="47625776"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="47625776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 10:28:42 -0700
X-CSE-ConnectionGUID: E/Kiis/CTLyb/o1j+KQD+A==
X-CSE-MsgGUID: 1jnNDL3FQrO+jgN0ZlduoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82226263"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2024 10:28:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6YyM-000gZO-1k;
	Thu, 31 Oct 2024 17:28:38 +0000
Date: Fri, 1 Nov 2024 01:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18659/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:180:6: warning: no previous prototype
 for 'uburma_jetty_event_cb'
Message-ID: <202411010152.inffSTWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c78205e40443cde6028b0539f30a00fda4167edd
commit: c3af5be3e72710b357d9f23a5bdcafe8f96d6dfd [18659/30000] ub: uburma add cmd create jetty implementation.
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010152.inffSTWn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010152.inffSTWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010152.inffSTWn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfc_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfc_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     156 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:168:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     168 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:180:6: warning: no previous prototype for 'uburma_jetty_event_cb' [-Wmissing-prototypes]
     180 | void uburma_jetty_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/uburma_jetty_event_cb +180 drivers/ub/urma/uburma/uburma_cmd.c

   179	
 > 180	void uburma_jetty_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
   181	{
   182		struct uburma_jetty_uobj *jetty_uobj;
   183	
   184		if (event->element.jetty == NULL)
   185			return;
   186	
   187		jetty_uobj = (struct uburma_jetty_uobj *)event->element.jetty->jetty_cfg.jetty_context;
   188		uburma_write_async_event(ctx, event->element.jetty->urma_jetty, event->event_type,
   189					 &jetty_uobj->async_event_list, &jetty_uobj->async_events_reported);
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
