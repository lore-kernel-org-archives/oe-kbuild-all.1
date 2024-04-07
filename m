Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B62B9C1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712499494; cv=none; b=SU+DQ7OcgnqvtrP7MWxaVRwwMml1MjHU7S/p9Dl2VEEyQQTWBFerfsAF4qphQR+lOjigEKiOgau2p644TRfRb+JIfwGymTBD1GmWrNVY9cdyRnd8+w7h6ez8sPqPwahSt643XwbWPLxcqEPlVJr1ZA23Kr1ttNIGZepQeiFTJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712499494; c=relaxed/simple;
	bh=BbQcehCxhg6PmhgUbiP2yeodXbYIIkizb6Lwj+lSLAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dts5/OpeU1b4CdkVFcqzRqEvLDgkWV0zGbGbN71TTJcPsqY2uyBFlj3eEu3zEV3TJc4Q/BEyRdWZIGaf3x9vmzR9ACsOnJ/2MQ5TQ+Ap20Cw2FkBqca1ELS8clB7ssxbmYGZBEIuSDHl6DoPG9q+6FHKT9eZdEtv4ADdyyaUwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0h9j8jP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0h9j8jP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712499492; x=1744035492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BbQcehCxhg6PmhgUbiP2yeodXbYIIkizb6Lwj+lSLAw=;
  b=J0h9j8jPDOkks0Arj8tLVJ/q3iFfNYuNqq6EJOkTFhnOkfWZIp8ScVOQ
   rOrDCns7h4JWxUCa9PWtOoBI66Atyqy10NyybUikHOj41soH/jBUUg1pA
   5YpIXP1XwCZEwzkrJoOGv+WrjZdUNVExejPcsQIoOHzOk0jUrTTbs/Adg
   IcUkEvXb9eTiuxL/Br8mtCsSPER4mn2V/lWd6cxM2Md/zFT8g753I8C5c
   1YtniC8GGo3GEvWYAM8WdhrBwJaoA1225b9mQQB4XoRkR5jvj7f5QFUYI
   5n6ga/ovDhIEUJf4utfsdm4RnxM+hfOfe4J88ANHcFp0rma3hWaGrVd57
   Q==;
X-CSE-ConnectionGUID: B+yKAyWIQsusVHCxMP3vAA==
X-CSE-MsgGUID: 9hVncOO1RFC9XeJ/Kprdmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18919194"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="18919194"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 07:18:11 -0700
X-CSE-ConnectionGUID: cyhW5ZsKRKWs6Mjd5a0Amw==
X-CSE-MsgGUID: ZIayhfDIR8W3VUyjWX698Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="24375168"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2024 07:18:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtTLU-0004Oo-13;
	Sun, 07 Apr 2024 14:18:08 +0000
Date: Sun, 7 Apr 2024 22:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 9/38] kismet: WARNING: unmet direct
 dependencies detected for MTK_SCP when selected by MTK_APUSYS_SUPPORT
Message-ID: <202404072239.CWyOdK1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   bc0272741f16a386b2a220ab4338b9f119162947
commit: f089a6758fa92cc61f89d484fd1a4cd40c93a40b [9/38] CHROMIUM: soc: mediatek: apu: Add apu hardware logger dirver
config: i386-kismet-CONFIG_MTK_SCP-CONFIG_MTK_APUSYS_SUPPORT-0-0 (https://download.01.org/0day-ci/archive/20240407/202404072239.CWyOdK1b-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240407/202404072239.CWyOdK1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404072239.CWyOdK1b-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MTK_SCP when selected by MTK_APUSYS_SUPPORT
   
   WARNING: unmet direct dependencies detected for MTK_SCP
     Depends on [n]: REMOTEPROC [=n] && (ARCH_MEDIATEK || COMPILE_TEST [=y])
     Selected by [y]:
     - MTK_APUSYS_SUPPORT [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
