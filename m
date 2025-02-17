Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C315666D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811750; cv=none; b=Jo81rdrGqWYfQ83N9AiRPCyMmMVBagNJDsgUeXr939OzRrL4PcDUi4RwXqBdG94ZjnGumIsm1jpQCcxMfR8V22+B8UelmpR/uYff5E25rIAD2zZEynB7KEyoubR2hyat4EC9hUrgIUfzcBjEmp6S3pj54g863/2MgHq2qkQ3Az4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811750; c=relaxed/simple;
	bh=7kU5UAfTNBRgNs3LI1wwaQMgYZuYFRy+Y+7zq2kF9ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sipQkdLn3jG77XgWlGc2MjvE0KwKY+I6/bIll3UciVh6sFBPrNaMyzIaewS9U2ZuL350eUtdxgOkqc/j4yMjJ9lKty8VTZk6Wtw6bqGP8gOP9coOciG2+EBnPMvJdX1NYXWS3Ld/p79kV1WIux1IPDJxsb8fC2FXwxtrpcGDfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiqoAkhu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiqoAkhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739811747; x=1771347747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7kU5UAfTNBRgNs3LI1wwaQMgYZuYFRy+Y+7zq2kF9ss=;
  b=DiqoAkhuSFW1kKpoIeVKElg/pmaIJxk1jdrTE9A8khoLdbgnts2Zf+I6
   5x8+LkosGGW0rmDE6JWfdBW4e+RnMIk/rEp5Tndg+KVruaXDSNcJxsTSq
   zX9n8Fz3zBL5igSpTJNm8CeMLuhnUBSjlLE/Eh6RiofoLioPBIrcGqB1O
   DOQUj4c4b5C3jBjLZKdGKBhiHdrBMYEyCiNJDlVZ+PCtBSHm+J4H31z9W
   RQf2xkIHDsxELR09ob2D9ZsZC42lkZ7iMKJPHESm6IWG8NgTBdJsW44sn
   wUeFJujYyprmh6nwda+f+ag6+a4sS9UrLzFhXAzJ/UbEV/zRUzDALL3rM
   A==;
X-CSE-ConnectionGUID: f2cmgFXoS56gLfgptv2MOw==
X-CSE-MsgGUID: LIS+JzOaSo62H9UY+c72vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39693292"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="39693292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 09:02:03 -0800
X-CSE-ConnectionGUID: lwD809CsTXORGsUsOEwEdw==
X-CSE-MsgGUID: wpf3NK4VSomencCg0pketw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="114102640"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2025 09:02:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk4VL-001DNH-0X;
	Mon, 17 Feb 2025 17:01:59 +0000
Date: Tue, 18 Feb 2025 01:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>,
	Jerome Anand <jerome.anand@intel.com>,
	Mariusz Zalewski <mariusz.zalewski@intel.com>,
	"Shah, ParthX" <parth.x.shah@intel.com>,
	Tomasz Jankowski <tomasz1.jankowski@intel.com>,
	"Krolikowski, Rafal" <rafal.krolikowski@intel.com>
Subject: [intel-lts:pr/56 0/1] htmldocs: Warning: drivers/misc/gna/Kconfig
 references a file that doesn't exist: Documentation/misc-devices/gna.rst
Message-ID: <202502180033.bV5C8nBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Junxiao,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: b2eccf8f49c2ecfbd40001948e14ebb824a1ac60 [0/1] gna: Enable support for GNA drivers
reproduce: (https://download.01.org/0day-ci/archive/20250218/202502180033.bV5C8nBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180033.bV5C8nBW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da90*.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>> Warning: drivers/misc/gna/Kconfig references a file that doesn't exist: Documentation/misc-devices/gna.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using sphinx_rtd_theme theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
