Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B271AAE04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718882220; cv=none; b=Li1+SwFmSdDlp4Z7jWjGy8EDAiNZMQaY8m65LrioBLePT66Gjzl9oARk2QL3RBad5klaCxSBz7LfHNoG6Uetq61fmartXRg1xPiWMWqnA1fxDtiUIUSIT54KcJApwt9d3BO+NiA7WxJJ/VZ+uazw8hDc+m22Aet9lSv9n6hJOYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718882220; c=relaxed/simple;
	bh=0fJu1gQh08k/OebXeAg434jSNLzEOXbgb7fDa/wju3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWBOBp+hBJzMuPQkiCsEQ2PzH6TZEO9S/Q9Wvu8lzsQVzNPtYAeTCt1zoRA0sQyQTqssXzdBAYiOm7aF3qX9QRRKQTjqJetz97ZRU07iZiEk+dDnVtWi+UKRZ+Jw9t4nOXwvmJdq3rLbY6Zsrmr10YPe4ojCwk86OYSnNxJMd/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dklO+czi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dklO+czi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718882219; x=1750418219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fJu1gQh08k/OebXeAg434jSNLzEOXbgb7fDa/wju3w=;
  b=dklO+czi1IUii//0VZvJcOV+kpjTWwTt27a/zOFlIu8uQsiNXR3HZIji
   EslLI5nLNwDr/r3WDEvZS8eCPrfsdRjBrjN877SDbFgPQ9abPiLNWwBt8
   nmBBAHFdvo/cDp0klLAlxWgrfFtPe8gYcMFY41q++aCbvOXwm8jDRwcXR
   4l58QCzs7/AA/AYt5OlVURDRb9gChRkdZpI/BRE+2e8rXows5tatg9eX2
   6GjOp6vciLbU4RNR6OyYHC16lLlJ/lCLnpeqvDeC6nFncaoYbhpcFYrHu
   FIkGNTi3qfdVbasYBbQp+sPuHP78P18QkQwEwVliynh46s5lryciNPAwx
   w==;
X-CSE-ConnectionGUID: arWospeTTvOyKCAYtohcbw==
X-CSE-MsgGUID: X7EgIvRVSv6y8SrmAUDQpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="38363034"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="38363034"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 04:16:59 -0700
X-CSE-ConnectionGUID: cxLRWf0VQY+3aa2tpdQfhQ==
X-CSE-MsgGUID: +Yl0zVkjS/CGLlEZ0ZUjcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42034605"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jun 2024 04:16:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKFmh-0007Yg-11;
	Thu, 20 Jun 2024 11:16:55 +0000
Date: Thu, 20 Jun 2024 19:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6957/7105] powerpc-linux-ld: smsm.c:undefined
 reference to `mbox_client_txdone'
Message-ID: <202406201931.iv5f7AuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: 066afad1eab08031372a7f693b8735ff56be0650 [6957/7105] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
config: powerpc-randconfig-003-20240315 (https://download.01.org/0day-ci/archive/20240620/202406201931.iv5f7AuE-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201931.iv5f7AuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201931.iv5f7AuE-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/soc/qcom/smsm.o: in function `qcom_smsm_remove':
   smsm.c:(.text+0x12c): undefined reference to `mbox_free_channel'
   powerpc-linux-ld: drivers/soc/qcom/smsm.o: in function `smsm_update_bits':
   smsm.c:(.text+0x218): undefined reference to `mbox_send_message'
>> powerpc-linux-ld: smsm.c:(.text+0x224): undefined reference to `mbox_client_txdone'
   powerpc-linux-ld: drivers/soc/qcom/smsm.o: in function `qcom_smsm_probe':
   smsm.c:(.text+0x5f4): undefined reference to `mbox_request_channel'
>> powerpc-linux-ld: smsm.c:(.text+0x748): undefined reference to `mbox_free_channel'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
