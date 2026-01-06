Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6120D320A38
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767694488; cv=none; b=Dv7JtG8v03Yy4bNyP5G9Sj+KVZjqgARik42JB/3RQNoROuwUjzbwV7SkadtkhDllTut63uEhqp+j4jDhsId1LVYXphptLoMgA+hfQFhJ6cu/GoV09bFEaaNR5WMnVcVW9y2KA+xrss7oQWOS5yWGb73dARvhI5wxsJ8/QDnpmoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767694488; c=relaxed/simple;
	bh=sDztLvIfwElPPDcvYQrOJ+t3hj3Fqoh9XCO4v8zKoss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kodub5DBvHk+YQxDMR2HMJkRRxAGwcfVn4L8FYNHIVt6btgMvCEGzSpCVrDbiVvWtS/bxolENOeGUQ6yAVnIRQZbc7al8uYTub24S5ZqFhzara45kt+BioXID+C0ux+41Vu8K9fzMLs1F4bWF1aFrGSsmAWpmMBF0SPKlLI4BjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzWDaFf2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzWDaFf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767694486; x=1799230486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sDztLvIfwElPPDcvYQrOJ+t3hj3Fqoh9XCO4v8zKoss=;
  b=KzWDaFf24Ef36H8rj6s8wQ59PTBgnventMnX6ftFKLKhazBPBE1D8y8+
   RTwMtdrQ0UTAJ8yPW349IoEm6qcpyEHxAhsh6mC3mJffK447LL7oY0hJT
   mi+H3sjdrxC0gGFAnZ7mkvKbVV2lhwMt395GnTBPuI5BIMZZtOy1q4OrG
   QCp9k7ZBGr3EUxqfif4c18bcBYhQAr6MsoQdkKtfPZ7uSb4XJaZJnP6x3
   94TT/IFkF+LG524MqcRwPfZgcmimCACulINelu0jdjCpl3Xglm401MWlm
   RJ79DkuwJBmZI9QF97nsDULIKSNQ5jPfr0iOB6mMSgcGxInZqQUdAl6aD
   A==;
X-CSE-ConnectionGUID: Tl3K9uo5Sui0LxsZmsDQ2A==
X-CSE-MsgGUID: +GTlozRMTXOAivsCB4ix3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79364130"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="79364130"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 02:14:45 -0800
X-CSE-ConnectionGUID: MxqnSe1jST+w3Q4iRBwWxA==
X-CSE-MsgGUID: aOemlkENR/W099JlcmEJ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="226166652"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2026 02:14:45 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd45K-000000001IL-3VYX;
	Tue, 06 Jan 2026 10:14:42 +0000
Date: Tue, 6 Jan 2026 11:13:57 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Ballasi <tballasi@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] mm: vmscan: add PIDs to vmscan tracepoints
Message-ID: <202601061150.pQxuWNUJ-lkp@intel.com>
References: <20260105160423.23708-3-tballasi@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105160423.23708-3-tballasi@linux.microsoft.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Ballasi/mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints/20260106-000721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260105160423.23708-3-tballasi%40linux.microsoft.com
patch subject: [PATCH v3 2/2] mm: vmscan: add PIDs to vmscan tracepoints
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260106/202601061150.pQxuWNUJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061150.pQxuWNUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061150.pQxuWNUJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/vmscan.h:569,
                    from mm/vmscan.c:73:
   include/trace/events/vmscan.h: In function 'trace_raw_output_mm_vmscan_direct_reclaim_begin_template':
>> include/trace/events/vmscan.h:140:17: error: implicit declaration of function '__event_in_irq' [-Wimplicit-function-declaration]
     140 | +               __event_in_irq() ? "(in-irq)" : "")
         |                 ^~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/events/vmscan.h:135:9: note: in expansion of macro 'TP_printk'
     135 |         TP_printk("order=%d gfp_flags=%s pid=%d memcg_id=%u %s",
         |         ^~~~~~~~~


vim +/__event_in_irq +140 include/trace/events/vmscan.h

   116	
   117		TP_PROTO(gfp_t gfp_flags, int order, unsigned short memcg_id),
   118	
   119		TP_ARGS(gfp_flags, order, memcg_id),
   120	
   121		TP_STRUCT__entry(
   122			__field(	unsigned long,	gfp_flags	)
   123			__field(	int,	order		)
   124			__field(	int,	pid		)
   125			__field(	unsigned short,	memcg_id	)
   126		),
   127	
   128		TP_fast_assign(
   129			__entry->gfp_flags	= (__force unsigned long)gfp_flags;
   130			__entry->order		= order;
   131			__entry->pid		= current->pid;
   132			__entry->memcg_id	= memcg_id;
   133		),
   134	
   135		TP_printk("order=%d gfp_flags=%s pid=%d memcg_id=%u %s",
   136			__entry->order,
   137			show_gfp_flags(__entry->gfp_flags),
   138			__entry->pid,
   139			__entry->memcg_id,
 > 140	+		__event_in_irq() ? "(in-irq)" : "")
   141	);
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
