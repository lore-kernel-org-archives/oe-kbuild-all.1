Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D1748D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726295749; cv=none; b=s7hkiAwpMYcQ6b9iIyWmVmC9/RKN3tfX79nTcgMw6EuOMdj7lxTWApiB2Xs/waKNmVkui8MMnCbIpD5c1TkedG4hW/Occ2xMbyAZj1m403jUSn9Y1aObyvyerTlS/VLckdZJFUN6Ml9TcmBaZRmeyDcKoFTI4xPoozrgYfeL7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726295749; c=relaxed/simple;
	bh=TZ+jWvwE1e40qeNuOjrOwfHUVrXdQ8QKwWZcuBuXZAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etoW2YZI1y/J2H/9ts6wYdKvl+CErzQJKnWWcGJ2S6HIGJ4h5HkNeGry7n5r1Os8HQC+J5gItrPNngjr7fa6gow/PalCydYw6GeMn07vQb2LYDFD8zOG/Izev+WYeQYA2ncGum+onOd2olFH002v10aEMF5/fyLBAgl+9ZJaeSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnepfVj1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnepfVj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726295746; x=1757831746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZ+jWvwE1e40qeNuOjrOwfHUVrXdQ8QKwWZcuBuXZAM=;
  b=KnepfVj1zRIDNUPNuOO0H/bChTIeNEhg8UREB9vSFgS7+XFNHwnD3vQh
   L6lFfLboOWYThE22UUu5vlxKslvNZbsc3Mzt3QBm7KOFNFEvkZVd7w1/6
   bDZhsKTT+JzBXiYe/j0pQaCGui4oAMeyb04OYj2lrRbW/uL6pzuaAEBsy
   eqFZST4n3Z4hLBlA/GpXVwaGGOJ766YhlSiyVBOulGSzwZmNh8LiOOiwR
   Zqnh1+CjyMbc9rejL1cbruvaw42OzYApi3HFJxOyYJAJSbjPLiiF0ZYQ7
   SVCUEAV6f75xan2NgloWUqXAdvPQAinTaYFbl8kkvzrTCHwK1FBnbug6+
   Q==;
X-CSE-ConnectionGUID: T7Y/tNJIScG9YJtIo7SM3A==
X-CSE-MsgGUID: b8wQqr2aTfWng0n7pKWcUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="42713742"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="42713742"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:35:46 -0700
X-CSE-ConnectionGUID: /Ag6Po/NT8GfAQTbLQcRJQ==
X-CSE-MsgGUID: mu9m+wQqT3qw8wAOEW5+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="72716131"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 23:35:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spMNi-0007SY-2c;
	Sat, 14 Sep 2024 06:35:42 +0000
Date: Sat, 14 Sep 2024 14:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_s 688/30000] kismet: WARNING: unmet direct
 dependencies detected for X86_DEV_DMA_OPS when selected by VIDEO_INTEL_IPU
Message-ID: <202409141454.KnX9O8t3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 123826108e51794c3922a0f8eba95e0375ffa36b [688/30000] media: pci: add IPU driver for BXT platform
config: i386-kismet-CONFIG_X86_DEV_DMA_OPS-CONFIG_VIDEO_INTEL_IPU-0-0 (https://download.01.org/0day-ci/archive/20240914/202409141454.KnX9O8t3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409141454.KnX9O8t3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141454.KnX9O8t3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for X86_DEV_DMA_OPS when selected by VIDEO_INTEL_IPU
   WARNING: unmet direct dependencies detected for X86_DEV_DMA_OPS
     Depends on [n]: X86_64 [=n] || STA2X11 [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU [=y] && PCI [=y] && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && MEDIA_CAMERA_SUPPORT [=y] && ACPI [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for X86_DEV_DMA_OPS
     Depends on [n]: X86_64 [=n] || STA2X11 [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU [=y] && PCI [=y] && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && MEDIA_CAMERA_SUPPORT [=y] && ACPI [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
