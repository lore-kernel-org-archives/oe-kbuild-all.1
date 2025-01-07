Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7851EE7D3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254596; cv=none; b=OlzbWFUp3ckgU4ugBdAC3iU0iZny382/2rasDqNgm0XpSGAkU1KIBHgV17dNv18i0AkEqkln7GCOFlTPrbyakv+Sr95Y9/kM9SopcqppuVo9W2fV8dINfpxIJfaHsI7VhXccSuTMoV+ab7ItsPjVevWkHXNgjCeK0BtGkVcRmwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254596; c=relaxed/simple;
	bh=QFYF/l9CwdEYUIzxxMAbX3RInAJJ2lo+D6OmFn+35Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eaxsa+xLef0KRAUk5RaBJQhuDGXdBkfHb6NN/FLL8idrDoHyQDjie/8lZXN9grpgQZVbmviosKozyLLVkWjJ77Hj4q9p0tDsrW5m0h9U52+hvUJcs+tNNXRkyOX2TiOY9VPO/gviBcgfRBJ4OcAOuzOek8ItbyLW2U9faztnbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dn0tpvJV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dn0tpvJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736254594; x=1767790594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QFYF/l9CwdEYUIzxxMAbX3RInAJJ2lo+D6OmFn+35Y8=;
  b=Dn0tpvJVwKueBKjyl6oXQtnyvyfihj4ycBGLGMTddiCjNmBBSCOcOs02
   h7BPIzHUG5CIJzQ6aj2XhMqinMBFMl6ZnH9TE7oRHIBlFh8ujmFiuT/5R
   cASzbP1p8AA7GgQCot4c+iPdMVJKT+PzVfqtoMKk28LA6CfTCTPCjsQSf
   K8EFYmFrrOH+QgybJgfJck9cvIIFCmm7KW7fB0B4RZjvn1QLPFnieGMie
   YswuDbB5M7f8GcXlt1O0ekzupQgUUhFHXyEi4PDp/DUC13Doa/lfomWtn
   p6kWS9wdhQhsNlAIvf0LFTJO2zYiTniH8GP3UxUuhkj6jWHLa0IUyGE/3
   Q==;
X-CSE-ConnectionGUID: qhytejSoRZiCnyYisXz4tQ==
X-CSE-MsgGUID: rV7hGjRGS0+ebhvVQwNadg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40381912"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="40381912"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 04:56:33 -0800
X-CSE-ConnectionGUID: VhdKI6TZRAiUCXjZ3kcw7A==
X-CSE-MsgGUID: FcDoIo5FT1SzSLx2DbfQRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="103270931"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jan 2025 04:56:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV98I-000EhW-0L;
	Tue, 07 Jan 2025 12:56:30 +0000
Date: Tue, 7 Jan 2025 20:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 1/1]
 kernel/trace/trace_events_synth.c:436:68: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202501072010.tL94nVVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-01
head:   bd15ae767bd293b77e31786ef49abaee8cc016d8
commit: 0934ae9977c27133449b6dd8c6213970e7eece38 [1/1] tracing: Fix reading strings from synthetic events
config: i386-randconfig-061-20250107 (https://download.01.org/0day-ci/archive/20250107/202501072010.tL94nVVl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501072010.tL94nVVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501072010.tL94nVVl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_events_synth.c:436:68: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *unsafe_addr @@     got char *str_val @@
   kernel/trace/trace_events_synth.c:436:68: sparse:     expected void const [noderef] __user *unsafe_addr
   kernel/trace/trace_events_synth.c:436:68: sparse:     got char *str_val
   kernel/trace/trace_events_synth.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false

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
