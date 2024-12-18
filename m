Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FF11BDC3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734561056; cv=none; b=oaarHyb6J/pr3t0lr9B0FSqjcVs8iV+QpJTzf0NyK0R+94DcX0bYIqBLZ5MUYn35Ga/rxkdz8sNvsh8EG6fUHJpue70Rf3mKCKD0VtsHKgjrIBPnB8hajVv5X34MMtyhQyHTL8OuG8W0mO6CxdOqNShlv4QDKbnTP+dyzHkyuj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734561056; c=relaxed/simple;
	bh=6ZGaY+bKQ6JYVmhaQZbJNlSBOi/evwkdqyJmoQ3BmXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=piX5KtgWDxtu+XOw/wJzvtkOPnVgauLhbMekRU8grYZqijJYROWCAkMkTnW6DoO13rsgZYD9aYo/3ANUBwBGb1XEYpMdBLEZIqmf6IQ4s7qIYcCnu3VHvhPqlykHFL64gMB57CVY9SAd8qPm/VLijIMa3mJSH9WGswC81aafHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zk2pZ2gb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk2pZ2gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734561054; x=1766097054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ZGaY+bKQ6JYVmhaQZbJNlSBOi/evwkdqyJmoQ3BmXE=;
  b=Zk2pZ2gbfN+D6cFEjldn3Dyap6DCwV//bDbIZlNq0SJQqr5xtBK8MIP0
   k3pIug4ED+HcC9DbvgZTFcc547pdS8FabJJOooQhBsw3EjnqhyRxQaZn6
   OZoAaKEg4nBUkMC5JvnAbOckxu555BNqABH9yllC3luILaPlX85mzCBGD
   f++3t8y18IEyRpSaZ9S3bIzzFq/VXonXUCs1va/4CDz+1sWJnxBCOmW1T
   v+48n38AxZVyNMdK5POZ5hAD0C1DES9Hd3aEAZ/8VFp3VoSvHMyg5hwCa
   6utLKuz70XXc1R4Ti21oxZ6DJ9Z79ao9qNdGvf5K9AzoykfheLtsmfi43
   A==;
X-CSE-ConnectionGUID: HSf+ZkCvTtyeCF8fShZuCg==
X-CSE-MsgGUID: MoxfDcVAQ8y+yDnrVcBCUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35185744"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="35185744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 14:30:34 -0800
X-CSE-ConnectionGUID: uz7b6kcdReOj3Z85CCj7DQ==
X-CSE-MsgGUID: ou2CgeT0RVeFyZA9tzB8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102139875"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 14:30:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO2Yo-000Gg2-0z;
	Wed, 18 Dec 2024 22:30:30 +0000
Date: Thu, 19 Dec 2024 06:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1335/1335] net/9p/client.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202412190600.PTjhIB1P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bf2d30f15bc3ebd4c79b1705da288451a043fee1
commit: a6fb923f7803f40a567445dfe1ff3a539c8adc1f [1335/1335] 9p: Use a slab for allocating requests
config: x86_64-buildonly-randconfig-003-20241218 (https://download.01.org/0day-ci/archive/20241219/202412190600.PTjhIB1P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412190600.PTjhIB1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412190600.PTjhIB1P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/9p/client.c:376: warning: Function parameter or member 'c' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'req' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'status' not described in 'p9_client_cb'
   net/9p/client.c:523: warning: Function parameter or member 'uidata' not described in 'p9_check_zc_errors'
   net/9p/client.c:774: warning: Function parameter or member 'in_hdrlen' not described in 'p9_client_zc_rpc'
   net/9p/client.c:774: warning: Excess function parameter 'hdrlen' description in 'p9_client_zc_rpc'
   net/9p/client.o: warning: objtool: parse_opts()+0x1fd: sibling call from callable instruction with modified stack frame
   net/9p/client.o: warning: objtool: p9_client_destroy()+0xec: sibling call from callable instruction with modified stack frame
   net/9p/client.o: warning: objtool: p9_client_clunk()+0xb: sibling call from callable instruction with modified stack frame
   net/9p/client.o: warning: objtool: p9_client_read()+0x251: sibling call from callable instruction with modified stack frame
   net/9p/client.o: warning: objtool: p9_client_write()+0x23b: sibling call from callable instruction with modified stack frame
   net/9p/client.o: warning: objtool: p9_client_readdir()+0x1fd: sibling call from callable instruction with modified stack frame
>> net/9p/client.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
