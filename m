Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5C4C62
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 00:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739839676; cv=none; b=NwXhMOUbqeQc4HQCAjsde17CsfsDChDeRdfDT7NQjxbNpaCuHpO+jgL5VxVpJp9wqBgvC8z2zfH8QozNb4F0yHyp3+5dsfRmjKT/u0NnJX64mJqpXH8buqfDjTQRXDaWGKvSsfCcOSF00dIcNrb+bfHv8bAYcyuiRrdUygwF35g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739839676; c=relaxed/simple;
	bh=Mzz4KZgb0sqhQDyzlEoaheOtbuaH9wKYGIvY+j6tNpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJnJ0Ttarks5fvzFBMUj0Vzz13KFLxsFqjHNctbGE2d40WuC9F30k9spdxW1ZJpkKLD/7u/hqMA3RJIX/We1HItl9jkZgDy9ExJvo4T+1gmhi7ZY71vEySywMi0vAf55/Zzh9i4Pt59RUprfojXEW+vLOF+xl9NDUqK7rSES2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ec73izxu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ec73izxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739839675; x=1771375675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mzz4KZgb0sqhQDyzlEoaheOtbuaH9wKYGIvY+j6tNpQ=;
  b=ec73izxuxR/5pGNRLbJi6vcBVWkEF/9zwWE86YFfpoBA/8QFF1FT4lxO
   vIn+x3OE4dgng8iMFhC9R7aNZjii5To+oOeMa3iD8V0pJkq52RJ+3RYDI
   eo9utserPOZIvruY9jwGcB6BgGslh7qwF/qG0+1N6HUXGlAA+MmFot9xY
   Z046lj24FxA6O21byofbDkh6HC743yHLUa7tvNe4e4+MbCl56lqJqhYoB
   v0FG7w21GKCtVDszrp8RzcTIK2CusEdqIIQTmySf3/14pp9j/cdboFZkg
   UwpZz2sdwVHghLimlPiqOKubk2m3obSthM1ZUXaUvj242hvpCVrc5wWDe
   A==;
X-CSE-ConnectionGUID: foxhYUAvSZKgl5Vbx+CYIg==
X-CSE-MsgGUID: bzmOB1U4RueyTNzwWmUemw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51953138"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51953138"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 16:47:54 -0800
X-CSE-ConnectionGUID: O7SMFwn7QViKliHuqo22Ig==
X-CSE-MsgGUID: 3JgDybYuQJaXmdFzIz9UBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="113984136"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2025 16:47:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkBmA-001Dk7-2e;
	Tue, 18 Feb 2025 00:47:50 +0000
Date: Tue, 18 Feb 2025 08:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 03/10] pstore/zone: introduce directly mapped zones
Message-ID: <202502180829.397JnTMl-lkp@intel.com>
References: <20250217101706.2104498-4-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217101706.2104498-4-eugen.hristev@linaro.org>

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
patch link:    https://lore.kernel.org/r/20250217101706.2104498-4-eugen.hristev%40linaro.org
patch subject: [RFC][PATCH 03/10] pstore/zone: introduce directly mapped zones
config: i386-buildonly-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250218/202502180829.397JnTMl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180829.397JnTMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180829.397JnTMl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/pstore/zone.c:141: warning: Function parameter or struct member 'dmszs' not described in 'psz_context'
>> fs/pstore/zone.c:141: warning: Function parameter or struct member 'dmapped_max_cnt' not described in 'psz_context'


vim +141 fs/pstore/zone.c

d26c3321fe18dc7 WeiXiong Liao 2020-03-25   88  
d26c3321fe18dc7 WeiXiong Liao 2020-03-25   89  /**
d26c3321fe18dc7 WeiXiong Liao 2020-03-25   90   * struct psz_context - all about running state of pstore/zone
d26c3321fe18dc7 WeiXiong Liao 2020-03-25   91   *
d26c3321fe18dc7 WeiXiong Liao 2020-03-25   92   * @kpszs: kmsg dump storage zones
0dc068265a1c592 WeiXiong Liao 2020-03-25   93   * @ppsz: pmsg storage zone
cc9c4d1b5597167 WeiXiong Liao 2020-03-25   94   * @cpsz: console storage zone
34327e9fd213414 WeiXiong Liao 2020-03-25   95   * @fpszs: ftrace storage zones
d26c3321fe18dc7 WeiXiong Liao 2020-03-25   96   * @kmsg_max_cnt: max count of @kpszs
d26c3321fe18dc7 WeiXiong Liao 2020-03-25   97   * @kmsg_read_cnt: counter of total read kmsg dumps
d26c3321fe18dc7 WeiXiong Liao 2020-03-25   98   * @kmsg_write_cnt: counter of total kmsg dump writes
0dc068265a1c592 WeiXiong Liao 2020-03-25   99   * @pmsg_read_cnt: counter of total read pmsg zone
cc9c4d1b5597167 WeiXiong Liao 2020-03-25  100   * @console_read_cnt: counter of total read console zone
34327e9fd213414 WeiXiong Liao 2020-03-25  101   * @ftrace_max_cnt: max count of @fpszs
34327e9fd213414 WeiXiong Liao 2020-03-25  102   * @ftrace_read_cnt: counter of max read ftrace zone
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  103   * @oops_counter: counter of oops dumps
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  104   * @panic_counter: counter of panic dumps
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  105   * @recovered: whether finished recovering data from storage
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  106   * @on_panic: whether panic is happening
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  107   * @pstore_zone_info_lock: lock to @pstore_zone_info
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  108   * @pstore_zone_info: information from backend
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  109   * @pstore: structure for pstore
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  110   */
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  111  struct psz_context {
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  112  	struct pstore_zone **kpszs;
0dc068265a1c592 WeiXiong Liao 2020-03-25  113  	struct pstore_zone *ppsz;
cc9c4d1b5597167 WeiXiong Liao 2020-03-25  114  	struct pstore_zone *cpsz;
34327e9fd213414 WeiXiong Liao 2020-03-25  115  	struct pstore_zone **fpszs;
da841d31ac7ea7b Eugen Hristev 2025-02-17  116  	struct pstore_zone **dmszs;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  117  	unsigned int kmsg_max_cnt;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  118  	unsigned int kmsg_read_cnt;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  119  	unsigned int kmsg_write_cnt;
0dc068265a1c592 WeiXiong Liao 2020-03-25  120  	unsigned int pmsg_read_cnt;
cc9c4d1b5597167 WeiXiong Liao 2020-03-25  121  	unsigned int console_read_cnt;
34327e9fd213414 WeiXiong Liao 2020-03-25  122  	unsigned int ftrace_max_cnt;
34327e9fd213414 WeiXiong Liao 2020-03-25  123  	unsigned int ftrace_read_cnt;
da841d31ac7ea7b Eugen Hristev 2025-02-17  124  	unsigned int dmapped_max_cnt;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  125  	/*
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  126  	 * These counters should be calculated during recovery.
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  127  	 * It records the oops/panic times after crashes rather than boots.
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  128  	 */
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  129  	unsigned int oops_counter;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  130  	unsigned int panic_counter;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  131  	atomic_t recovered;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  132  	atomic_t on_panic;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  133  
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  134  	/*
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  135  	 * pstore_zone_info_lock protects this entire structure during calls
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  136  	 * to register_pstore_zone()/unregister_pstore_zone().
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  137  	 */
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  138  	struct mutex pstore_zone_info_lock;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  139  	struct pstore_zone_info *pstore_zone_info;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  140  	struct pstore_info pstore;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25 @141  };
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  142  static struct psz_context pstore_zone_cxt;
d26c3321fe18dc7 WeiXiong Liao 2020-03-25  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
