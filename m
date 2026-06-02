Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538A13BE17D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405066; cv=none; b=AIVGFcepneQneC1fgSRpwAWNpzPq9/Wjv/HsWWaZHhMRu0Zd8/H8XY+5MJjbXPb30WGrmngsJgi7kOf+gTtZFd8r+3Uq6D95OzyNBVpTfpc/sPTF2A2BIqKJtpJr0zY4BpAeXPcsyoXCoDCnQOztA/R9Jtv8KaS/xVRehjRP+Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405066; c=relaxed/simple;
	bh=yWJ8jbOp8Qki3VbKm7Kf0osmZhjpVgXHMVlz2+rtak0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fM/THzoeFgnu+MkDDYFpndrmMJGjU8V6Ss1NrdpEZeFTHdFS79aueU8Fx7McpH873gRPNDvTUMx1iVwo+AUM0bJgxGGZBypcK3+S8JyZauOxt/Lfk1ygceMdPmfPtXpFqFbZQ5KXpQe4dvAm0R7289YqOatxOf+DXUeWBSFMyXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuoUd67T; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuoUd67T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780405065; x=1811941065;
  h=date:from:to:cc:subject:message-id;
  bh=yWJ8jbOp8Qki3VbKm7Kf0osmZhjpVgXHMVlz2+rtak0=;
  b=SuoUd67Ta99vsb/Y5KSZloSH/UpJ0hm7sxnShWoQDiFGQCOkmVRAqQrE
   mHZ+MuCV9RV56u/EgBTaLs+wrevgqb1Ni0iykeoyWSPvUTfxDtM2vF9Ju
   czwJEJeEdoyg/snO4d3tCujAtO3ItEmqtyr8QUS6xiXhVGf8XKMRFBjL1
   DYuU31CePQW3pvRZm6X0/FJAevM7INBUxb+Ip62bL9s9BD90QDzRJG8cA
   48+GHzSPxVxWIaMRanyp3s5CG6HKR5aWfKXtLsjNpI6iyMid221wGN1Ub
   c8hmwsq7pqw79nywo5KlQLIyy2AXjGbspSqMUXnJ0HoO0muf/+Ep0yapP
   Q==;
X-CSE-ConnectionGUID: m/yvSwcuTnCqrxeLhMguYQ==
X-CSE-MsgGUID: jYfPIBmxTaaPeVXne+WW5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98751325"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="98751325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 05:57:44 -0700
X-CSE-ConnectionGUID: 69ULqNDBR3KDLhy4zQaVCg==
X-CSE-MsgGUID: WMYgl2mzSbG7Fsj6vDpHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="247856569"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jun 2026 05:57:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUOge-00000000C2o-3MKk;
	Tue, 02 Jun 2026 12:57:40 +0000
Date: Tue, 02 Jun 2026 20:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sbates130272-p2pmem:switchtec-dma-sysfs 4/4]
 drivers/dma/switchtec_dma.c:1198:55: error: 'readw' undeclared; did you mean
 'readsw'?
Message-ID: <202606022007.RkJdh1xY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sbates130272/linux-p2pmem.git switchtec-dma-sysfs
head:   7de58d38d826e9043f1c21054c804d326563a84a
commit: 7de58d38d826e9043f1c21054c804d326563a84a [4/4] dmaengine: switchtec-dma: Add pmon sysfs attributes
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606022007.RkJdh1xY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022007.RkJdh1xY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022007.RkJdh1xY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma/switchtec_dma.c: In function 'se_pending_show':
>> drivers/dma/switchtec_dma.c:1198:55: error: 'readw' undeclared (first use in this function); did you mean 'readsw'?
    1198 |         return pmon_show(chan, page, perf_se_pending, readw);
         |                                                       ^~~~~
   drivers/dma/switchtec_dma.c:1177:31: note: in definition of macro 'pmon_show'
    1177 |                 __pmon_val = (reader)(&__chan_fw->field);                    \
         |                               ^~~~~~
   drivers/dma/switchtec_dma.c:1198:55: note: each undeclared identifier is reported only once for each function it appears in
    1198 |         return pmon_show(chan, page, perf_se_pending, readw);
         |                                                       ^~~~~
   drivers/dma/switchtec_dma.c:1177:31: note: in definition of macro 'pmon_show'
    1177 |                 __pmon_val = (reader)(&__chan_fw->field);                    \
         |                               ^~~~~~
   drivers/dma/switchtec_dma.c: In function 'se_buf_empty_show':
   drivers/dma/switchtec_dma.c:1204:57: error: 'readw' undeclared (first use in this function); did you mean 'readsw'?
    1204 |         return pmon_show(chan, page, perf_se_buf_empty, readw);
         |                                                         ^~~~~
   drivers/dma/switchtec_dma.c:1177:31: note: in definition of macro 'pmon_show'
    1177 |                 __pmon_val = (reader)(&__chan_fw->field);                    \
         |                               ^~~~~~
   drivers/dma/switchtec_dma.c: In function 'chan_idle_show':
>> drivers/dma/switchtec_dma.c:1210:54: error: 'readl' undeclared (first use in this function); did you mean 'readsl'?
    1210 |         return pmon_show(chan, page, perf_chan_idle, readl);
         |                                                      ^~~~~
   drivers/dma/switchtec_dma.c:1177:31: note: in definition of macro 'pmon_show'
    1177 |                 __pmon_val = (reader)(&__chan_fw->field);                    \
         |                               ^~~~~~
   drivers/dma/switchtec_dma.c: In function 'latency_max_show':
   drivers/dma/switchtec_dma.c:1216:52: error: 'readl' undeclared (first use in this function); did you mean 'readsl'?
    1216 |         return pmon_show(chan, page, perf_lat_max, readl);
         |                                                    ^~~~~
   drivers/dma/switchtec_dma.c:1177:31: note: in definition of macro 'pmon_show'
    1177 |                 __pmon_val = (reader)(&__chan_fw->field);                    \
         |                               ^~~~~~
   drivers/dma/switchtec_dma.c: In function 'latency_min_show':
   drivers/dma/switchtec_dma.c:1222:52: error: 'readl' undeclared (first use in this function); did you mean 'readsl'?
    1222 |         return pmon_show(chan, page, perf_lat_min, readl);
         |                                                    ^~~~~
   drivers/dma/switchtec_dma.c:1177:31: note: in definition of macro 'pmon_show'
    1177 |                 __pmon_val = (reader)(&__chan_fw->field);                    \
         |                               ^~~~~~
   drivers/dma/switchtec_dma.c: In function 'latency_last_show':
   drivers/dma/switchtec_dma.c:1228:53: error: 'readl' undeclared (first use in this function); did you mean 'readsl'?
    1228 |         return pmon_show(chan, page, perf_lat_last, readl);
         |                                                     ^~~~~
   drivers/dma/switchtec_dma.c:1177:31: note: in definition of macro 'pmon_show'
    1177 |                 __pmon_val = (reader)(&__chan_fw->field);                    \
         |                               ^~~~~~


vim +1198 drivers/dma/switchtec_dma.c

  1195	
  1196	static ssize_t se_pending_show(struct dma_chan *chan, char *page)
  1197	{
> 1198		return pmon_show(chan, page, perf_se_pending, readw);
  1199	}
  1200	static struct dma_chan_sysfs_entry se_pending_attr = __ATTR_RO(se_pending);
  1201	
  1202	static ssize_t se_buf_empty_show(struct dma_chan *chan, char *page)
  1203	{
  1204		return pmon_show(chan, page, perf_se_buf_empty, readw);
  1205	}
  1206	static struct dma_chan_sysfs_entry se_buf_empty_attr = __ATTR_RO(se_buf_empty);
  1207	
  1208	static ssize_t chan_idle_show(struct dma_chan *chan, char *page)
  1209	{
> 1210		return pmon_show(chan, page, perf_chan_idle, readl);
  1211	}
  1212	static struct dma_chan_sysfs_entry chan_idle_attr = __ATTR_RO(chan_idle);
  1213	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
