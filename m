Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A523CAA47
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409863; cv=none; b=cCVO9UbCpelan789cBTFX3u+hggmL/so6SAbhvswO1W7jlV0wti01KhIOpwX5w5seOqNbDiCPGABoIlM4Ay0toHIl7leVpj4nmCNM2lOt7zykLW3C7OqlK12anGQ9DsbsfN8E0ilyPIfjqfFAETSz8q6jiiuKrYx1LOUQrE7cIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409863; c=relaxed/simple;
	bh=Zr+AA4uNwaoOqz+EVWchln7dIkFGD+pe3DnbZLpvxdc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ewHlh6TsUixAdmXK0nVFWDPjxCoR+GVUuVeh7/wAl5MJwf288rP8J/LXb4mvy/Vnym8fNMgVTCb5B+SJskBiHyWCMrxSeu7SGseOXOh1E+mUA5/r5h2L06nC1pl29f0ZQ2O/Qqqm67aCJhN2cLmUFbll7EfVh9Ukll9p1079ZJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b62TKvKW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b62TKvKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785409860; x=1816945860;
  h=date:from:to:cc:subject:message-id;
  bh=Zr+AA4uNwaoOqz+EVWchln7dIkFGD+pe3DnbZLpvxdc=;
  b=b62TKvKWFRGdJcEWPKFk0uInG4YqeGqq9LhB3MNAhwTLczD8QSAGgE+d
   ghNYnYwD8/SpHI2HEKqHdSwCkPSw37+XhfnTT1vLcuAiWebHTN++pB5XC
   We6AyKvWegmjh5nISIVCJonfI8zZ9iLodWxswIEnuB4hH2X05M8xdl13/
   cII6STLiz8e6OHOMH4SfMQiT5/dIn05cCGvjfm23oEDCy8z9Sl+VXtCtH
   +Adocfhi117NnSNDjbsMa59rFx4P8GlPLfyjsOsszWD4+4LhzrUZWo4+d
   pusxp8Uz6u8P/USEv/oTmhlmyQ2mixpS5GaOpuDr/PXLlEd2N5SRa/lzW
   g==;
X-CSE-ConnectionGUID: 8BpFAeZ6QpOSWd+jcYBrtQ==
X-CSE-MsgGUID: ctfbBiVBT5yfpyHhPqKT/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85900992"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85900992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 04:10:58 -0700
X-CSE-ConnectionGUID: ktH0mFkITm+3I+RwpGV5jw==
X-CSE-MsgGUID: c8/9p+1BS1ekFwMe4uKVUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="255972432"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2026 04:10:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpOf4-00000000gSw-2k8v;
	Thu, 30 Jul 2026 11:10:52 +0000
Date: Thu, 30 Jul 2026 19:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: Fred Treven <fred.treven@cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cirruslogic-drivers:v6.12-cs40l26 36/694]
 include/linux/mfd/cs40l26.h:38:10: fatal error:
 linux/firmware/cirrus/cl_dsp.h: No such file or directory
Message-ID: <202607302103.fJcadPhh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/CirrusLogic/linux-drivers v6.12-cs40l26
head:   bc4ed91198ba7fae8ede7cb90ba2496dfe9a377f
commit: 0c4cc2d9f8e6b3a6a7bd74954c21a58880436412 [36/694] ASoC: cs40l26: Add CS40L26 Stub Codec Driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260730/202607302103.fJcadPhh-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607302103.fJcadPhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607302103.fJcadPhh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/cs40l26.c:7:
>> include/linux/mfd/cs40l26.h:38:10: fatal error: linux/firmware/cirrus/cl_dsp.h: No such file or directory
      38 | #include <linux/firmware/cirrus/cl_dsp.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +38 include/linux/mfd/cs40l26.h

a890e2fdb00940c Fred Treven 2020-05-28  37  
10f91c81a4d7f2a Fred Treven 2021-01-07 @38  #include <linux/firmware/cirrus/cl_dsp.h>
a890e2fdb00940c Fred Treven 2020-05-28  39  

:::::: The code at line 38 was first introduced by commit
:::::: 10f91c81a4d7f2a41526d9e27c4c83681f0d12b1 input: cs40l26: Change include location of CL DSP

:::::: TO: Fred Treven <fred.treven@cirrus.com>
:::::: CC: Fred Treven <fred.treven@cirrus.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
