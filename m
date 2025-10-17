Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4357F332EB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760701233; cv=none; b=jKHF64ZyCUhqvKAewkZUfQreETAeMuNBU98EmsiUcbPsb0i6YdBsGJfnjTk/UzzzPRoRNc+QUjfG5cxb3HPGhifCzMq9qq9tROvy8PQa6fVAAKgkUegEPGorbSw/Fd7Adv60O3c0HJUTWRNt/UfpvJm/KM2B8A/JOUqX567knw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760701233; c=relaxed/simple;
	bh=H+chiSAxedc2A39Wqfeb2scjoEPR+SUzXc3P/ND+tCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG1e376W6J8lTUpR2K3HQEINgA8KfL5Cme149SljdtKUiU1sPNEhFHl5ziGb40EvXS3a/oDi7ov3RHQCjlvnjvC+nVxFGHWByYsnNvMrAUksKbhxClQfMVyGoXo5v4My7HbISZNk9BaewuQ4befRq4LubAQVbf+CV5inx5OhJYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2ge/SUs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2ge/SUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760701230; x=1792237230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H+chiSAxedc2A39Wqfeb2scjoEPR+SUzXc3P/ND+tCo=;
  b=X2ge/SUsN0Af6XJBGflHvzV4gWn5KxbDkBb443ClYujpxoEmqOq1x6DX
   Si6Vc1/7Up3f38WtcMZBFFLpy6SDcvgI+UfyLIX3+MlniNkjaWp5Jvlt5
   opWVCy7txjStzRsEMaQGZE1WLhZSPg4O2/oBY2YZZX4jpFdNMqvvX4aHF
   STbJUeb1SuzVc+Zapldfnx+D3igxXcoJ1GvmOr4oWot4gF1UzoWcTXHG/
   jOG2S203dBcmyYpaE762P46AY4Srpg/zwPdOgNKZfhIhc4S4ZIrnd1sJ+
   Zt73mo7BshnYdBTjfx5aZ0KExY9n1FGtAxtVm4Vj2txkeKTxdEJuIQLuB
   Q==;
X-CSE-ConnectionGUID: hXPJP1dwS824GvJkbnleIw==
X-CSE-MsgGUID: Z3WmLp3FSAScBxH1Jom9mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="61940687"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="61940687"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 04:40:29 -0700
X-CSE-ConnectionGUID: +G/7qwJWRdO/Hmchxy0waw==
X-CSE-MsgGUID: R3WwujknTTa1EVKJxWcx+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="181906754"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2025 04:40:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ior-0005v3-1Y;
	Fri, 17 Oct 2025 11:40:25 +0000
Date: Fri, 17 Oct 2025 19:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/4] vdso: Switch get/put unaligned from packed struct
 to memcpy
Message-ID: <202510171924.wxiS1KQh-lkp@intel.com>
References: <20251016205126.2882625-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016205126.2882625-3-irogers@google.com>

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on deller-parisc/for-next]
[also build test WARNING on tip/timers/vdso linus/master v6.18-rc1 next-20251016]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/parisc-Inline-a-type-punning-version-of-get_unaligned_le32/20251017-045346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
patch link:    https://lore.kernel.org/r/20251016205126.2882625-3-irogers%40google.com
patch subject: [PATCH v5 2/4] vdso: Switch get/put unaligned from packed struct to memcpy
config: nios2-randconfig-r122-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171924.wxiS1KQh-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171924.wxiS1KQh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171924.wxiS1KQh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   drivers/infiniband/core/cm.c: note: in included file (through include/rdma/ibta_vol1_c12.h, drivers/infiniband/core/cm_msgs.h):
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
   drivers/infiniband/core/cm.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   drivers/infiniband/core/cm.c: note: in included file (through include/rdma/ibta_vol1_c12.h, drivers/infiniband/core/cm_msgs.h):
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
   drivers/infiniband/core/cm.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   drivers/infiniband/core/cm.c: note: in included file (through include/rdma/ibta_vol1_c12.h, drivers/infiniband/core/cm_msgs.h):
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
   drivers/infiniband/core/cm.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   drivers/infiniband/core/cm.c: note: in included file (through include/rdma/ibta_vol1_c12.h, drivers/infiniband/core/cm_msgs.h):
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
   drivers/infiniband/core/cm.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini

vim +48 include/rdma/iba.h

d05d4ac4c9316a Leon Romanovsky 2020-01-16  41  
d05d4ac4c9316a Leon Romanovsky 2020-01-16  42  static inline u64 _iba_get64(const __be64 *ptr)
d05d4ac4c9316a Leon Romanovsky 2020-01-16  43  {
d05d4ac4c9316a Leon Romanovsky 2020-01-16  44  	/*
d05d4ac4c9316a Leon Romanovsky 2020-01-16  45  	 * The mads are constructed so that 32 bit and smaller are naturally
d05d4ac4c9316a Leon Romanovsky 2020-01-16  46  	 * aligned, everything larger has a max alignment of 4 bytes.
d05d4ac4c9316a Leon Romanovsky 2020-01-16  47  	 */
d05d4ac4c9316a Leon Romanovsky 2020-01-16 @48  	return be64_to_cpu(get_unaligned(ptr));
d05d4ac4c9316a Leon Romanovsky 2020-01-16  49  }
d05d4ac4c9316a Leon Romanovsky 2020-01-16  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
