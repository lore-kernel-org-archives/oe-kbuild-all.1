Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542117;
	b=oV9vp7F/B42qC8hQ+FT7Tg5MkdiJ9UxmAPBUJFRl3nvSFlJgrtI0vMTXuU9jWA9bKHlK
	 uS9bofepLd+FPPw+38YwaFodvWU9VSesFbMUSq4+QlaFl19zt89kJFzLmBqLu9USN5XzN
	 RWuuVrzOEaDZznu1c4E/UiAfBRUcLvvuA7fMtudCR1C2q3tW760E5ccUyCtM99tGs/ZKq
	 l18s2Ad8swDwUKg2AWDl8X5hDXIF+WiP59HNc/rtC3V8jLO75HZNg5PYJisWqNxcEf8Xi
	 aAPjcdqKpJcO/GTgMCSKoDlB+CPd77J3CTL8Pr5o1HsfekMQiMwiNTzoxEYO4khH1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542117;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=F9gcDoaLglu0//Uvj6ynjj5PxKgTXpYXR/bLUGIqpcA=;
	b=FelLLmZOyjPfe7kIou8RvsCbg+3WHF0YxpzT1sedjNSv0p0bOcfSXS7gOy+Zb+Yr4Odx
	 wGfAafGWUKveKl0V+/wcgBIUUYQWhsDxzNCOGQ3JOnwbQpNXXv8khm+4qGC6KPM0dXu5V
	 08P8rlqwVpjn0rL3LsR1d6cJrRpFj9+f2zHwu/gGRYlYbD9XD5jvZHbbbgH8iBYIR6cPl
	 gxLZMRoXVMIB8fkUHfYc+lHi6aDOirHGQjTAmhVYgJYB+GZPOLlI5xk7maUMlZZ0IHiIg
	 Izz+NUOCrUfCQcZ51YRaeTLj6nbGfQl52HJJZ76ixidjdCTbvKzeRecVSaxqhGs8PDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JrWieF8x;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586BB606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 14:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 586BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JrWieF8x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793542116; x=1825078116;
  h=date:from:to:cc:subject:message-id;
  bh=6ftT/lHlrbJK0Dx5PVAy4DiBv6dxElPXrEQVVX36HyM=;
  b=JrWieF8xYZhzhJVhAn2F2lv6IALK+V6V322tS7h4vkYmPmCuzXoCSoJY
   F3i3bnyYKhk3xUVmZTSWIGDNautTniYbGDyyD27RzfHf1WfZg+jAvJXhl
   MQpHGhNFOpa2JzwN9cAiUHssIXzUQBQ58HSwgk935v8kHOXJOulH6xa+a
   AksHqMzxG89zREpgNKeCoqZBTkb7pEe22gAdi9atk9KvHPJFefTuSZgWE
   hqmc8jEXaiBmiPx8glsLcn/m0mRFm6iPoT7EqJX4fhGB02jlwVPZGFlod
   iR1dL881Th4ikGOs4o1I0vq7kSAi/H+/Jeq6ewhyDgOnwewm/qglstqOQ
   g==;
X-CSE-ConnectionGUID: m3MJedXyR5WnrNIQRh5OKA==
X-CSE-MsgGUID: 7d4SUZ1PQ22Qkc/0OiSiMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2123406"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2123406"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 06:08:35 -0800
X-CSE-ConnectionGUID: 4WcPjSYQS8SmN74M0mdM5Q==
X-CSE-MsgGUID: BEBO2wjjS4eBgARdjsPpuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6202216"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Nov 2026 06:08:34 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNWEZ-000000007tT-31Cv;
	Sun, 01 Nov 2026 14:08:31 +0000
Date: Sun, 01 Nov 2026 15:08:23 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-main_preview 35/35] kismet:
 WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by
 PCS_MTK_USXGMII
Message-ID: <202611011528.yrgntT8b-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-main_preview
head:   ab2af42d6ed901295c998bab1ce6fbee17d1b8d9
commit: b128ad6d67c2c090bbda352b059836caa6cca345 [35/35] net: pcs: add driver for MediaTek USXGMII PCS
config: s390-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_MTK_USXGMII-0-0 (https://download.01.org/0day-ci/archive/20261101/202611011528.yrgntT8b-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611011528.yrgntT8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611011528.yrgntT8b-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
