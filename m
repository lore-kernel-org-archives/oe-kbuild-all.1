Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871462C848
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709881845; cv=none; b=JvVmMkpaZkTLasbbKQ7q3hQkr497iICzon9edcTiIWAKRXIBrHN38Bx6b6TXD3g1BLUuj9eG+zligexXl/HmJXzs/r6dyLzmqmiokgwjr79C0F0t2oowOngl6aD4Pjexw4wXZVnPGOTWZUR12m5y0c9r/9JyGD4d6qWgOF67wqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709881845; c=relaxed/simple;
	bh=yKbR1Oz3oTu9WUoWgGZKr6CJq6M3Ng3ghNbr9fpqBW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEqt0fsf4Y8HTdkddmNyPeLxLWfRpOw7Eytkj3hT9lMmlWvlUPauaqt5Z7ajyq9ds43jPscO2E6lnUWIVKvuOmFVJr+tXscGV5C1ILEUz+eui9vPi9bhA6iFc37VBOFRkFwtDPv4E1ZUb6o/cxEIvQDIxUUyJ8MB72iMrbZ3HFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRwBCcpx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRwBCcpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709881844; x=1741417844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yKbR1Oz3oTu9WUoWgGZKr6CJq6M3Ng3ghNbr9fpqBW8=;
  b=nRwBCcpxuavVrxluJbdUIeHItK3UdFrbSp6kQdVuPSd2Ek9PQnh/6+hO
   IDJq6VDh/LuwJxzwwnfC0jIEB2vUjOt/zAY81m9RfVR4KJMFo/g7bBc5L
   Sg4n1Qf4x5/J7Re/4PSPQNxSmPFD67l2aLOQLCpeHydHmd4xC8czUFe5d
   As1Ha72maq7OEwGly3AfRDZyx59vAodpBWLctS9+kWV8Ng7UEz1J+C7YK
   vC9KV72AIzNNHiO5mQFIZN93kCV1ihofoAdN71TLtd1iM+8c5LDkbXv9+
   SVXJaH3zBId419KGY/pj1Zosn6Niq++VFtB6oQpstohC5mRwdc9FLJIsW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="16021867"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="16021867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 23:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="15041932"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2024 23:10:42 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riUNL-00068V-24;
	Fri, 08 Mar 2024 07:10:39 +0000
Date: Fri, 8 Mar 2024 15:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15383/21781]
 fs/proc/etmem_scan.c:244:18: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202403081509.2XWi5xzk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1c33d0b3f9230be83d0a9b8b7b292861cfd72534
commit: bad4d8833739acc8eef306e7ad5c7877f9f4f0fb [15383/21781] etmem: add etmem-scan feature
config: x86_64-randconfig-r131-20240304 (https://download.01.org/0day-ci/archive/20240308/202403081509.2XWi5xzk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081509.2XWi5xzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081509.2XWi5xzk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/proc/etmem_scan.c:244:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *buf @@     got void *buf @@
   fs/proc/etmem_scan.c:244:18: sparse:     expected void [noderef] __user *buf
   fs/proc/etmem_scan.c:244:18: sparse:     got void *buf
>> fs/proc/etmem_scan.c:1032:40: sparse: sparse: incorrect type in assignment (incompatible argument 2 (different address spaces)) @@     expected long ( *extern [addressable] [assigned] [toplevel] read )( ... ) @@     got long ( * )( ... ) @@
   fs/proc/etmem_scan.c:1032:40: sparse:     expected long ( *extern [addressable] [assigned] [toplevel] read )( ... )
   fs/proc/etmem_scan.c:1032:40: sparse:     got long ( * )( ... )
   In file included from fs/proc/etmem_scan.c:2:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.

vim +244 fs/proc/etmem_scan.c

   240	
   241	static void setup_page_idle_ctrl(struct page_idle_ctrl *pic, void *buf,
   242					int buf_size, unsigned int flags)
   243	{
 > 244		pic->buf = buf;
   245		pic->buf_size = buf_size;
   246		pic->bytes_copied = 0;
   247		pic->next_hva = 0;
   248		pic->gpa_to_hva = 0;
   249		pic->restart_gpa = 0;
   250		pic->last_va = 0;
   251		pic->flags = flags;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
