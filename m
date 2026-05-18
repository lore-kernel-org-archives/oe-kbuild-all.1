Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB2D1FDA61
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 01:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779068035; cv=none; b=WtR86yk0YNGbOcNM6TvuX6Pa5PBavcCkliP7ual1L21QEmHHdR78n/F3aZf6Qfr97kkxFIS1X6SnV7H1EBvAnxh6hjOQBGqFiOBCD8afaIN5l8sURIUgpoEe9gRbHZ2aMd1akSFupYkkSh9otH14BRhzBOdAz7yX5efWTyhTIyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779068035; c=relaxed/simple;
	bh=2cPYwYPWJSHIMGKau0i5i5aBnoOFaGQQOiJOmTU5gmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IOORpN6bpBM0L1NavY3p3q08MScW+NdaGFXPBqLp5jGBMsWIeuTiMr6xuKKgqSrW+vIhDbrIDIfSDkl/g+dfRrKOxg/RPdkBU73PY8CqFmXFLOU+PB8GcI8uR93LMpHhcK0ro0IToJCCC/YT65aeYP6r3VpxGbbLL1++RLVT58c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgok4d7W; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgok4d7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779068033; x=1810604033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cPYwYPWJSHIMGKau0i5i5aBnoOFaGQQOiJOmTU5gmw=;
  b=fgok4d7WBmrfCpCuntT/wjcq6iv9rxAUviZudHZWsSzQ5d5jw+dWxYi6
   DNtobeAYCCb9KNlDYHsUSYT0ekSU4rnJ0No2FiuS9fu0+iYtJQLvn1Qad
   LiqwVRhAn8IrQ1FO4ow66ryxACg9L4j8IRzcEuYfwSt7JZ9Azk3X7JBvO
   hc7v8rqnbEUHwCHnE4nuKjjVjrD5FVYgg/2pTRQC6J3PJBvqyYATX6gUG
   qxFROrCvyZQVxMw3Zfq4Mye40/qrrfFvFPPhl6plRu0z137ulUvP/iBHu
   fE6GjhB2FjKX2nmbeZjNLq+e9FIbEhZwuICLhiPHWPjBmUaP5Pysnr4Aq
   w==;
X-CSE-ConnectionGUID: hrJ3PpguSYy2KTmPqk+NYA==
X-CSE-MsgGUID: 7c0YfR9/SdiJW4uP10en2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79054095"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79054095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 18:33:52 -0700
X-CSE-ConnectionGUID: dd75Z220SaG6zIq1r8Pe8Q==
X-CSE-MsgGUID: v7waXJsSTBGI0f8XWoAgoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="243578275"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 May 2026 18:33:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOmrd-000000009iL-1NX3;
	Mon, 18 May 2026 01:33:49 +0000
Date: Mon, 18 May 2026 03:33:37 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: pids.c:56:17: error: implicit declaration of function
 'strtostr'; did you mean 'strtok_r'?
Message-ID: <202605180326.hjGkx0Wg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/sched-Update-get_task_comm-comment/20260518-023906
head:   1b9c135d84ae615e18ef6eeb3d7a0a37b52cd016
commit: 9e83f70b2a5e5bbbcaba6fa03f48c4b1f65b9d7f string: Introduce strtostr() for safe and performance string copies
date:   7 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260518/202605180326.hjGkx0Wg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180326.hjGkx0Wg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180326.hjGkx0Wg-lkp@intel.com/

All errors (new ones prefixed by >>):

   pids.c: In function 'add_ref':
>> pids.c:56:17: error: implicit declaration of function 'strtostr'; did you mean 'strtok_r'? [-Wimplicit-function-declaration]
      56 |                 strtostr(ref->comm, e->comm);
         |                 ^~~~~~~~
         |                 strtok_r

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
