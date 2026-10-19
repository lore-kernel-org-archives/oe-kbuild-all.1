Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427635;
	b=4LXekuxlplD08wZC8sC5SsgKP5BckSc7fSjO2c6rz8f1C6mf0iRU0/gcPZ9fK3DNvC5s
	 7OfmVNAMPnSvw1ISOh0XAwCgzmpaWv4qQC82drrsYRLV7g7C+w4z15f4cgr499qV6I214
	 ZAMFQyyBCML9G+vVH2VfpjQZFEX/eXJdwYd5N25UErUi2iwPbHqDO4l2sY6oua58Jo49f
	 GWzLkyjPkoOXAD2N8Zm/x37AC0nE2AGRfjGf6nRbzED/aP5kkCZj1/ECF5go+VoQ7Rqpn
	 oKevJS7RVvr1MnJMDg0z623E4hm8Xm50PEjtcBbSBHS5OBzj4gun9XmVgzHO2Pbgd4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427635;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lneAUbZ1k+HawBWig+WEflhrYqm6XQc9wG34s5KSAxw=;
	b=5RdYi9D/187MuNRnkasaGNRXcCUhg3ZYd3396T4PeCyUsZkY6AdyjLtJ4KpDvcQ4xBXw
	 lLyQW9k+BzrZyNBecv+B7hDE1+gcFS1UpYapDfecaPc7XP9zAoYFubWG18yuMFNCOqucH
	 JQdxIUxzZNsThqHGe4xIlQzwxgJVVNoY0MIThxMFq1wdeLTGgFKmksyL5h/zKIvEHeFrM
	 geH2wHInh4uUYJB+KlX3yBfbgQ2mSzzo7eLv6RskUzid9LKXs6+RJWFBHs1gKWGsMGjPY
	 8MEqtBEy42WlHkBPumtmhDMdlqGjjEe/H0s+vdK3PwEiXuxxkOMBwzHU49vXn9CMY0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTI7OgWl;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65B7606A326
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 16:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTI7OgWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792427636; x=1823963636;
  h=date:from:to:cc:subject:message-id;
  bh=CvlK5utFupZ+OJKWRPslbX5uDZARC7RnEE6gBpd8lPQ=;
  b=GTI7OgWliy7+dodwNnonLL/REbvma37YApY6Ytf6sn9ilO1XaiVEa9IQ
   K7tYn5gpAbxRoKzigNiTA4Nyp6eYdoLKYJbWiXK8NDBtgRyO5SlLLPwUs
   W7dSAqffptFZAfXDG6b1nc+Z2EHjs443pkwnuzGBZhGw0+38BO/K7RfhT
   ezrxWaWo72lGvPh5WE6a9enY77VCOMK4FR1ghPc7YhKKXJSJ1f+XBJoSR
   4ZkKSJkFHi5kuKdYy05H9u8YM0rjjTVqC6/4sjw1l4HhFgTFhhZsQXd3O
   3nqZae0REspkrY+L3GGdC+ndKdiDMI8xXamu7NwzIlsPMZI9jtDasSX4y
   w==;
X-CSE-ConnectionGUID: Xcglns38RyqYmcEx46Yucg==
X-CSE-MsgGUID: 7qcr5VsZRfuuvsUll1g9ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1125844"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1125844"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 09:33:55 -0700
X-CSE-ConnectionGUID: PrZzUxUpQbGgB0gcHWJqYQ==
X-CSE-MsgGUID: seiWO2d+QGKZ25kVBggKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="3043621"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 19 Oct 2026 09:33:53 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIqJ5-000000005hj-0uee;
	Mon, 19 Oct 2026 16:33:51 +0000
Date: Mon, 19 Oct 2026 18:32:56 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 8/22] vmlinux.o: error: objtool:
 ___bpf_prog_run+0x76: ignoring unreachables due to jump table quirk
Message-ID: <202610191833.tINTSz2L-lkp@intel.com>
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
commit: 20f58aa1dc32160414033482f1b4ee292279d225 [8/22] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-2101-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191833.tINTSz2L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191833.tINTSz2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191833.tINTSz2L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: ___bpf_prog_run+0x76: ignoring unreachables due to jump table quirk

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
