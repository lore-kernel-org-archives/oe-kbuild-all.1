Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609115;
	b=ASi8FYxuy2UKv714eaaaK3z9tpcFy0tiQlXupYni4dwKApz+dBpOYLJBFyYPUjriua0z
	 MqBkvmXMeNjQe++IAgkCiDZfvJHKpMzs4gEU5Sp7HP7jJhaJvyg8MSw+30sjOEp72Uh1d
	 qKF4P7fvgk55ongz1zjl5XYzuemQdYI1LtdvvT+OMN5qzzf3eD/Ec6yRhFrLxzhbWnc88
	 GShAaz+mI6tW+b1knW9wPDoCzo4ssU1cjfAR8iN67xiesh3F6RJ+TT4TWVN5O3KOkYWGh
	 7M0ZIfdFeVForEdkY6s8CH6Rs9B1VagqRv33cEKh3ZiezUd5UtmKY3IupW0Vls13Xww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=82ruNYLNUYqy0uXp7jwnJdZMdHWvu4VqnB+ED4+mYA0=;
	b=XV3qmYu2t8EIwAyVDYH20dKmrT7Rfrmh1xcAeDwuCAPqpZHipn03jcwYS5eWfaWDgz7e
	 GK9BKP/q2ldGmIGqOVH+09OL54I6CBa/59QdoyM1TDdcnDfIH2Y4+67jRLwHaz1sSIuis
	 lZsuCWI9xZcxT++OC30VAWn+Sca2BHa6jjIdh/I9SB2hw6dCFKOKO2oJobMvwyeXog6tq
	 j8MkcUWQawi/iYKiPkdKjZcztAsKHesq9LluLoIg2WaKb2CpAvl4cWmjTAqV5BrUOD7jN
	 tjWtCrv9eiMqv3PD2i8NLAlJRSueorQnTCGSiO6KpTLg6eRNt80+xhIrhygzp+NS1KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LodaeUWl;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C29606A893
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 22:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C29606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LodaeUWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794609114; x=1826145114;
  h=date:from:to:cc:subject:message-id;
  bh=0HfjS5cKDxvBrSr9aGGse4slSbjGwKf7nE82cF1nU5Y=;
  b=LodaeUWlu+l64qG3vQBonMwtY1w2VMJKz2nHnDo+VUKGl0CG/du6gvps
   krusGCAwJZpTBW+sVTNOdorLQkiTbah1ZQKYFZL4DWnTFfl/eQM8uiDpD
   c2Sj4K5aqMqKPnhnLUKNuH6EGjVnRDkasTyRRzqKkNl6SfjyiBdFKCCbI
   OlZVYQlee7xnbSeAN1qtjaXeoHKp5a0dXmczx8qQoHWdAf1ji842OEKfI
   jaYaeyfmDj1PB3Gq43lU8+kiDKZay2WR/UE3/GjIOqTd4lQaYcm8oHQT8
   lf2R+6TiJbP3rphmAfaVcra4sF4dJ1KKfz2aboYACbg56rIHa+3md9yjE
   Q==;
X-CSE-ConnectionGUID: oziPB0uVRheFOh4ucVGZvw==
X-CSE-MsgGUID: fQ0KhcAqTf6YhPlxOpkX4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3302251"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3302251"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:31:54 -0800
X-CSE-ConnectionGUID: sMUIvGX0QQ68GsfPaj7YxQ==
X-CSE-MsgGUID: 78Km2C/WQv25j277Q4W0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10754296"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Nov 2026 14:31:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRzoE-000000001Lh-0fvT;
	Fri, 13 Nov 2026 22:31:50 +0000
Date: Fri, 13 Nov 2026 23:30:54 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [jpirko-mlxsw:wip_attestation_all_2 13/68] htmldocs:
 Warning: Documentation/driver-api/ctlv.rst references a file that doesn't
 exist: Documentation/ctlv/abi/ctlv-example.yaml
Message-ID: <202611132336.GeL4R4SU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: ed1bb20e593812e25f641db240eca762a6a2dca9 [13/68] Documentation: ctlv: Describe how to write a family
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261113/202611132336.GeL4R4SU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132336.GeL4R4SU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/driver-api/ctlv.rst references a file that doesn't exist: Documentation/ctlv/specs/ctlv-example.yaml
>> Warning: Documentation/driver-api/ctlv.rst references a file that doesn't exist: Documentation/ctlv/abi/ctlv-example.yaml
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
