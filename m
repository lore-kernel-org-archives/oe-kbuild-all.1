Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA317FE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689099616; x=1720635616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6oOe8wN910lPzYvtO4VR8WlwEMziqOi2SwZ7Nhklgo=;
  b=IE5rcO3rMuZVi2jF6oZYoqVDIqPmtt2VOWvvYZWsc3WZJBrjVfhWQZ2C
   V6PVa2yJo3Rhy0lj65FwWiEjNp/jCbe8BQZhwFa6oR86gtuSEgFv9h3WQ
   vd1klsV5e10mDtnVEwshR1ESE5EEs1e6qOmqC8P25WNdhcVKJbdkT7Cvk
   iq0bIzYmqEzXSRDuMpfXAdScbYDsj3mUUv/nVKOHAlOQNarTvUfzfr/XO
   HHLsWagqgKxC/OzcryvI2x0AVBYyImDOtZPx8aBqYcNGaPFpwjcPh7qZO
   AwRyli7oyF+iZwy5fBWToECrKcBVxOHO/bE4E3P1PQsBlYUH7aQBps5fa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="451060804"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="451060804"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 11:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="895269124"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="895269124"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Jul 2023 11:20:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJHy9-00050l-1A;
	Tue, 11 Jul 2023 18:20:13 +0000
Date: Wed, 12 Jul 2023 02:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Eugene Loh <eugene.loh@oracle.com>,
	Kris Van Hees <kris.van.hees@oracle.com>
Subject: [oracle-dtrace:v2/6.4 9/13] scripts/link-vmlinux.sh: 147: [[: not
 found
Message-ID: <202307120226.2osTLbOb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 39e8b5a2ee1ef9dcd1ce239c640a065b10dcd36f [9/13] kallsyms: add reliable symbol size info
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230712/202307120226.2osTLbOb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120226.2osTLbOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120226.2osTLbOb-lkp@intel.com/

Note: the oracle-dtrace/v2/6.4 HEAD 9b6d57638acaddc5e1016dbcfea27771df400611 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> nm: 'a.out': No such file
>> scripts/link-vmlinux.sh: 147: [[: not found
>> nm: 'a.out': No such file
>> scripts/link-vmlinux.sh: 147: [[: not found
   Usage: kallsyms [--all-symbols] [--absolute-percpu] [--base-relative] [--lto-clang] [--builtin=modules.builtin.objs]  in.map > out.S

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
