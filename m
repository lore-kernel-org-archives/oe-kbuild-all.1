Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5402198823
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 04:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739852531; cv=none; b=uVQJDhfQwSnGdvRdEBOGtFqJPm1wR+PqfyH/MF3SlaemuXmgBinr3VTSsijEMSwcPQ444R/WWeHL5Eoq9quTqUKE0QSyzkni9e3VyifGJckyhJqC1U/fNtIEVftGI7HRHSJvcvl6AWnVhWKfCeTSsT98dEosySmuciQ0ZYdq0Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739852531; c=relaxed/simple;
	bh=z/TatgOE6ERquHYJ+CpTz6Po69K65ZiMKYHblH7M3gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPFnYIwRFdoBLsvejVnwJISMI8HZxWB7c8SFdk2Mq0mY93rWIbZ8Nd2tYoYirrIBLoA46lDmiYkCZKC8VVn3GzjqJiJripcFGetfm8XB9zmfpBznHha3cr6RvmSH9kGw4Zp6xMtbnw9hgKzTKRoK2HCPHGiXzLUNRbwJs6OeXjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0p306wl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0p306wl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739852529; x=1771388529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z/TatgOE6ERquHYJ+CpTz6Po69K65ZiMKYHblH7M3gY=;
  b=M0p306wlK3zIbbU4fLtz89aMsvwZgLD3ZHHq7jDKcz5mtUz7YS2EEKEv
   I62gQiB9++ZL9FBp5mUjF50cr/GQH0Gb3kR8fh0SK7t3QMPhMdbqvYXAG
   WhyGvQl8n+Lp6wNENtjRpHqprx2EOxMqj+NFg/IfyIPakntmsZ4rao1YN
   JzWvOw3BFGUuu6zWYfumo963BFUoZEZIjatBahcLDokbi/V2EMpBrr4xC
   npKXuw7/tMkCMV5cc/zuj6bCZs2+IbuG/UsLQh4JqAKpnZoatxTjhqPtR
   Jg0thMaIieWVwsadNkxkMuN413FrgLA4qj7xbsXL8OCGuQlat/LxriePV
   w==;
X-CSE-ConnectionGUID: AtTlRILkQjaFWXYcvDS0sA==
X-CSE-MsgGUID: vui60wX8T/Sv9pv1OYNq/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="57940472"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="57940472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 20:22:08 -0800
X-CSE-ConnectionGUID: WOnlaqJ8RNeXRYZqWE+4hw==
X-CSE-MsgGUID: j7RMc4BmTkK6fGt0P0FYrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="114478113"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2025 20:22:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkF7U-00009j-33;
	Tue, 18 Feb 2025 04:22:04 +0000
Date: Tue, 18 Feb 2025 12:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 05/10] pstore: implement core area registration
Message-ID: <202502181221.ImSQYXh4-lkp@intel.com>
References: <20250217101706.2104498-6-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217101706.2104498-6-eugen.hristev@linaro.org>

Hi Eugen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on kees/for-next/kspp driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.14-rc3 next-20250217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/pstore-zone-move-pstore_device_info-into-zone-header/20250217-182615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20250217101706.2104498-6-eugen.hristev%40linaro.org
patch subject: [RFC][PATCH 05/10] pstore: implement core area registration
config: arm-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181221.ImSQYXh4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181221.ImSQYXh4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181221.ImSQYXh4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/pstore/platform.c: In function 'pstore_unregister_core_area':
   fs/pstore/platform.c:316:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     316 |         int ret;
         |             ^~~
   fs/pstore/platform.c: In function 'pstore_register_core_area':
>> fs/pstore/platform.c:299:17: warning: 'strncpy' specified bound 8 equals destination size [-Wstringop-truncation]
     299 |                 strncpy(record->priv, handle, 8);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +299 fs/pstore/platform.c

   280	
   281	int pstore_register_core_area(const char *handle, void *area, size_t size)
   282	{
   283		struct rec_list_t *rec_element = kzalloc(sizeof (*rec_element), GFP_KERNEL);
   284		struct pstore_record *record = &rec_element->rec;
   285		int ret;
   286	
   287		if (!psinfo || !psinfo->register_dmr) {
   288			pr_err("No pstore available ! Bailing out.\n");
   289			return -EAGAIN;
   290		}
   291	
   292		pstore_record_init(record, psinfo);
   293		record->type = PSTORE_TYPE_DMAPPED;
   294		record->buf = area;
   295		record->size = size;
   296	
   297		if (handle) {
   298			record->priv = kmalloc(8, GFP_KERNEL);
 > 299			strncpy(record->priv, handle, 8);
   300		}
   301	
   302		mutex_lock(&ps_dmr_lock);
   303	
   304		ret = psinfo->register_dmr(record);
   305		if (!ret)
   306			list_add(&rec_element->list, &rec_list);
   307	
   308		mutex_unlock(&ps_dmr_lock);
   309		return ret;
   310	}
   311	EXPORT_SYMBOL_GPL(pstore_register_core_area);
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
