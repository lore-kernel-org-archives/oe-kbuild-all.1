Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0179E18A92F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778332052; cv=none; b=XQG3YZdPQz9PYtBGLvDV+uZx3uz5ZTM7xlX1FjDvu6YsSc/3rYHD0uaQjIxtI9tLjkq1MhngFAdeJ5vabKWO/19Xi+7A1vR97TGVgKcP8+GE9h91VPfuzf2E5Kx1dLUOT9eI8W0yxIsD+zZJ5cDGkOtrF12lFGR7L3Lx1zDSPYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778332052; c=relaxed/simple;
	bh=tFFrtTk269YemWACrvFTzzkNYgRIV8nPWmSE6Ivdb6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PSABGWDuUnj9qdQTrmTRc6XBBYB0FXgkc0NXY2IzdTMiB1U7473ZZv+X0ZWlJ1R7Jjaf3EeDMvO4MEQ3BvbDcmb5EEuqiyYWxb69ohXCDo69UGxjZvk6GHXfkMSFCvvejUBVPQ8XcW6K2VkHqmJNDBsQ1piyPs225ro0gdWqhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncS62Lun; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncS62Lun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778332051; x=1809868051;
  h=date:from:to:cc:subject:message-id;
  bh=tFFrtTk269YemWACrvFTzzkNYgRIV8nPWmSE6Ivdb6w=;
  b=ncS62Lunh8QGe2AwPGiAPVZ00dJL53XHlTBjLjlSNr7++hZ15f9YvRrc
   SO36XzgDxBJYfmVNBHE1sXzCuiBdrbpDoEFwmPEoyOYD/ctgAMT2WWFUU
   Td3pERpIWJEApMgALOQIlZaKgRbt0TtWPveaNUci+0cFBw52WlwNyazGD
   63XF6lJBLzFfR/1oS2xtuYOGfY8lD30m1Oj4ixAR/teczOdItOg4mAu5K
   Yw4TAvR1erYQw5fxg7jlxiLWT49tBmqCwQO8ndUUOCgMitY4fSEBhRDO+
   eUdr0Sty/WRZVfXgUgU0R08eq5gPMSE2lUpfyBaNm/3GyeA9HK8ud1On8
   w==;
X-CSE-ConnectionGUID: elzdGoq2Sc6JZ9cvxCZprA==
X-CSE-MsgGUID: AOLlOLtaSUiYIE7wLkdWdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="81857922"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="81857922"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 06:07:28 -0700
X-CSE-ConnectionGUID: XZ1lpLruT2CdSrgaO6qVtQ==
X-CSE-MsgGUID: nqdNDRYmS3On7ZyYtmJVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234351558"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 06:07:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLhOu-000000007Sb-2j3T;
	Sat, 09 May 2026 13:07:24 +0000
Date: Sat, 09 May 2026 15:06:29 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 18/19] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202605091536.uaECTkDf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: e9ca8c87d173cbf7eb2089d7ddec9149e1d608a1 [18/19] HID: Add Apple DockChannel HID transport driver
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091536.uaECTkDf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1152: FILE: drivers/hid/dockchannel-hid/dockchannel-hid.c:1065:
+	switch (hdr.channel) {
+		case DCHID_CHANNEL_CMD:
[...]
+		case DCHID_CHANNEL_REPORT:
[...]
+		default:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
