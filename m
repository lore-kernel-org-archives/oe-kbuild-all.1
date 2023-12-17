Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2439915B3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 04:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDtSc3Aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702788382; x=1734324382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qyln/JRSbJlEBMTZ9nm77A6GcNMashNtiwmbjHo1rCM=;
  b=VDtSc3AazZDbJoJJz+S7T0zqGwWaMGr2pdMyEIjLey6rXwlzwf7ADhSd
   jc2ILO8RryqmfMyIZhdJKdGBSzdhF6pxuhZAV4BlTRepomXc2eeRTILng
   t8pEdDgwpEiJ/FRdAaSXIJFcEIRUPdYS7i+7D8woUhaQTjIjtZNTxYu03
   Z+dFcG85qE61iVhLY+ZavzX5on6gV+84k/gi1r8yUbtdE2ctCPHEVrBqM
   dkUNYXUG3GfwySyfk0U92ixUOvf7DBnRGIn+HhPoavzhKLfhcszY8F1C8
   n2Zz6LZRmTJO7TytBqSxuSEExpzIuupa7eRuqHy34/3L7f5q2R4ZLI3cN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="16956733"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16956733"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768448028"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768448028"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 20:46:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEj2f-0002eW-1f;
	Sun, 17 Dec 2023 04:46:17 +0000
Date: Sun, 17 Dec 2023 12:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [toke:xdp-queueing-08 4/10] kernel/bpf/xdpmap_fifo.c:48: undefined
 reference to `__udivdi3'
Message-ID: <202312171226.h4BuhV25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-queueing-08
head:   707bff6510161065e4e624c99c8c668b6c0114b6
commit: 68c0c58b27223821b2cf6d102fa11e90e3cd553a [4/10] bpf: Add FIFO map for queueing XDP frames
config: i386-randconfig-011-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171226.h4BuhV25-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171226.h4BuhV25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171226.h4BuhV25-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/xdpmap_fifo.o: in function `xdp_fifo_alloc_check':
>> kernel/bpf/xdpmap_fifo.c:48: undefined reference to `__udivdi3'


vim +48 kernel/bpf/xdpmap_fifo.c

    34	
    35	/* Called from syscall */
    36	static int xdp_fifo_alloc_check(union bpf_attr *attr)
    37	{
    38		if (!bpf_capable())
    39			return -EPERM;
    40	
    41		/* check sanity of attributes */
    42		if (attr->max_entries == 0 || attr->key_size != 4 ||
    43		    attr->value_size != 4 ||
    44		    attr->map_flags & ~XDP_FIFO_CREATE_FLAG_MASK ||
    45		    !bpf_map_flags_access_ok(attr->map_flags))
    46			return -EINVAL;
    47	
  > 48		if (sizeof(struct bpf_xdp_fifo_bucket) > U32_MAX / attr->map_extra)
    49			return -E2BIG;
    50	
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
