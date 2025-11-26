Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AE424468C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177192; cv=none; b=gBZ+a9F2J2P8YDmDf090W+MPs0+DzXZWeetDpAEHYG3dudoUZL/zsjfVJ2fG5GiobFurx06e9PS/FzGopr01PRcp+2mlZvFE5JAhRG3arrc5o5UWVSCgdBjYyk6JuFMEx038/7ksNoYGltkNw1KF+4QyljQjnvBs0Untj/mGP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177192; c=relaxed/simple;
	bh=rActBB9AYr5Xs3afg+cy+bRr25IlNymI8G/BUEpOyfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6zsKqc+TSrec+J8p1d66LfMKpWgC0MtVyUo4ASOX8ZsuB0C2tz35Nlwo0OM6DtpIHouei0R6mhPtJlj3wY4J6xDEbbef1ipC1XiLbbCHfsRQNslF6w/iiJKyKdvqeX9Pmr0Q2qLDlg3rYvQAvN5LQovSeRKqCq98s3RKSQzYuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkRIsFL6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkRIsFL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764177192; x=1795713192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rActBB9AYr5Xs3afg+cy+bRr25IlNymI8G/BUEpOyfk=;
  b=IkRIsFL6VB5tIpfgTO/UOXC3swA0ATDHVPSZwS0ZlMkIwudzQxsEbJqj
   r91pcNtL0zarfNg9RTE7wkqtGi1Gs8GDqJbSrkS/qY3TfXkUuONfPpwy7
   ps1f+68C6p4CcbF6Kgy+rWpy5dDsgRpWiuqIZ8rjQPnSl5h0u7aEp9vQ3
   KC9fELso69BapPQ5BOtQVFAla/A5Yh8/jFcsxZ5kB+d76li2/wtV3GXYI
   JtpzWMK0yCVQtbi/KK57CSf9M9UPmCAXHAKy/WEZ7QrEb3zjAYTaB/8Pz
   lQJWtT+y5Wvsn9x9iASDGRjrpvnwA3yByIrLsvGkTllYKHEKi2lXtZC25
   g==;
X-CSE-ConnectionGUID: it0o5vKJQuepoDcabFD08A==
X-CSE-MsgGUID: GsAO3TP1QQW29rFg/rc0SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66298182"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66298182"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:13:11 -0800
X-CSE-ConnectionGUID: uSEfYBRLRtir5qD3O2xGZg==
X-CSE-MsgGUID: Ki42yIpLRDqtltvLETScWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192245495"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2025 09:13:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOJ4l-0000000039h-2EfW;
	Wed, 26 Nov 2025 17:13:07 +0000
Date: Thu, 27 Nov 2025 01:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 10/16] af_vsock.c:undefined reference to
 `dma_buf_get'
Message-ID: <202511270143.KjU7LA0O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   56410ffc55694c2bc41463768df26269d3a2b3f4
commit: 55a1096feb1728f7f5d97e89b04bd0bc7893515c [10/16] vsock: Add shared-memory support for virtio and loopback
config: m68k-randconfig-r112-20251126 (https://download.01.org/0day-ci/archive/20251127/202511270143.KjU7LA0O-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270143.KjU7LA0O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270143.KjU7LA0O-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: net/vmw_vsock/af_vsock.o: in function `vsock_connectible_sendmsg':
>> af_vsock.c:(.text+0x2584): undefined reference to `dma_buf_get'
>> m68k-linux-ld: af_vsock.c:(.text+0x261c): undefined reference to `dma_buf_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
