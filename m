Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B07531629
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175095; cv=none; b=uL907IdcNSP6sS+pkRZsXhBdA9rJlFO02rXO7yIcKyasBO/dSstFezwtW4OZM5CZSTPhhsZ4KunaJz13nohzLaL5ItJSx+O/kaQBv+APly0Zl3jwyMQ4BR0TLsCezy4ch/fS6QJ8cXsjtn6hEvYo2Tk7eGeB6SSGmRO+yKa3D0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175095; c=relaxed/simple;
	bh=iZtL3dTZxramTEGVMF6uxp01mGQMlEZZXVEEw2LsHsI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H4qJnM6h2H13PzoUD48KuEbmMMNxwSFp/zPhZpJvx0EDiSGFbe0eJWKibb6f/2F9nb/ciW/zaetcO3Gjvh29Od4duUXwYOnCNpCEcADIUi+cPLp5rz3CUGrwzO7Kflh7qWHswr0GhzFE7CbAjnooSh9GkrBCoyUxG+tANsBir8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfpO8OVw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfpO8OVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175094; x=1821711094;
  h=date:from:to:cc:subject:message-id;
  bh=iZtL3dTZxramTEGVMF6uxp01mGQMlEZZXVEEw2LsHsI=;
  b=jfpO8OVwe0zWNYgXX8cQuM0gw4wT3Xn3/bvJiqijzWLKkkIuplsYKAIY
   OciPKFz/yYQJTHrfya4qILAvqggVD0SmVmaBwUaMX2ljwenb/l5f80efe
   yD9TtaHaqGof0YfHFIcSjvXaqBCmZqJXk3iOrjyYug9bSkKtvre0f5YM2
   33fh8liYwVXE6vhHrSArOANA6jAKQX88z3eM1UMxVk/zAPauri1HxnPZv
   NkAsC8KauqMr6HgiW43sCFCRzwCa42fsm3ng2N7JUpgjafSloxNqMzJwo
   CDALLy8ctLrSBaL5QP46S7MSDdjxMJycyqwVD+5OKbXhfNaoWvgZQSzfy
   Q==;
X-CSE-ConnectionGUID: zBAi9XdkRTeYvecBFXnPIA==
X-CSE-MsgGUID: jgvS90+uRL6wgWM04DliqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90899671"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90899671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:51:33 -0700
X-CSE-ConnectionGUID: xpWQbqTJS/GdhwC7UCB8qg==
X-CSE-MsgGUID: iNhYMTtFSFe1mHKbCW3bqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="273834523"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Sep 2026 07:51:32 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9OJm-000000000iB-0kg2;
	Wed, 23 Sep 2026 14:51:30 +0000
Date: Wed, 23 Sep 2026 16:51:14 +0200
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/counter/rz-mtu3-cnt.c:80 struct member
 'count' not described in 'rz_mtu3_cnt'
Message-ID: <202609231655.q1TkUeiw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/counter-rz-mtu3-cnt-put-runtime-PM-on-initialization-error-path/20260914-233600
head:   954d90b083946d6e70b731917c145a5125bed7c4
commit: a6794bfdb333fca961bb866793df36845a1fe60f counter: rz-mtu3-cnt: cache count values
date:   9 days ago
config: parisc-randconfig-r2202-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231655.q1TkUeiw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231655.q1TkUeiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231655.q1TkUeiw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/counter/rz-mtu3-cnt.c:80 struct member 'ceiling' not described in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:80 struct member 'count' not described in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:80 Excess struct member 'clk' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:80 Excess struct member 'mtu_16bit_max' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:80 Excess struct member 'mtu_32bit_max' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:80 struct member 'ceiling' not described in 'rz_mtu3_cnt'
>> Warning: drivers/counter/rz-mtu3-cnt.c:80 struct member 'count' not described in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:80 Excess struct member 'clk' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:80 Excess struct member 'mtu_16bit_max' description in 'rz_mtu3_cnt'
   Warning: drivers/counter/rz-mtu3-cnt.c:80 Excess struct member 'mtu_32bit_max' description in 'rz_mtu3_cnt'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
