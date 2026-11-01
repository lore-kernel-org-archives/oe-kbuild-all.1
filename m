Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554462;
	b=oZscKTtSqB1tzfs0ioVD4BtSy4gG+/4Htxp5oLWvu4c4uQ8sxRamVp3hvcqpDvrnIIXE
	 Dm7ib2dtsPZEGzr1/h2y2G8QL2mH/a4ziKBZuSTS5dnpcwZZMx3nSGCJodr2v1VnO4vUc
	 QNXbT40tG0GjWw+74F+pHIPME5EPYlBV17bwPjbCZtJ0FJbL6utC3fHdsr6rbzeqjVN33
	 Nf+4dY/2QqZ5Fx79RCoRa0Av25lMr3biMNsp0IKL4lGa/xFc4cAVAeKIpqwfga5uM3xh4
	 1pS89hi9ddMAYe4LuSSVFNq2H0Osd5MvM5gEXbQZPzhB9oiXuir7grrAABK9ClGpYJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554462;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Bzyt/Zjt/PrED3A/5hMd8u5nb9gbkzJjUt4D3ILBe44=;
	b=HUgjQXW7Jpnt+7iBBs+UwKXxVfayZmNdFgg0Act4FuNOtqMOE0b8kjvEC7TuIihStRef
	 jG6IleazHP6Xv0kIJH/zbaCQzj/62EC4/swI904diPMKyesBVvydm9IrDohB4t1GPOPDD
	 ggJMXA+JbSo+WiSnmEIlN6E17hSwvUTbS1Nh57figFKISdeK1RN/T9pcbkeVhDI1RjPY4
	 yjfNrQjyhtxaZsRVb1OZBT/zlIOD2VXqEJSRwbugYhoZRfjHuuB6J5zRn9zqmUrj2xPtl
	 Efmy4J+NoVizv6I9ujKOUiGN8soR8EtjkWC2kWSeYz5ea9baJ0wQIrscWyVkiJUcisQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jp5ASTrx;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D86606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 17:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D86606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jp5ASTrx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793554462; x=1825090462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zUnwh1Z3Oj0D57fe2N23AW6VbT3XSxD+Z7zUCaHBVSo=;
  b=jp5ASTrxaZCi2CWi53z7Di5i0q8xvWU9Tea3qJtVFkNu/cgSTre1LZpG
   bDrqQFm+84M/HBeQ46/QUajrqPqtjKg9g9ub2AMMfPuy/TLIbvGuYxWW6
   TFiRwwFcdoCgWlnThtL3ReqkKnInVsW+mOFl+btXoczAQ+2KZq21d3N8z
   8GHux4i3foZtGD5juYIJaG8Rie0jtLUaYc+qCA91w6TcUtJ3LBAdVLjjw
   AhIPTof7oPn/76mxN7sav07d78TpDdb4HIk4OMJjW0k+7l7GsZP8M3tiJ
   Nace7r2DJxDvbIbyTYCEEdyqIcoCc0lJnXvEBetwAWys2x2Q6RNsarkL0
   w==;
X-CSE-ConnectionGUID: hzU02AoeQueD8SfSNoKbAA==
X-CSE-MsgGUID: Jy2pVaE6Q0uevXDQS1TqhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2125938"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2125938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 09:34:21 -0800
X-CSE-ConnectionGUID: gpl4fR/NSwSZrN386K/54Q==
X-CSE-MsgGUID: smk97tWlSIKXi70eDuVm0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6044293"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2026 09:34:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNZRb-00000000eay-1QkX;
	Sun, 01 Nov 2026 17:34:11 +0000
Date: Mon, 2 Nov 2026 01:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Xinchen <caixinchen1@huawei.com>, mic@digikod.net,
	gnoack@google.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, corbet@lwn.net, skhan@linuxfoundation.org,
	utilityemal77@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
	rdunlap@infradead.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, johan@kernel.org,
	dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk,
	viro@zeniv.linux.org.uk, brauner@kernel.org
Subject: Re: [PATCH v3 -next 09/18] LSM: rename inode_getattr to path_getattr
 and pass struct file
Message-ID: <202611020103.YCFAreL6-lkp@intel.com>
References: <20261027121151.1887650-10-caixinchen1@huawei.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027121151.1887650-10-caixinchen1@huawei.com>

Hi Cai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20261026]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Xinchen/fs-pass-struct-path-to-notify_change/20261027-201134
base:   next-20261026
patch link:    https://lore.kernel.org/r/20261027121151.1887650-10-caixinchen1%40huawei.com
patch subject: [PATCH v3 -next 09/18] LSM: rename inode_getattr to path_getattr and pass struct file
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261102/202611020103.YCFAreL6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020103.YCFAreL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611020103.YCFAreL6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/tomoyo/tomoyo.c:122 function parameter 'file' not described in 'tomoyo_path_getattr'
>> Warning: security/tomoyo/tomoyo.c:122 function parameter 'file' not described in 'tomoyo_path_getattr'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
