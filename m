Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB02D29C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 19:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769197553; cv=none; b=SZUMN/MO3rIGD/Pth5HYiaZkT+awgx5n2BEoUcJiY79y9ISj9pCxAEZeX7yq/NpjHX/mEwgkUOy/MOnapCC1rujWOVN56p+aa4Dh97MQa8D+E3UWd/Pz1X8/4CdVMNa60T68Jqvkyt0HID8prjl35FYdmaEaaXvqOp3iYuKbaC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769197553; c=relaxed/simple;
	bh=JRlAl/Bfk4qmJuJ/EjK7xavGt4FNDKAnxLg8+uvxerg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOTz+I7QDMg8HdtwGUOIFz5MhS0iRgyWJ4USLt6anlpeorhhwWOyvTJHo4eCpob76uGXNv+dwiP3Mpv7vva4+ivg+I2Dcn8IRuLXOj0oo5npqh3Jxrsw6mPZxP5ecrwouvLS+jWVcFhkpUd7ekEoJ7Ev0GtpxymAoe6GNKnbQgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kv1HPG55; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kv1HPG55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769197550; x=1800733550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JRlAl/Bfk4qmJuJ/EjK7xavGt4FNDKAnxLg8+uvxerg=;
  b=Kv1HPG55nckSuLrO23vKtaG2jd23huy+J5wm9IUNTaSA8prcPHOJtbTY
   l9uiyeJeAc5JR16Dlad4+tRgV/t2nUhQ0CwXEOtMQMhp/Z0u+afJ+GWaL
   Ue+Y1UNljvyoux2nKbDNRDTeOcdb2gycFbvqTzUgoNbN6EO3q78KMoIMi
   HuDJ02ClK+FKGBN52s9+rrcMgGsj/aYk8OHdB+DgIA5FhRVqELo6cY870
   eSqzyx/6hR+y5akVF+kxmOfI3LUgI4IggEQ8MVA2hCyw03h8d2fw/+ocv
   ii9ZNb7YCTu9rRcpgAMwDaMM7Xy8HJZZyVgqaauS8jgs55z4ddZG7j2fL
   A==;
X-CSE-ConnectionGUID: mLcHSKL8Sb+ZYu3uONW27A==
X-CSE-MsgGUID: GP7LiA9tSSmRtrjowf4xAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70505817"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70505817"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 11:45:49 -0800
X-CSE-ConnectionGUID: gma40dXwRZaMjbnHH7NtgA==
X-CSE-MsgGUID: wFWNG/NOQ42ln5G8p59GkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211564224"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 11:45:48 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjN6H-000000000o5-40B8;
	Fri, 23 Jan 2026 19:45:45 +0000
Date: Fri, 23 Jan 2026 20:45:31 +0100
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v3 05/12] libbpf: introduce
 bpf_map__attach_struct_ops_opts()
Message-ID: <202601232002.VLM6oC5G-lkp@intel.com>
References: <03bf6aafe30def690c63e454d76e733f27dff4b3.1769157382.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03bf6aafe30def690c63e454d76e733f27dff4b3.1769157382.git.zhuhui@kylinos.cn>

Hi Hui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[cannot apply to akpm-mm/mm-everything bpf-next/net bpf/master linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/bpf-move-bpf_struct_ops_link-into-bpf-h/20260123-170445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/03bf6aafe30def690c63e454d76e733f27dff4b3.1769157382.git.zhuhui%40kylinos.cn
patch subject: [RFC PATCH bpf-next v3 05/12] libbpf: introduce bpf_map__attach_struct_ops_opts()
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260123/202601232002.VLM6oC5G-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601232002.VLM6oC5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232002.VLM6oC5G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Num of global symbols in tools/testing/selftests/hid/tools/build/host/libbpf/sharedobjs/libbpf-in.o (357) does NOT match with num of versioned symbols in tools/testing/selftests/hid/tools/build/host/libbpf/libbpf.so libbpf.map (356). Please make sure all LIBBPF_API symbols are versioned in libbpf.map.
   make[3]: *** [Makefile:179: check_abi] Error 1
   make[3]: Target 'all_cmd' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
