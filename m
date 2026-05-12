Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDD9382F1A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611742; cv=none; b=VyDibHkU2DiAoaIxuH2Jt75d4A6dCHniZ83y7+DcBlgrbzjsE7MAT4mWmnj78zxnUFkCKcNeZaou85toog6X1uCXYHToICFJd6UEOqfKxur5kj1gbvAIEfIl7rG34xCU2cL/X46Nhbv/DJk3RUGYMTCEwEYsd3UDaBFLaUXui9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611742; c=relaxed/simple;
	bh=JDJIg36vmlzCtIsCMqupMO+AdKnTE+IOuPLQpd343tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S21wuIy7ugsqkmxbM3nsEUicxqIzRQL6/yFonReD9ObBk2BnM4E0s/l5zZ45XYNCq0/YxDM15ZctdSAMwOxRmlrnuLC1hfCHqMotZvTcShO0UFOIpxqxnVckCH/6Thd3w7EfXbKddwkmne7WfiqKypEDcuTB6j8wwmzpe8bo8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYusQ9Y5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYusQ9Y5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778611740; x=1810147740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JDJIg36vmlzCtIsCMqupMO+AdKnTE+IOuPLQpd343tU=;
  b=NYusQ9Y5fzi79hHSJ+weD4z4UYGBPWYaQF9YWXWNjPj/2rCcR+rDU/Dy
   dFWtP/DiTneUSbJR91ZQiXd/5IrKxq5pcwtVC03nCKALbrU0dPfd3hCV3
   ukE0RIIDFXZP4gr9eubpHHeTotIckftNGyN8MDKBGTLxQYIyxVy/SLWDI
   fLtq+Y0htma9ytjsyurvt6HnBQQkfFOapqJOy/146ZUFYKAV6n60zRgBy
   DZUAYqaQgKd2rFWIOIJ3HMTziInFVI5EnkpYsw2MNgDld9qljndl/nQhU
   7k/E47lkJ+7eF/l41sFX09g6x+ou16hoUIn72m4qH/3l74pYmJOI2RLrt
   g==;
X-CSE-ConnectionGUID: ptHg1O13QViQ0PUmouG3IA==
X-CSE-MsgGUID: APSp58UpTUS6kh3zCBF/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78674344"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="78674344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:48:59 -0700
X-CSE-ConnectionGUID: OXmhdwYAQZGxma+o8FT6dA==
X-CSE-MsgGUID: gIXF5nN8RwGeZRBldCDQ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="268190666"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 May 2026 11:48:57 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMsA2-000000002dZ-3vFc;
	Tue, 12 May 2026 18:48:54 +0000
Date: Wed, 13 May 2026 02:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: chalianis1@gmail.com, miquel.raynal@bootlin.com, srini@kernel.org,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Chali Anis <chalianis1@gmail.com>
Subject: Re: [PATCH] nvmem: layouts: onie-tlv: fix read_post_process
 assignment
Message-ID: <202605130223.sNRxfA5D-lkp@intel.com>
References: <20260512025715.50645-1-chalianis1@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512025715.50645-1-chalianis1@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chalianis1-gmail-com/nvmem-layouts-onie-tlv-fix-read_post_process-assignment/20260512-213659
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260512025715.50645-1-chalianis1%40gmail.com
patch subject: [PATCH] nvmem: layouts: onie-tlv: fix read_post_process assignment
config: s390-randconfig-r073-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130223.sNRxfA5D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130223.sNRxfA5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130223.sNRxfA5D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvmem/layouts/onie-tlv.c:127:26: error: incompatible function pointer types assigning to 'nvmem_cell_post_process_t' (aka 'int (*)(void *, const char *, int, unsigned int, void *, unsigned long)') from 'nvmem_cell_post_process_t (u8, u8 *)' (aka 'int (*(unsigned char, unsigned char *))(void *, const char *, int, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
     127 |                 cell.read_post_process = onie_tlv_read_cb;
         |                                        ^ ~~~~~~~~~~~~~~~~
   1 error generated.


vim +127 drivers/nvmem/layouts/onie-tlv.c

    97	
    98	static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
    99				      size_t data_len, u8 *data)
   100	{
   101		struct nvmem_cell_info cell = {};
   102		struct device_node *layout;
   103		struct onie_tlv tlv;
   104		unsigned int hdr_len = sizeof(struct onie_tlv_hdr);
   105		unsigned int offset = 0;
   106		int ret;
   107	
   108		layout = of_nvmem_layout_get_container(nvmem);
   109		if (!layout)
   110			return -ENOENT;
   111	
   112		while (offset < data_len) {
   113			memcpy(&tlv, data + offset, sizeof(tlv));
   114			if (offset + tlv.len >= data_len) {
   115				dev_err(dev, "Out of bounds field (0x%x bytes at 0x%x)\n",
   116					tlv.len, hdr_len + offset);
   117				break;
   118			}
   119	
   120			cell.name = onie_tlv_cell_name(tlv.type);
   121			if (!cell.name)
   122				continue;
   123	
   124			cell.offset = hdr_len + offset + sizeof(tlv.type) + sizeof(tlv.len);
   125			cell.bytes = tlv.len;
   126			cell.np = of_get_child_by_name(layout, cell.name);
 > 127			cell.read_post_process = onie_tlv_read_cb;
   128	
   129			ret = nvmem_add_one_cell(nvmem, &cell);
   130			if (ret) {
   131				of_node_put(layout);
   132				return ret;
   133			}
   134	
   135			offset += sizeof(tlv) + tlv.len;
   136		}
   137	
   138		of_node_put(layout);
   139	
   140		return 0;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
