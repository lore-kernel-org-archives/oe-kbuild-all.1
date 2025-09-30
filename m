Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C892FE599
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242150; cv=none; b=NGKwcixu3hbVEBEFRcsYzB88jjavWzhmXFCG8j96QhUaRdkBzCqbta86OEEt5SraC4Vg8Mc9Yr+vruJjYW86Ta6vAMkfHTazijvUdiCD6AxE+VggO5yEigqy3BdlqNfEcmS/otxmkJMzWCR5KRbbtGasAKDJrwm9F00yLSb08dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242150; c=relaxed/simple;
	bh=lhS4k9rq0XtlfUWNWhrV63ewxodvV+q2mkaGk/oY47g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFZXYE0rfmd3qIniTrMJSRN5avsGmJKyCz14+5pydQX+Z/7IMzQS8npFoS82HFWyl52ki4rdJ1qI7mIxOFEDhDoOYrvhPnu64NA5zeizWtM9dqLmouS9E1Gy3SyY4cd7LgJ+Z4UXl4RVNG4SX38v7o7fhvoZe/K3ozyuO+pDwuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMLkXKn2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMLkXKn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759242148; x=1790778148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lhS4k9rq0XtlfUWNWhrV63ewxodvV+q2mkaGk/oY47g=;
  b=VMLkXKn25joqGZ3AgRU7+jppEbwE9JZ/k7qDwnYyRaaF73Do8KH6nv4p
   cMweb86+Ye9Fd+j4uEkI2PmsqL4X+UYaWUo3LQTboDjWvl/6AEvjy53rA
   rWdzXCPev/sBBWjNfKN8228IrLjYrG5vMCwjRiQdmSmE3XCEQohuDRyam
   9WQNgKMO0dkvYa4K34IlXtAlB1fHB3NuLvZtx6ZTJaXZDafZConFccYIE
   Jz+6yF0sdIkeyrOEs0L6QwqUs4c36IESrbuzALx7E+ffC5kz48hNImoAJ
   I/tYDosVBr5iMQGF50E5NrM9S3kWzm1tGIVSHzI8NT60TEXAAxkQ5ArNq
   w==;
X-CSE-ConnectionGUID: JI6n61eFQXKHJAm6C3a+ew==
X-CSE-MsgGUID: 49T96dZBSJSIm4h1EESEBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61664974"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="61664974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 07:22:28 -0700
X-CSE-ConnectionGUID: jWdF3OVcTlSUPje23X1/RQ==
X-CSE-MsgGUID: +/4vhEp2QoS4ytZUhWdsXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="182952384"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Sep 2025 07:22:27 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3bFI-0001P1-1o;
	Tue, 30 Sep 2025 14:22:24 +0000
Date: Tue, 30 Sep 2025 22:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 45/45]
 drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c:669:60: error:
 'snprintf' output may be truncated before the last format character
Message-ID: <202509302227.KhwIbkS4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   aa75e6da3895e56cacebbe71d2df72767d3e89e0
commit: b94b04b8f028da64ee7ab3215f07ca548cb261dd [45/45] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250930/202509302227.KhwIbkS4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509302227.KhwIbkS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509302227.KhwIbkS4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c: In function 'ps3_host_info_get':
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c:669:60: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
     669 |         snprintf(g_ps3_host_info.release, SYS_INFO_LEN, "%s",
         |                                                            ^
   drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c:669:9: note: 'snprintf' output between 1 and 65 bytes into a destination of size 64
     669 |         snprintf(g_ps3_host_info.release, SYS_INFO_LEN, "%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     670 |                  utsname()->release);
         |                  ~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/snprintf +669 drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c

   667	
   668		memset(g_ps3_host_info.release, 0, SYS_INFO_LEN + 1);
 > 669		snprintf(g_ps3_host_info.release, SYS_INFO_LEN, "%s",
   670			 utsname()->release);
   671	
   672		LOG_DEBUG(
   673			"host info: machine=%u,vendor=%u,processor_cnt=%u release=%s\n",
   674			g_ps3_host_info.machine, g_ps3_host_info.vendor,
   675			g_ps3_host_info.processor_cnt, g_ps3_host_info.release);
   676	}
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
