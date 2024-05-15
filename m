Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7841C84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715758837; cv=none; b=XJu+jZiAyFDvPLejk9JX9LYdPIHYTRwSUxKZ2YhUg9o4kN03aTGtaHhGnIomuOqLCOw3Fbt8OLHne7AsfFrwdhOpqL+67K6ME0mS279Wy6HHJ7PcgVMm6cmFl/3ZBdSaLZjpHg6vbinx9n+rpmVIp4DS4UGmy0FrjzRD1ZjNw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715758837; c=relaxed/simple;
	bh=8fNqCdU9fHiRJFC9Z+XbGxxOA7SrSQ6NLHFjswbKYgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mzef8YwQ/kbw2XTPsahovF9mg8LACSBZ/HIXz2mvozRAs2L+Q7qKWR4RYLVxYSLbS8Pqhv47oXyNh16Q6yXP09Vx8yZ3EtXn3028ZAhOse6+P1FWvX3JSJ4InTl9JwiS+ejYztSp6rKfcZIV1sFBEgf0/LZ5tywgrn1El7VM3g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBzl/nQi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBzl/nQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715758836; x=1747294836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fNqCdU9fHiRJFC9Z+XbGxxOA7SrSQ6NLHFjswbKYgo=;
  b=BBzl/nQi5ff1EEGzCCgx0PsbiyvUENhBVGELCwTJwqUhti96rNPRy6x3
   Gy7L29dgyb5RdyqgyYAGuO3+zWgkumx1lYTLWyIjdXAYP2+w23R58ZaG4
   l26fr9lY2i2DelQ3K8/HcKpJjETZNaRRA2lIVePVjLkmyzpk+p3nMEyPp
   Qyio0YH1EbP0q9yMOL2t8ug7OX2j+B4UWRHDZ3WqvCA5/xBXZFQRCbhus
   0nZX6B2f7oy2Wf4maDVe00YorxGR7d19uJkzo3h8++21LMsieNzJIYUoc
   jyqwolawlQ0GYNXs9IJRCC/bx7OUE/1xrPLUD7Rq7jTSRl83GIwy4AOFq
   A==;
X-CSE-ConnectionGUID: /Nu23JwXT3G34XnnKPbGLQ==
X-CSE-MsgGUID: dRUIvDXaSd+yVF6g2OYdAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15577414"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="15577414"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 00:40:36 -0700
X-CSE-ConnectionGUID: hHRECv4dQk6oL+P3pgvHgQ==
X-CSE-MsgGUID: /PE26n1lQP6ifcpkX2D1DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="31551558"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2024 00:40:32 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s79FV-000Caf-1Q;
	Wed, 15 May 2024 07:40:29 +0000
Date: Wed, 15 May 2024 15:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6599/6620]
 drivers/crypto/ccp/hygon/tdm-dev.c:93:13: warning: variable 'ret' set but
 not used
Message-ID: <202405151512.NWtdOFHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   24bcde27d3b11d99cdceaa28d2ba6213e1678e90
commit: 0e593db3fec9ea1f08b5b2b37f7c0b7147086858 [6599/6620] newfeature: crypto: tdm: Add Hygon TDM driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240515/202405151512.NWtdOFHk-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405151512.NWtdOFHk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151512.NWtdOFHk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'list_enqueue':
>> drivers/crypto/ccp/hygon/tdm-dev.c:93:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      93 |         int ret = 0;
         |             ^~~
   drivers/crypto/ccp/hygon/tdm-dev.c: In function 'psp_create_measure_task':
>> drivers/crypto/ccp/hygon/tdm-dev.c:605:27: warning: variable 'head' set but not used [-Wunused-but-set-variable]
     605 |         struct list_head *head = NULL;
         |                           ^~~~
   In file included from include/linux/string.h:294,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/paravirt.h:17,
                    from arch/x86/include/asm/cpuid.h:62,
                    from arch/x86/include/asm/processor.h:19,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/crypto/ccp/hygon/tdm-dev.c:10:
   In function 'fortify_memcpy_chk',
       inlined from 'tdm_get_vpcr_audit' at drivers/crypto/ccp/hygon/tdm-dev.c:1362:2:
   include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     592 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ret +93 drivers/crypto/ccp/hygon/tdm-dev.c

    90	
    91	static int list_enqueue(void *entry)
    92	{
  > 93		int ret = 0;
    94		struct list_head *head, *entry_list = NULL;
    95		rwlock_t *lock = NULL;
    96	
    97		if (!entry) {
    98			ret = -DYN_NULL_POINTER;
    99			pr_err("Null pointer\n");
   100			goto end;
   101		}
   102	
   103		head = &dyn_head.head;
   104		lock = &dyn_head.lock;
   105		entry_list = &(((struct tdm_task_ctx *)entry)->list);
   106	
   107		write_lock(lock);
   108		if (entry_list)
   109			list_add_tail(entry_list, head);
   110		write_unlock(lock);
   111	
   112	end:
   113		return 0;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
