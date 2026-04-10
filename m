Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBD233F5AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806524; cv=none; b=A+1yYHY8BqAI8RP/r481laco7Ipm6yKiPJWQkGeWqoLWFtb0zAbBgutoMcB8C4HU47L8QjlG1++NsZ6Wz2S66BOiloloajc0GwMlXqhQ+raGoc4w+/RRXFFANuuVguHBzOXO+DQL5zCekqG/jvfdMv4QwgT2odrw2IqONzXTXIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806524; c=relaxed/simple;
	bh=DmOBIQMJbENmB0uBkbehuyRFcxAuD/13bD/5YyrB0SY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sVtgA0w6yCMUKt6mq22iE5HpfIx79XTu5fJI/hTVKFMm2xqRvWs0vxvhS6sFa+Q/xTHkfGDNq150lfmZp+hpw3tNjcUQImIcZuCLaoU84A0ThxVmnMkiFmfuH8XgOCXRSx00SSN0FKleb/zR1ACs02ntnNbXPIarSasSehJG8fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtV4g0Tf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtV4g0Tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775806522; x=1807342522;
  h=date:from:to:cc:subject:message-id;
  bh=DmOBIQMJbENmB0uBkbehuyRFcxAuD/13bD/5YyrB0SY=;
  b=JtV4g0Tfrho0kALAq1qUmyVMnckKfsMiA2/THPEj+I2qhYdg/twxPbuO
   Yc1EqZhUKRF69n3T1u30ZsfWZobG0nyc3lQGuAfF7vR90pjyyrZ3a0J9H
   muwnTpgeNIXLXd5mMIz+Y6i1ZdKz65eiw8yQAVpVgZYwQyXAaSN4fvWEw
   kXZv9uXk3Q8u8Ad5LAervCvLTX7udVl+26yM/ZE+ROrKTyYKTsNVmOQib
   O3CV7srAJxIbiUb+G+GABlk/Tb9scVowt4OGRC57q+SAmx4rAr+oSS1Gb
   0nEC8IYQo1TcK5P7g1/cye6Vpb+hdOdy6B10IZAy6+Tq6ue7gzNQGduN6
   g==;
X-CSE-ConnectionGUID: EEEl6/w1SCqz+Id6gajLbg==
X-CSE-MsgGUID: sQcAqDBOTHudOkTnP3YQ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76702007"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76702007"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 00:35:19 -0700
X-CSE-ConnectionGUID: 6O1XYqs8T0SSkZBIEGCUig==
X-CSE-MsgGUID: I1r7vGJgTvamYtM2Ap4llg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="224272790"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2026 00:35:16 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB6OY-000000003S5-26WN;
	Fri, 10 Apr 2026 07:35:14 +0000
Date: Fri, 10 Apr 2026 15:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2] Warning:
 security/smack/smack_access.c:650 function parameter 'label' not described in
 'smk_import_valid_label'
Message-ID: <202604101555.bbl7h3xZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   08e21ebff803243bccd5e6cd4a8253ffebf74c64
commit: cf008f5bd3d5db210d1edd244e7cd1d879cb1a5e [0/2] smack: fix bug: setting task label silently ignores input garbage
config: i386-randconfig-007-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101555.bbl7h3xZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101555.bbl7h3xZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101555.bbl7h3xZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/smack/smack_access.c:650 function parameter 'label' not described in 'smk_import_valid_label'
>> Warning: security/smack/smack_access.c:650 function parameter 'label_len' not described in 'smk_import_valid_label'
>> Warning: security/smack/smack_access.c:650 function parameter 'gfp' not described in 'smk_import_valid_label'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
