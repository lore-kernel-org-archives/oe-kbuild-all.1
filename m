Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793131425;
	b=EvExvY+2ESZMbjYnb80rgeiFNgzcPe1zQPZSXR/iuWp2oqnSwK8XDn8fhOmSxnuY/bJr
	 ArRea0m2fHPmCiDk3SfVbJ7tvrG1RcvOueA0P99ZFFS86kPIZRMh97PJ7UhZDdFFTZIfT
	 K7ht+2Zcuk3Sz5Quj/23LmPCBZQlTGFjeSdQ2zzjzVs2gREInSEWkYjLk+VRKVT3qYbfK
	 IjEvaqh0T2QHPbaZzvX994SKrlaP8/yOPofYW7vfqjhDulnFtJuM3lBwcjkDZ7sltKiOS
	 R3dKpO4Yjcg0sTHuHHvEZH+lzJA3IW46d/H84/X/GAMEgPCermSrOEF/wscecUOwbzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131425;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LhwYYyvS+jK5+zpVGfGuZ+KJC2eD3qRe07VLISH+nGQ=;
	b=EcPWFTuqJcTmG23juZHx+F4jncQVPfDA9ptimuWm2FDqS7aiockd1TTagnMtDa2CaCyd
	 OroCYywIpZz5UBXHmLmt6WtVL4nluLoRliDc24jVE7VSSg7De0RYDJW+VxVIYk5SgN5xJ
	 ERFA+gNlEKFgmpTcLkYJhHlJy3JU2l6Vqi40nzRJbdPocaho1lteuvVp8al4exYNfRajG
	 MfnpKQH2v9K+hm9FPU0gT+W/mNIJ7B8fVttN1BI79OT/+qeZ+lyQEf9ExuteSYjqbZ+bc
	 +0pOCNdD+x2q3dcBmsZAjXWhANJFOYoTAhNxoOkmDHqtopOFJGEI/xPbP20OgGGdkcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f9dRrrUr;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7F606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 20:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f9dRrrUr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793131424; x=1824667424;
  h=date:from:to:cc:subject:message-id;
  bh=Eiudfsg1wSBtoZGRdIYdX2AD6DSyqV20vmeVXqNTZXs=;
  b=f9dRrrUruhdsw2QnhzPU9M2X9dp2VIosQh7oqMlndvU/Peydw1EgvE+I
   HnRycu4N60Rj0+DxhOsRzKR6nivjqUjxyDlx+RxzilAmVq6QGsLW5wFOc
   lCYl0csBpJUEBw0KwaO+QSMLTluES2J6XDd1SRq6JEUjGP/dipXtu96jm
   sUvVpU1P5k5dFsGc0fSTMGHS+xF1t1Rnl8l8bmVGLWXm/lhjQpo1XXczB
   lJLk7A9i//bxNzvxZxQWddA/w+XW57hHNs/ygxP+7sj3EGwrPKc+Lgqm7
   bmEbyyPFkxxWuZIh/4FyntQKsXyWrezrk9FgMBdjKz8pe6E+PkSeW6W3b
   Q==;
X-CSE-ConnectionGUID: CzKW+q3zTOO42UbkLITB9g==
X-CSE-MsgGUID: hGUmBSq2RHe7/V9S/WutpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1872258"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1872258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 13:03:43 -0700
X-CSE-ConnectionGUID: fqYB9beNSVKbKtRd8HLd3g==
X-CSE-MsgGUID: qBhFHS89QzmsJ1IrgFC6Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4983926"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Oct 2026 13:03:42 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLnOV-000000004bv-2vA3;
	Tue, 27 Oct 2026 20:03:39 +0000
Date: Tue, 27 Oct 2026 21:03:22 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:random-stuff 9/10] htmldocs:
 Documentation/driver-api/gpio/index:26: ./drivers/gpio/gpiolib.c:4952:
 WARNING: Inline emphasis start-string without end-string. [docutils]
Message-ID: <202610272045.jAsa0ipL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git random-stuff
head:   6c5d9e149cf308ead35a6bd9016a5f1c74a33cea
commit: 2949919aef6a434982eb9e5e0b635f8eda0b4cbb [9/10] gpiolib: Add gpio_get_property_name_length()
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.22.4, Python 3.13.5, on linux)
sphinx: sphinx-build 9.1.1
reproduce: (https://download.01.org/0day-ci/archive/20261027/202610272045.jAsa0ipL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272045.jAsa0ipL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:779: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
>> Documentation/driver-api/gpio/index:26: ./drivers/gpio/gpiolib.c:4952: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/gpio/index:26: ./drivers/gpio/gpiolib.c:4957: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
