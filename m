Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380FFF9EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 00:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768279; cv=none; b=GV08yiXijPVC21CtN4XZvKTheB6fE/HbCm2bwLDYAE1KtyiCWh4THtHjv5ECQy6uJVTShVQk4TYV7O6Ou+BQOsS6VQfSJj4cKcGQhjxBcMg9SpY4IQ5TJpZ0T9hNb/8x/mVQNiR+KEjvK9ysxpTIDMnLJBvI1IEyBn/w6sC1fYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768279; c=relaxed/simple;
	bh=xsZXGUSfjysPsy1/OGY31ASTi6xODcGTVahliuNvr6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DuuaaxK2+XlMtqFbw+qbsXVQgHOessepmYdauriAqgoDugu1oTTyxwJnm+ETA0m+t2d4N9t3hdAnu3pe/aZT3+Qir+zy59RNBmfeDbmfpAeGqKHVChJNU6Qh9DX1wXZZpG1IcVT6tjvQsf/eumI1FKQmlddfwLgd/ihjGSzEN5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDJlFhgG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDJlFhgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730768277; x=1762304277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsZXGUSfjysPsy1/OGY31ASTi6xODcGTVahliuNvr6I=;
  b=SDJlFhgGo2JeVoI45JbDkpZO1rrHtbHBow5rwWSTgADbuQG8gaa5sIhI
   DtVmit0U+qPiqs9b/YQwD8EflYVCm3YvgEFpzvGyxIqgAGVCmgY/877yj
   iBrSheYHbTeTDigPKXepKqk/bJB+cFfm/su+ltkeYI4b5+mr/svgKBfd+
   lFJGc8gvJUv4AO+sTU3dOdpLXA4RBtZBBVRCDXdnjk6X0ctyc6rlNJuvy
   PBiLXrjn/oAY/CKz9dk3yGnlwz055jAXUOEk1qIa97mQRxTnt+QVVlXKW
   4lEnF3sOzvXpSQIN+ZVRcNSBZ4XSZl409TPnGPlwoylLcwsvEXYcZLAi8
   A==;
X-CSE-ConnectionGUID: buDe8N1sT9mO3y/qjVgcTg==
X-CSE-MsgGUID: 0rqvvitsSrKO0EkzHsLizA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34423050"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="34423050"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 16:57:55 -0800
X-CSE-ConnectionGUID: jkC0MhmDTn+S9TH1VjpVfg==
X-CSE-MsgGUID: JTW/3akkTtOu+NLMyIeItg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="88641671"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2024 16:57:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t87tH-000lSD-16;
	Tue, 05 Nov 2024 00:57:51 +0000
Date: Tue, 5 Nov 2024 08:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1223/1223]
 drivers/soundwire/bus_type.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202411050850.a56hGHlt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pierre-Louis,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d426553bb97ebfcb4ea34e8fd63477a44316644
commit: fe38a6fef0e5f4ba9c21d3e26381987519b7edc7 [1223/1223] soundwire: fix regmap dependencies and align with other serial links
config: x86_64-buildonly-randconfig-006-20241027 (https://download.01.org/0day-ci/archive/20241105/202411050850.a56hGHlt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050850.a56hGHlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050850.a56hGHlt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/bus_type.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
