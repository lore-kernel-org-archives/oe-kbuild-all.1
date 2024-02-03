Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71DD10A12
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706993606; cv=none; b=dFZzFCV3N3VDH01zk6DBaGwsa0f8qK6dUjcAgSa08C9bRVch3YeF0Kl00RoSI+mFH7ex0fCi58vxUTPCTwr6R3e/V0E2Vbkp9l1/daM1i6dnRrLUdROr5CQkkFg6Qj5QqmPyuRw910cbE5Wq+7qgvCCobnZ+P8xXz45w8SPLsAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706993606; c=relaxed/simple;
	bh=kOFYAsBsgolladMxT9dE8GWLfqSJ9L5SnKmwlbgjQ8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNQd9fmAWfwXe+1DNtvRFFpkJAGg8qO/UkHjykGeUGdYtVV6GO3j3iD6sd3brUC+PYgjgp+JwPuQIUPZephr/OPAJSQI29JHD7aXxmprApEclIBNx1j7MUq0adhVT2FxYHtK/81dMmc5MhaBRBerCnvDeFKxhURvoR+/AuB+Ld8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qf+OCMP1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qf+OCMP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706993604; x=1738529604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kOFYAsBsgolladMxT9dE8GWLfqSJ9L5SnKmwlbgjQ8E=;
  b=Qf+OCMP1/T2KyEERtMOzazTw16nZ4C6k7x0nyeczd0J0639EhDVsByTF
   SLfTQcBgRu55b3PaFCj0rtzNG/j8M1/JvYbbI63CaRuy8h4ZDc/orc/8r
   +WBRYorN2akQZsq3S2CMybeEOxVjETV7dv447LmTU4sCI5oh8JUs8edGC
   opGv1Enx03GDsgTunVy29wtsIR8B0kCKpQg90D0Zt3rysCRX2K3bB0dRu
   FThkJyCzsX5NY+RsGlRmMa078E99F0CtDxRxm6WqRyyyRUlcJNbaxzAjZ
   N4DsBLDnaph5rJnumZSfbk9ur8Eh2MRU1hLb+mL+8dcrE0y5Boi7V+rti
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="4144145"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="4144145"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 12:53:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="37801872"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2024 12:53:22 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWN0o-0005bk-0H;
	Sat, 03 Feb 2024 20:53:18 +0000
Date: Sun, 4 Feb 2024 04:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8557/21614]
 fs/ecryptfs/.tmp_messaging.o: warning: objtool: missing symbol for section
 .text.unlikely
Message-ID: <202402040416.bTJHykFw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5bc2c7cbdcbc5c8e5bbe65d3542ec2fccbc61492
commit: 775947c125d5bd6e00e0dcf9d12c57fd5d44d07f [8557/21614] asm-generic: fix -Wtype-limits compiler warnings
config: x86_64-buildonly-randconfig-003-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040416.bTJHykFw-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040416.bTJHykFw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040416.bTJHykFw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ecryptfs/messaging.c:28: warning: Function parameter or member 'ecryptfs_msg_ctx_free_list' not described in 'LIST_HEAD'
   fs/ecryptfs/messaging.c:170: warning: Function parameter or member 'daemon' not described in 'ecryptfs_exorcise_daemon'
   fs/ecryptfs/messaging.c:220: warning: Function parameter or member 'daemon' not described in 'ecryptfs_process_response'
   fs/ecryptfs/messaging.c:275: warning: Function parameter or member 'msg_type' not described in 'ecryptfs_send_message_locked'
>> fs/ecryptfs/.tmp_messaging.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
