Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26E22D3220
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762581320; cv=none; b=MbNXjTjdAFwRjnkZMH/JNf8Ifr/dAOZtKaNdmVRbmm4fO8FeQPikGFQOxHCVZ3nILM1Y+Dqd0hHEMNp3iSXj4vmMnVaC5spyqROIQWyOTeMJ4Fcjigd0Vc8kSnk/LkrR1+zRCPV7ODjErAHOGayuwTr3a6vLgwRonww631bM70Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762581320; c=relaxed/simple;
	bh=uQBa14UkJu8OybqoET+1Fb24hHQMoyiZ5uqiTgyP3Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SxF3WyBk9S25qZyI7XF3Lzy/ASuU4SObGe7u/V5A3YTbmHEXaEMvinK2qx2yyJuX6Er5ZsPPTOb53j6PKQGx3/ppNufbCjv808D9Ujp8UCGgNkiqcJmTLf61Xt7xizIKQ0Q6Ndevf/xRrwBhCnJIq8i4Cr31nFcHf6E/NccV+0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WE6D3pqQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WE6D3pqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762581318; x=1794117318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQBa14UkJu8OybqoET+1Fb24hHQMoyiZ5uqiTgyP3Uc=;
  b=WE6D3pqQ5LLWotOmBKxGPhjkBuphxxGAMYb5nwSy7gL2tJzOjmM16PMM
   BG4hoYhMuc69PBNFAlz3mr0sXG3GxWF4VuEGfGoiHMvZlKCSL8ahxkkfM
   lhNd+tVT0dsza6MFMVMLbFZQ0zMkCwHikBbO3mSdt5nHEi5NFzhCwtz6V
   yHZbqrhNnhwq5BFsmK6hKEKC7/8XRnoP2Ri1o/t3U0hz5LX5SIKsqSHp2
   Vr7WGWk38mIOxj+NWL2bpJQPI77D5w+ifSDWJWoKkRDMgCCOENtPwGIRO
   dPSMvfb0Wn1Ox/zTApe0MbLKROF/vsP9mWD+O15MQRaRRMwDO6AwEDvu4
   g==;
X-CSE-ConnectionGUID: 5ZR8FVS+QDGKESZnUm9KTA==
X-CSE-MsgGUID: 8sSr+fT2QlK3E2bbj1zNQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64640916"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="64640916"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 21:55:18 -0800
X-CSE-ConnectionGUID: qvWep7V1QI2Vt0srgHwzHw==
X-CSE-MsgGUID: DYoYu3DOQEesYvuJx3Olfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="188175088"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Nov 2025 21:55:16 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHbus-0000n3-1b;
	Sat, 08 Nov 2025 05:55:14 +0000
Date: Sat, 8 Nov 2025 13:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/services/ras.c:32:5:
 warning: no previous prototype for function 'cper_severity_to_ub_ras'
Message-ID: <202511081317.igsm8YAI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: b16c9013e8adf3fbfb1f5a016785fd034c744a1c [3075/3075] ub:ubus: Support UBUS RAS capability
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511081317.igsm8YAI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081317.igsm8YAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081317.igsm8YAI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/services/ras.c:32:5: warning: no previous prototype for function 'cper_severity_to_ub_ras' [-Wmissing-prototypes]
      32 | int cper_severity_to_ub_ras(int cper_severity)
         |     ^
   drivers/ub/ubus/services/ras.c:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | int cper_severity_to_ub_ras(int cper_severity)
         | ^
         | static 
>> drivers/ub/ubus/services/ras.c:272:6: warning: no previous prototype for function 'ub_ras_recover_queue' [-Wmissing-prototypes]
     272 | void ub_ras_recover_queue(struct cper_sec_ubus *ubus_err, int severity)
         |      ^
   drivers/ub/ubus/services/ras.c:272:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     272 | void ub_ras_recover_queue(struct cper_sec_ubus *ubus_err, int severity)
         | ^
         | static 
>> drivers/ub/ubus/services/ras.c:328:6: warning: no previous prototype for function 'ub_ras_init' [-Wmissing-prototypes]
     328 | void ub_ras_init(void)
         |      ^
   drivers/ub/ubus/services/ras.c:328:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     328 | void ub_ras_init(void)
         | ^
         | static 
>> drivers/ub/ubus/services/ras.c:333:6: warning: no previous prototype for function 'ub_ras_uninit' [-Wmissing-prototypes]
     333 | void ub_ras_uninit(void)
         |      ^
   drivers/ub/ubus/services/ras.c:333:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     333 | void ub_ras_uninit(void)
         | ^
         | static 
   4 warnings generated.


vim +/cper_severity_to_ub_ras +32 drivers/ub/ubus/services/ras.c

    31	
  > 32	int cper_severity_to_ub_ras(int cper_severity)
    33	{
    34		switch (cper_severity) {
    35		case CPER_SEV_FATAL:
    36			return RAS_UC_FE;
    37		case CPER_SEV_RECOVERABLE:
    38			return RAS_UC_NFE;
    39		default:
    40			return RAS_CE;
    41		}
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
