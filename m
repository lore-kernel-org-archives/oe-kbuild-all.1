Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D17125B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 04:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708663690; cv=none; b=pogwRVpypzJKLH4uvRa+EucNod74LbXEVFCTReiBGUNoamS4pAuSKjxwDhg+0xpny2fB5/F4R4ukPf0Vq24dftZ9OIrzODttyu+i9xExSwzbzxa5no0JOu3whN2633jJUVd38n5qvhiFIxuBOIQajwikT8kMBNOlsLO02m1oHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708663690; c=relaxed/simple;
	bh=mL3k07BKUknE+dprKTXLdJNod4hVw2mQvtIP+k3e1/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EyalkjuhSFaMU22aa0k/Pmp0b6/IvW6xCzJw/9uXnXjOsq+VWOFkV0nDkifOAUY7Dqv7u7V28/vGi9zubRQVkljZe26AOzncoQZviQHX07hsQxKarKxDtZq7MikWARtSRcRPLlcEdF1MaBCK4zqRA0ZpORICvQd/9WFMyKYIFoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJmHhGuU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJmHhGuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708663677; x=1740199677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mL3k07BKUknE+dprKTXLdJNod4hVw2mQvtIP+k3e1/g=;
  b=oJmHhGuUnaosb4qDI+VuahOZzyLCWD7nW0u5iLtR/zwY7140LOITGJEt
   XESgy+S/erGeSC99YkNWprWsgJwRaAwMKrwmeRbNAAontWmx92zyqtE/W
   MCe7+/8s4sttCT8f/p+KEFRHuAEt/LvQMCrgf9kRH6Pl+48+mOMycKuoD
   eXjP24CH3r4BzbMHWSjtvp7RWpLNWv/bPPr2/1S38b/a416jyNQIE16hl
   0sFASt8lTqXVK2NDJJxVEe27sVPxT2RMvwmeLPGcPXVfA700NhuZL8f2T
   ZHIFKarBPKrn+6lqwQRh7p7Hfr9GptnwMuYgs0O9gdecNeVYJV6u7XTHz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3465884"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3465884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 20:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10488392"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Feb 2024 20:47:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdNTP-000754-0Q;
	Fri, 23 Feb 2024 04:47:48 +0000
Date: Fri, 23 Feb 2024 12:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/cgroup/mbuf.c:293:6: warning: no previous prototype for
 function 'mbuf_reset'
Message-ID: <202402231225.w53xCGrj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 7600f2ca4450f694f3d0ae89dbd741ea1d0f8ffa tqos/rqm: Tencent Quality Monitor Buffer
date:   2 years, 4 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240223/202402231225.w53xCGrj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231225.w53xCGrj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231225.w53xCGrj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/mbuf.c:293:6: warning: no previous prototype for function 'mbuf_reset' [-Wmissing-prototypes]
     293 | void mbuf_reset(struct mbuf_ring *mring)
         |      ^
   kernel/cgroup/mbuf.c:293:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     293 | void mbuf_reset(struct mbuf_ring *mring)
         | ^
         | static 
   1 warning generated.


vim +/mbuf_reset +293 kernel/cgroup/mbuf.c

   292	
 > 293	void mbuf_reset(struct mbuf_ring *mring)
   294	{
   295		mring->first_idx = mring->base_idx;
   296		mring->first_seq = 0;
   297		mring->next_idx = mring->base_idx;
   298		mring->next_seq = 0;
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
