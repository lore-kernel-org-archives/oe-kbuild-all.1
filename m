Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771193;
	b=qlG8k/SuaTWZjVt6PWSWzaLim4Jo+IhIoQ9BVWnAChmalyA+y7dl0sSSV2TpjVr9WFmk
	 sy1gomwFzAVXPXFY8hk2QkFkIyKKtdhi68AyCxzIR6aOr6iWfTb6ACnL8UfBZAMLZFUCG
	 8k0KYd3uOh0kN1ZxmpLc1S05p1wSf2xgncFJeIGaPIP+YdYSu/xDEr6JLUC8MSAyGSZHk
	 MAurqR5K4vB7drmjTIqFbx+vXLpyHF1YoewFOShstrsYkYP0QS+AP60HKq7XPlAMVR460
	 I3wbjkIG8CI1OcO4Virf3Tcg3KGO7n6GW88fkigpid47u+whJLlHotfsoQhbAIF2Ohw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771193;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lL48N6lm9KlLmKPeJlOym1AMfeabMaIdEJjt/DEXSVA=;
	b=PS+97J2IwTGqKvIMOG9gAY0ROagc6zRrT+E+cmmY6UDNx5g6vnseJ6px1GRcLN+1j3Ix
	 WXL/hoJtjHE9Q+yksAp6WNDAxYpcRYdiHRP6pCojw5ufvmWgjNrgx7uj2/Evtgbq2+yBv
	 B8PRBaCLBVBtZHkSrt2aV1P4u6VmJC5SkvjDZju6kYq4hmZSBDLgldp7uENB31VfnARHg
	 Yw3uOaeNKbHhfs/CsySnuqyFUupEmLaNyOYp24cnJ98JCg7Tg1G2YOQHJ/eiCCVijyKoV
	 XzpDugzdx5TaERCDhwO8yVUqUF6tSFROas9rBrW5QkiYa5rCEfO7ip5mpNkzqUFuELQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MNXcwDsc;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C6606D819
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 05:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 244C6606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MNXcwDsc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793771193; x=1825307193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2caz6pZrdsl/w7c7xKphyNInhe+GoD8Vhtu/f5yp0sk=;
  b=MNXcwDscFqdkDtB5/UZQzmg5hwvONtAZJ1jZlK7tvqUG3RK8p2ggOReQ
   +AQjRtT8doN8BIon76tTOSx62L3dVqDSg1lEaQrdawJ4sNcfnNQCmhkfy
   rZh5+8cNpAEJ6EeGDEIb1GLL9V5pGstXvmroYn8VeHZvUSUU4xb8J+46y
   UE8GBShN5rrz5SeMV+JNjMyzsGz6SBLDYNFYaqxMUNqQIseqAWZtmGxBU
   S/oMTQeoMDR1DUtZPyS92UiBpCyAG/ixOkXU2SVUCJH/zKczxrj7+R51V
   t0wk8Sgpx5x+6VdZ6VFwqGQv+n7Rcl1Cg+DGddOTWc1RHktl8fLmXKxry
   Q==;
X-CSE-ConnectionGUID: DYxOeKHhSzyDO4T5OhWV9g==
X-CSE-MsgGUID: wfMEzXPHTiadjAacOYobLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2403409"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2403409"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 21:46:32 -0800
X-CSE-ConnectionGUID: 4JDXFGiwR16PRhXzhrlPqw==
X-CSE-MsgGUID: K55v2g+CT4OnexggWvY1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6729633"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 21:46:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOTpL-00000000jpn-1To1;
	Wed, 04 Nov 2026 05:46:27 +0000
Date: Wed, 4 Nov 2026 13:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: wen.yang@linux.dev
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 03/39] sysctl: add KUnit coverage for numeric bounds
 and handlers
Message-ID: <202611041325.NFweGflV-lkp@intel.com>
References: <3f6be87a6685418f170b6713c1759a9c16573871.1793204511.git.wen.yang@linux.dev>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f6be87a6685418f170b6713c1759a9c16573871.1793204511.git.wen.yang@linux.dev>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to sysctl/sysctl-next brauner-vfs/vfs.all linus/master mcgrof/sysctl-next v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wen-yang-linux-dev/sysctl-replace-overloaded-extra-pointers-with-typed-bounds-and-context/20261029-003440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/3f6be87a6685418f170b6713c1759a9c16573871.1793204511.git.wen.yang%40linux.dev
patch subject: [RFC PATCH 03/39] sysctl: add KUnit coverage for numeric bounds and handlers
config: sparc64-randconfig-1001-20261104 (https://download.01.org/0day-ci/archive/20261104/202611041325.NFweGflV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041325.NFweGflV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041325.NFweGflV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: kernel/sysctl-test.ko: symbol 'proc_dou8vec_minmax' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
