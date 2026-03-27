Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF8C38D681
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645107; cv=none; b=qhNO6cz+rgH+ieTZa6dlfTDdP7XKeW7usKXYRt2l+cv6kJbp1u7lzYF6uHuw/jWF97sjvLdw02j22Vs0Rfgit7gO9n2d3c/tV/5CqUEvluZlAlczbsqLCrFkcW0K6HxHCeyY0398tiBnJrRCkrdYsZRkYioi5zs3lc9erXqBUmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645107; c=relaxed/simple;
	bh=SQR0YyvvNKZ19ivSH0b+y9Tjg/QCeOc1Y/8TMEN1CZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRn5T345/JAWGL7N/PdTqtrUv8rmDEwQzPLfi3NWA7EH0NzRcb6v05z0xlLioKlwEP6HsPF6H1qebmYS1aSV4foFfrHMg6vd0DLV4Mc8CMpFSCAqqxL9CFUXeZfHYRLEkZd6+zLZbQ66CZPiv6nOauqWfoSQ5N+J6vPnGYVIczs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lD6nwNrx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lD6nwNrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774645106; x=1806181106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SQR0YyvvNKZ19ivSH0b+y9Tjg/QCeOc1Y/8TMEN1CZY=;
  b=lD6nwNrxz5fEkD/rjuOV/yxrAuQSTOwl4XbcnbF5GgdjSX38135XdgRt
   1jGaLB4w635yI3iSNpzbtuAf9BHn4pNucgulT8ZeDCbCJwDsQDQ8IG7mT
   egbC3bJcXw8F07ZXa5HNnwdJwTwy6JD6WPi8Y8GkPWQPUZGvJbGD7hd+J
   uPVZcBUMrb1YhQsX25g166hzCC1jHQCesDbv8nmHbpDehobPlHjAJVKYz
   GRoSZe8bH0je5cRr3EYc3UWJEWFXRbSDKAH7g/uucXr6DEKt9SetUFMs7
   U87VseAAnxkEcYgAVNkHHEbaaHlFXpYugF+IMjL/1gmNw+Yz0BDn2gyyw
   w==;
X-CSE-ConnectionGUID: LZ9s4fwmRdGbQ448TesYNA==
X-CSE-MsgGUID: IThAgbsXRuS41lY58E53Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75439711"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75439711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:58:25 -0700
X-CSE-ConnectionGUID: UYhKLyDwTgG2QT2x7s+T8g==
X-CSE-MsgGUID: hT6cdgmqQ9CvuiYlrtr0LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="221023310"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2026 13:58:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6EG2-00000000Ak1-2ELz;
	Fri, 27 Mar 2026 20:58:18 +0000
Date: Sat, 28 Mar 2026 04:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 3/4] irqchip/ast2700-intc: Add KUnit tests for route
 resolution
Message-ID: <202603280415.xv0eHt8u-lkp@intel.com>
References: <20260326-irqchip-v3-3-366739f57acf@aspeedtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-irqchip-v3-3-366739f57acf@aspeedtech.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-interrupt-controller-Describe-AST2700-A2-hardware-instead-of-A0/20260327-190127
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260326-irqchip-v3-3-366739f57acf%40aspeedtech.com
patch subject: [PATCH v3 3/4] irqchip/ast2700-intc: Add KUnit tests for route resolution
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260328/202603280415.xv0eHt8u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280415.xv0eHt8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280415.xv0eHt8u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-ast2700-intc0-test.c: In function 'aspeed_intc0_resolve_route_c1i1o1mc0i2o1':
>> drivers/irqchip/irq-ast2700-intc0-test.c:351:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     351 | }
         | ^
   drivers/irqchip/irq-ast2700-intc0-test.c: In function 'aspeed_intc0_resolve_route_c1i2o2mc0i1o1':
   drivers/irqchip/irq-ast2700-intc0-test.c:292:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     292 | }
         | ^


vim +351 drivers/irqchip/irq-ast2700-intc0-test.c

   293	
   294	static void aspeed_intc0_resolve_route_c1i1o1mc0i2o1(struct kunit *test)
   295	{
   296		struct device_node intc0_node = {
   297			.fwnode = { .ops = &intc0_fwnode_ops },
   298		};
   299		struct aspeed_intc_interrupt_range c1ranges[] = {
   300			{
   301				.start = 0,
   302				.count = 1,
   303				.upstream = {
   304					.fwnode = &intc0_node.fwnode,
   305					.param_count = 1,
   306					.param = { 510 }
   307				}
   308			},
   309		};
   310		static const u32 c1outs[] = { 0 };
   311		struct aspeed_intc_interrupt_range resolved;
   312		struct aspeed_intc_interrupt_range intc0_ranges[] = {
   313			{
   314				.start = 192,
   315				.count = 1,
   316				.upstream = {
   317					.fwnode = NULL,
   318					.param_count = 0,
   319					.param = {0},
   320				}
   321			},
   322			{
   323				.start = 208,
   324				.count = 1,
   325				.upstream = {
   326					.fwnode = NULL,
   327					.param_count = 0,
   328					.param = {0},
   329				}
   330			}
   331		};
   332		struct aspeed_intc0 intc0 = {
   333			.ranges = {
   334				.ranges = intc0_ranges,
   335				.nranges = ARRAY_SIZE(intc0_ranges),
   336			}
   337		};
   338		const struct irq_domain c0domain = {
   339			.host_data = &intc0,
   340			.fwnode = &intc0_node.fwnode
   341		};
   342		int rc;
   343	
   344		rc = aspeed_intc0_resolve_route(&c0domain, ARRAY_SIZE(c1outs), c1outs,
   345						ARRAY_SIZE(c1ranges), c1ranges,
   346						&resolved);
   347		KUNIT_EXPECT_EQ(test, rc, 0);
   348		KUNIT_EXPECT_EQ(test, resolved.start, 0);
   349		KUNIT_EXPECT_EQ(test, resolved.count, 1);
   350		KUNIT_EXPECT_EQ(test, resolved.upstream.param[0], 510);
 > 351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
