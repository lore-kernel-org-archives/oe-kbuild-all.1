Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2EE21257E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101763; cv=none; b=YTX5qlh1o6/2PoCeDsVmhqQQuFmZjM4Hi1LDIbY7XJS6XrxhawZJ4tWwakBsu/UAl6r6aQJgF0CfI3vQhPQp0eMTaMvJanL/AzmtCNESn5m3Sg90/J0avbMaWrkLAmhVPy7Q2/zAgjET1toGe7TTD0Jw/5kRbaTccf4EUjGYueI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101763; c=relaxed/simple;
	bh=e63rxy722baqv/v7R/67xBYor0mGiDFUuX3FsQSZv+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RS9rdV9FDcA8JbwQD/U9BP7vcPp6YicOV6RZ7k8EGB6q/aHX8E4amk7OAdpGdyhh0i8Y0iYH5uPu595TD+Vi/TXkvL/Op4fhTmfEgYrtUUo0sKcwseNtI0UspSNr3+F6520wbsceXYd0CTHctoc6geq2qNiiFTsGttlKdZlzxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGl7F3R4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGl7F3R4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767101761; x=1798637761;
  h=date:from:to:cc:subject:message-id;
  bh=e63rxy722baqv/v7R/67xBYor0mGiDFUuX3FsQSZv+M=;
  b=OGl7F3R4bQPeRru2tJLe5D3oLYe+cY1lipLuXSj2ZdxmWHxNvnMHgcL1
   xXFZt0xjxGNBJp3dIbICp1RVVrHbwqnOOOLioIK5cVHP5gowpy9/g9ulm
   epM3334L05tdSV7C0ZmpXGdjHodwSDw+i0B31RMVZKEY90ff9l9d97mWo
   2Er/FoQYzDssDkEWsn71urQnU2GT1fF82qxozf1CubQN0y4pR+SYcZ9HF
   obDb5vYPic3HcsDWEpgiA6X9Z4j/yf4IMrLU6IFbirGnJAXDA+ytoowcp
   R0/MhBSn8sPhAZMFRyyrLGwwYXtr0dZ9A7JZPHiCHqa2b3cspd004ujpg
   A==;
X-CSE-ConnectionGUID: hUaFRir+T2mNTfH5fWXxCw==
X-CSE-MsgGUID: KGzhsY2LT8aKxvEi8bZiJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68664416"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="68664416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:35:59 -0800
X-CSE-ConnectionGUID: ozKvVUPoQOmWDP3gX82pdQ==
X-CSE-MsgGUID: vjvbve3MR2W4RjYg7RWhYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="200429150"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2025 05:35:59 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaZtE-000000000P7-2m0m;
	Tue, 30 Dec 2025 13:35:56 +0000
Date: Tue, 30 Dec 2025 21:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 11/16] undefined reference to
 `bpf_struct_ops_link_to_ops'
Message-ID: <202512302131.tu5eOJfp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   d16fa0113ece3fae58e5105dbed6b0dbe1c28c21
commit: 7752accd071a5cf12d71dff3c340ddf846b9d464 [11/16] mm: introduce BPF OOM struct ops
config: csky-randconfig-001-20251230 (https://download.01.org/0day-ci/archive/20251230/202512302131.tu5eOJfp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512302131.tu5eOJfp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512302131.tu5eOJfp-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: mm/bpf_oom.o: in function `bpf_handle_oom':
>> (.text+0x32): undefined reference to `bpf_struct_ops_link_to_ops'
   csky-linux-ld: (.text+0xb0): undefined reference to `bpf_struct_ops_link_to_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
