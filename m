Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B32207A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 04:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725337003; cv=none; b=CuXvlSak5tUaXiLBGUtBPk2FLKjpTrpwPMgsiQLt0TS7HBTbkWNTh7x9hdA9hGn8+UKk03+Re+y+HtDzSKYTp/rcltER/znjOdvBZKVul7wePEs7E2V0QxSTB1dzD5nRPwdgLdx9Kqoh6vxMcZ/fn9MX8njtBnvVSYw0eZD4oiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725337003; c=relaxed/simple;
	bh=HK9bP4RN+DKY/5sQZbaMZM88FS+BMN9DFSdZteDiq2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAcn8/QGCnOj+LkStsKluQRw2V5pID8BQrNuCfHYpc5vkwuA1PbcDDBcdz+TCWwY4yE//VT83Rln/seOmdQdIaJVbP0x+RZ8fF/TnZHfrgeKlryxV9ocmVYNcpsIo2YlhHpM39SjFRKNZicX/6TgS6je75yW2FRgHxMxko244Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oi7ns3iH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oi7ns3iH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725337001; x=1756873001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HK9bP4RN+DKY/5sQZbaMZM88FS+BMN9DFSdZteDiq2g=;
  b=Oi7ns3iHo5MPxoGc/VVMp8V40LGdcq38iNPYN7+XoJOF6kgKiuAZUtZZ
   7KrL8YLz0MNwyAR7PQkboYfMrdG6kyhzcOUsGRCcdrL5Nm5z0vfyNmHUy
   gVzkyq8GSENVgV518BNONM6jnrzR5FqZjxirTpQUA88mZXDmHjc4WDZj3
   h6i8htd8OyHSWi4OrBT3vbv8OAwhHb0TE2BZku///7cMCiy0/qmRFoFUX
   WJRq9wTIzw4gVeG9rG8frTmaSmpLLqeZNC3lKyBoav5niyKdzfb5TTCjV
   BJilAu4eWfAxpq5fI6BLZGCigjQYFkkCPotGEsCNzBcaBcJMJuLl1+UbQ
   w==;
X-CSE-ConnectionGUID: GTml3TBmQcSyGwpaN4cpfA==
X-CSE-MsgGUID: mYtLSLDNTwmmR2KJBMZz2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41410373"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="41410373"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 21:16:38 -0700
X-CSE-ConnectionGUID: q4L4RwrQRke/qh9VwGU8Cg==
X-CSE-MsgGUID: O1UiWwUpRjKWVnpQdfVRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="102216245"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Sep 2024 21:16:36 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slKy2-0006Cs-0c;
	Tue, 03 Sep 2024 04:16:34 +0000
Date: Tue, 3 Sep 2024 12:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29999/30000] drivers/acpi/numa/hmat.c:726:6:
 warning: no previous prototype for function 'hmat_restore_target'
Message-ID: <202409031250.rcUC04W4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7bed6628b750ffd687d1da0a170dece4b0c08bd
commit: 2e1b00fcf1e3152a1e73846f5f9ec37cef088a65 [29999/30000] ACPI/HMAT: Add missing locality information for hot-added device
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240903/202409031250.rcUC04W4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031250.rcUC04W4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031250.rcUC04W4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/numa/hmat.c:726:6: warning: no previous prototype for function 'hmat_restore_target' [-Wmissing-prototypes]
     726 | void hmat_restore_target(int nid)
         |      ^
   drivers/acpi/numa/hmat.c:726:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     726 | void hmat_restore_target(int nid)
         | ^
         | static 
   1 warning generated.


vim +/hmat_restore_target +726 drivers/acpi/numa/hmat.c

   725	
 > 726	void hmat_restore_target(int nid)
   727	{
   728		struct memory_target *target;
   729		int pxm;
   730	
   731		pxm = node_to_pxm(nid);
   732		target = find_mem_target(pxm);
   733		if (!target)
   734			return;
   735	
   736		mutex_lock(&target_lock);
   737		hmat_register_target_cache(target);
   738		hmat_register_target_perf(target, 0);
   739		hmat_register_target_perf(target, 1);
   740		mutex_unlock(&target_lock);
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
