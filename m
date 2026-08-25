Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A792D3B961B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 06:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638780; cv=none; b=Rpnj5d9sODgKzUtNqG2dMb42+2oKfzAuDM9T90N8hyqLHLMrCfNRN14I7nqG8o0xDOMhc6/NMFDe0aYH8bULxJOEFhefNhxUFFLUHnPSSkZZWLezgVLCMh7hyORayyxRUMTzYqKb9XS3MOMmxMliMsmQTp//bqdJa6VhB47QOUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638780; c=relaxed/simple;
	bh=xLOKavvHZUic0KKUbE3tR2Bc7/M7KoBM0RGZ+2q9sPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RF4XFbi1NzceHJtarPYxlOTjOt/G+c+xm9O/DegGgUbXPjQzzMYSkt8i8Vl0rbooWg7aV9IMmPeoyl8LaYp4tZajMS6xJj1uwOMnFTmYlwcpf6CG8jbGxgFga/uu5Ov1wxPWoZ4iX96xsGKCnlZKlc0eDfndZerz03/7fVPfHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zj25DYLH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zj25DYLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787638778; x=1819174778;
  h=date:from:to:cc:subject:message-id;
  bh=xLOKavvHZUic0KKUbE3tR2Bc7/M7KoBM0RGZ+2q9sPk=;
  b=Zj25DYLHM00qM5w88SW92xoLddVN6LEItiFopzYThoXasP11QSYMPAtJ
   r80d9Bj7aRayvxdLs5bXxNLP2ITQrjxa9xuJKbxS/oby4Fv7FsCNGfrbo
   FdjSYl+4NVNzx/20PiY3WaZwqrmLILEA1EXYLltY8WeU+tozCkooDX3TC
   M+Lm2QXo53lqCj/28ECq19HDvwuOhg1JbhwAVnp5a9sR1kOqpq743qc3h
   ovELem2/oUrlAmmZHlVENl7T7ijCXQckOWrQOzBfYZvpSuDzD7f2ergOV
   jNA/4payRc79+sz3GqmklM/k0gpmgN/HNfKfT9VhCHM+VCeEmHikzmdG0
   g==;
X-CSE-ConnectionGUID: KCXM6eNxQLG++t0hibB3Gg==
X-CSE-MsgGUID: GCS9FedlSd2225zvsbdyqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98772372"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98772372"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 23:19:35 -0700
X-CSE-ConnectionGUID: UjGVOY7XTj+dHBsIWYhAnA==
X-CSE-MsgGUID: iBSAo6upTeeEiNWJzsJOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="265425269"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2026 23:19:34 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wykVQ-00000000574-0dbE;
	Tue, 25 Aug 2026 06:19:32 +0000
Date: Tue, 25 Aug 2026 14:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 14/14] fs/eventpoll.c:2008:
 warning: Function parameter or member 'depth' not described in
 'ep_get_upwards_depth_proc'
Message-ID: <202608251402.evHenq68-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jann,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   42af5216d44771f3071e771ac4dca6c186e017ed
commit: 1b13b033062824495554e836a1ff5f85ccf6b039 [14/14] eventpoll: Fix semi-unbounded recursion
config: x86_64-randconfig-104-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251402.evHenq68-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251402.evHenq68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251402.evHenq68-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/eventpoll.c:2008: warning: Function parameter or member 'ep' not described in 'ep_get_upwards_depth_proc'
>> fs/eventpoll.c:2008: warning: Function parameter or member 'depth' not described in 'ep_get_upwards_depth_proc'


vim +2008 fs/eventpoll.c

  2003	
  2004	/**
  2005	 * ep_get_upwards_depth_proc - determine depth of @ep when traversed upwards
  2006	 */
  2007	static int ep_get_upwards_depth_proc(struct eventpoll *ep, int depth)
> 2008	{
  2009		int result = 0;
  2010		struct epitem *epi;
  2011	
  2012		if (ep->gen == loop_check_gen)
  2013			return ep->loop_check_depth;
  2014		hlist_for_each_entry_rcu(epi, &ep->refs, fllink)
  2015			result = max(result, ep_get_upwards_depth_proc(epi->ep, depth + 1) + 1);
  2016		ep->gen = loop_check_gen;
  2017		ep->loop_check_depth = result;
  2018		return result;
  2019	}
  2020	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
