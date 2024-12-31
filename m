Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D351EEE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735636284; cv=none; b=pfWcWTlZHHFq9FzfX4fmJAT+b22JfCoWUvmr7k/d/WV8Z01ujAFNm1gE4GewDYIngnUrk+bsVQliAB5Nh9XpkYomuFxRopUpsjvsCzq2f9c6Re6oC3/CDgrwN18Dhb/4U9DypVmaueupM+M9AbX/kioUFqLq88Nj7tXcQ78feOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735636284; c=relaxed/simple;
	bh=0VtMIUhUVreiAJ9+QhuTfdunzjiscNfyV+1dDjKTd1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eKyTdJIhhphREaWF74lpIMnJq/nwCXmsMAex9HomRwkDslEO5E7HUN3SmSL3j1cH7otbyqJU8emHBR7G0vA4HRYWMiqovDrbCc3avM1cs8DinyD1xnISH7fOpVZ8G93D32V7Qck6jMDvxF00pzF2neD4SsPUtLtvK1NeKEgZjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rr4JliHM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rr4JliHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735636283; x=1767172283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0VtMIUhUVreiAJ9+QhuTfdunzjiscNfyV+1dDjKTd1k=;
  b=Rr4JliHMVH023sRq1vZ4l5h/kC5QCyG5kOIr1QfU8vXE/atprjsr8MwK
   tzjvnuV0KILITBLiF6lZ4VDlqtEVM/WuBYROLnNmcx3Wug5oh1/wddqbM
   hxMtqaxdzFR1vo87GY1FQascE2aLxbAmcxHHFPdY0fd3h0A3mRSEOlgO8
   QqNPwfUyRy5In/7uOUVY9k/jrcaXLUkb3V6+I8dyudPoTmR5t45pSLAGM
   XleCM3F2lT4arK87Rt43OFl0ZH8743jh1D/MR0maN+jhksLkAC2KMN5Vh
   d5OTvz2gWWp4o0qSAY7yvf8rFmq2QUZwi6NvaQdgjKQ2IOzFvXSYcMdLw
   w==;
X-CSE-ConnectionGUID: VChidvYLQuSOr+ARtEIKyw==
X-CSE-MsgGUID: 3I/rCzIXSgSagFZDhW8sVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="38748711"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="38748711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 01:11:22 -0800
X-CSE-ConnectionGUID: BtkhyekTSQmgRd8pVj6p8g==
X-CSE-MsgGUID: D/MzTRBLRZ+tR9Ehnc1Fbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106070789"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Dec 2024 01:11:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSYHW-00070P-1c;
	Tue, 31 Dec 2024 09:11:18 +0000
Date: Tue, 31 Dec 2024 17:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhanglei <zhanglei48@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359]
 drivers/scsi/hisi_raid/hiraid_main.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202412311720.1jGDOyid-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4dc4cec05b40921a3db85d24f97f1142272e4abf
commit: f153a1e5e708c7cf9607ad375bf7145060ababd4 [1359/1359] SCSI: hisi_raid: support SPxxx serial RAID/HBA controllers
config: x86_64-buildonly-randconfig-004-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311720.1jGDOyid-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311720.1jGDOyid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311720.1jGDOyid-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'hdev' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'qid' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'hiraidq' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'cq_vector' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'hdev' not described in 'hiraid_create_send_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'qid' not described in 'hiraid_create_send_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'hiraidq' not described in 'hiraid_create_send_queue'
>> drivers/scsi/hisi_raid/hiraid_main.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
