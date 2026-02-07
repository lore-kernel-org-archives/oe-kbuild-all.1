Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A727FD49
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770453399; cv=none; b=dxCaG49ZkTJq+11UB3hy1MplGd/jzPN97nqfR3oSoASlz9iyNqLtykWpnvTAEGbgR6l+Ppi6HKptM+3O5WG9+ZrXXJ+o1+f+5doTP+nvVG1EmP/oDkcHA+MmNsWcZsEZURZe9RoP8hciz5txvgbsGqiW5Jer/p9r4P90rTvu0Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770453399; c=relaxed/simple;
	bh=2qCa57HsYcqwV7Q3c3OzkeLpoNaPNCHK7q8R+LDfVxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ULyo1kGMijIPquxWFiiK0sBsasMggEq8UAxP43+32jJ/dL2UHNlOKbVC9aynjkb82iBUWAo6l4TbGqq/XLPmjt8IfgCyaap8jpEE7rSt4L6+4at0E/Q0w2Xy0itU0WI7jAhWsvmNx5sGfEJLkJjhmLDgqKeZykYhT8ULcRN7yCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzzLFZC/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzzLFZC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770453399; x=1801989399;
  h=date:from:to:cc:subject:message-id;
  bh=2qCa57HsYcqwV7Q3c3OzkeLpoNaPNCHK7q8R+LDfVxE=;
  b=hzzLFZC/5bfl9chNvvr6RcpiUNWWmQqsSuKojD32EEYUS/CsUqKtPlbF
   TP3VD9T+gBw6dSyp8Fdhem/Bsoy6PLqodE7B9sh3MdutGTyM82z1QZq8S
   I587ewmYqB0yrKasJZZcacUzW+5w6vo9gRYyp35mXuELj06z/epEH/SqX
   G5YSMi25qOK8NqJ7PKNXkrWQDzQHx4hSxoLpoladRxOLAT3RdlDbf0zVO
   FF+F/ot2dUT54dEOmrVXzjvci/tw9qB+uW4mfgksNuT0EUsoiV5Fj+4JY
   NBuOKobcJC8ZrwkPQepo7tCpDJfYQ7vXFMbouTtvf/Cu3eVFWVTIaSV2K
   w==;
X-CSE-ConnectionGUID: Ury8jMgXS/yRySnXimS8bA==
X-CSE-MsgGUID: kPn5tB0dSxew8AqiPbwuhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82762724"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="82762724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 00:36:39 -0800
X-CSE-ConnectionGUID: mTVRv4HSTMK12x7bPPfwLw==
X-CSE-MsgGUID: heKYe3f2RhyFPm8uT7sWwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="241437985"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Feb 2026 00:36:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vodnu-00000000lWQ-2o1W;
	Sat, 07 Feb 2026 08:36:34 +0000
Date: Sat, 07 Feb 2026 16:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yuli Wang <wangyuli@uniontech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Wentao Guan <guanwentao@uniontech.com>
Subject: lib/dhry_1.o: warning: objtool: dhry+0xa60: stack state
 mismatch: reg1[22]=-1+0 reg2[22]=-2-16
Message-ID: <202602071618.nJh9Zdbw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yuli,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2687c848e57820651b9f69d30c4710f4219f7dbf
commit: 892a79634196d2729b81bb8e5b029d095704df63 LoongArch: Enable UBSAN (Undefined Behavior Sanitizer)
date:   10 months ago
config: loongarch-randconfig-r111-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071618.nJh9Zdbw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071618.nJh9Zdbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071618.nJh9Zdbw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dhry_1.o: warning: objtool: dhry+0xa60: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
