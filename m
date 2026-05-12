Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC8C2EC090
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 18:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609820; cv=none; b=Qc+0DXL3AKhADrF3JlDqNe9JyBnL8JLPgOhvpcZ0/f4lSQxxNMRsUhvz2MLo41ZUBES2L5+fTtndUeC46G0ha4BcF/Fra8swgl/ZM5/lKCXByJWUV1OZu7Y6i4mnEnEXExJklqQGjXr3ca8RR1tKwL94WihdeA5jkPxSEoQ7RhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609820; c=relaxed/simple;
	bh=1iccbtAqZZcwdZiQkb7nq0mWmcb2aFWAuiobN/rw3LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XihFwLvPK93lpywAEubpAh7w08671J5jsVqf4L7iYfNw83okaILt4yB/Qmh/IGJX9OSfqdosCwecO/DIlHm7in25vBs7nv8+yASK0aStJHD8Ep740EZsLj6lIMo+iBZKsmzfFOU5PaqhML6NVaFBA7nM203ZlffDHn8L3K8MloM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+UCCOQG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+UCCOQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778609818; x=1810145818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1iccbtAqZZcwdZiQkb7nq0mWmcb2aFWAuiobN/rw3LI=;
  b=n+UCCOQGXwqcQPkuwJq2PIwtIYaq27dj+fIxDZN8AnMWnzxftQ/YVw/9
   dHoh7HMqzzBaddkFQr33OrLDxPhCgMzNCGf11luL9bxwpZpc0NYbZaElj
   yLSVHELI/FQc0iUoy+hqsbXIK0UgOYwNPEf2p+GDJlRvUNzETv0KoznBu
   zqLGBOSix56Jc7tBM+fwGxTxbrUQ3fF0MDl+dSwrdE8ZHlud1Vb8UEvTq
   mmYjOnlj6QdJxB7NAMMCK76NTQSJOssTTST1jynCcLvM0IdiTVpKBGoJV
   tSX7CBDFLdTlRuWOTUL2YhENnTh54uFJx9T+OJ4KSj+avzY+r1o7igmAY
   w==;
X-CSE-ConnectionGUID: f+PchckUSAy7diGaVlQFLA==
X-CSE-MsgGUID: U5VVDEhzQmWhIQxBtFPT7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79243366"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79243366"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:16:56 -0700
X-CSE-ConnectionGUID: zOtref1/SxyOg6eLbwIfbQ==
X-CSE-MsgGUID: N23V6en5S328Aa+0UaFF2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239654370"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2026 11:16:55 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMrf2-000000002Zz-21cu;
	Tue, 12 May 2026 18:16:52 +0000
Date: Wed, 13 May 2026 02:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: chalianis1@gmail.com, miquel.raynal@bootlin.com, srini@kernel.org,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Chali Anis <chalianis1@gmail.com>
Subject: Re: [PATCH] nvmem: layouts: onie-tlv: fix read_post_process
 assignment
Message-ID: <202605130229.IIa8Bfjl-lkp@intel.com>
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
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260513/202605130229.IIa8Bfjl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130229.IIa8Bfjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130229.IIa8Bfjl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/layouts/onie-tlv.c: In function 'onie_tlv_add_cells':
>> drivers/nvmem/layouts/onie-tlv.c:127:40: error: assignment to 'nvmem_cell_post_process_t' {aka 'int (*)(void *, const char *, int,  unsigned int,  void *, unsigned int)'} from incompatible pointer type 'int (* (*)(u8,  u8 *))(void *, const char *, int,  unsigned int,  void *, size_t)' {aka 'int (* (*)(unsigned char,  unsigned char *))(void *, const char *, int,  unsigned int,  void *, unsigned int)'} [-Werror=incompatible-pointer-types]
     127 |                 cell.read_post_process = onie_tlv_read_cb;
         |                                        ^
   cc1: some warnings being treated as errors


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
