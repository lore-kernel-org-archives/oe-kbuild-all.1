Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F51F8723
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762613405; cv=none; b=m0GYN3oXHWKG34GTWDPFlESVoxv1sePHspNYUAfgczOHK5OpWdSUsOMThwkxUDevsOzb8OloL14pZjH5MuY5eDOtKA0J7Bi9qnDBMM8ViF0gUJK8r6al0Pya6v3/VFQ2gq0+ydCUIcQ5PUWfFjGXcIShOn5EXBoxSNMwngPC2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762613405; c=relaxed/simple;
	bh=hYa+Q8VHTeIgKxDmaO/o87DQoAeuXog9c9S1QmySBBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3ng8mMjwCXh+sEj65l68fDM3Whrkfwgnc322kADbkkopVpO3jfCBv6EjWiTIBL5poH4o0IPi19DtqmEi1i0aHqmZzsNdY8hNfgoPNxS8EWHvKnhNfd+F4ZIJhGIjON1kp5ThWh4hi3n/X/cItCZdsdewOjm0wE6iH3Yxpqn118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwG8F69f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwG8F69f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762613404; x=1794149404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hYa+Q8VHTeIgKxDmaO/o87DQoAeuXog9c9S1QmySBBM=;
  b=gwG8F69fwVXYZm7ZC8A4FtbQbugaWjaugFcvsZdFnmUU/XJT6ifolxMe
   LoTdq3dGD80atqb7qxVODULtZfSLPLeTiuZxHQb27BO1/SbaK9exJ732d
   ENA6h18O16846+BeaWBC2UJL7QljA7bBjzLrdpSg3KxL4+1HiPvTsmnLC
   biyjkEpfQa5Ia8nDEafv+MaqEZO1Y5nK0YWoRfeJSz2Z/DBWSr+Cdu5As
   syUaGrdHyc6o4/6q1rnr407PveqPja1yMAFA4qkmkZpYBpHhqRv5V/493
   +tw1sg4IhiUMJ5oUFp6jcxol3mOtNImUS9P9LL4mff19IflnWsxv/LQuT
   A==;
X-CSE-ConnectionGUID: CFbRxRuSTUqENNpRZxxqXA==
X-CSE-MsgGUID: YhceCSDAS6mJZH3leqyerg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64644412"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64644412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 06:50:03 -0800
X-CSE-ConnectionGUID: byh1CyF1QpWGmyW+EegHqg==
X-CSE-MsgGUID: 1YbM5zbwTDiwkeFWfpEw5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="188025701"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Nov 2025 06:50:02 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHkGN-000139-15;
	Sat, 08 Nov 2025 14:49:59 +0000
Date: Sat, 8 Nov 2025 22:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC mptcp-next 1/6] mptcp: add sock_set_nodelay
Message-ID: <202511082238.xkh2dhn2-lkp@intel.com>
References: <a1cf1ae0309392bee2e97b9a1640c7a056204fbd.1762485513.git.tanggeliang@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1cf1ae0309392bee2e97b9a1640c7a056204fbd.1762485513.git.tanggeliang@kylinos.cn>

Hi Geliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mptcp/export]
[also build test WARNING on mptcp/export-net linux-nvme/for-next linus/master v6.18-rc4 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/mptcp-add-sock_set_nodelay/20251107-113907
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/a1cf1ae0309392bee2e97b9a1640c7a056204fbd.1762485513.git.tanggeliang%40kylinos.cn
patch subject: [RFC mptcp-next 1/6] mptcp: add sock_set_nodelay
config: riscv-randconfig-002-20251108 (https://download.01.org/0day-ci/archive/20251108/202511082238.xkh2dhn2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082238.xkh2dhn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082238.xkh2dhn2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/tcp.h:44,
                    from net/core/devmem.c:20:
>> include/net/mptcp.h:329:13: warning: 'mptcp_sock_set_nodelay' defined but not used [-Wunused-function]
     329 | static void mptcp_sock_set_nodelay(struct sock *sk) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/mptcp_sock_set_nodelay +329 include/net/mptcp.h

   328	
 > 329	static void mptcp_sock_set_nodelay(struct sock *sk) { }
   330	#endif /* CONFIG_MPTCP */
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
