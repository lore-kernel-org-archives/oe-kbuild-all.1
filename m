Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538648;
	b=tLYLTqgx6+nC1NMO9bXeOi6TI8Z68KMDLokDP0nPkhV3ooDDDAbHbfPAxesxK9Ij+8Ga
	 thvmxCnRUCU+yKMZEKv/Ej35fWG4OvxyCQon0dVHbDmQTggYo/AFobCElCmP+SYeazM+O
	 5Km/WcUitQtO5lt5HMQSR9E6ncvkIDhU4taFh9SvORSTDlwAXFc+oxvJclRKPCsOvbNi8
	 yQaMuQpjDxTPIX9sSTCuXiCs/njL16CloTVkCadn5biZIpwjVW3PjmaMT+xeb37VbSoYM
	 BxielYGww16WdF1outa+RKhuo98PW/EWn45p24ZfhA5hsG7crxQ+6wZ0P6BEvOSadEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538648;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/BLjIp7LQel1rITKidY/UDZ/He83YSDISQKcmQPTMmM=;
	b=tD954mCTH5reHvhpDQIK1GRb+qbOJHzy+TFsfyDYGUSeCoayN3PJssXXIen0z0VxMb3d
	 i0701QEfggFjFNFwcEGV7qcd2Nfn5C9QGOQaGVhoJ3PctX6ZGoBigx0teHsEu0StUUygU
	 qLyZoGiFiH43ioTleoX3JjvuqV2tNoCuyoLy1X3NHyybXMH2Q8jpNBBiJD9NOerFDLC8R
	 2U2svjNrcMZZ8cxA0dhRls30caS5uOsp1jCqy4hPO0norKTYmkIUuHQrcjZjQNLLqmUDH
	 Wrq6XpC/j1QtJa7UuZtzRdAD3s1NbSDZNAXteoWl1CggmmPu4gB0QTjev3JwE0LXw1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWBZqLBL;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84708606A323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 02:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84708606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWBZqLBL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794538648; x=1826074648;
  h=date:from:to:cc:subject:message-id;
  bh=pDAIlkt1RAOy0BNi6S5Z6/O1no1SdZun5zbkAGMwAn8=;
  b=DWBZqLBLd+/hy6yX7auhMqwXKjTACsgh83c6XBjNOCd+833bzLxPi86+
   drrpMQR5KAeTNJ3lveugN02tGk0rpzDyLtNRTQOoMhtu91uXYOpbQFdVY
   70xHxS5TsNoabKoouwSd6wUectfzv6o/uhvtMDW8MtKVS91CPSonrKNYN
   +9jXEEpp59Gggdn7ssJIxY9ziIzvAuAdj43jfs3Ww5qq7pRec58kyPbHa
   4xsPXlSlJ80k3HCYcWw+PvyElTJZK3vwbVDbvvaX/apH4nKwU8NMT2KpE
   8ps95SngyNy+E8lReSp9RF42EDfZaj4JMvdheJZSfOEponAavnthQQ1e6
   A==;
X-CSE-ConnectionGUID: 9ceDj3OqShOstytINYubNg==
X-CSE-MsgGUID: eSUtGrp9QFW5uWxZEt/AdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3200254"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3200254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 18:57:27 -0800
X-CSE-ConnectionGUID: RDAeBbEbTS2GOfkdlLPopQ==
X-CSE-MsgGUID: EQpwzxmKSKO7zMyyPz7qxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8971211"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2026 18:57:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRhTf-0000000015V-0RLr;
	Fri, 13 Nov 2026 02:57:23 +0000
Date: Fri, 13 Nov 2026 03:56:41 +0100
From: kernel test robot <lkp@intel.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: [docs:docs-next 24/36] htmldocs: Warning:
 Documentation/doc-guide/checktransupdate.rst references a file that doesn't
 exist: Documentation/process/foo.rst
Message-ID: <202611130347.6z3dpT1c-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git docs-next
head:   2138148bf44fd84d3e0a863f0e8cb3627cdcc606
commit: 64e0d8dcdce89129a075e765b640f5ffc46a3015 [24/36] docs: improve translation update checks across locales
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261113/202611130347.6z3dpT1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130347.6z3dpT1c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/doc-guide/checktransupdate.rst references a file that doesn't exist: Documentation/process/foo.rst
>> Warning: Documentation/doc-guide/checktransupdate.rst references a file that doesn't exist: Documentation/translations/zh_CN/process/foo.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
>> Warning: Documentation/translations/zh_CN/doc-guide/checktransupdate.rst references a file that doesn't exist: Documentation/process/foo.rst
>> Warning: Documentation/translations/zh_CN/doc-guide/checktransupdate.rst references a file that doesn't exist: Documentation/translations/zh_CN/process/foo.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
