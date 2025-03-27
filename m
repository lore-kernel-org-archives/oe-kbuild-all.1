Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF451D0E2B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743059705; cv=none; b=SRH01dMpIhGf1eKfc3ILr8Yr4ebBgsrMcCXcw1yvWitWtnchu3MyupSXPkM+J49s8DzHmxn71qY6U1SGxtYbPLXxqEp51MYQJOz9fzL1EWOd3mx10xAnPJ6YY/nVr+/23lSplKB0QVfHfP/HklhI21SzYIAyLg9zEmRAV3SVAUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743059705; c=relaxed/simple;
	bh=/dV8Dsrd/Vo9rGSZiJ22sGbsfoz+QocOB6Hn/HBVflI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAmufrJyf7HsKnZ6egKmtojiEYwmLPzg6hdXmW3avIUsedXIwae0Lxj4Iizu5mhzDsxJJ9CHbE7P4i2EJOHK2o9i7/kKvzVVUDS6qyCa2ODZff9Hcx5c+IC366z361wAYMG4TTj9L5u65e5jgVPdHI6Rf5Xgy9tKBi0Jlj2t9uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l23I14Uf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l23I14Uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743059703; x=1774595703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/dV8Dsrd/Vo9rGSZiJ22sGbsfoz+QocOB6Hn/HBVflI=;
  b=l23I14UfTYB4RHPolzkFiVSLzdaf+LjCxbikhNPgs7L1BJgZaaFo7woN
   gt83iqkB4fb62BVDBit3Uy5kLrGwzd14qweOtIxqHLJ++MgtLon9GtFRo
   ama1jg5QtcttPqlOO7ptjrIdfkj8s5YG4PG5hrwJaMIF3sWebtffYiejT
   dvM6lOMSvD3WWkL5wxhYS2mfmCuUtY0AQDBwfHKGsEiyOLRXlcqFGSNDP
   h/RlvYYowo6JZZFtt8Z46WUx0t7vyP8Uus/d3Y9FRUcmFi4O/orxcKyY8
   5uz8+zevKs3pm/G8DOcIOg0BYRa1YSf9clzSvpshqHohelbRu/Bl9/jEa
   g==;
X-CSE-ConnectionGUID: W18b8dMBQtKF4qwneWpNoA==
X-CSE-MsgGUID: KGnrj0z0TPe/X7hQDTM1Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54579610"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="54579610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 00:15:03 -0700
X-CSE-ConnectionGUID: cjuauYm2RjOwuqXMFaj9cA==
X-CSE-MsgGUID: PZwxGz5GQmqgYhPDkbBpOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="129204736"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2025 00:14:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txhRw-0006TL-2u;
	Thu, 27 Mar 2025 07:14:49 +0000
Date: Thu, 27 Mar 2025 15:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1523/1523] drivers/edac/skx_common.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202503271455.zeSbmwpC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   69d39b683755039471781fee8dc7ed96952f771b
commit: e34047f6dc606c123911c6db8fa424bb4a035262 [1523/1523] EDAC, skx_edac: Delete duplicated code
config: x86_64-buildonly-randconfig-002-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271455.zeSbmwpC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271455.zeSbmwpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271455.zeSbmwpC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/skx_common.c: In function 'skx_mce_output_error':
   drivers/edac/skx_common.c:470:15: warning: variable 'type' set but not used [-Wunused-but-set-variable]
     470 |         char *type, *optype;
         |               ^~~~
>> drivers/edac/skx_common.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
