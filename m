Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9751A3C463
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724081335; cv=none; b=DnLFNAoOq+h3pWkBDry+c7HA3brua759WtplHEcJ2s1pk58zr9jsHggfdEhnJ8M/f6J6/3oo5P10oKQZS4mYcG5jyd/utxnejG3oem5XcZTsE9Gi89vxajY0ONn2TSbpTcd9p6RZCl31RmZmPHA/ABTyJlXZTGHac74mKc5YCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724081335; c=relaxed/simple;
	bh=I+/UT1olTGSkvbiVyjjw4uFqCudbOKfjOI1VeyWZTAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPNUKdjI0QT8HVC0phVjDphGCg3k2fTfDF+HcDA8Nxk2PSP6Wo2S0X/gLrNnuaMMgf8YwlcnW9HHcoZig/dRPMETre0z87x8RNjFvO55wL0El0KIdQd/jL9Yw9nZ6xwKGo06xZGnWWVZxTKJj+ki0km6WCkMftXSNP7RN7rTt7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZf96PwJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZf96PwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724081333; x=1755617333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+/UT1olTGSkvbiVyjjw4uFqCudbOKfjOI1VeyWZTAw=;
  b=fZf96PwJzhGiWURz2wodlkCuh+kpf4jHYPb2OS/w5FS8EjwTbIGUFRnC
   dX637+IoKdZXZ7E9nVOfYTu5yBsINT29lGJKrCAzd6CYfjdSznh1+SAb/
   Kph5sMYSaJnABp8z1PtUlIMT6XxiPBNTXyP0XWPLt46K5vgCqpOx3G1ZX
   jNQZNQb2zOWt+Sk1sLj9UzrA07+k1prN+bgsKS7R70Bwh2jqtAubD0YPF
   wUPiz5tRtxHiXraVKShZmrnjuhsgj86DONiGV8tIjlrxeIHTzleBXAB0K
   HNAyPZmEApuigxX1dg2gfZ+jqMl/oaRtTBxgLcYdvh7mGqCg9ATRyBr82
   A==;
X-CSE-ConnectionGUID: 5foIKNnbR2C2eTGWu715OA==
X-CSE-MsgGUID: CPGprIihS929vC7nkv67fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22220508"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22220508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 08:28:53 -0700
X-CSE-ConnectionGUID: PW1DYPY+RiyaSVjJm8L5vg==
X-CSE-MsgGUID: +BYVAJ/nRKmj1g1pxVmTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="97880937"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2024 08:28:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg4JK-00097m-1F;
	Mon, 19 Aug 2024 15:28:46 +0000
Date: Mon, 19 Aug 2024 23:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, brendan.higgins@linux.dev,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <202408192327.nZeNynmO-lkp@intel.com>
References: <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819092850.1590758-3-ryan_chen@aspeedtech.com>

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc4 next-20240819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20240819-173106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240819092850.1590758-3-ryan_chen%40aspeedtech.com
patch subject: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240819/202408192327.nZeNynmO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408192327.nZeNynmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408192327.nZeNynmO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_setup_buff_tx':
>> drivers/i2c/busses/i2c-ast2600.c:442:46: error: implicit declaration of function 'get_unaligned_le32' [-Wimplicit-function-declaration]
     442 |                                 wbuf_dword = get_unaligned_le32(wbuf);
         |                                              ^~~~~~~~~~~~~~~~~~


vim +/get_unaligned_le32 +442 drivers/i2c/busses/i2c-ast2600.c

   411	
   412	static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
   413	{
   414		struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
   415		u32 wbuf_dword;
   416		int xfer_len;
   417		u8 wbuf[4];
   418		int i;
   419	
   420		cmd |= AST2600_I2CM_PKT_EN;
   421		xfer_len = msg->len - i2c_bus->master_xfer_cnt;
   422		if (xfer_len > i2c_bus->buf_size) {
   423			xfer_len = i2c_bus->buf_size;
   424		} else {
   425			if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
   426				cmd |= AST2600_I2CM_STOP_CMD;
   427		}
   428	
   429		if (cmd & AST2600_I2CM_START_CMD)
   430			cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
   431	
   432		if (xfer_len) {
   433			cmd |= AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
   434			/*
   435			 * The controller's buffer register supports dword writes only.
   436			 * Therefore, write dwords to the buffer register in a 4-byte aligned,
   437			 * and write the remaining unaligned data at the end.
   438			 */
   439			for (i = 0; i < xfer_len; i++) {
   440				wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
   441				if ((i % 4) == 3 || i == xfer_len - 1) {
 > 442					wbuf_dword = get_unaligned_le32(wbuf);
   443					writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
   444				}
   445			}
   446	
   447			writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
   448			       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
   449		}
   450	
   451		writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   452	
   453		return 0;
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
