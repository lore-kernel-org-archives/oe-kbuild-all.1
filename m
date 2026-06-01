Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DC8237713
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304914; cv=none; b=usPY5X0+G/BQIz1ymKZCki2sM2VORL1zec5ODW36dTvH0YbkBVyAlDfUxCkLb/lFjC5JTFhuvnB73l99mq0/J4uoaxEjr4XUspSFQIKi5YzYEZ88PUgt9D4Cd87CDZk833YCd6e8KpMlGBA8+NbASuz/YzxdCbGE52j/Pgv4Uoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304914; c=relaxed/simple;
	bh=YOjcHbPPuiEVS8/2pIRKPAsAMDUAyVw4ivs0jCjI3QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMKtbSUF1F9A8myUfFiipgEkQ24ACfWKo5RcCMEquJkL+wz0lJ0rGtNHkZHAcZtN1ahrzBeMLNQpvMEvLYJFoZhRFff9hLQJ/jifkRzJUwHX5PVBOdS7GCCagt4kV3+7ogiyL5/pAA3XFqlJTdyrQhwohqS/4A/EdoRvob3SZdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=mgxtMgsp; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="mgxtMgsp"
Received: by linux.microsoft.com (Postfix, from userid 1173)
	id 925DC20B7166; Mon,  1 Jun 2026 02:08:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 925DC20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1780304894;
	bh=LyOQ9pXJyYGsO3JKnIuvfT5lYsTE9+zgjF/TM0Z0pJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgxtMgspeBHhGFgcKN+Gav4VaYtxHORMs78zzec29Fa9M+bDdIDR9vjxg6EhsZpw3
	 j7kG0J9aHGbAhnjg7D0HSww2NERXQKIj4HAzsNxUlWlFb0mBB3cAgeoQma0OI1Zjcg
	 ZKstdnPfcgzizajn/9voAW/nBdW/hPnc1WdahyAg=
Date: Mon, 1 Jun 2026 02:08:14 -0700
From: Erni Sri Satya Vennela <ernis@linux.microsoft.com>
To: kernel test robot <lkp@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-next v4] RDMA: Change capability fields in
 ib_device_attr from int to u32
Message-ID: <ah1L/geUw1KijSCA@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260526194225.1338210-1-ernis@linux.microsoft.com>
 <202605290321.lRxnXfw4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605290321.lRxnXfw4-lkp@intel.com>

On Fri, May 29, 2026 at 03:16:24AM +0800, kernel test robot wrote:
> Hi Erni,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on rdma/for-next]
> [also build test ERROR on linus/master v7.1-rc5 next-20260528]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Erni-Sri-Satya-Vennela/RDMA-Change-capability-fields-in-ib_device_attr-from-int-to-u32/20260527-040218
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
> patch link:    https://lore.kernel.org/r/20260526194225.1338210-1-ernis%40linux.microsoft.com
> patch subject: [PATCH rdma-next v4] RDMA: Change capability fields in ib_device_attr from int to u32
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260529/202605290321.lRxnXfw4-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290321.lRxnXfw4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605290321.lRxnXfw4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    drivers/infiniband/hw/qedr/verbs.c: In function 'qedr_query_device':
> >> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_818' declared with attribute error: min(1 << (fls(qattr->max_qp_resp_rd_atomic_resc) - 1), attr->max_qp_init_rd_atom) signedness error
>      699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
>      680 |                         prefix ## suffix();                             \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
>      699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>       40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>       93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
>          |         ^~~~~~~~~~~~~~~~
>    include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
>       98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>          |         ^~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
>      105 | #define min(x, y)       __careful_cmp(min, x, y)
>          |                         ^~~~~~~~~~~~~
>    drivers/infiniband/hw/qedr/verbs.c:146:13: note: in expansion of macro 'min'
>      146 |             min(1 << (fls(qattr->max_qp_resp_rd_atomic_resc) - 1),
>          |             ^~~
> --
>    In file included from <command-line>:
>    verbs.c: In function 'qedr_query_device':
> >> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_818' declared with attribute error: min(1 << (fls(qattr->max_qp_resp_rd_atomic_resc) - 1), attr->max_qp_init_rd_atom) signedness error
>      699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
>      680 |                         prefix ## suffix();                             \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
>      699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>       40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>       93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
>          |         ^~~~~~~~~~~~~~~~
>    include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
>       98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>          |         ^~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
>      105 | #define min(x, y)       __careful_cmp(min, x, y)
>          |                         ^~~~~~~~~~~~~
>    verbs.c:146:13: note: in expansion of macro 'min'
>      146 |             min(1 << (fls(qattr->max_qp_resp_rd_atomic_resc) - 1),
>          |             ^~~
> 
> 
> vim +/__compiletime_assert_818 +699 include/linux/compiler_types.h
> 
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  /**
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   *
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   * compiler has support to do so.
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   */
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  700  
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
I will fix this in the next version.

Thanks,
Vennela
