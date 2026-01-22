Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D143D666E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 22:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121473; cv=none; b=HcC6RUioZhjTktCv+4otjfpZCHviyEkMijRW3N2ej4mzeXuy6jt1EtZZZaZHg6+wbeweouM0tiWO/5NDJONyshZzzel6u+JVVS2F5xgL8WZ/5SpaFFCgdUHpNxfyo0Lz/QcUBcDJzzVpxMOEgSS6+ttiYYL2bWroFn+kjOzIOQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121473; c=relaxed/simple;
	bh=LEV0icAEQJ4LZbqADVgCiI5vSUINbynwK66Xuxh8NIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2B2VgVjErdtvSXOdgAixYSkdUEdGn9Br9aczM4JsAPOFCOtxCgSRtO0BdqYygQFdfBFxI4AXC3E1MzYgNnNCI3sDeM8W9jJpoXZJQ6bg2yOZOFPo2N5192u6fZx6fCj5R5wgTX1l2U2gIckFqw6D97TY56zgT/Ec4LAcblxgIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaRcMl/B; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaRcMl/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769121463; x=1800657463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LEV0icAEQJ4LZbqADVgCiI5vSUINbynwK66Xuxh8NIs=;
  b=CaRcMl/B2BSCDI1xJzVOy/lMO25ZAtTaUMxExzdSQK2PddkgHR/zz/sa
   sCXuDaa497DMwf4ncfbrJn5SP0CaMp7MvB7j0/f6K2WEijYDphJxoq7IC
   PB+Px2eE6TVqdc2jeljiJzz/fM0AaHItJkzGdBp3YgKbwFBwPbwvuRwMO
   ka5KpJi93qxk3S+OFKyPH8LOB7E/IYPjcC8puqveuwelZZcToD4jJUfxt
   qQ7b+fSTCfCVtSiM3wBQ7dtCXF6rxduP02pXmOR9U0EYWDf7txrFD7iMj
   PLYpoLmYu5BU7xnIBDSVrP2/dlNl9RpOGALtsN1ZHX+5feN8fD7HyCg8M
   Q==;
X-CSE-ConnectionGUID: W2SOYdVHS86CCi7wrTVBcg==
X-CSE-MsgGUID: IcpNj8tETtebYSHzRbfHmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70347023"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70347023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 14:37:39 -0800
X-CSE-ConnectionGUID: rEdMFJ35Ty2PJ24rdpV8FA==
X-CSE-MsgGUID: IfeoD/MpQIq+CJCSggJtMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211303065"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2026 14:37:38 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj3J1-000000000Yj-2lRD;
	Thu, 22 Jan 2026 22:37:35 +0000
Date: Thu, 22 Jan 2026 23:36:39 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/7] selftests/statmount: add statmount_alloc() helper
Message-ID: <202601222324.E5vtCZPM-lkp@intel.com>
References: <20260122-work-fsmount-namespace-v1-5-5ef0a886e646@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-work-fsmount-namespace-v1-5-5ef0a886e646@kernel.org>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1bce1a664ac25d37a327c433a01bc347f0a81bd6]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/mount-start-iterating-from-start-of-rbtree/20260122-191218
base:   1bce1a664ac25d37a327c433a01bc347f0a81bd6
patch link:    https://lore.kernel.org/r/20260122-work-fsmount-namespace-v1-5-5ef0a886e646%40kernel.org
patch subject: [PATCH 5/7] selftests/statmount: add statmount_alloc() helper
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601222324.E5vtCZPM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222324.E5vtCZPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601222324.E5vtCZPM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> statmount_test.c:36:26: error: conflicting types for 'statmount_alloc'; have 'struct statmount *(uint64_t,  int,  uint64_t,  unsigned int)' {aka 'struct statmount *(long unsigned int,  int,  long unsigned int,  unsigned int)'}
      36 | static struct statmount *statmount_alloc(uint64_t mnt_id, int fd, uint64_t mask, unsigned int flags)
         |                          ^~~~~~~~~~~~~~~
   In file included from statmount_test.c:15:
   statmount.h:91:33: note: previous definition of 'statmount_alloc' with type 'struct statmount *(uint64_t,  uint64_t,  uint64_t)' {aka 'struct statmount *(long unsigned int,  long unsigned int,  long unsigned int)'}
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
