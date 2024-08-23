Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FE14AD3B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404353; cv=none; b=HopPKuXYqc/cdONf8O78ZrIXZTz4IWMG1rYDqdErD3pIZIvlgnm8JVj88RcCBqZQLp98AG/xtKlAgZU90LkvgIr7lhP2BRAj1mrbh+7wGqx7YS36cuUw2CRwI0c6NldJzvSANtJIm1IsQOR1ubjUxKb5yEoEYNzH9x839KvfM3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404353; c=relaxed/simple;
	bh=2nSkBndRISGUsaBKCv8dHU5ZRLd8S22U22MxvIWyRQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VUWORSg68lhbY+6XG1bdQpaM+bVlVDi7aVug5yrUG6f2t4//Cx2BdtFIy1HYVpQFKBFuEuAyK6vy8am8rVOBXcuy3wyL5iFAnKck4Le1OmfCWw1wkZZ8ztX3QotPlVI/b9FfDsjFf0JmlHctEc7rZb4QD89nip1BwWQ+NMR2kpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXKsyjNw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXKsyjNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724404352; x=1755940352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2nSkBndRISGUsaBKCv8dHU5ZRLd8S22U22MxvIWyRQM=;
  b=HXKsyjNw0H4oKiP35AHPKikRYOCABD/vf/qF6YC3xoHigXOGU3GYRCvR
   CHFJTdapjE4VKQTpXyIOLIQshfODKRiuux2sc71ommxnxfAve2dKsHq4M
   iuCFqIzEvLl3OmFPnQiOHdRSZRgYU6d1buHLd5L94ZbwhIFvukAdzjCaz
   hiQ6pm0aGxc+SCdTbm8+M1ycPz7IbDWN2EjaTrNoxSyZsiMbB1/iv9gw7
   0bYTw+zd2gBXvF5jb3ZseA23zKqz8nBFAB+EU6w9wrelZ64fFBr+bNhQT
   KuMCVYEIkenRlEwpv4mX+8Td7RvBT5FhSQnxfXtbVcGuVNEdpQ7r+39OZ
   w==;
X-CSE-ConnectionGUID: 7brZZO21QESXmkqjt4J59w==
X-CSE-MsgGUID: rSjGk6SuTzeRy6slu7rx2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33429073"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="33429073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 02:12:24 -0700
X-CSE-ConnectionGUID: way3lBdJQ4OidQn6iZ1omg==
X-CSE-MsgGUID: NGWeXoyCTPm9DvOp1/GRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="61756703"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Aug 2024 02:12:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shQLD-000Dbi-2h;
	Fri, 23 Aug 2024 09:12:19 +0000
Date: Fri, 23 Aug 2024 17:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 10131/23540] kernel/sched/.tmp_debug.o:
 warning: objtool: missing symbol for section .text.unlikely
Message-ID: <202408231741.udIkhb2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7b8c61ed410ceffed92d95d0c85ee62e6ff8391d
commit: acfa0f545c7dd43f959c28e8ab4b139c927ba387 [10131/23540] svm: reduce log of run queue and atomic->atomic64
config: x86_64-buildonly-randconfig-005-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231741.udIkhb2c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231741.udIkhb2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231741.udIkhb2c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/debug.c:797:6: warning: no previous prototype for 'sysrq_sched_debug_tidy' [-Wmissing-prototypes]
     797 | void sysrq_sched_debug_tidy(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/.tmp_debug.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
