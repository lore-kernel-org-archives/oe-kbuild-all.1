Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925457;
	b=yyVQvNMVxm51T4lU+hmyqEEq+QLuBRBO+jQQLRy94SuyM7/KPZphAZJJKfEkPFCSgp+F
	 5LBm6eF99c2P1TEWmOOeSf/lWXkNqtGaOyCtsTe1loaG8+n8jPSEU3/zcPVUlW9cMBwoU
	 RGo0+f611EfNZBxqImVvOcWfUGEsAN6so6Qe8YIqpiyDsC6dkLgqaRWQ+O0OS+XiW6TfN
	 TlZJ4k04rIIzAstbAcymWNLfdoo1bYAkVtshlJ0+SXxaEHj1qXfyoC2M0KmjlPwKU9XDj
	 XAag2qSucxefU8/PrP8o18/SmnmA3uiOVjrb0aDb4QpM2HRAN4JPwzX3hnnqIUpvTBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925457;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eS5rPsLc+oDnGltq5woP0XL8xxT3uTFnJsOxDUVy4oE=;
	b=iy3nvM69fFr71noiH3QaTfNtjs+QCxoxFX1ECROxXqp38SxGKwhCE4/ieNP+G94wCJ64
	 fvi7HuluNjNmFwhlO/pCF1IK/nAdsiMSaXjayhL/KBYSxZ8fA+zEa4VpYsCr3HpyOIS4l
	 UFMNuGbw/paHvNh9Fm+dwo/8R1DnEFABudALCh0yOnSUndnaOI+JmG09602OWiTKoA3Zg
	 bT0JZ25E5fAGP46aLU6lmbEmVteQCE6FbnIegeb08r54yimcH0nSoQ+mTOht/zeDOtZBQ
	 8DXIf67ph1mVtdtuNiTr55Bl3Y8eEiloAfdi4Hrd3laMktb67uIPaQTu/Hh7GFwzHqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dhu05tng;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D4606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 00:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 098D4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dhu05tng
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793925455; x=1825461455;
  h=date:from:to:cc:subject:message-id;
  bh=xoD3fIEGJ5ukvBvULWmWWxHtt+P7BvPKw4kl/c7A3Kk=;
  b=Dhu05tngIgGq2X/UPpsSAPWuSCpnobH5yEqPDTUfaoeAONOgH5+EHx0A
   i+D9F3jyxCkLESAs14bRRcOPmKYOz8Uj0lEf2kdVCt9l6bZ79ILh091fZ
   UXSQtnf14RzHuX0rdr3ByVUnUXy79SSitjbJF81o3KkLL34J0pFRgX5ag
   MiBs05k5zDF87mKJVQzMH0vtrH7tWIEatdf5wl/yGFxSaE/jQEuxvAtAy
   NPHsV/gnPiXzWfq4DHYnwgYolP7DU4ovmkWvvgYFZ1dIoUpvWlbnyt7KG
   TWe43/2mtIHIYWlVd/81IZUwQXJWQPbXJuk1k4trX+HcLUC21Lc0wUZTN
   w==;
X-CSE-ConnectionGUID: cDgMD6DcRA2aL1GyaonAZA==
X-CSE-MsgGUID: k7+Hzkx/RRq4GFgq7MuPAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2607998"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2607998"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:37:34 -0800
X-CSE-ConnectionGUID: E5EWMzd7RP+muUI0qqVDTQ==
X-CSE-MsgGUID: EGwhO9LVSS2cT9mJfPxGMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8911085"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 05 Nov 2026 16:37:33 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP7xT-000000009vr-17fO;
	Fri, 06 Nov 2026 00:37:31 +0000
Date: Fri, 06 Nov 2026 01:36:52 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 0/1]
 drivers/misc/eeprom/m24lr.c:346:24: sparse: sparse: cast to restricted __le32
Message-ID: <202611060150.ba9d5Xcf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   a9580b7485bbf58d7b44b7d51e15c8ebe1cea327
commit: cd5c5e0231c538a5d2d4a73f3b3ffc77ff08449c [0/1] eeprom: add driver for ST M24LR series RFID/NFC EEPROM chips
config: i386-randconfig-2300-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060150.ba9d5Xcf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060150.ba9d5Xcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cd5c5e0231c5 ("eeprom: add driver for ST M24LR series RFID/NFC EEPROM chips")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060150.ba9d5Xcf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/misc/eeprom/m24lr.c:343:24: sparse: sparse: cast to restricted __le16
   drivers/misc/eeprom/m24lr.c:343:24: sparse: sparse: cast from restricted __le64
>> drivers/misc/eeprom/m24lr.c:346:24: sparse: sparse: cast to restricted __le32
   drivers/misc/eeprom/m24lr.c:346:24: sparse: sparse: cast from restricted __le64

vim +346 drivers/misc/eeprom/m24lr.c

   323	
   324	static ssize_t m24lr_read_reg_le(struct m24lr *m24lr, u64 *val,
   325					 unsigned int reg_addr,
   326					 unsigned int reg_size)
   327	{
   328		ssize_t ret;
   329		__le64 input = 0;
   330	
   331		ret = m24lr_read(m24lr, (u8 *)&input, reg_size, reg_addr, false);
   332		if (IS_ERR_VALUE(ret))
   333			return ret;
   334	
   335		if (ret != reg_size)
   336			return -EINVAL;
   337	
   338		switch (reg_size) {
   339		case 1:
   340			*val = *(u8 *)&input;
   341			break;
   342		case 2:
   343			*val = le16_to_cpu((__le16)input);
   344			break;
   345		case 4:
 > 346			*val = le32_to_cpu((__le32)input);
   347			break;
   348		case 8:
   349			*val = le64_to_cpu((__le64)input);
   350			break;
   351		default:
   352			return -EINVAL;
   353		};
   354	
   355		return 0;
   356	}
   357	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
