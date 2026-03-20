Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4BD3C5DD0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023938; cv=none; b=haALtaucQw2cSVwQIkNmgDPLnfqt8FviVZ+CL9wh9UgxhDPLrM3nMxDnrszNybbXCvBCFW0fQviim+7aWvniAEg9eh0ietECOl+/FjmuEcAwHOfC5YMw8PgfWAOCMEH8B9GTOMySbWX57QxBRnnuEfYyF7230GuzxrvujI0WHv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023938; c=relaxed/simple;
	bh=cIOGPa2qO04DgCKXuYdyM2MKI40Fh9fwskZT3BM033c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=da7QlQD3r3OXlAnMP2RJhAO50o4Fqx+qE3/gF16QmJhW8F5L7BHDT29MEr7YAqip5SagC8V66/xEtFbOQhIxvKZOIdo+u4MBKlmCxlucPBcHEqyyy+3/jNNMV0YAWevQTfuZfbqzpxIc3vcz0rxeD7U66NmCDnyglr3vWAQIUag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Psp1ULY+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Psp1ULY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774023936; x=1805559936;
  h=date:from:to:cc:subject:message-id;
  bh=cIOGPa2qO04DgCKXuYdyM2MKI40Fh9fwskZT3BM033c=;
  b=Psp1ULY+zaPHtX35tmnx/MagDI/DPG5W6BVoQJZGhySnm8NFGeE86ir1
   XmfNwuW0X1MjzPYMaDvgmSt41I1xXpa4IZgN+09+Rc7Jp9Z2g2dLfdIPS
   ZUtxaEZ3FeHH9Z+UydZCopOlO07gYGGaUCYckDrhe8nsDIU2XK4JlD5Mm
   qwdnAkbxR0/zvVQ3umUkDeWCQf1T0Rqi25Jjgn+qecDVupvPgFup6yolM
   j94USwWKrEjkCXRJ9/o8JXeGe+Ga0vGfGDiW/+xz1l7hBBD+qAKS940KQ
   I/9szID507yycO0NZ9ORBkoY03MlJeTnCArgjCxMy2gHTo1Xve6TqX6aK
   g==;
X-CSE-ConnectionGUID: zmICPkztRkiLBDcq8oMhow==
X-CSE-MsgGUID: r4kg4QiuQBihqNmo/v1c/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75230745"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75230745"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 09:25:35 -0700
X-CSE-ConnectionGUID: e5IHbSB1SEO2AM5MhcS9zA==
X-CSE-MsgGUID: 1w5l2jMDS6eQMK15sOzZag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="261235491"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 20 Mar 2026 09:25:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3cfD-0000000054T-3NFb;
	Fri, 20 Mar 2026 16:25:31 +0000
Date: Fri, 20 Mar 2026 17:25:17 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl-fixes 4/4] Warning: fs/open.c:905 bad line:
Message-ID: <202603201759.AjqLbLHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux ovl-fixes
head:   eddcc69d8fdf2df5597db67e422d6b91f0ce7be7
commit: eddcc69d8fdf2df5597db67e422d6b91f0ce7be7 [4/4] fs: allow backing file code to open an O_PATH file with negative dentry
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260320/202603201759.AjqLbLHT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201759.AjqLbLHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201759.AjqLbLHT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/open.c:905 bad line: 
>> Warning: fs/open.c:905 bad line: 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
