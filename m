Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B8CDDD4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695463324; x=1726999324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3KlciKjFuKLxjrt+FQDkuuPocqYL9/PoZy0VontCSI=;
  b=RALJApNl5KUCV4XZwsbmFcaM+c0n/zaITd/ea6XSyldwg9SITyNtyyE3
   rJCeDmsXNsE7Zt6eKbC/o1aln629vnUu1Dzydj8vpMFk7/6bfrQGFPxjw
   AmVTOoeWSNJltaPxFL2IMDS8FWtGVhtOmOTI0QelaH2KrK5F2RAH+pxgM
   p9UD/ZXCWgUTR8p/dMuVfI9tto7h0/bs5TFvasVl1eC6jQ9GIFQLDmW60
   2Wc/5Tf9YdNLLGTSkqHGcAypA91To8gAmYKHg2wt8kFyah1gMbuQl8Ffa
   EDAIvSVSYmDHBk2nDXPB6rF515BgG7IwrTN+DhV/Du+KskisiKfydmWp7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447491738"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447491738"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 03:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813372952"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813372952"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 03:02:01 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjzSZ-00028B-2s;
	Sat, 23 Sep 2023 10:01:59 +0000
Date: Sat, 23 Sep 2023 18:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/socket.c:1676:21: error: no previous declaration for
 'update_socket_protocol'
Message-ID: <202309231748.AETjbleh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d90b0276af8f25a0b8ae081a30d1b2a61263393b
commit: 0dd061a6a115f25132989cbd591a25afb2dee086 bpf: Add update_socket_protocol hook
date:   5 weeks ago
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20230923/202309231748.AETjbleh-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231748.AETjbleh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231748.AETjbleh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/socket.c:1676:21: error: no previous declaration for 'update_socket_protocol' [-Werror=missing-declarations]
    __weak noinline int update_socket_protocol(int family, int type, int protocol)
                        ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/update_socket_protocol +1676 net/socket.c

  1659	
  1660	/*	A hook for bpf progs to attach to and update socket protocol.
  1661	 *
  1662	 *	A static noinline declaration here could cause the compiler to
  1663	 *	optimize away the function. A global noinline declaration will
  1664	 *	keep the definition, but may optimize away the callsite.
  1665	 *	Therefore, __weak is needed to ensure that the call is still
  1666	 *	emitted, by telling the compiler that we don't know what the
  1667	 *	function might eventually be.
  1668	 *
  1669	 *	__diag_* below are needed to dismiss the missing prototype warning.
  1670	 */
  1671	
  1672	__diag_push();
  1673	__diag_ignore_all("-Wmissing-prototypes",
  1674			  "A fmod_ret entry point for BPF programs");
  1675	
> 1676	__weak noinline int update_socket_protocol(int family, int type, int protocol)
  1677	{
  1678		return protocol;
  1679	}
  1680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
