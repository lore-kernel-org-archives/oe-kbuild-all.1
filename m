Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258A737F301
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 02:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131253; cv=none; b=D4ZFA7EJHFGO8ISvPFnkOMXyeddVs7c3HvZmJUEVNloqWNrUt+t4i6l730UBzwlyn5lgYqtV8hYnztNNq+GI/Z9p9ehCue4vrK1BkZxojY6l+3KgtYPMfn5pZpbQfSpeUZRnCeNPdtUgl+5bEyj0NGbJzmyf2Muayuep2xWeTtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131253; c=relaxed/simple;
	bh=LbZgog7ajIEumnPGbDzWTetNw/gdFVzO75lzLEaDae8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YcLARjL3Grtu5tLNeKihD8mp3ExdETXGtCxOEIVu+BuXgSpJK9gRY6owPDiL8fSw9SFroHU4suaxDuvz3B9DQPs2yowFrtl7pVvlDw0k+d23k9llmGyfgwBv41DhnjNKesgsLPF8O1USVyNZKURRg6ef00bjYoELBFcSPvy2yEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C57GfFHG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C57GfFHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790131251; x=1821667251;
  h=date:from:to:cc:subject:message-id;
  bh=LbZgog7ajIEumnPGbDzWTetNw/gdFVzO75lzLEaDae8=;
  b=C57GfFHGOkUQ7v6g7EWLXxtryDl0EuMJbZ0pa5dnzTT+3EfVCTq/oGqr
   XegG/TUwL5L7IkO9v/NGPLswIxk3KY5gM2flbnpP8G8WeK1Zrj2hLN0eY
   hfzl8oekTcUAdxeldzdUcBLLCmEX6kUj4NuNgekP0oogRShLVRnfdlorp
   g+R3pZTo4pPN4zyfazERB/CpLs09PHfxuRnrKbFfxClCMeEgYHI/9NNEd
   Fx1+4Cit0kbh35JT44GMuN4rYJpsjFg11e+MGRHqqQRpC1FanG4unQi7I
   kvzfrjdJeKRvIN3gBbghFVEVRcJHq1R61kDaZ8new0zQk+e6mZJFfY4P+
   A==;
X-CSE-ConnectionGUID: s0rou93hR7KBWLTd7xmaQA==
X-CSE-MsgGUID: KQD71YF5RPOoQF81m5c2qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89708066"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="89708066"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 19:40:51 -0700
X-CSE-ConnectionGUID: KRkq9fdrRUyFBbjN5g9q8g==
X-CSE-MsgGUID: oDH33qZtROiUjLa4G25D1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4694304"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 22 Sep 2026 19:40:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Cud-00000000GPm-03cE;
	Wed, 23 Sep 2026 02:40:47 +0000
Date: Wed, 23 Sep 2026 10:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:v3-build-speed-up 38/49]
 arch/sh/tools/.depcheck.mk.tmp: No such file or directory
Message-ID: <202609231019.kNcdslGA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git v3-build-speed-up
head:   789909cb4fd0730510265f0059c1579b5687f51a
commit: c096548eb67d62de7340454d8d0fd621687d196a [38/49] kbuild: implement and use depcheck to check dependency timestamps
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260923/202609231019.kNcdslGA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231019.kNcdslGA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231019.kNcdslGA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sh/tools/.depcheck.mk.tmp: No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
