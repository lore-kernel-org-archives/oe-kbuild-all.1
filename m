Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CC20EB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 02:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730516297; cv=none; b=Y3hiQgKgyI0DP3M0yAVUm4wAov0DsB5bpywkTthOeAlK2K7fcsO/gIUd2dYG9tsFSUImSv30sq3b2jzphcC5V/Ti/ZeCe9BXJZxpTwdre8fV/nq20PrQYkUGyxaPIP+cRFpiYBDcxDD6M2ZzgGPVl1d3lb9cTZkll7KJnCdt7x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730516297; c=relaxed/simple;
	bh=xtx1CT//l0nd6oLi1tAFr7hJgTKmBdBd1AN35bnkHOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDSmDWCKkIjJKcndoq9ZFbzxnytzbEX9fYs2hNtReZgdqmJBcNIXfg3kx4IZBRQFtcs7zFHMNpL9ZnlyCZ+Ml/jXmXIna1N5vRoZvgHnCoUht7WucBEN2bFZSf4VuqUTwXU8iomUyx0YI84+nVJJM9nJQYvTUElHupT+Pcgvi0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHB39mBj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHB39mBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730516295; x=1762052295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xtx1CT//l0nd6oLi1tAFr7hJgTKmBdBd1AN35bnkHOI=;
  b=fHB39mBjgdeIq+xAnvSEVlDzVtbosLeTCDtY6bNVct76ORWhHqQSyWMt
   OQC9KKVA2r24uRdSYA17tg3QS9NxF6m13CJEX544xt/tf0kHj6h6qCHyF
   u2eb6DEwqO+r4wUxRKMoDT608Fb0vAauhppj1lI/v3KX2B3BERoJeef89
   K+T6AaSuyEEDzflWPAG1OqJw9hAPmCYFi6RDzw893sSP0+Wh+H5DgASUK
   44HRvA9BqA2JIav65z6Hcun9pmlbR9+btYNn74KT/xDfY1m3EINtHnYBx
   iDitKpM6cxYX4i3Z4fSPFEkf78313RtHAySEeUy7a84bo3WwASSi16J3i
   A==;
X-CSE-ConnectionGUID: cPf2hWceSKWil5/mU9O+Mg==
X-CSE-MsgGUID: 1NyBQ+90RPyzL9mULDAn2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="47784727"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="47784727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 19:58:13 -0700
X-CSE-ConnectionGUID: flRydUlxSXGOkGz+4fe/Zg==
X-CSE-MsgGUID: 2PJiv1V2TZe+R89akZpkEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="83261793"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2024 19:58:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t74L4-000iLN-0V;
	Sat, 02 Nov 2024 02:58:10 +0000
Date: Sat, 2 Nov 2024 10:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next fanotify 2/5] samples/fanotify: Add a sample
 fanotify fastpath handler
Message-ID: <202411021024.bhf3a68R-lkp@intel.com>
References: <20241029231244.2834368-3-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029231244.2834368-3-song@kernel.org>

Hi Song,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf/master]
[also build test WARNING on jack-fs/fsnotify linus/master v6.12-rc5 next-20241101]
[cannot apply to bpf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/fanotify-Introduce-fanotify-fastpath-handler/20241030-071530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20241029231244.2834368-3-song%40kernel.org
patch subject: [RFC bpf-next fanotify 2/5] samples/fanotify: Add a sample fanotify fastpath handler
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241102/202411021024.bhf3a68R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021024.bhf3a68R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021024.bhf3a68R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/fanotify/fastpath-user.c: In function 'main':
>> samples/fanotify/fastpath-user.c:61:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      61 |         args.init_args = (__u64)argv[2];
         |                          ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +61 samples/fanotify/fastpath-user.c

    43	
    44	int main(int argc, char **argv)
    45	{
    46		struct fanotify_fastpath_args args = {
    47			.name = "ignore-prefix",
    48			.version = 1,
    49			.flags = 0,
    50		};
    51		char buffer[BUFSIZ];
    52		int fd;
    53	
    54		if (argc < 3) {
    55			printf("Usage\n"
    56			       "\t %s <path to monitor> <prefix to ignore>\n",
    57				argv[0]);
    58			return 1;
    59		}
    60	
  > 61		args.init_args = (__u64)argv[2];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
