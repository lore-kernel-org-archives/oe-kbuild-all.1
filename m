Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49F7828D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710243755; cv=none; b=nAFMwSeRDMtLBZFMc4G3k0wOAVLSaD5W8MYOO9d2nolo9sE2lQXi5xGmI+8FvCEHJP0LVLeP8acjRjeTaZDGV78xozjB74zhk0bno4quZON/cOz1gSE6o45Ea9AOFfWkCuUBXD81l2gjtn6uvO5bU/VFC8Uriv07pCl8hw2kqAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710243755; c=relaxed/simple;
	bh=5g+Qo7SDw8So5y4i5EUNyCORXhV3EfQuuyfwPIyjn34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uySz3OH2B2bRAM/54GtPImTb+0gvBKjNw6At/vOerJ3PMuR00XtBaYPMM/+H5qynIcnheQpKUlRFhxHsXZ4Mbgn5VH8PqK9lfoApV9/jdtazRiffAvictyXFVwGXB+qAD3Z2uMEr0QQyrfqtr1UyjSrpw0pkrl4soJ/0Y6hiW8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O81BDZWx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O81BDZWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710243752; x=1741779752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5g+Qo7SDw8So5y4i5EUNyCORXhV3EfQuuyfwPIyjn34=;
  b=O81BDZWxy86Fyg50yoo17nUnAKuyrbPUki1CnPiyLtty6j88K61e+8WD
   dNzdxXEEV3IoSHEdD7gfRUSNRw2GbG4cOLHTNiLuWmjq/i6hxm2p0sBu1
   xD7f/8KLGBRYvkbi8sezBOHhi2Z1BhU8K+i883xdFs+wSRrp7FvQhkxdI
   2CIS9WwZFX9QwhDVuWfYHsKrNODKRg7xIW67l7HZ+qGRFRS7xBIZLvQmI
   1WY7fdMw+OYHDAbc/s1GBm4tMnptQHMcTWB0WnTDSKXvwdn5o6ZK8nSB5
   g4zeCnuR3Nj0mnC6c7irgjGJKqY4w9Sc7nXZx32IB2fMzB5rxiPxrW+LG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4801342"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4801342"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 04:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="48955004"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2024 04:42:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk0WY-000A5L-2a;
	Tue, 12 Mar 2024 11:42:26 +0000
Date: Tue, 12 Mar 2024 19:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 4/5] net: integrate QUIC build configuration
 into Kconfig and Makefile
Message-ID: <202403121915.dlcScnXH-lkp@intel.com>
References: <f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin@gmail.com>

Hi Xin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/net-define-IPPROTO_QUIC-and-SOL_QUIC-constants-for-QUIC-protocol/20240312-002959
base:   net-next/main
patch link:    https://lore.kernel.org/r/f5678996612dc82c990da0dbceb19dcd062d97bd.1710173427.git.lucien.xin%40gmail.com
patch subject: [RFC PATCH net-next 4/5] net: integrate QUIC build configuration into Kconfig and Makefile
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240312/202403121915.dlcScnXH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121915.dlcScnXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121915.dlcScnXH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1345:9: note: in expansion of macro 'quic_frame_create_and_process'
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[0]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1345:9: note: in expansion of macro 'quic_frame_create_and_process'
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1345:9: note: in expansion of macro 'quic_frame_create_and_process'
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[0].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1345:9: note: in expansion of macro 'quic_frame_create_and_process'
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1345:9: note: in expansion of macro 'quic_frame_create_and_process'
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[0]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1345:9: note: in expansion of macro 'quic_frame_create_and_process'
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1345:9: note: in expansion of macro 'quic_frame_create_and_process'
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[0].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1345:9: note: in expansion of macro 'quic_frame_create_and_process'
    1345 |         quic_frame_create_and_process(padding), /* 0x00 */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1346:9: note: in expansion of macro 'quic_frame_create_and_process'
    1346 |         quic_frame_create_and_process(ping),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[1]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1346:9: note: in expansion of macro 'quic_frame_create_and_process'
    1346 |         quic_frame_create_and_process(ping),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1346:9: note: in expansion of macro 'quic_frame_create_and_process'
    1346 |         quic_frame_create_and_process(ping),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[1].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1346:9: note: in expansion of macro 'quic_frame_create_and_process'
    1346 |         quic_frame_create_and_process(ping),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1346:9: note: in expansion of macro 'quic_frame_create_and_process'
    1346 |         quic_frame_create_and_process(ping),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[1]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1346:9: note: in expansion of macro 'quic_frame_create_and_process'
    1346 |         quic_frame_create_and_process(ping),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1346:9: note: in expansion of macro 'quic_frame_create_and_process'
    1346 |         quic_frame_create_and_process(ping),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[1].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1346:9: note: in expansion of macro 'quic_frame_create_and_process'
    1346 |         quic_frame_create_and_process(ping),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1347:9: note: in expansion of macro 'quic_frame_create_and_process'
    1347 |         quic_frame_create_and_process(ack),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[2]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1347:9: note: in expansion of macro 'quic_frame_create_and_process'
    1347 |         quic_frame_create_and_process(ack),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1347:9: note: in expansion of macro 'quic_frame_create_and_process'
    1347 |         quic_frame_create_and_process(ack),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[2].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1347:9: note: in expansion of macro 'quic_frame_create_and_process'
    1347 |         quic_frame_create_and_process(ack),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1347:9: note: in expansion of macro 'quic_frame_create_and_process'
    1347 |         quic_frame_create_and_process(ack),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[2]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1347:9: note: in expansion of macro 'quic_frame_create_and_process'
    1347 |         quic_frame_create_and_process(ack),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1347:9: note: in expansion of macro 'quic_frame_create_and_process'
    1347 |         quic_frame_create_and_process(ack),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[2].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1347:9: note: in expansion of macro 'quic_frame_create_and_process'
    1347 |         quic_frame_create_and_process(ack),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1348:9: note: in expansion of macro 'quic_frame_create_and_process'
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[3]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1348:9: note: in expansion of macro 'quic_frame_create_and_process'
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1348:9: note: in expansion of macro 'quic_frame_create_and_process'
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[3].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1348:9: note: in expansion of macro 'quic_frame_create_and_process'
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1348:9: note: in expansion of macro 'quic_frame_create_and_process'
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[3]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1348:9: note: in expansion of macro 'quic_frame_create_and_process'
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1348:9: note: in expansion of macro 'quic_frame_create_and_process'
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[3].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1348:9: note: in expansion of macro 'quic_frame_create_and_process'
    1348 |         quic_frame_create_and_process(ack), /* ack_ecn */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1349:9: note: in expansion of macro 'quic_frame_create_and_process'
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[4]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1349:9: note: in expansion of macro 'quic_frame_create_and_process'
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1349:9: note: in expansion of macro 'quic_frame_create_and_process'
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[4].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1349:9: note: in expansion of macro 'quic_frame_create_and_process'
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1349:9: note: in expansion of macro 'quic_frame_create_and_process'
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[4]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1349:9: note: in expansion of macro 'quic_frame_create_and_process'
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1349:9: note: in expansion of macro 'quic_frame_create_and_process'
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[4].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1349:9: note: in expansion of macro 'quic_frame_create_and_process'
    1349 |         quic_frame_create_and_process(reset_stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1350:9: note: in expansion of macro 'quic_frame_create_and_process'
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[5]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1350:9: note: in expansion of macro 'quic_frame_create_and_process'
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1350:9: note: in expansion of macro 'quic_frame_create_and_process'
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[5].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1350:9: note: in expansion of macro 'quic_frame_create_and_process'
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1350:9: note: in expansion of macro 'quic_frame_create_and_process'
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[5]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1350:9: note: in expansion of macro 'quic_frame_create_and_process'
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1350:9: note: in expansion of macro 'quic_frame_create_and_process'
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[5].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1350:9: note: in expansion of macro 'quic_frame_create_and_process'
    1350 |         quic_frame_create_and_process(stop_sending),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1351:9: note: in expansion of macro 'quic_frame_create_and_process'
    1351 |         quic_frame_create_and_process(crypto),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[6]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1351:9: note: in expansion of macro 'quic_frame_create_and_process'
    1351 |         quic_frame_create_and_process(crypto),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1351:9: note: in expansion of macro 'quic_frame_create_and_process'
    1351 |         quic_frame_create_and_process(crypto),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[6].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1351:9: note: in expansion of macro 'quic_frame_create_and_process'
    1351 |         quic_frame_create_and_process(crypto),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1351:9: note: in expansion of macro 'quic_frame_create_and_process'
    1351 |         quic_frame_create_and_process(crypto),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[6]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1351:9: note: in expansion of macro 'quic_frame_create_and_process'
    1351 |         quic_frame_create_and_process(crypto),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1351:9: note: in expansion of macro 'quic_frame_create_and_process'
    1351 |         quic_frame_create_and_process(crypto),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[6].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1351:9: note: in expansion of macro 'quic_frame_create_and_process'
    1351 |         quic_frame_create_and_process(crypto),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1352:9: note: in expansion of macro 'quic_frame_create_and_process'
    1352 |         quic_frame_create_and_process(new_token),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[7]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1352:9: note: in expansion of macro 'quic_frame_create_and_process'
    1352 |         quic_frame_create_and_process(new_token),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1352:9: note: in expansion of macro 'quic_frame_create_and_process'
    1352 |         quic_frame_create_and_process(new_token),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[7].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1352:9: note: in expansion of macro 'quic_frame_create_and_process'
    1352 |         quic_frame_create_and_process(new_token),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1352:9: note: in expansion of macro 'quic_frame_create_and_process'
    1352 |         quic_frame_create_and_process(new_token),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[7]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1352:9: note: in expansion of macro 'quic_frame_create_and_process'
    1352 |         quic_frame_create_and_process(new_token),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1352:9: note: in expansion of macro 'quic_frame_create_and_process'
    1352 |         quic_frame_create_and_process(new_token),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[7].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1352:9: note: in expansion of macro 'quic_frame_create_and_process'
    1352 |         quic_frame_create_and_process(new_token),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1353:9: note: in expansion of macro 'quic_frame_create_and_process'
    1353 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[8]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1353:9: note: in expansion of macro 'quic_frame_create_and_process'
    1353 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1353:9: note: in expansion of macro 'quic_frame_create_and_process'
    1353 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[8].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1353:9: note: in expansion of macro 'quic_frame_create_and_process'
    1353 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1353:9: note: in expansion of macro 'quic_frame_create_and_process'
    1353 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[8]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1353:9: note: in expansion of macro 'quic_frame_create_and_process'
    1353 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1353:9: note: in expansion of macro 'quic_frame_create_and_process'
    1353 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[8].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1353:9: note: in expansion of macro 'quic_frame_create_and_process'
    1353 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1354:9: note: in expansion of macro 'quic_frame_create_and_process'
    1354 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[9]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1354:9: note: in expansion of macro 'quic_frame_create_and_process'
    1354 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1354:9: note: in expansion of macro 'quic_frame_create_and_process'
    1354 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[9].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1354:9: note: in expansion of macro 'quic_frame_create_and_process'
    1354 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1354:9: note: in expansion of macro 'quic_frame_create_and_process'
    1354 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[9]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1354:9: note: in expansion of macro 'quic_frame_create_and_process'
    1354 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1354:9: note: in expansion of macro 'quic_frame_create_and_process'
    1354 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[9].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1354:9: note: in expansion of macro 'quic_frame_create_and_process'
    1354 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1355:9: note: in expansion of macro 'quic_frame_create_and_process'
    1355 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[10]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1355:9: note: in expansion of macro 'quic_frame_create_and_process'
    1355 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1355:9: note: in expansion of macro 'quic_frame_create_and_process'
    1355 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[10].<anonymous>')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1355:9: note: in expansion of macro 'quic_frame_create_and_process'
    1355 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1355:9: note: in expansion of macro 'quic_frame_create_and_process'
    1355 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[10]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1355:9: note: in expansion of macro 'quic_frame_create_and_process'
    1355 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: error: initialization of 'struct sk_buff * (*)(struct sock *, void *, u8)' {aka 'struct sk_buff * (*)(struct sock *, void *, unsigned char)'} from incompatible pointer type 'int (*)(struct sock *, struct sk_buff *, u8)' {aka 'int (*)(struct sock *, struct sk_buff *, unsigned char)'} [-Werror=incompatible-pointer-types]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1355:9: note: in expansion of macro 'quic_frame_create_and_process'
    1355 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:38: note: (near initialization for 'quic_frame_ops[10].frame_create')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |                                      ^~~~~~~~~~~
   net/quic/frame.c:1355:9: note: in expansion of macro 'quic_frame_create_and_process'
    1355 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1356:9: note: in expansion of macro 'quic_frame_create_and_process'
    1356 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: note: (near initialization for 'quic_frame_ops[11]')
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1356:9: note: in expansion of macro 'quic_frame_create_and_process'
    1356 |         quic_frame_create_and_process(stream),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/quic/frame.c:1342:10: error: invalid initializer
    1342 |         {quic_frame_##type##_create, quic_frame_##type##_process}
         |          ^~~~~~~~~~~
   net/quic/frame.c:1356:9: note: in expansion of macro 'quic_frame_create_and_process'
    1356 |         quic_frame_create_and_process(stream),


vim +1342 net/quic/frame.c

b53fc4edb7faf3 Xin Long 2024-03-11  1340  
b53fc4edb7faf3 Xin Long 2024-03-11  1341  #define quic_frame_create_and_process(type) \
b53fc4edb7faf3 Xin Long 2024-03-11 @1342  	{quic_frame_##type##_create, quic_frame_##type##_process}
b53fc4edb7faf3 Xin Long 2024-03-11  1343  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
