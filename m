Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F53EDAB6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 22:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782943696; cv=none; b=ekOjWwnUJ8AB+A+umrQmlxjTnCxIEh7Akecy95ZRamlvjiyKtaqriy/1gFwj3zd0oD+Dvl6cvhd7rVZjDiCpIIGvUvUTcuFfEyeFAsQlDlt+OlsJ2p546aZKpPbvSP9bcQUyf7NyjIi8FAujJ1zXl/Ve9HaxplloPY6yVFFjjQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782943696; c=relaxed/simple;
	bh=iR8409j+70guVJtrTuc2FCAe5IjQNSvNW6GDIbSMP7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PCojNdoiu96lcfAG4HKqPCObmXW9ki7ZXtW3Li4SiVlFlDMCNtDjKsXH0vTnUrLiJILcbeChQm46wqy6vpC8K/X2fKZW6o2weDYjBIK8yWOVJpPltxV0F7Ykr4Rhqu1VL6Pdhb8hClrEG8OjpHRgBmsxRbkMfIRnnphVeg1phDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7Y04/aK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7Y04/aK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782943690; x=1814479690;
  h=date:from:to:cc:subject:message-id;
  bh=iR8409j+70guVJtrTuc2FCAe5IjQNSvNW6GDIbSMP7k=;
  b=J7Y04/aK/93Zf2o6wKvnJ8VPa4fDlO8CIv94Zl1AGS0zC4nsQAgG9rq4
   LSP9RMVBapLOCSOIUII4O4Ljbsh4gS9+P9XfAxBFEqP+Y9Oy5Kb+MfERO
   kolmWAgYa9of6NjtSdXkVmNkZNXeFG1ShZEG//IabbpI7TtC0bYhg58J2
   F+bkazVVjaUg5O/fZUQDE+RMv02v7ntEkaMTyFu4ldAt4JUnSSGmHXgoS
   eI0vfURhFKOoYde1NbWpQ+D4BfsfpUebmaobFkl9q2z63KnKotQy25gbo
   sgCs5gr3BPS2VSeUJzReytid15lHeD3xor93ItejxTQRIAhPnpBhe05IU
   g==;
X-CSE-ConnectionGUID: 14Sh9eCYSri+Z8QbTeYz2Q==
X-CSE-MsgGUID: S8JbOLxSS2GRgvqpSaFALA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94045244"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94045244"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:08:09 -0700
X-CSE-ConnectionGUID: YZICElB9QAa80hAEDhKZdA==
X-CSE-MsgGUID: cCtRZnVyT7K3WblwLeP+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="290803913"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Jul 2026 15:08:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf36C-000000009fp-1TSl;
	Wed, 01 Jul 2026 22:08:04 +0000
Date: Thu, 02 Jul 2026 06:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: include/linux/build_bug.h:78:41: error: static assertion
 failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct
 virtchnl2_rx_flex_desc_adv_nic_3)"
Message-ID: <202607020635.2BZNjQnq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   665159e246749578d4e4bfe106ee3b74edcdab18
commit: 88ca0c738c4159ce87893782b6dd964b5aa01f6e idpf: add XDP RSS hash hint
date:   10 months ago
config: arm-randconfig-r051-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020635.2BZNjQnq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020635.2BZNjQnq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 88ca0c738c41 ("idpf: add XDP RSS hash hint")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020635.2BZNjQnq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_lib.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct virtchnl2_rx_flex_desc_adv_nic_3)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/xdp.h:118:1: note: in expansion of macro 'static_assert'
     118 | static_assert(sizeof(struct idpf_xdp_rx_desc) ==
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
