Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5087D098
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747852833; cv=none; b=TGDSflcoorX218Sdkn0UVBhdk36Uj+ffXn/Wo14rm1e7vVkP7gUcN6gESZ5EaQc7SRiJjOKJfB3U/anB399JU0kvTjU0qRpVN2TtjEa4LeuHO4qjRF+3hnbTtWaMlU+fOJKE6vcSI45JdG7kLYR5WLCqEdAYxwH5dAzEp7q1Ps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747852833; c=relaxed/simple;
	bh=RO43uuPYzhbkLC07NVMMcBLVbbVtpYaaKnRegwJ9lEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RfXPNKIdaXEzhJZiGMp3VLk0rqiK+vgjnXD7GoKs1yKZxkkbD0eYoKx3FeTZKwn+gw7GUGQcZ/+Btg/zm8hlbQ47T9trLWeShyQNGUiszkMI7UyYBnR14s0uQdhuaX2U5MPTBy/zJztjVgup+4ghXbDq8T7IZZhA2ObMgC7QNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaydEQH1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaydEQH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747852832; x=1779388832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RO43uuPYzhbkLC07NVMMcBLVbbVtpYaaKnRegwJ9lEQ=;
  b=TaydEQH1MkvV0Hba+gfxVszpRFGpmHaKfE60XlYk7LTmoDhktd5zn/OC
   eJyVWyNXMTgRXcAwVR6bF8PQhcTxbEiuvc9LCGpfqK9hysgb8BlG6oPnF
   jtu0psx4TbWr8KEbWmbhWCzY946CdKTTV5fYGMyOE5MOikVsEjv4Y4FqX
   uFN3UgD3AYQtBpN4NnEzSHkC67l28GY+lyvxyKZrgA2XXmhLhk5fiGubr
   bXndmfcOnXiHgGKvtPJFnyHyNXn0mhxCXQcHQnOjv+as8U/JqQtz3wDjd
   Fi5QZQshHahhI4iUC3bkI98HsNu/UBAcFzL+V2ttQpzjURYSnGAozYKT4
   A==;
X-CSE-ConnectionGUID: nbvs61vzTEaupY4uhaWaUw==
X-CSE-MsgGUID: VXYPOUZkTh6AWgPy2pgI4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60487465"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60487465"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 11:40:31 -0700
X-CSE-ConnectionGUID: WJOB/Lq9Rjif7GGhMSDQDw==
X-CSE-MsgGUID: kAw5O7r7TdKWDoKg6/UQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140050718"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 May 2025 11:40:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHoMd-000OX6-2z;
	Wed, 21 May 2025 18:40:27 +0000
Date: Thu, 22 May 2025 02:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] net/socket.c:1525:21: warning:
 no previous prototype for function 'update_socket_protocol'
Message-ID: <202505220253.recEQAjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ace7789354948892feb8f07d384af6d4af715703
commit: 5284b7a2430f7c5fce8e4645bea63eef55bd8b1d [11/11] bpf: Add update_socket_protocol hook
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505220253.recEQAjG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220253.recEQAjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220253.recEQAjG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/socket.c:1525:21: warning: no previous prototype for function 'update_socket_protocol' [-Wmissing-prototypes]
    1525 | __weak noinline int update_socket_protocol(int family, int type, int protocol)
         |                     ^
   net/socket.c:1525:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1525 | __weak noinline int update_socket_protocol(int family, int type, int protocol)
         |                 ^
         |                 static 
   1 warning generated.


vim +/update_socket_protocol +1525 net/socket.c

  1509	
  1510	/*	A hook for bpf progs to attach to and update socket protocol.
  1511	 *
  1512	 *	A static noinline declaration here could cause the compiler to
  1513	 *	optimize away the function. A global noinline declaration will
  1514	 *	keep the definition, but may optimize away the callsite.
  1515	 *	Therefore, __weak is needed to ensure that the call is still
  1516	 *	emitted, by telling the compiler that we don't know what the
  1517	 *	function might eventually be.
  1518	 *
  1519	 *	__diag_* below are needed to dismiss the missing prototype warning.
  1520	 */
  1521	
  1522	__diag_push();
  1523	__diag_ignore(GCC, 8, "-Wmissing-prototypes",
  1524			  "A fmod_ret entry point for BPF programs");
> 1525	__weak noinline int update_socket_protocol(int family, int type, int protocol)
  1526	{
  1527		return protocol;
  1528	}
  1529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
