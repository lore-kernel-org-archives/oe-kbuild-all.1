Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7D18D62C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 04:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723694938; cv=none; b=ORD9QH5dMteJhRzNsUc4NIHpm4/vWzZZjrxIwRbYUfGWpPU0TMaj3dUveGPjNRV6/sb8yzIyN1gJbu3KcHab0Jvn1l3+tW+k2jq+VjavzMYcmY7v3ZhP2VNbiy3DPpKdu2VyqLvgea31QLwQ3QBGMseOqYJB6/XQzYl7yCnCLXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723694938; c=relaxed/simple;
	bh=Gf/vuhF5mbXxWKuq5uL+z51ncnzhweFqWWEL6tg+1vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi8idUJOb6HQnaovGxFK2+0K5ikYkCliTNXhzxz/xDtsMQwOu6gFy9t3jqHjiBqRvnsVCePlxcwLPinMFdDGuKROG3S/gn+g1XfnGnBu0nXf143RkyKnoJvyjATsWK/bLY/JW6et6JwcKINNmnNI1HxHc7oqd+nXMYqKr3pK74U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKxNivB7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKxNivB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723694936; x=1755230936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gf/vuhF5mbXxWKuq5uL+z51ncnzhweFqWWEL6tg+1vI=;
  b=JKxNivB76M99hstDIx1PJOXLqUf7ibUs/nBrPoVdxbN2YqoSVTyrODnq
   mAaWybu+ilI/CEoUkz3DQ6emaNl64A9Vea/fuYOFqAVQQj+igF4S1N+Ri
   bBOB9EfLvVBDHg4Gi5mNRYDmri10wl4SkhxH2ffbn5TZUdO4DyA9HNyp3
   nb84PWhnYB+MQRT3ykK0Pvgcs6jnLJN68VBZeL/hAIn4Fwv5IRXJaQY+0
   gXMGYudxmUfOVOOGfTbuzGu6Lb2sQnDsldtKNiIKOxWqHufNl8SOT3aoA
   MpF6k8K+i2BXTc7lvP/FBJmK2straKQnJeuG6EwMitWNjuxlI7BdpxkL3
   Q==;
X-CSE-ConnectionGUID: jxSEPVysQOS2PZ8rHE5w4w==
X-CSE-MsgGUID: /PB1qofhSZyiDuQimSIo7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39447707"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="39447707"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 21:08:56 -0700
X-CSE-ConnectionGUID: PKa/OiZmTN+ozk//EX4yYQ==
X-CSE-MsgGUID: F5UPqVliSHuFEzakf/HNbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="64168148"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 21:08:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seRnA-0003As-1Q;
	Thu, 15 Aug 2024 04:08:52 +0000
Date: Thu, 15 Aug 2024 12:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 5/5] block: implement io_uring discard cmd
Message-ID: <202408151106.qm0NcKPZ-lkp@intel.com>
References: <6ecd7ab3386f63f1656dc766c1b5b038ff5353c2.1723601134.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ecd7ab3386f63f1656dc766c1b5b038ff5353c2.1723601134.git.asml.silence@gmail.com>

Hi Pavel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Begunkov/io_uring-cmd-expose-iowq-to-cmds/20240814-224344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/6ecd7ab3386f63f1656dc766c1b5b038ff5353c2.1723601134.git.asml.silence%40gmail.com
patch subject: [RFC 5/5] block: implement io_uring discard cmd
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240815/202408151106.qm0NcKPZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151106.qm0NcKPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151106.qm0NcKPZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> or1k-linux-ld: block/fops.o:(.rodata+0x90): undefined reference to `blkdev_uring_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
