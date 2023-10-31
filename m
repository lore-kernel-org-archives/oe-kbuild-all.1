Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1E1DFC7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lylfxgU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698770900; x=1730306900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VYlLG8Bj97MwJ67yKiE1mvonsQIgqZZal5EL2i74hxg=;
  b=lylfxgU/G35wCbJ6cJglJL8i4og3kpfb+IcwiieBNvhFcSgiM5baXtO4
   nHtml0+zg3yC0s4gYgRQS2NXSrCYMcO6A4NTGgIF8AiVTXBDKMWcJqCvx
   LAjRse/gPd7D/ctVW0WaP2thOyWXDnQSI/nEdAPz0rg9Ux+/xmVPVY4AS
   JziPdlNtcrDDx9ePkGn0qRCWFkZS2q+2violnNV//A2iUFTY90Oz+uYoK
   qriunmhfCjtz2osqqvo/xCsiIPXoKs0pdI53sOAXKHI+c3Rj9+iGjPfOk
   pBmqQ+eGXr5SwLhEyXi2zCgPAV1wEej2TaWNU2zPeXdtXc/97eU7YsVRr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="6951486"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="6951486"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="795646201"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="795646201"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Oct 2023 09:48:15 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxruX-0000Hh-03;
	Tue, 31 Oct 2023 16:48:13 +0000
Date: Wed, 1 Nov 2023 00:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tom Zanussi <zanussi@kernel.org>
Subject: kernel/trace/trace_events_synth.c:436:68: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202311010013.fm8WTxa5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a6a09e97199d6600d31383055f9d43fbbcbe86f
commit: 0934ae9977c27133449b6dd8c6213970e7eece38 tracing: Fix reading strings from synthetic events
date:   1 year, 1 month ago
config: x86_64-randconfig-x014-20230805 (https://download.01.org/0day-ci/archive/20231101/202311010013.fm8WTxa5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010013.fm8WTxa5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010013.fm8WTxa5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_events_synth.c:436:68: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *unsafe_addr @@     got char *str_val @@
   kernel/trace/trace_events_synth.c:436:68: sparse:     expected void const [noderef] __user *unsafe_addr
   kernel/trace/trace_events_synth.c:436:68: sparse:     got char *str_val

vim +436 kernel/trace/trace_events_synth.c

   404	
   405	static unsigned int trace_string(struct synth_trace_event *entry,
   406					 struct synth_event *event,
   407					 char *str_val,
   408					 bool is_dynamic,
   409					 unsigned int data_size,
   410					 unsigned int *n_u64)
   411	{
   412		unsigned int len = 0;
   413		char *str_field;
   414		int ret;
   415	
   416		if (is_dynamic) {
   417			u32 data_offset;
   418	
   419			data_offset = offsetof(typeof(*entry), fields);
   420			data_offset += event->n_u64 * sizeof(u64);
   421			data_offset += data_size;
   422	
   423			len = kern_fetch_store_strlen((unsigned long)str_val);
   424	
   425			data_offset |= len << 16;
   426			*(u32 *)&entry->fields[*n_u64] = data_offset;
   427	
   428			ret = kern_fetch_store_string((unsigned long)str_val, &entry->fields[*n_u64], entry);
   429	
   430			(*n_u64)++;
   431		} else {
   432			str_field = (char *)&entry->fields[*n_u64];
   433	
   434	#ifdef CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
   435			if ((unsigned long)str_val < TASK_SIZE)
 > 436				ret = strncpy_from_user_nofault(str_field, str_val, STR_VAR_LEN_MAX);
   437			else
   438	#endif
   439				ret = strncpy_from_kernel_nofault(str_field, str_val, STR_VAR_LEN_MAX);
   440	
   441			if (ret < 0)
   442				strcpy(str_field, FAULT_STRING);
   443	
   444			(*n_u64) += STR_VAR_LEN_MAX / sizeof(u64);
   445		}
   446	
   447		return len;
   448	}
   449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
