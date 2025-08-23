Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDD8A930
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 01:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755914218; cv=none; b=JpNzRQnDrraUBXPmAoVTJQndRY+xc0tn1titXP2hCd3gm//NiRHQ7niYpdHx7248hywxMvvi0Vv5STnLcC78ZkDPkyZ/hbnyr+uEJoLGZ5GvTcwbGRWi0kd5kOwc2Wi5Syh8UwiUQGWuJB2ZJYheIYFUTWvyMfxp5f4LY46PqSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755914218; c=relaxed/simple;
	bh=JL+qZJbAO8Bxc9GieN2QooVbyG5Tg+J12uAFoqh6Kd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uuJQU6jwKm99DyZHXM/UXEqjUYAuz0Z8ux9RMdnl9AUFMXEfBKeR00jWdRYmkJYlKvpka6JkwmJtkLn08e8igyArZ0syCfejrGbloDcr+rfBFgnogcVlHvm2RgIJuJ9PApg/Etjf3sTHAu1SkZtC+rzdO9HcbLbjNOvSqLy4r8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fl1ZkZqv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl1ZkZqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755914216; x=1787450216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JL+qZJbAO8Bxc9GieN2QooVbyG5Tg+J12uAFoqh6Kd8=;
  b=Fl1ZkZqvonzLrD5HdVKIRkSOdvlYcPdmMEosKFg7+bNsXhifJgJqdeYI
   8b4SdHifyFvdtLA1/5CcfcP5oVect+a2KXdjHu09Vg8JHfb8U+VFdH2jm
   clQQnfTFhZC8Ltchm0mwDD3qyhui6vk3mjzAk8C/jpkF1uxWio99qP2Vs
   wQ/l1L/+31NWOJ6H2MpsK0LZ+6w7WLf3nmLfVFZAgYnksIm9cytOn6IGw
   +NeZS9Del9ijE0t/xveMWDq1w0q021bdCDfjby2KPktWz8w0UQlstp4sY
   wR/E8Pwhyxi2Z7ZLx1DF8sWQ0VzsASetCyzmUPlkvWQOWw9yJ1/7qx/Ry
   Q==;
X-CSE-ConnectionGUID: 1SABUEr5T5eN/JMxJhJJVg==
X-CSE-MsgGUID: 9b1WKLvTQlaIAgEbew0kkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75677997"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75677997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 18:56:55 -0700
X-CSE-ConnectionGUID: /dybbAMCQyW6l9cxoa3lZg==
X-CSE-MsgGUID: UEEE2royTFSCVCg15U7hhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199720985"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Aug 2025 18:56:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1updUt-000M0Z-24;
	Sat, 23 Aug 2025 01:56:48 +0000
Date: Sat, 23 Aug 2025 09:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-06 2/2] kismet: WARNING: unmet
 direct dependencies detected for DEBUG_MAPLE_TREE when selected by
 TEST_MAPLE_TREE
Message-ID: <202508230926.zmMIqc1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-06
head:   e79b019bb2601e8b6639ea69da6d0520078475dd
commit: 120b116208a0877227fc82e3f0df81e7a3ed4ab1 [2/2] maple_tree: reorganize testing to restore module testing
config: i386-kismet-CONFIG_DEBUG_MAPLE_TREE-CONFIG_TEST_MAPLE_TREE-0-0 (https://download.01.org/0day-ci/archive/20250823/202508230926.zmMIqc1x-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250823/202508230926.zmMIqc1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230926.zmMIqc1x-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE when selected by TEST_MAPLE_TREE
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
     Depends on [n]: DEBUG_KERNEL [=n]
     Selected by [y]:
     - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
