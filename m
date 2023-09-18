Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A1515A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 03:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695006124; x=1726542124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FGX+Dn1HoRHGoCLByogqaXBjz07DFwJR6GOWA39eNPo=;
  b=fXbe0l0M8EAaprNuY0aKy2VFufi4zQ9wScYNjG1MwdFuNUrBC4UTIfKw
   O5yzXCU7u7ZSBgd/D1DN4nDfWmxlVTocqenKXQxv18R17wiU9x8ABvryc
   Xy+sZ0VL55ZeFO4/nq6vO/inhaBplceFeWBfok9ToPufK/AfNhYM9ii7q
   R/U2brHjYpkuT84SD/l98bmk00aLzE3lC65C2IvG19n1SsOq490njIepg
   7uv52XxqDrYBfJJUYSqW42GfSYx+ZjuSksV9NADY4v/veKd1qhVLKZRz+
   ZEoTCG+s80hwDG8JnEkLK1P9E2lyfP4GiM+Ykv8D27i++9N1EoJyDTFcn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359806943"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="359806943"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 20:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="722315944"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="722315944"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Sep 2023 20:02:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi4WO-0005em-0U;
	Mon, 18 Sep 2023 03:02:00 +0000
Date: Mon, 18 Sep 2023 11:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-next 28/29] ld: fs/nfsd/netlink.o:undefined reference to
 `nfsd_nl_rpc_status_get_done'
Message-ID: <202309181002.9STX60YB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-next
head:   013fd95f671a2d4427bf3aa0820897e41f384ccd
commit: ecb61abdf1985420234b8f12f93a07d59d5718ed [28/29] NFSD: introduce netlink stubs
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230918/202309181002.9STX60YB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309181002.9STX60YB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309181002.9STX60YB-lkp@intel.com/

Note: the cel/nfsd-next HEAD 013fd95f671a2d4427bf3aa0820897e41f384ccd builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld: fs/nfsd/netlink.o:(.rodata+0x0): undefined reference to `nfsd_nl_rpc_status_get_done'
>> ld: fs/nfsd/netlink.o:(.rodata+0x4): undefined reference to `nfsd_nl_rpc_status_get_start'
>> ld: fs/nfsd/netlink.o:(.rodata+0x8): undefined reference to `nfsd_nl_rpc_status_get_dumpit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
