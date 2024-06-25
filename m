Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D854AEF6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719349473; cv=none; b=hYUlo+p/0bKHc+ldVutX+81u0+jZOJAwa+P7wtYYe1goFs0IKQAsDLrpMBgtbdlUps5jG6fqSe+d/lOgbwwqisDt1IGkasO5Kpbrqkm74C9znCnbQGIRQcsZv7V70/440pB/TRf/C5IdxMhOJfjEOzGhqZ5KgAYgA1FftGdEXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719349473; c=relaxed/simple;
	bh=e/jrCA8SJViC9yVMeq/yS7Iiw8KkY+PxubQ2eE9JHyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5yphdP8XJcbDz5nP6jbScKc3aGJtR3g66W/Qcx1sVjMjmLxtuJrEZ8V72wb63AlE8+b9pZyeTg+BjLphDEVuBBdv3ykSNhX28sR7Hk5LxnJG+63ymEQ+aStQhtJRIuN5CqeGU3TL7vO9zdCMWzMgOX+dW0SWpcFuyJfXQvpkCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBoftO9e; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBoftO9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719349472; x=1750885472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/jrCA8SJViC9yVMeq/yS7Iiw8KkY+PxubQ2eE9JHyo=;
  b=DBoftO9ejo47yh60qk+4zTnhU0Gj4+OXiOMb+3f3evVUWm8cISnYvQBQ
   Jg2g1ulMMOIHuD0meVHSODI6QyctMoZl6LXmTJ57A56q/JwV8LwVUxUCP
   wcqWpd+mpcUjS21+wyk/sB0WMDtF3q0ZGXfz5+pmxpm7NHWI5L6Is0EEw
   W6N/DzJtobXXbR3Knmy4W77lKl6n6PwIK+w6cnZfPiEbKNWxGmil05bCJ
   tbY8lAq/pSOhSTAdzCZh5EG3eqz/X1fhHhZo/8th541uB4aan2hD7DkyP
   FYhDS7pqM9m3ePD/6wJp6/uo+8OssENaGEv5HkrJH262q7+5bJcgovOEq
   w==;
X-CSE-ConnectionGUID: k3Yeeh19ReSZXXxjrTY03w==
X-CSE-MsgGUID: 9ASldJFsSmqmBg13+le4/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16520083"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16520083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 14:04:31 -0700
X-CSE-ConnectionGUID: F9FNrit8Svi93l2nIJGckQ==
X-CSE-MsgGUID: 7KioCBhOQGabNfZ3DYKUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="43747354"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jun 2024 14:04:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMDL2-000Ej8-1T;
	Tue, 25 Jun 2024 21:04:28 +0000
Date: Wed, 26 Jun 2024 05:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 8/35] mipsel-linux-ld:
 devmem.c:undefined reference to `__tracepoint_page_pool_state_hold'
Message-ID: <202406260541.sc1hCHMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: 8306bf316a4d3928d670f98e9e6a3b3218e8c73a [8/35] memory-provider: dmabuf devmem memory provider
config: mips-gcw0_defconfig (https://download.01.org/0day-ci/archive/20240626/202406260541.sc1hCHMA-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260541.sc1hCHMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260541.sc1hCHMA-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: net/core/devmem.o: in function `mp_dmabuf_devmem_alloc_netmems':
   devmem.c:(.text+0xa04): undefined reference to `__tracepoint_page_pool_state_hold'
>> mipsel-linux-ld: devmem.c:(.text+0xa58): undefined reference to `__tracepoint_page_pool_state_hold'
   mipsel-linux-ld: devmem.c:(.text+0xa10): undefined reference to `__tracepoint_page_pool_state_hold'
>> mipsel-linux-ld: devmem.c:(.text+0xa88): undefined reference to `__traceiter_page_pool_state_hold'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
