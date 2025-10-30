Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1459F25A65B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823521; cv=none; b=qet0YePyBpLC+skot+09PCKfCfqstFofGFTDm068gpwZPdbGdvRl7ytDJvzS/JJWh3wgcGI7JPdVDmg59mBJVTGTSE0OgU8dp5E+XVbxe71CeKYcPAV+RPe0ptGABdsxe442p2lqIY1FAWyG9Ht1xT06ge+d3b9lmczxYgigv08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823521; c=relaxed/simple;
	bh=4b8WKOcycG6S+VCjHKQr1nwKz2Oov5X7BKFthcaikTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQeQbSZo6OgIO8AcurQPIQ6CM2uiQlctCx2zGCgY98IeWbJz5EQBRrKWNyPfekDjmzO07m9wFMk/bo+2f2peQ1wjcXS+Za7j2pqc1Xen378o+rFC76MuxK6o0KGvrrlBr3x0z54CbRRchm4t0TTRMXGXs9MFg/knzK59x3Kk1zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nu65p8ys; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nu65p8ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761823520; x=1793359520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4b8WKOcycG6S+VCjHKQr1nwKz2Oov5X7BKFthcaikTQ=;
  b=nu65p8ysHvfx+h7jza+/d9BtCygDuuZEHYy3GB1zjZOpsfVY6CjT3Hq1
   WSzKuP0s2B6bSB3fLP2DeEnNhuuff13mZtf5Y8nmHRbD4LuJKVtBjL/mT
   Rifm/tQdLe0f4fXFoIlCAS9m+gUnqc9qs6+wg1O7BRKLhg757lMls1roY
   Ave42ZMl23ruRoQK2u0izv9ASBu7jGQC2q1qiwKd2ndnlGry4U/TGt2QI
   zNPBuOEN6GKIS/ij4eb29xWLfN3AwbCuFHD88HV8EZFC+ewIznbJNbBV9
   ltf7C9IOpvxJAyHgbEmDnFvYYc6bfMaCsHLUqKK/KpfJeV5mnxAbOllbq
   w==;
X-CSE-ConnectionGUID: 1P7H+M6CS/qjY6r5oaDGAA==
X-CSE-MsgGUID: KUdc6pLRRS6OcQpczCp1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="66577140"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="66577140"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 04:25:19 -0700
X-CSE-ConnectionGUID: Sfj5DS3WT8CaBG9zwjfySw==
X-CSE-MsgGUID: v/W+LEe3RKaHQI63K31Zzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185864118"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2025 04:25:19 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vEQmK-0000000010c-0yQq;
	Thu, 30 Oct 2025 11:25:16 +0000
Date: Thu, 30 Oct 2025 12:25:07 +0100
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 2755/5042] Warning: fs/inode.c:1609 function
 parameter 'isnew' not described in 'ilookup5_nowait'
Message-ID: <202510301249.XnNhwb73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   131f3d9446a6075192cdd91f197989d98302faa6
commit: f5608fff035ae2310a647984998060546c3ec6dd [2755/5042] fs: rework I_NEW handling to operate without fences
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251030/202510301249.XnNhwb73-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301249.XnNhwb73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301249.XnNhwb73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/inode.c:1609 function parameter 'isnew' not described in 'ilookup5_nowait'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
