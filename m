Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577752170B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729807711; cv=none; b=qxDJkazPnhnflnqADbSKKNeaj2vsSbRxyLyiuCzxskm50YP4xBcjO0Typbv4CMVOcm/13S1FvHhJeVvOd09SAElynJuMcJqu6tQLsoZ3/VeRUwn91NEHgMLvu1kC8CycndVBaZAIzxajs0V8kelWYaVIzMqNQDbquaCTqeafF7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729807711; c=relaxed/simple;
	bh=3OKojh35VQhn3F/xQHnvC/XOGg8xwD8zmYLqdtwxP9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX3CESpFOV2LcbzLTOlBKAkMuuF0OA9MQx+3p3MGzSPXaOhlH4Qo09AaSYqvjHT3bxLShku/EMJ4hvjJGRCZYG28OTndB9IkaHjDrXCwkSN2b01wZHU5Ca6r4jm5LZ5hadG21xpsvfxdObO5jU9uazslJ+3uSgh3ZJo+6ZTvzGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLbvFB1/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLbvFB1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729807708; x=1761343708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3OKojh35VQhn3F/xQHnvC/XOGg8xwD8zmYLqdtwxP9w=;
  b=VLbvFB1/WPQOGCBnfbhXR1GCERhr8hR8HbrIDSn33kv9qGRLfcQxczv4
   QtakBrMstKK0wonQzVOjRdDWiS+5f+ZGX6UPX2ajZUA4BrcKnH01Cza47
   Nbdfzmujg7HZYjkxsh1NqhMmfEUl5xpFzyPAp1V9y/uLdILPatmNK+VNk
   /QJiIxfM95X+Obq+9+ozHjMO8EBiq4X1PSYBII8ZhEdNMUNBsxVKsQ6S0
   X5GNwWESbMpeuVPeSbir7HIxU80s7/sfTBzl64PlCnrdAu9fYjiczTLFL
   s2MpZzTwV3bLvxXmsTfUSdu8PF18tlNJuspM38ezwI0fMAArFw5hR4BaA
   Q==;
X-CSE-ConnectionGUID: qgdQ+zFCS0WkBbK7TSXsiQ==
X-CSE-MsgGUID: 5PICTo35Tg+Yg+4pMARxvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33269181"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="33269181"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 15:08:25 -0700
X-CSE-ConnectionGUID: sBVEn1FnQKqpBCKjyZXrvQ==
X-CSE-MsgGUID: lkc4Tid4SHKzAutQLibRrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="85272832"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 15:08:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t460E-000XCL-1N;
	Thu, 24 Oct 2024 22:08:22 +0000
Date: Fri, 25 Oct 2024 06:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/3] crypto: Add Mediatek EIP-93 crypto engine
 support
Message-ID: <202410250502.61am6IgF-lkp@intel.com>
References: <20241021145642.16368-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021145642.16368-3-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master tip/locking/core robh/for-next linus/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-crypto-Add-Inside-Secure-SafeXcel-EIP-93-crypto-engine/20241021-230034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241021145642.16368-3-ansuelsmth%40gmail.com
patch subject: [RFC PATCH v3 3/3] crypto: Add Mediatek EIP-93 crypto engine support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410250502.61am6IgF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250502.61am6IgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250502.61am6IgF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/crypto/inside-secure/eip93/eip93-main.c: In function 'eip93_handle_result_descriptor':
>> drivers/crypto/inside-secure/eip93/eip93-main.c:210:26: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     210 |                 } while (FIELD_GET(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN, pe_ctrl_stat) !=
         |                          ^~~~~~~~~
   In file included from drivers/crypto/inside-secure/eip93/eip93-main.h:18,
                    from drivers/crypto/inside-secure/eip93/eip93-main.c:21:
   drivers/crypto/inside-secure/eip93/eip93-main.c: In function 'eip93_initialize':
>> drivers/crypto/inside-secure/eip93/eip93-regs.h:102:49: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     102 | #define   EIP93_PE_TARGET_AUTO_RING_MODE        FIELD_PREP(EIP93_PE_CONFIG_PE_MODE, 0x3)
         |                                                 ^~~~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:293:16: note: in expansion of macro 'EIP93_PE_TARGET_AUTO_RING_MODE'
     293 |         val |= EIP93_PE_TARGET_AUTO_RING_MODE;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from drivers/crypto/inside-secure/eip93/eip93-main.c:12:
   drivers/crypto/inside-secure/eip93/eip93-main.c: In function 'eip93_crypto_probe':
>> drivers/crypto/inside-secure/eip93/eip93-main.c:459:28: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:9: note: in expansion of macro 'dev_info'
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |         ^~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:34: note: format string is defined here
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                                ~~^
         |                                  |
         |                                  long unsigned int
         |                                %u
>> drivers/crypto/inside-secure/eip93/eip93-main.c:459:28: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'int' [-Wformat=]
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:9: note: in expansion of macro 'dev_info'
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |         ^~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:38: note: format string is defined here
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                                    ~~^
         |                                      |
         |                                      long unsigned int
         |                                    %x
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:28: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'int' [-Wformat=]
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:9: note: in expansion of macro 'dev_info'
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |         ^~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:42: note: format string is defined here
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                                        ~~^
         |                                          |
         |                                          long unsigned int
         |                                        %x
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:28: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'int' [-Wformat=]
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:9: note: in expansion of macro 'dev_info'
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |         ^~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:459:46: note: format string is defined here
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                                            ~~^
         |                                              |
         |                                              long unsigned int
         |                                            %x
--
   drivers/crypto/inside-secure/eip93/eip93-common.c: In function 'eip93_parse_ctrl_stat_err':
>> drivers/crypto/inside-secure/eip93/eip93-common.c:47:19: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      47 |         ext_err = FIELD_GET(EIP93_PE_CTRL_PE_EXT_ERR_CODE, err);
         |                   ^~~~~~~~~
   In file included from drivers/crypto/inside-secure/eip93/eip93-main.h:18,
                    from drivers/crypto/inside-secure/eip93/eip93-cipher.h:11,
                    from drivers/crypto/inside-secure/eip93/eip93-common.c:19:
   drivers/crypto/inside-secure/eip93/eip93-common.c: In function 'eip93_set_sa_record':
   drivers/crypto/inside-secure/eip93/eip93-regs.h:207:49: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     207 | #define   EIP93_SA_CMD_IV_FROM_STATE            FIELD_PREP(EIP93_SA_CMD_IV_SOURCE, 0x2)
         |                                                 ^~~~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-common.c:302:36: note: in expansion of macro 'EIP93_SA_CMD_IV_FROM_STATE'
     302 |         sa_record->sa_cmd0_word |= EIP93_SA_CMD_IV_FROM_STATE;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/crypto/inside-secure/eip93/eip93-aead.c: In function 'eip93_aead_setkey':
>> drivers/crypto/inside-secure/eip93/eip93-aead.c:132:36: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     132 |         sa_record->sa_cmd0_word |= FIELD_PREP(EIP93_SA_CMD_OPCODE,
         |                                    ^~~~~~~~~~


vim +/FIELD_GET +210 drivers/crypto/inside-secure/eip93/eip93-main.c

   174	
   175	static void eip93_handle_result_descriptor(struct eip93_device *mtk)
   176	{
   177		struct crypto_async_request *async;
   178		struct eip93_descriptor *rdesc;
   179		u16 desc_flags, crypto_idr;
   180		bool last_entry;
   181		int handled, left, err;
   182		u32 pe_ctrl_stat;
   183		u32 pe_length;
   184	
   185	get_more:
   186		handled = 0;
   187	
   188		left = readl(mtk->base + EIP93_REG_PE_RD_COUNT) & EIP93_PE_RD_COUNT;
   189	
   190		if (!left) {
   191			eip93_irq_clear(mtk, EIP93_INT_RDR_THRESH);
   192			eip93_irq_enable(mtk, EIP93_INT_RDR_THRESH);
   193			return;
   194		}
   195	
   196		last_entry = false;
   197	
   198		while (left) {
   199			rdesc = eip93_get_descriptor(mtk);
   200			if (IS_ERR(rdesc)) {
   201				dev_err(mtk->dev, "Ndesc: %d nreq: %d\n",
   202					handled, left);
   203				err = -EIO;
   204				break;
   205			}
   206			/* make sure DMA is finished writing */
   207			do {
   208				pe_ctrl_stat = READ_ONCE(rdesc->pe_ctrl_stat_word);
   209				pe_length = READ_ONCE(rdesc->pe_length_word);
 > 210			} while (FIELD_GET(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN, pe_ctrl_stat) !=
   211				 EIP93_PE_CTRL_PE_READY ||
   212				 FIELD_GET(EIP93_PE_LENGTH_HOST_PE_READY, pe_length) !=
   213				 EIP93_PE_LENGTH_PE_READY);
   214	
   215			err = rdesc->pe_ctrl_stat_word & (EIP93_PE_CTRL_PE_EXT_ERR_CODE |
   216							  EIP93_PE_CTRL_PE_EXT_ERR |
   217							  EIP93_PE_CTRL_PE_SEQNUM_ERR |
   218							  EIP93_PE_CTRL_PE_PAD_ERR |
   219							  EIP93_PE_CTRL_PE_AUTH_ERR);
   220	
   221			desc_flags = FIELD_GET(EIP93_PE_USER_ID_DESC_FLAGS, rdesc->user_id);
   222			crypto_idr = FIELD_GET(EIP93_PE_USER_ID_CRYPTO_IDR, rdesc->user_id);
   223	
   224			writel(1, mtk->base + EIP93_REG_PE_RD_COUNT);
   225			eip93_irq_clear(mtk, EIP93_INT_RDR_THRESH);
   226	
   227			handled++;
   228			left--;
   229	
   230			if (desc_flags & EIP93_DESC_LAST) {
   231				last_entry = true;
   232				break;
   233			}
   234		}
   235	
   236		if (!last_entry)
   237			goto get_more;
   238	
   239		/* Get crypto async ref only for last descriptor */
   240		scoped_guard(spinlock_bh, &mtk->ring->idr_lock) {
   241			async = idr_find(&mtk->ring->crypto_async_idr, crypto_idr);
   242			idr_remove(&mtk->ring->crypto_async_idr, crypto_idr);
   243		}
   244	
   245		/* Parse error in ctrl stat word */
   246		err = eip93_parse_ctrl_stat_err(mtk, err);
   247	
   248		if (desc_flags & EIP93_DESC_SKCIPHER)
   249			eip93_skcipher_handle_result(async, err);
   250	
   251		if (desc_flags & EIP93_DESC_AEAD)
   252			eip93_aead_handle_result(async, err);
   253	
   254		if (desc_flags & EIP93_DESC_HASH)
   255			eip93_hash_handle_result(async, err);
   256	
   257		goto get_more;
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
