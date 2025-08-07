Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2A72AE68
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 01:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754530527; cv=none; b=QAThazPE9aY9mX8/Ubii/uU7LQTeKp3IawHM0mdY7S4eMTnwNbFy/kPgmuxEPCUyKH8QayfWEUNQrsi9xyBuK4dkevUdUigZRJ/Cl4HY0nYmkA2SnztnjnLGHmYvEuQ6NK8wPgN4Wza4z5ixwnEJF82cZXcwOYlrlEj1yDu+Tm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754530527; c=relaxed/simple;
	bh=1C0AemSuhJiTUN7RIn9YFnJCBE9dYHY1hgf6TqN8Erk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqWxIrAML7xG02UEZdhc/cno0rc1Kdc2+oKevrFDqFjhhA1MFag0BKmzp+tfCOhui6mnlFeGGAzwcqKQDiyP97AdRHlUJ1V6Zc2rT/38jNqNCRek6EieKA0oDWu4HpB8vynowosywTZe1RpMIxv0l1VVtCARfRwgWRAZefUaiY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3Nd63yo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3Nd63yo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754530525; x=1786066525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1C0AemSuhJiTUN7RIn9YFnJCBE9dYHY1hgf6TqN8Erk=;
  b=J3Nd63yoDe2lwOtkV9zkM8kq/yzlgX6y+LqfP8KUFpbvVak9aEpBU0AM
   4Hzsz3tg7nNAW6me/AQ76fbBH0UTiTjgzNbghZ+rLrOGW1NDt1eW+0IF1
   Dh/1gWsaaFojNWok55pDaGkoIIZ6vyHjurCSgLQG7cQZ9je3CSDAMyHNx
   GzdI81qA/lvzbm+IeQGqUdQZYZi0Sjbkr9Op7ZWHCUlzC4JBrUVuJmW/1
   aQ76dTpOvy4NckYoPN1PvRisaQ70D3L34yl8LZUJMkKXmlzX2DrAfkqKa
   7kOVHVSV9dGCi8mIsFt4XdMJ/+CpIiO4U6Xm/HMbsyzKSQ+U05JJIYjDc
   g==;
X-CSE-ConnectionGUID: eAdkApKcTGqSZsHVPA16mQ==
X-CSE-MsgGUID: +ALfdTdqQaShUeGJgB4q/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67449382"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67449382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 18:35:24 -0700
X-CSE-ConnectionGUID: H82DARxcTR2ZjVIGx6TMog==
X-CSE-MsgGUID: UBW9AfsJTZmDS8n9PJBgWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202082683"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2025 18:35:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujpXN-0002Fm-2F;
	Thu, 07 Aug 2025 01:35:21 +0000
Date: Thu, 7 Aug 2025 09:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v4 03/12] vsock: add netns to af_vsock core
Message-ID: <202508070942.uCu2tZZO-lkp@intel.com>
References: <20250805-vsock-vmtest-v4-3-059ec51ab111@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805-vsock-vmtest-v4-3-059ec51ab111@meta.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on dd500e4aecf25e48e874ca7628697969df679493]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/vsock-a-per-net-vsock-NS-mode-state/20250806-130409
base:   dd500e4aecf25e48e874ca7628697969df679493
patch link:    https://lore.kernel.org/r/20250805-vsock-vmtest-v4-3-059ec51ab111%40meta.com
patch subject: [PATCH RFC net-next v4 03/12] vsock: add netns to af_vsock core
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070942.uCu2tZZO-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070942.uCu2tZZO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070942.uCu2tZZO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/vmw_vsock/af_vsock.c: In function 'vsock_sysctl_init_net':
>> net/vmw_vsock/af_vsock.c:2794:1: warning: label 'err_sysctl' defined but not used [-Wunused-label]
    err_sysctl:
    ^~~~~~~~~~


vim +/err_sysctl +2794 net/vmw_vsock/af_vsock.c

  2791	
  2792		return 0;
  2793	
> 2794	err_sysctl:
  2795		vsock_sysctl_unregister(net);
  2796		return -ENOMEM;
  2797	}
  2798	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
