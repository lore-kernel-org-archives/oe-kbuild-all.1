Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374FD31987D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770115491; cv=none; b=KiSfkV40/3nqVdWr2zwHO5/h2Hcd+wzxS8jECNMG5maqB/LifMNMJ/JMIblrQ5QZkLEIphv2lMn2gLoul+eEgPG3me3NkkFd60Gz7YaxLYp8qt++HW5/VQsRR+IBr47fLzfrLrIB1zX5xQHEfCdRKm4xOEa2wk1n3tYtfSgLuhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770115491; c=relaxed/simple;
	bh=ANjKinJIvWojB90sqitT/kZQ535Vtb3783STbuL6p1g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hmfgoH6i47azXiPb62rZwdpP+CCg/LQ6Tx3d4IsVlkgvV6a4dmvwOR4zWxwKFaWIrshj7bNL+S35jns7KsmN1+AAmIh59f9ZtTNBMrmZ1CWLPs7KwbeICWb9VA51tC+r/57xplSOsoIDJ9TsNyzsYFrlSq5TNzKYryBeQg+7mBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfoGMjTZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfoGMjTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770115490; x=1801651490;
  h=date:from:to:cc:subject:message-id;
  bh=ANjKinJIvWojB90sqitT/kZQ535Vtb3783STbuL6p1g=;
  b=VfoGMjTZWM15N0Yfa202NGmJ+FzczSfvOgvur7rNS0g9OXHe0x6NDuBq
   tmPUjJoY74vScV252u96MVRNI2Hy5tkBv54D13CGCUytH+yXjnGHo4NIM
   /0gA81xxq5NirSdo1y+7xJSYW9+ArumBXtGIX0O3HuE+i0iJm4V6NG7qa
   eJ5e2YBI26c0mNKZZRyEHt3AQoJy3PZjdEDt3Bwo3aQflD4mchsmYVy08
   DtN1Ai8AenpeOWcHRu1IKTDxXa8BjWv6iJDoXOOEK7g1SPszm7ZrPMg1z
   l2YYj603fmvVhqnnzLIPKot/HuDm7/xeU41JQ8itFkq25+7d2SPCeLecg
   Q==;
X-CSE-ConnectionGUID: ua96xr+wQUC2pE5jtSQDlQ==
X-CSE-MsgGUID: 79w5c91sQtGhliNCT0i3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75140462"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="75140462"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:44:49 -0800
X-CSE-ConnectionGUID: uhpvQCpIR9SccmpwQKO1DA==
X-CSE-MsgGUID: o6zlqJc5Tv25nTrqWKrpKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209236724"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2026 02:44:47 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnDtl-000000003M5-1jPW;
	Tue, 03 Feb 2026 10:44:45 +0000
Date: Tue, 03 Feb 2026 11:44:19 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] htmldocs:
 Documentation/driver-api/media/drivers/vcam:16:
 ./include/uapi/linux/vcam.h:115: WARNING: Definition list ends without a
 blank line; unexpected unindent. [docutils]
Message-ID: <202602031156.UVpGYCR7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   9ac202884d39519107d153eae44036236a6f28b5
commit: 5af3f279ab07c2046cf7236c56e79ec2597e5b13 [5/5] media: Virtual camera driver
reproduce: (https://download.01.org/0day-ci/archive/20260203/202602031156.UVpGYCR7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031156.UVpGYCR7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/libps2.h
   ERROR: Cannot find file ./include/linux/libps2.h
   WARNING: No kernel-doc for file ./include/linux/libps2.h
   ERROR: Cannot find file ./include/linux/interconnect-provider.h
   WARNING: No kernel-doc for file ./include/linux/interconnect-provider.h
>> Documentation/driver-api/media/drivers/vcam:16: ./include/uapi/linux/vcam.h:115: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/media/drivers/vcam:16: ./include/uapi/linux/vcam.h:118: ERROR: Unexpected indentation. [docutils]
   ERROR: Cannot find file ./include/linux/parport.h
   ERROR: Cannot find file ./include/linux/parport.h
   WARNING: No kernel-doc for file ./include/linux/parport.h
   ERROR: Cannot find file ./include/linux/pwm.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
