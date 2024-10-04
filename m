Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC11D9A43
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728054208; cv=none; b=QSZB2y20hexM7LQVT7jJt6btX7D9ClBCwXNPB+ywiJbEXHdcJzZH3FvDrBlWrkijKfGi12j6e6f+/TboZuqDKd0Rq3pDKVLz/Yg+Y10cISZT8D6+FppfP8TdrfhvxRlz7nAGKjSWauBTMYf5p4io/rkMtZ6rKzW9iO5Ko2uvssY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728054208; c=relaxed/simple;
	bh=d3fu3gYbeSLp1RzKr4Jq7g9e4jncCPi18jt3/FkDbTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGy+7C6eeFiJz49KCTCdg+xvblGLxDomML5rMgkxp0W34u8tyXm6k9FC4muDD/Yl3WACzxCi8SxzpnNAsdfSGrAoVAkbG1gQyuN7W4D+F7qv5ADL/MdAwEOzpOcGIuaKR8KCNY07et/kAkuj6Chcj/5PzZswSHac0tU+N/C/OwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qmwkoqyj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qmwkoqyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728054206; x=1759590206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d3fu3gYbeSLp1RzKr4Jq7g9e4jncCPi18jt3/FkDbTI=;
  b=QmwkoqyjWJEkcK9B2eJrWptwdG1i/oBxgwgHd4c+dVV52YZOAE1aooCE
   WmtnWbKVH7A6ZIx7+eTwJ9l3YZLf//EfGEUWQR+u9BXVw4kss89nFZv3c
   zYEsBIEhMXUtF/nqPwxk5dUP5hSHVkZjWUtQ6ezBN1srMbAmAQUTRT5v3
   yhYzu+Q3I3RVarI/D1f0cz/5/vJKZCa7f5QLvKsNFsBH9/v0IcjSTFgkA
   n+QXIJD3PIYnangHtl/MhdXSx4n8qLQpoTHDUREMslMHwv3E58Ljk+KV9
   WKhnuh2YSR2oqCVzjox85OTQV7tuZP29SU9TJe5JrX/uTJRJAHSjj4UIB
   Q==;
X-CSE-ConnectionGUID: EeMSkkskSoWzUODgIY6yfQ==
X-CSE-MsgGUID: Ufc4rA/+Tcaaga2ip71RRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="44808139"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="44808139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 08:03:24 -0700
X-CSE-ConnectionGUID: t6IlfvWBSAWlvpcSQN4pwg==
X-CSE-MsgGUID: PRY9kZa8QfeEGnwN05R6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105572680"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2024 08:03:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swjpx-0001nU-0Y;
	Fri, 04 Oct 2024 15:03:21 +0000
Date: Fri, 4 Oct 2024 23:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 24/27] xdp.c:undefined reference to
 `page_pool_alloc_frag'
Message-ID: <202410050158.mQ0joAiy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   7a2364bb14a700337f0bc7b8d6c66956dd32ed8b
commit: ff72d3dafea238d778ca9ae6ab29d20a4e0f17c2 [24/27] xsk: add generic XSk &xdp_buff -> skb conversion
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241005/202410050158.mQ0joAiy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050158.mQ0joAiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050158.mQ0joAiy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `xdp_copy_frags_from_zc.isra.0':
>> xdp.c:(.text+0xc2b307): undefined reference to `page_pool_alloc_frag'
>> ld: xdp.c:(.text+0xc2b48f): undefined reference to `page_pool_alloc_pages'
   ld: vmlinux.o: in function `xdp_build_skb_from_zc':
>> (.text+0xc2b595): undefined reference to `page_pool_alloc_frag'
>> ld: (.text+0xc2b6f6): undefined reference to `page_pool_alloc_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
