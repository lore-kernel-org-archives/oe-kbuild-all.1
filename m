Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE166FC5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 05:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709443334; cv=none; b=U4YXxUIRQFsiYa3naL+BU6nqgKSe8QWCmGmFXSa27/7rxBDRPUiqf9FmBNFlZMLCHRsURQIB1VdfgZVPwxw6JfAYs+YMlrIyA1P4ZuVMHIS4cfODQ86NDqmHmPgC+iupel0F+99518EUViOWjp/1uS4ZEu7y6p+1D0rcWSGDJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709443334; c=relaxed/simple;
	bh=WyHbJ1WI2jM8yOuPYU5nrzeOlGrJrw/kdEcG7dl2LP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ka+MznnYEzIzFBPoCRxYd03JKw28zR5aDvMsHXTeUyN6PF4QAyf/F/9StcPwPE2EUKRGChe2OzlNuBbfZ4+NdbXsUzOjFBQdBvqsiU/TB8D5SysK7HxEAB1uHApYSzSXEyN7ga4kzYpGi40vOCFQAbgRKatMVLOuiyylgAbVyaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaRULEL0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaRULEL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709443332; x=1740979332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WyHbJ1WI2jM8yOuPYU5nrzeOlGrJrw/kdEcG7dl2LP0=;
  b=JaRULEL0WK96wnSDK7f/QKeKR9/j9yEZErnU+vd6fS0WRfgKzS42WMpv
   aa5lTkkgM7lVNvu5PmqPgw2SGybASVVJOm8oQXUmzHhUnQDsvF7amdGug
   io+1Ycpogm25hS2SlJU5Q4xdN0m0yyhAhrb9RDkE++Fv2NSOXqmdo3QuD
   AdSgzIE/pOGP+EngYTRY9fww6DPzCAhNytgJKNci/aFsdbFou1jp/GKPo
   tK4sbC2eq0b9W6mywf4SW12zy9pRL2tfrFkgt0LICfKC16UGjtwLVIorX
   gHKJvMUmlwqp9RdzGKSGMUUrgYTASJd3Xf0MSsGVknGBC4s63KzpFqLdh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="7768721"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="7768721"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 21:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="39625799"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2024 21:22:10 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgeIZ-0000aW-2n;
	Sun, 03 Mar 2024 05:22:07 +0000
Date: Sun, 3 Mar 2024 13:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14455/30000] drivers/scsi/qedf/qedf_main.o:
 warning: objtool: __qedf_probe() falls through to next function
 qedf_handle_link_update()
Message-ID: <202403031342.0NFibsyL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6adee00913b51cd59245584085cdaca64f74465c
commit: 3e393ad0efe336af9da4abd7ce7b5b858e9b9b0c [14455/30000] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-073-20240302 (https://download.01.org/0day-ci/archive/20240303/202403031342.0NFibsyL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031342.0NFibsyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031342.0NFibsyL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qedf/qedf_main.o: warning: objtool: __qedf_probe() falls through to next function qedf_handle_link_update()
--
>> drivers/scsi/qedi/qedi_main.o: warning: objtool: __qedi_probe() falls through to next function qedi_setup_int()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
