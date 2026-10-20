Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458837;
	b=gB1f4SC9YQiGX5iHQrjb19fwnZTxllL3GBbYukP5fmlk5ai9wWH22sNffP5x8btrEHyW
	 fC6yrvx/ISJWf/QJF1VmaOimCBWTR70k+72QaIYOr4/80h2NwLliF1d/yz69OqGY2+TmP
	 TwySSvJsekXKjnP/JSlMlClclsN+/8Dpff1aeTN6gX59uY/jdBbeUl5NtKsHqw25UJwmZ
	 Wd3cTQkvKo1ED/eFaLcIkgt/yHjJShM8nmuwLBSec1egSsY1GgOwh5JQC9CvEVilnETjv
	 0AlJLWESOahXXfh029L3i+/qGoWoPIBzCl+fHXpSDEKD743Ucu9lroyIP9eg2HkiDCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458837;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fA37l7pnLY2hUZ+k+PLSmZfSgwupJ3ZFecsRD66B4iU=;
	b=aarf2yUXaM1Y//8ou9hCaWvOKdlXyYlogGn3aQQ1j8RAgcJutajvX5zQDZQI8NTG1YTt
	 AnzTFObrrqDLxwPfJGdK9e80xkgsyOJXH1YXqQez0LTrjyNCdlFJOb/G47HlqQUyPrZ2W
	 u4FcT0Yc50bhzxaRsTHdc4xRGCe+zWCsKviAk5mytZjmOj5U8yM+5HTCVwaMA/s8aMhLm
	 twsLDTaNQqHpSjXV/4S4DwStgbDcdx1RbicH1JLo5Mz6rBYwU+AM8FI7iK+UXJH3nkZZM
	 7nBznLVe20AGHyArpRApS+eKdIglDojQOWie0XC69ZJAsNXystbs17GoWaP5J2FMRcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Li2bjIrN;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC231606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 01:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC231606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Li2bjIrN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792458835; x=1823994835;
  h=date:from:to:cc:subject:message-id;
  bh=Se2g8RatZuZT5kmaDL53qw8ZMa4V9HnUGE5QN/aqk5Y=;
  b=Li2bjIrN+BAb9l1l/XIcClH7HFwoQqK8VlEGoIbASCW8XAb1ihRdGsJS
   zxf5wkURsKxTf+ZieeU8y+z2P/ICfiC07wHsa5w16rkpOK8BQqhy/3rmc
   WwCtc+lynjysQNmP+FDG1CeEMQDSHFBkHzmJ/dLbDOtQpBhXBzHUYs4NB
   dFYAGgGlHZluBnOUOeVqLtUy4YMnCby0mqWK+Xmx4f/ewbp8qSPAyjNvF
   DUaq4wa5sxjcP2imo4ov6anrkiTqbd/UPns25em/gn5B/AifTZfATO6Lj
   Kbi9m+RHBmu0kQHsgFtnCtsWNCGKCJ6sdGA885UdDgnbFmUFDwX0rpd3t
   Q==;
X-CSE-ConnectionGUID: EoIf0VHjSmGibFp8UjUDow==
X-CSE-MsgGUID: ykLEYK5rTliul3aVnVwaXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1057412"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1057412"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 18:13:55 -0700
X-CSE-ConnectionGUID: jv2kzMQdRx6bpyWDiwLmNQ==
X-CSE-MsgGUID: RDpnoGNNQj2onSyBYNDBWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4499404"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 19 Oct 2026 18:13:54 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIyQJ-0000000061X-1Ehf;
	Tue, 20 Oct 2026 01:13:51 +0000
Date: Tue, 20 Oct 2026 03:13:34 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 10/22] arch/x86/kernel/kvm.o: warning:
 objtool: __raw_callee_save___kvm_vcpu_is_preempted+0x1a: unreachable
 instruction
Message-ID: <202610200352.nYbO4QTN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   6a0fa5d8e005033f0d73c2cbabb5e555ea8575d2
commit: 60aee4318ce34e68540772a2cdb3f57b04d4c9d1 [10/22] x86/kvm: Use RIP-relative addressing
config: x86_64-randconfig-r2102-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200352.nYbO4QTN-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200352.nYbO4QTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200352.nYbO4QTN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/kvm.o: warning: objtool: __raw_callee_save___kvm_vcpu_is_preempted+0x1a: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
