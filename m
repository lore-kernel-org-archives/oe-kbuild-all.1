Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE4C1EB5D4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173666; cv=none; b=JE/fLqB4XAMUpl3Cp9dTDEPB9Uo23/cx67KI+8Hjv5XCS4Ilv9Xdq03WrUgw4cCxJow65Zh6SngyJ2lujXkfEG9Y4+XbKotW34nf1D2mNSzWtaPAYitfAozsjuQrw9/bYG0hN+veo9xnzfGza88wP9AsjiK+ksGkHMEGPBJ9G9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173666; c=relaxed/simple;
	bh=GxKeJwKFLpBr+spoCHuZZeWVQFY8u4xJCWNp4dXl7nE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLZfidA5AsRSp4+YssKHdooM/DnRmiIyCHlUobkcCYwU63JZ4Uh+mHsiVPM/5Mb065fWRmtWMnXsq89DcfokU/u0F0naAHZhesLFbIefo+5ZzW5Vyiph4C13u62EZKWHcxxOjPGna9I4jUHJWcuGhJ9gVmmYpSzyUCqmew+IcvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNuEMkvR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNuEMkvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741173663; x=1772709663;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GxKeJwKFLpBr+spoCHuZZeWVQFY8u4xJCWNp4dXl7nE=;
  b=GNuEMkvRj4EmQyG/F2Xi0HXAHUpqUUwFEOSFsFCkxWUfHriF22qvs1b9
   ZpSBc9XTuTIKEkDpQZdciCbJG4l5prsy22pnGA7W0riasRhrZ5LopmGVI
   lKsgV0hK8UjespMngocwy6JkFFsp3ARe57lL8dL8iq25tvW2s1biuJvqf
   avg1epxxlLJyZwaYOgTMDVdJZ2ZmWhVnz96DalW0yp90Gpnt+DhFfY+Nk
   HjJF08Oe9PegcmqIALgeKaeSEK7ny1PYnQJJXKAAe5/lWs3Hzxd4pJY4+
   lJEAijtRcjxs9wdnWbNaf3nD3shry8c12g9umScb34vHi/RKZACus7bGL
   A==;
X-CSE-ConnectionGUID: LBM5W+6ZTlGvLGNa+Z1QvA==
X-CSE-MsgGUID: Dy0DvRhHQH2FliDPk4zW+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42332091"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="42332091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:21:03 -0800
X-CSE-ConnectionGUID: E7dW+7WGST+CEZSz8GlC2w==
X-CSE-MsgGUID: 3pn4U/+tQb6GWoCPie4KWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="118489233"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2025 03:21:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpmo7-000Kta-2W
	for oe-kbuild-all@lists.linux.dev;
	Wed, 05 Mar 2025 11:20:59 +0000
Date: Wed, 5 Mar 2025 19:20:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] kernel/events/ring_buffer.o: warning: objtool:
 perf_aux_output_begin()+0x693: unreachable instruction
Message-ID: <202503051906.icv6XBua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 7771bdbbfd3d6f204631b6fd9e1bbc30cd15918e [1/1] kasan: remove use after scope bugs detection.
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250305/202503051906.icv6XBua-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051906.icv6XBua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051906.icv6XBua-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/ring_buffer.o: warning: objtool: perf_aux_output_begin()+0x693: unreachable instruction
--
>> fs/nfsd/nfsproc.o: warning: objtool: nfsd_proc_symlink()+0x35e: unreachable instruction
--
>> net/sunrpc/auth_gss/svcauth_gss.o: warning: objtool: unwrap_integ_data()+0x18b: unreachable instruction
--
>> net/ipv4/arp.o: warning: objtool: arp_send_dst()+0x1d2: unreachable instruction
--
>> net/ipv4/ipmr.o: warning: objtool: ipmr_cache_report()+0xc6e: unreachable instruction
--
>> net/netfilter/nf_nat_core.o: warning: objtool: nf_nat_register_fn()+0x290: unreachable instruction
--
>> net/sctp/output.o: warning: objtool: sctp_packet_config()+0x806: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
