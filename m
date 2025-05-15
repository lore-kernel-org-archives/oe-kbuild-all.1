Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D143B42C0B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317893; cv=none; b=XDInSnGMlkEadIne1OqIz5rSsN4F/riBk4Y9gKCkfRTnxcO/ytSWG5/Qf4g2AbaGjVkAmqaCclXJtTMEPBp/6yaxD0E9rqWqdRKW0BRnVUdZXCH9OEVZsFOxw41SzSt04HpdC8rYBDX+a1ln+UVsyialwZpBeFWf/PRtRE3y0rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317893; c=relaxed/simple;
	bh=987lPqCElTyfqLvchF/jnzeVKbf0XkcdfacBuQXd6lI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2nmQfnmZhwWOKbQHjGTlJ7GjVoCeTC0qSIUdc/bIkVTJ1jefdLs/w34ADYngu5C60wBK0v/m31d0N8KQgCdn6Q+8iHoz6TDVJtZTN46R1+1FdRfyt2GEpn7MO5xNg1T+ZRZq3zerhgAWfEWKTiIfp7j09zWmRUbGeE5UBE8DUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kp2hsvzA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kp2hsvzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317892; x=1778853892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=987lPqCElTyfqLvchF/jnzeVKbf0XkcdfacBuQXd6lI=;
  b=Kp2hsvzAZMweAZxu/N2eXUknIcuocnVFAeICvOmzzPsKyGu83kpD0wsc
   a2gHfjmQATY6hAwoX/ulhchzRyMj4rQStgaYmim5/Qy/Wwz8rp5+Rqy3E
   EWbVNmKeZKHUJiS3NvBHBiPGz3vOqMPG0q4mw4OMg/+kGLuC6RjfjFx4A
   +QRvhEYutL2Vzw4OtgHnXgQOw9DLRSSQA4DYUbQlrMbzg78I5v2x4ayLs
   S5ciZEvQQpvlGWO9Y5J6hkiuG2EB2ImbM9COTSM0F/hmQwxYTvvC2jXY2
   RzDwx4SOXoKRclWScT26hoT1+DGFAWuwASKp88NnlX4OhZfA1uqb+8mzB
   Q==;
X-CSE-ConnectionGUID: o6pxI7HhSgiqtZPhsqGDbQ==
X-CSE-MsgGUID: cVmm9H3kTqesSI8skjeRSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943616"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943616"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:51 -0700
X-CSE-ConnectionGUID: NXWsWkb/QImKkYC54lqU/w==
X-CSE-MsgGUID: zvuTfg59SrSWUIgwn7kjyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138778839"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000Ez-1O;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229]
 drivers/crypto/ccp/hygon/tdm-dev.c:94:6: warning: variable 'ret' set but not
 used
Message-ID: <202505150253.nSMsteDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: a1dd4972da4e66d9a9d1a89b3dfd8f742c20193b [2229/2229] crypto: tdm: Add Hygon TDM driver
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505150253.nSMsteDG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150253.nSMsteDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150253.nSMsteDG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/tdm-dev.c:94:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      94 |         int ret = 0;
         |             ^
>> drivers/crypto/ccp/hygon/tdm-dev.c:606:20: warning: variable 'head' set but not used [-Wunused-but-set-variable]
     606 |         struct list_head *head = NULL;
         |                           ^
   2 warnings generated.


vim +/ret +94 drivers/crypto/ccp/hygon/tdm-dev.c

    91	
    92	static int list_enqueue(void *entry)
    93	{
  > 94		int ret = 0;
    95		struct list_head *head, *entry_list = NULL;
    96		rwlock_t *lock = NULL;
    97	
    98		if (!entry) {
    99			ret = -DYN_NULL_POINTER;
   100			pr_err("Null pointer\n");
   101			goto end;
   102		}
   103	
   104		head = &dyn_head.head;
   105		lock = &dyn_head.lock;
   106		entry_list = &(((struct tdm_task_ctx *)entry)->list);
   107	
   108		write_lock(lock);
   109		if (entry_list)
   110			list_add_tail(entry_list, head);
   111		write_unlock(lock);
   112	
   113	end:
   114		return 0;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
