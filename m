Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FEF3CAE9B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 05:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785906096; cv=none; b=UYH8SqK24FWQGSW4veekVvgLas4Zxr8DyXhEa039pmuUmqaThuWelJ3NWrrQBtM1kCT9JuH0pdXVYXWHf3I2DouaWbwK2GQ689IQCEecfhHfJW72gIkRup7XtPHYD2Vp/y/MrJjfAYoA9R6LQOGUvIOBVEXLaPk6ZBouRzTP4+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785906096; c=relaxed/simple;
	bh=0hyzE+nMpJqVenIOIKcFfFYqWCUe3o50WG/11fX85+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdCYjPT+VfQQ2ATfgFDPlUtJHsWFNbCvXiyzRDThjQuAc8JULR00IhyYblXaVesyt1MUXAM9GwfGzJUMERvU0fiQzr83JgEIKwSzp9QuZ4cxzWPykpYt2HY+XJAziuFCX6p39WiLK7wr+wErZwti++d+T+nTqCBRGWJlR95z+d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSsMrK1n; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSsMrK1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785906091; x=1817442091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hyzE+nMpJqVenIOIKcFfFYqWCUe3o50WG/11fX85+w=;
  b=MSsMrK1nPThkkIHATvKQnXS18IfVNwpBDJ9knW5bbeNUYF7FoJVGCDQX
   P2uTsv2OluwXLZp09l1+C/4L3dQAc9efqizkTsOLfZP8iKhif8fCM/ywL
   O96ny/sfcfa0uwfB3H6Jt8ulD93VDI8Kkrrd+LPTvUYDZmz8Izog1HDyg
   7CqT3F08Z5BpCVuBlv2wH5xwEAiI+tkHtiW2h4xz2754/YC2rNm8VgjSf
   +zUnqol7tlCpGvVhIFna71CQ6jFEWOQlEdwmFNRBLO2rD1egz4oY4sCH/
   pSEpr19tcnA+6bCTEMX0WUmKDGYgfI/NHqMGWPWse2VSAXXHpVgg/7IXq
   w==;
X-CSE-ConnectionGUID: OjjTVzSgQo+mpVkjH1mJ9w==
X-CSE-MsgGUID: BkzLV4UxRXO6zBimFEMD0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86670770"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86670770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 22:01:30 -0700
X-CSE-ConnectionGUID: WWHqbFdIRZuHBrxqs2rfuA==
X-CSE-MsgGUID: v5AICPlRSNa3uSrnvB1HYg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2026 22:01:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrTkp-00000000BZt-3gbX;
	Wed, 05 Aug 2026 05:01:23 +0000
Date: Wed, 5 Aug 2026 13:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chenguang Zhao <chenguang.zhao@linux.dev>, leon@kernel.org,
	jgg@ziepe.ca, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, chenguang.zhao@linux.dev,
	Chenguang Zhao <zhaochenguang@kylinos.cn>
Subject: Re: [PATCH v2] RDMA/core: quiesce CQ polling before device shutdown
 on reboot
Message-ID: <202608051205.y2QczkvS-lkp@intel.com>
References: <20260714075558.1420384-1-chenguang.zhao@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714075558.1420384-1-chenguang.zhao@linux.dev>

Hi Chenguang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.2-rc6 next-20260804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chenguang-Zhao/RDMA-core-quiesce-CQ-polling-before-device-shutdown-on-reboot/20260805-044210
base:   linus/master
patch link:    https://lore.kernel.org/r/20260714075558.1420384-1-chenguang.zhao%40linux.dev
patch subject: [PATCH v2] RDMA/core: quiesce CQ polling before device shutdown on reboot
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608051205.y2QczkvS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051205.y2QczkvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051205.y2QczkvS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:23,
                    from drivers/net/ethernet/mellanox/mlx5/core/health.c:33:
   include/linux/mlx5/driver.h: In function 'mlx5_core_is_shutting_down':
   include/linux/mlx5/driver.h:661:65: error: invalid use of undefined type 'struct mlx5_core_dev'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                                                                 ^~
   include/linux/bitops.h:44:44: note: in definition of macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/mlx5/driver.h:661:16: note: in expansion of macro 'test_bit'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                ^~~~~~~~
   include/linux/mlx5/driver.h:661:65: error: invalid use of undefined type 'struct mlx5_core_dev'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                                                                 ^~
   include/linux/bitops.h:45:23: note: in definition of macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   include/linux/mlx5/driver.h:661:16: note: in expansion of macro 'test_bit'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                ^~~~~~~~
   include/linux/mlx5/driver.h:661:65: error: invalid use of undefined type 'struct mlx5_core_dev'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                                                                 ^~
   include/linux/bitops.h:46:57: note: in definition of macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   include/linux/mlx5/driver.h:661:16: note: in expansion of macro 'test_bit'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                ^~~~~~~~
   include/linux/mlx5/driver.h:661:65: error: invalid use of undefined type 'struct mlx5_core_dev'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                                                                 ^~
   include/linux/bitops.h:47:24: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/linux/mlx5/driver.h:661:16: note: in expansion of macro 'test_bit'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                ^~~~~~~~
   include/linux/mlx5/driver.h:661:65: error: invalid use of undefined type 'struct mlx5_core_dev'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                                                                 ^~
   include/linux/bitops.h:47:39: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   include/linux/mlx5/driver.h:661:16: note: in expansion of macro 'test_bit'
     661 |         return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
         |                ^~~~~~~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/health.c:37:
>> include/linux/mlx5/driver.h:662:1: warning: control reaches end of non-void function [-Wreturn-type]
     662 | }
         | ^


vim +662 include/linux/mlx5/driver.h

   658	
   659	static inline bool mlx5_core_is_shutting_down(struct mlx5_core_dev *dev)
   660	{
   661		return test_bit(MLX5_INTERFACE_STATE_SHUTTING_DOWN, &dev->intf_state);
 > 662	}
   663	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
