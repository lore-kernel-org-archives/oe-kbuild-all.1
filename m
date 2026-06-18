Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90B5306B0A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804367; cv=none; b=lZ8Uz/zRY6y/6tPhmwXlTCizYPiYEgEGhOac84uX7Q58vdQYAoNnD6ssbNo4yMuso8WiJk+5WQq2lyk+v4MeL+EvNNlL+RMpRXwgc8opQFcC1otRJDyVyHecGEfDmOF5PBFv5c3VWke1Tchurjsz1IF+rs9SaUtO1spYd0Bur5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804367; c=relaxed/simple;
	bh=JwFNhxWy4eJpr1JPYaH1cWVOn/Vm7urCfSUL+plk9Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pJfW8U5xl2SefSQl/P9jO65P9vOit3VDYgwa0sHex5Or9XA3IttG1MTqYWiLKs5gLNuKGEF8kgebOjt9s+FPeONqYBALoAcmOv52SIeZY4XAsRXcWo4i1GCuW+nMiQM3i9UhuigUBtLOJXZQbh/xKHXbIGWkSqDzezjyr7fA6OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAqLu2Wu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAqLu2Wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781804367; x=1813340367;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JwFNhxWy4eJpr1JPYaH1cWVOn/Vm7urCfSUL+plk9Jc=;
  b=kAqLu2WuzUkujbTRfbZ0nSGTZDWDHh4wip6C/TvcJqpra4/T5qN+0yuS
   F72ECxQtmbLe7q2MouxN1KxthPdgKarfkNlPYCSCmXYi6nJbR0Z/ld7yz
   xU3GFVYZoAdU9uv1hhBgYgPhPCtx9TgPfYYpIsM2Kf1lShSCsCtBBCckF
   iAQOfj5Wp1gR7N+KRdQLriCW/3ugSg1PMAZ1P7G1wESMyTzpABEt3a+5y
   TNT9l5bwENjBb19WuBsOuYbRz90AQHq0yT3tL9BDglH4CTQxzmB4X5spa
   oprpg+EzsPA84foJi9LFlQE3dJL/+4F3c/5Aptj3NaGkbs996PONbVJBY
   w==;
X-CSE-ConnectionGUID: YQJUxdv6Q5m9ausSnzCB6g==
X-CSE-MsgGUID: lYIuPWFYQhCcLnAd7fIGbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81635840"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="81635840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 10:39:25 -0700
X-CSE-ConnectionGUID: KjkM0j4hQI+n4o1weBJAHg==
X-CSE-MsgGUID: tWcN9q6ATPqjSRXCrsRfEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="272125422"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2026 10:39:24 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waGi1-000000005ZT-3ygp;
	Thu, 18 Jun 2026 17:39:21 +0000
Date: Thu, 18 Jun 2026 19:38:27 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 80/121] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606181908.XVusfqVx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   9c0dea96595ed07b9d3948c7bd1a5dc915573121
commit: 800150cfb169317da8f8de989c0ae0d30bf8c87a [80/121] Add a ZTE RTC dri=
ver
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606181908.X=
VusfqVx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#55: FILE: drivers/rtc/rtc-zx23.c:6:
+ * Copyright 2026 Stefan D=C3=B6singer
+*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
