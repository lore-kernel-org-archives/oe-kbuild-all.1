Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793534799;
	b=VE6YAutjj4jOdlZeQY+EqV22jlTOuSzdUKEK9uEn0iHx/76i7rznLDTfdvdGq3KtbH8o
	 U86PgIni6LE5HrLKVjm2vI84MK00woZ3DqjgHL/JVF+F9my5tLSmKoQyCb6Yndzv80bSZ
	 bEk76AYN0ZorhJWaj7podmdUAyK2v8FxsjRnoUWkh6nJVifymguEPu1FNuTpHh+0ViJx+
	 RXFGJE4JqNn+eKl6NZ84hxsU8FvOllkFMWL17FC9QnImBsdY+wD7p4YHMqlkod1NnLB9+
	 mPDt1gMOlLAZQxg01YgOCJtzkUDU/SlOvRdkZxmO0nZKc1DVcOunuEd61TazbfxKPNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793534799;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=B2/gTTOXCXOOfPcoazIIuFDjzVuFbo3z0W9lAt3uqC4=;
	b=Z91jhssfTj4F4/d+8yxq23BumcYFETBtrQVugVfdDSLQ8QTBHMkyKN/AfMw03QMqceDV
	 eJHLvu/N704m8D58tTIXtqO2YaJsHhzl5KPOV9k+lyE1Go1t4efDFk6W+4bM4j5qDnByd
	 JNogQmif0kfyCV9N4Iq8RnIYNYRt+hX1zS5TDwHTET/uc74Hu9auiUECF28XN+br+zwes
	 AaapH84IQYo2lTmCVrIHLux7vQxYUxtuU3GEVCAs3s4SQQSGYUnuRXFOBQUyPgHiFDVTd
	 4lBfylt77xzA1aLGV/Md0XsEDl20CP3sZiy+vu/IZPc4SUQn0HHf80w5BW8MfLIWJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cC0Vp7Nj;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09125606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 12:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09125606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cC0Vp7Nj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793534799; x=1825070799;
  h=date:from:to:cc:subject:message-id;
  bh=P1LvBpEh0b+UzQr0yyCoW62CA5H9u4ZC2qPMm9Iotf0=;
  b=cC0Vp7Nj5auKoQ9T+zcAdsAJQo1ILNubt83zvbzFMM2xsvvXyiP5CqDj
   fARJe5oeoGLwTGLKywd7v2Z4FfEkbwG3jiJINmfmxf+BKq92Q/1JGIBcs
   Vbiz478NQnZIAN62lsvjNtX27cNr9k08+IeF0RZuYtK2XRLLEjN2eORQO
   GRNkljgjxIo1xWmTq0GDWbrml1Ab+an6u2KYYttgz/fJFYl3gUy8Hl6Ob
   5UXCXRNc9AmJSiUjaeCyugC+gNC1y0xBCPKj24UOS9aIhNv1bD/68Hb94
   d3a37hpU8U6RzatGkHQ6uI7wCnhpixtMDvpuij1ZhgEjYpy3Xl69EiNts
   w==;
X-CSE-ConnectionGUID: Mz+5/x5hRqm8DNiaRQIeoA==
X-CSE-MsgGUID: 0b0FfSd8T9e8ARyK+QTVVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2142868"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2142868"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 04:06:38 -0800
X-CSE-ConnectionGUID: XkrfoioDSPW7TRilD+acag==
X-CSE-MsgGUID: zCY0NuONSdKXZAa43ACKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6401497"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Nov 2026 04:06:36 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNUKV-000000006gx-1Zlk;
	Sun, 01 Nov 2026 12:06:31 +0000
Date: Sun, 01 Nov 2026 13:05:56 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.procfs.cleanup 80/115] Warning:
 arch/powerpc/platforms/pseries/reconfig.c:359 function parameter 'kbuf' not
 described in 'ofdt_write'
Message-ID: <202611011331.kwp26asP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/brauner/linux.git work.procfs.cleanup
head:   149defb030fc6398856817bad7186556426e0845
commit: 215a8562deae01577440c7c9ccb15b8df743bf4a [80/115] powerpc/pseries: let procfs copy in writes
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261101/202611011331.kwp26asP-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611011331.kwp26asP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611011331.kwp26asP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/powerpc/platforms/pseries/reconfig.c:359 function parameter 'kbuf' not described in 'ofdt_write'
>> Warning: arch/powerpc/platforms/pseries/reconfig.c:359 Excess function parameter 'buf' description in 'ofdt_write' (did you mean one of: 'kbuf')
>> Warning: arch/powerpc/platforms/pseries/reconfig.c:359 function parameter 'kbuf' not described in 'ofdt_write'
>> Warning: arch/powerpc/platforms/pseries/reconfig.c:359 Excess function parameter 'buf' description in 'ofdt_write' (did you mean one of: 'kbuf')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
