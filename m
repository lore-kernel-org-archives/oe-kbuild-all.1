Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E2AD4B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860774; cv=none; b=SiVo4533bTr6SIWjwVjflcG++tJY07Y9khsOSOha6je5kvwYNo7aFz/jVmTM4iKmVGYYltE2wChlM1qy1B61egwK25Mse7q150Zm2qn82PVP8oT4nNohfcC7utmr2eut8k+17XI6aJQbDtjitEHN7A97OS69M/JUEfv8CBbSvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860774; c=relaxed/simple;
	bh=p/geQpQiHdrtjqDO8o1vrkqzfTpP7paV1Ebj9R5iztM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QffGPtjPivCotPDYpaTaNIZKEDzIaHgM82Jda5M7xZ1tXqm3kq/IxOeO1Xwt1yp4fJ2uXpHHPolIeTwNp1glhIIBGEFfAOTU6Zw50Pzcr7s7pb9wlHnFsx3Z8m1A4xPVOsvkQ1bUH7ZG++wisEc8E53gCpjwXQfZSI/JFNlrL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVF11xUM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVF11xUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760860773; x=1792396773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p/geQpQiHdrtjqDO8o1vrkqzfTpP7paV1Ebj9R5iztM=;
  b=dVF11xUMy1VD1Y2cv91daoKeeTY7pbEZH43I7R9aBrWTyIItvwbtEuap
   BN1xLxdTfXLASip/QChSptX7N/7R/vCXIgti8zK3tDSKU7b9IjocKfYWq
   R11wxiupJuJWFshMwT9YeyF8dS0APdTkzPWsQi1exwlBKhZdeRUPQbJaQ
   d47KbTWzFZYpUOhPeSpcvfMstRApaoqgVXa0eBBB4DHvq80BZvDBnqDgk
   op3g+1WkQxn/bl3T3DImnVHqOeEaJBxh0F9cSaqSPBS3QLnavL+BYLFyO
   Pw9LHGz5dJQdqZG1yNgmCkrqG5JHvfzqXD/YnImo2toeuv6ZTAdcKb+nw
   A==;
X-CSE-ConnectionGUID: uF6Mhn8wSR6iLzRAS7e/IQ==
X-CSE-MsgGUID: /pUzLbpNTT+Q8859b4NE9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66848203"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66848203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 00:59:33 -0700
X-CSE-ConnectionGUID: J94Vfm9XRfCcflZJAYonUg==
X-CSE-MsgGUID: tyle5pujQj+QaeZ7FCeq7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="182635282"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2025 00:59:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAOJl-0008vp-1B;
	Sun, 19 Oct 2025 07:59:22 +0000
Date: Sun, 19 Oct 2025 15:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Patch v2 01/16] kexec: Introduce multikernel support via
 kexec
Message-ID: <202510191541.uuglmICk-lkp@intel.com>
References: <20251019061631.2235405-2-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019061631.2235405-2-xiyou.wangcong@gmail.com>

Hi Cong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on powerpc/next powerpc/fixes robh/for-next linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/kexec-Introduce-multikernel-support-via-kexec/20251019-141940
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251019061631.2235405-2-xiyou.wangcong%40gmail.com
patch subject: [RFC Patch v2 01/16] kexec: Introduce multikernel support via kexec
config: x86_64-buildonly-randconfig-002-20251019 (https://download.01.org/0day-ci/archive/20251019/202510191541.uuglmICk-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191541.uuglmICk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191541.uuglmICk-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kexec_core.c: In function 'multikernel_kexec':
>> kernel/kexec_core.c:1334:14: error: implicit declaration of function 'multikernel_kick_ap'; did you mean 'multikernel_kexec'? [-Werror=implicit-function-declaration]
    1334 |         rc = multikernel_kick_ap(cpu, kexec_image->start);
         |              ^~~~~~~~~~~~~~~~~~~
         |              multikernel_kexec
   cc1: some warnings being treated as errors


vim +1334 kernel/kexec_core.c

  1314	
  1315	int multikernel_kexec(int cpu)
  1316	{
  1317		int rc;
  1318	
  1319		pr_info("multikernel kexec: cpu %d\n", cpu);
  1320	
  1321		if (cpu_online(cpu)) {
  1322			pr_err("The CPU is currently running with this kernel instance.");
  1323			return -EBUSY;
  1324		}
  1325	
  1326		if (!kexec_trylock())
  1327			return -EBUSY;
  1328		if (!kexec_image) {
  1329			rc = -EINVAL;
  1330			goto unlock;
  1331		}
  1332	
  1333		cpus_read_lock();
> 1334		rc = multikernel_kick_ap(cpu, kexec_image->start);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
