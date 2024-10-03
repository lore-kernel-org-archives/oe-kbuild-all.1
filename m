Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96C41527B4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727974366; cv=none; b=kF9Zh3/5Npj6ihayIN4BYljmXbFCRgiEojtTFn72KMBYEHex87Cu0dtfxWLhad8sVqVzjNt63/tbi6JDjMt/DxLAUgkL4KumsO04u3rmEqFhpoaZYZU+oGnc8Uan22G8QSvfjLcJHifkVxLjPN9aFU6hdMYWPCQ2BdoLs5neSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727974366; c=relaxed/simple;
	bh=wDkuqnVbaGxhCFBWvQwyJw9hdgz1Klqj7rUSs7OcmLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xh9tOljMQ5H5yznd8Ek+l6/HIxA0n7W9gx6boG7IEWgQnUaT8Il7DPNfJe2r60t6Y3zxcxm8UM5g2wIbzxandESfWZqUTczj56dm1CW/bijyIRiC2mvhABVNM9h4raw4tGftyWGIsnJ6yKrKAa7pRpjLrLlNGbGTIublcOXAD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gI7QuO7S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gI7QuO7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727974365; x=1759510365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDkuqnVbaGxhCFBWvQwyJw9hdgz1Klqj7rUSs7OcmLc=;
  b=gI7QuO7S5llNxA23b4Rp02bQyqTeh/THneYeec5In2eSU8NMnIzhKBP/
   505V3TLBnPMnhdut/utKFl5ncR+8XchsiLZTpA0e8LQsQyI1O5/JFDSA6
   ALy2BmY9yyycTX4k329l8azvtCEj7VYW54ZcVXdmv5WfK6sjB6yJgqBlh
   khQ1CfnechQOsgeINOwuFkdWvKu9S8vLB3FLzhNuQ+0e4JpK/s9QmxQUr
   ohyRbpgUUIUu85n8WhZiXurGFmYryJBDzb7RtytZ8ZsiLmzD0o3iS54jE
   X9KKhhzWVWS9ox28JCkLAQU3g3xR8r0z0q8yDNRZQUdcgp8nGlfwhTAcd
   Q==;
X-CSE-ConnectionGUID: xZFRPNW8TeasyBehyH4DjQ==
X-CSE-MsgGUID: vTdk8S9fSAe8iJnDdKwPxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27271861"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27271861"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 09:52:44 -0700
X-CSE-ConnectionGUID: sAFUHqyKRQGT01hTrBRi2Q==
X-CSE-MsgGUID: 0yciw726T6mpdTLV2Rk6lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74528160"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Oct 2024 09:52:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swP4C-0000go-30;
	Thu, 03 Oct 2024 16:52:40 +0000
Date: Fri, 4 Oct 2024 00:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v4 5/8] extable.c:(.text+0x0): multiple
 definition of `set_direct_map_valid_noflush';
 kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
Message-ID: <202410040025.ngiPg64i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v4
head:   78ddd88de53d081958e51e23b23efa53a0472087
commit: e1b0e568561b8fc6c459b1e72f1210493cc0532e [5/8] arch: introduce set_direct_map_valid_noflush()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241004/202410040025.ngiPg64i-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040025.ngiPg64i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040025.ngiPg64i-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/filter.h:19,
                    from kernel/sysctl.c:35:
>> include/linux/set_memory.h:37:5: warning: no previous prototype for 'set_direct_map_valid_noflush' [-Wmissing-prototypes]
      37 | int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   or1k-linux-ld: kernel/extable.o: in function `set_direct_map_valid_noflush':
>> extable.c:(.text+0x0): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: kernel/dma/direct.o: in function `set_direct_map_valid_noflush':
   direct.c:(.text+0x110): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: kernel/kallsyms.o: in function `set_direct_map_valid_noflush':
   kallsyms.c:(.text+0xb08): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: mm/vmalloc.o: in function `set_direct_map_valid_noflush':
   vmalloc.c:(.text+0x4768): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: fs/select.o: in function `set_direct_map_valid_noflush':
   select.c:(.text+0x544): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: fs/eventpoll.o: in function `set_direct_map_valid_noflush':
   eventpoll.c:(.text+0x2290): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: io_uring/io_uring.o: in function `set_direct_map_valid_noflush':
   io_uring.c:(.text+0x1494): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: io_uring/poll.o: in function `set_direct_map_valid_noflush':
   poll.c:(.text+0x15e8): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: io_uring/sqpoll.o: in function `set_direct_map_valid_noflush':
   sqpoll.c:(.text+0x99c): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here
   or1k-linux-ld: io_uring/register.o: in function `set_direct_map_valid_noflush':
   register.c:(.text+0x97c): multiple definition of `set_direct_map_valid_noflush'; kernel/sysctl.o:sysctl.c:(.text+0x241c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
