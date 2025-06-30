Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97959202F8F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267842; cv=none; b=T9UhQi/m2uFHpCM8G7uOnkpIH+gHcSv+0uH3/KkGBp+t+GLwGNek3Q+mJ1MCePf0cljtgF8QXANTau2r27Y5QQEbID2Iyj32hJeddBZVuGYOTb250qI+/jVRUAeLTbJr7EyHoXcirpvAnrUCK8ErwtAxSR4tnjel3q4jV9dHsew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267842; c=relaxed/simple;
	bh=92WyQMGXY55rlKrt8VevzmG7uhIEydWVlvL7jeyFZug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tgl8/hZjeXwWqhH0QeC2NjtcTV1eiVY1on0+u+qA2oBa1CtVLytUGVctjkTSezHLrbyj9g2R2v10N69KDZmVek5C904B5s9j7elCDFfYL7/gzYHZ08xlU0axxZ6b8AnVPLW4b+BWG7eIuoQUvMJSigTru6U9j2YYni59FfxPq+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPQ7tZhc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPQ7tZhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751267840; x=1782803840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92WyQMGXY55rlKrt8VevzmG7uhIEydWVlvL7jeyFZug=;
  b=EPQ7tZhc2Naet5yKDCNCN4u0qdXejNSCBv2Z7Jmuh5F31nZjx+AziM7G
   shQtHduzeNDfrIYyxwAJfDLu/L3lvnUwcnMhQ8+bCIks/trUpDj5vHVXL
   Pm+x3VruB2cEercp+FCZpW1eqK3Ne6Yj/dmEo7NCna8RV47x3+WcvG8JV
   qj2uGq9/JCD74HYyKaF4pVa7c0hBluGqvwWtPZ47u4Dmdjg+v6FBWIur/
   EKK1PxoeH7zgWn0xB2RbZPiarQnzXIDxVJsmP7a+2rZgOQOGmLIBPrfMs
   a96CwYZWNTRp4VLh0STemPODPtsd08d/Kvdprvfd3aIL6cqKqobq1+OXN
   Q==;
X-CSE-ConnectionGUID: Sn1N31x6R3y8+4BAcjKkUQ==
X-CSE-MsgGUID: RTc5ZPoxSDeMouKTXn+y7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64834826"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64834826"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:17:19 -0700
X-CSE-ConnectionGUID: 7qVfaJXrQUuerLPOpSfgxw==
X-CSE-MsgGUID: e35QtlWCRjSzyVm7PmZJtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157772135"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2025 00:17:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW8lP-000Yag-2O;
	Mon, 30 Jun 2025 07:17:15 +0000
Date: Mon, 30 Jun 2025 15:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev3 6/6] ld: kunit-test.c:undefined
 reference to `kunit_deactivate_kprobe_stub'
Message-ID: <202506301542.UDSsrXiT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev3
head:   feed99729a7729442ce6bace637033f9bd78a78c
commit: feed99729a7729442ce6bace637033f9bd78a78c [6/6] kunit: Add tests for kprobe stub
config: x86_64-buildonly-randconfig-006-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301542.UDSsrXiT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301542.UDSsrXiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301542.UDSsrXiT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `kunit_kprobe_stub_test':
   kunit-test.c:(.text+0xea5bd2): undefined reference to `__kunit_activate_kprobe_stub'
>> ld: kunit-test.c:(.text+0xea5be9): undefined reference to `kunit_deactivate_kprobe_stub'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
