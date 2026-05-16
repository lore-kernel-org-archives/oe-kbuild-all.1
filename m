Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8E30C17B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778914949; cv=none; b=qUfBhc0EY0PGOOt1jCUCJ2YMSkknMIHj1gmXrPS6dAt0sPbCd8ZWpIL/P+TuL5M/nedZdQHtaFVFoYmchMBLkwA7XHramTdqlnQ/OmbzZTHKKcb3tpso4rpH3TsUP+yJujBDT/n5QEwSe6daJXsGvrzum3qlvcyKoy15t1YJGMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778914949; c=relaxed/simple;
	bh=eYN1tyOBaQON2jrlkLNWNeE78FCjIytom7dsHxJaD08=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WVt4DxBzS1YLB2Ty5cK32be/9nFJWbr0R84aYIevqOvKvfHbcvXlOVate0L8sM8qVdfbmGG5hZMDHh6oUNeiA30MvTv7afYpELIi8BTwgtezdZfdp+CRHgSNAo1oyUO7O0FQj22PxoXWCL8V8ZoCR1QVvwsAuu5DCufhU6Cvs1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbxOWiFU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbxOWiFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778914947; x=1810450947;
  h=date:from:to:cc:subject:message-id;
  bh=eYN1tyOBaQON2jrlkLNWNeE78FCjIytom7dsHxJaD08=;
  b=hbxOWiFUwCSfm82Yi5+6j5AlDPBjmHOTTaY/d2tOe/Jae7Oy/aY61HS4
   JTVDSfhKd3sDp/ZAb/vfALdWGkf39ZiyotA68dWHJwEXL0C/10+BaibzQ
   SZhvEnsYf/8BnwG5r7IaPElU6HxkIMkmktNP56JRqrnSC9YeZi5ddDiAF
   ZCTv2lA3TCfLjAnhd9gKUA42mSv3eioYwE9w24OILnvujpguZ6LEuqs7v
   2TMRgLfqBMYB/GARNxPyD6G5BDwB6EvHpizrIwVqBDOxriNM+fG1i4WX2
   HuaWmKGvTi4N9PpJYy9sbPKPEFEQ2Q3hxe0Gxqrvs2/9UZIMEfiNZ/RDb
   Q==;
X-CSE-ConnectionGUID: CUiytcVNSgGdPH1cinQSLA==
X-CSE-MsgGUID: 4fi8RM08Tp2fPswjRww3Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90963722"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="90963722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 00:02:27 -0700
X-CSE-ConnectionGUID: 2gB7I1ZaTbWDo6MJ+Ow3ZA==
X-CSE-MsgGUID: 8ewvqvMyRzC6ISdVVDNmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="238792337"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 May 2026 00:02:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO92U-000000009Ff-2wi3;
	Sat, 16 May 2026 07:02:22 +0000
Date: Sat, 16 May 2026 09:01:41 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/240-isp 25/53] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605160825.7ljFegFs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   e07eef9bb80835218a1344ffca2cb5b4398dd0eb
commit: b5abf9c456fe27274a5d2b6a075528761727176f [25/53] media: apple: isp: Remove ioread/iowrite and stop doing raw address translation
reproduce: (https://download.01.org/0day-ci/archive/20260516/202605160825.7ljFegFs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#487: FILE: drivers/media/platform/apple/isp/isp-ipc.c:252:
+		/* Only enabled in debug builds so it shouldn't matter, but
+		* the LOG surface is always the first surface requested.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
