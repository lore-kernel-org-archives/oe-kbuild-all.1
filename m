Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8EA38758E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 23:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777507112; cv=none; b=cNTMbXkZsbpEsvWwniujrHavBn/F+EnX5fJf0gk9Vb0Wjk2F+g/UIbqG+9Vz00/I43UBz5zYX/BdkX23W4Kv7p3eXKimTcELfofeHpSTfKV/9X59X2ejXW+SOPYCsmoY4McBxn7J8uUHrDw/KlbQu7VbiRy/xCdAOEFECsjy6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777507112; c=relaxed/simple;
	bh=Pu4fVYnH7q5npdPgyoceDoc1BZOuu6ZywYbkG9peCbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptZN2t00StELYnkcAhvNuFNlgUn2Plsep+PeEMLd/jbiX4PnM2g3IiHEUDN9KqaIF9FPlXynTe6Wy2VjgQW8oNe2D+J89bKyZSAP7S9WAFgQnB1YOz4FBaJHXLwW8x6M5ilYoyTHV0NuhncELXpPHdKowlcy4UgdIHVMVX0Pv6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wzv+s/Hh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wzv+s/Hh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777507110; x=1809043110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pu4fVYnH7q5npdPgyoceDoc1BZOuu6ZywYbkG9peCbQ=;
  b=Wzv+s/HhqakWw4ZlUtPXurmBcFI6VOFGT4Enn0QOu+VsarsrSwxHSJQ6
   MVwJK+3z5bND29nkws8UJ/pFIBsuUt18q06LsHWyqAErIJkA5t7kWCdNt
   dMJGir37VDRXpR3MqmJGBFmM4/o3VPHwFRXpC1NEKuE0L6b4Qv5oCDYmp
   qrUcf/+VA9CBSfqZwNqzbEPRxV5TG2X2I4EVsrkziuX1Y5cUAbrb4ZPz9
   P7mrLjGg5JkCwCodJswnpJBDsIa2CyH6x5nVfrBCClq2DdWFTMFqeW7uM
   jIm2raAhBr7EjfxZPohyBrLwLzYd6KAK025YLPyu89ZaF7cPU3g1hDvfV
   A==;
X-CSE-ConnectionGUID: N6yWGHgsT9S/v529pci86w==
X-CSE-MsgGUID: Eg2vV0YmSxqbC33T6GYBTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78554398"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78554398"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 16:58:29 -0700
X-CSE-ConnectionGUID: 7tW+9+ojQaCMSzeyuRirng==
X-CSE-MsgGUID: bbpw/1a4SSin7IcUrK1bTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234301597"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2026 16:58:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIEnQ-000000004eL-2Zik;
	Wed, 29 Apr 2026 23:58:24 +0000
Date: Thu, 30 Apr 2026 01:58:17 +0200
From: kernel test robot <lkp@intel.com>
To: chenheyun <chen_heyun@163.com>, rafael@kernel.org, pavel@ucw.cz
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
	chenheyun <chen_heyun@163.com>
Subject: Re: [PATCH] [PATCH] PM: docs: Add comprehensive wakeup_count
 documentation
Message-ID: <202604300146.7zqFMAu9-lkp@intel.com>
References: <20260419072330.101419-1-chen_heyun@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419072330.101419-1-chen_heyun@163.com>

Hi chenheyun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chenheyun/PM-docs-Add-comprehensive-wakeup_count-documentation/20260420-160506
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260419072330.101419-1-chen_heyun%40163.com
patch subject: [PATCH] [PATCH] PM: docs: Add comprehensive wakeup_count documentation
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604300146.7zqFMAu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300146.7zqFMAu9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
>> Warning: Documentation/power/wakeup-count.rst references a file that doesn't exist: Documentation/power/wakeup-events.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
