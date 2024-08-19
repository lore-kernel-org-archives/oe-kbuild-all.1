Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F9C3FB31
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 02:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724035941; cv=none; b=WR+nTtYsZWr00YZiMeW9ybZloil4I+lJGhLr7I/EzPK3bUj5CxOhFPweXk28slFdXu3yGiwNToQI37HLPH6XYDFesODkUA13cJeHUyG//C8W8AcqsHsdFG4Pw4s2SC+RT/jjxYYp9l0m57VL7kwBJ73L4xPXHlOm8yF7m8UIn04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724035941; c=relaxed/simple;
	bh=ic4M4Z8PyjL/0sQTC/AI4V2s5sFa9Eoyq6mt6Tvlws4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oowjvb1xEhZ7HHA8ntcOgPgG864PDgDh1Gi7VxBGzs2Fl0+nNTEWnEvwrAA2KV4PbS2lPHhB0IqnF1lvZchkClu4Z2UFBVo+RiD1DZ9cshCJQ4MpEoS8XRQk7XEHX8wJnxmQoj7zApKEuX43tpdn9nsZ8gFmY4qBYTraQ88TY+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckbEGRPE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckbEGRPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724035941; x=1755571941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ic4M4Z8PyjL/0sQTC/AI4V2s5sFa9Eoyq6mt6Tvlws4=;
  b=ckbEGRPEneVObsrm48S7M7q44OREVIkLGa5Y2OZLU8Wr1Epi62Je2e6U
   bUD7CdKF0QrqwSfPubjHWk26mQWvYqHAQx63TCurSC531m6641cLMsHw2
   3V4mKBAvpRgrf1aPbOKbeNlbiFL2AXRCn3Sp2+eW/8zS38N0Dr5cxF7Gn
   HLG0N084pSdRUrtoDyLv7rVJrgrBRgjlMtO0LSpm/2OD9pqbUAnbC+LND
   jcSn5fcLTfuATOtc8yRsPohdUjXUsL+WPX4ATbCnfTjS9W+6o9pZjewJJ
   ER0o4OIrWQFHbbtTkv2/utJJk7pcosYZMRAnTzf50p99rowcxXsQPSfsJ
   A==;
X-CSE-ConnectionGUID: SKzXcgGOS2W1ahoyj1g+/A==
X-CSE-MsgGUID: INcWR3hpQF66Qi5EjFb8Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26055514"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="26055514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 19:52:20 -0700
X-CSE-ConnectionGUID: 0flAea66TGehWQvmUbjW7g==
X-CSE-MsgGUID: 9NMo2Zh3SWeZEoiFPDw6+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="64887071"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2024 19:52:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfsVE-0008a2-1y;
	Mon, 19 Aug 2024 02:52:16 +0000
Date: Mon, 19 Aug 2024 10:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-41c 66/93] drivers/bluetooth/btintel_pcie.c:53:9:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202408191001.jGZqJUfJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-41c
head:   0002c11a78f7c2b3adb014d0034e9e525257fed7
commit: b782d087702043ab6ec6d1b0e61626f8b79b8ca9 [66/93] dyndbg: move flags field to a new structure
config: i386-randconfig-r122-20240818 (https://download.01.org/0day-ci/archive/20240819/202408191001.jGZqJUfJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408191001.jGZqJUfJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408191001.jGZqJUfJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btintel_pcie.c:53:9: sparse: sparse: Initializer entry defined twice
   drivers/bluetooth/btintel_pcie.c:53:9: sparse:   also defined here
>> drivers/bluetooth/btintel_pcie.c:53:9: sparse: sparse: Initializer entry defined twice
   drivers/bluetooth/btintel_pcie.c:53:9: sparse:   also defined here

vim +53 drivers/bluetooth/btintel_pcie.c

c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  49  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  50  static inline void ipc_print_ia_ring(struct hci_dev *hdev, struct ia *ia,
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  51  				     u16 queue_num)
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  52  {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07 @53  	bt_dev_dbg(hdev, "IA: %s: tr-h:%02u  tr-t:%02u  cr-h:%02u  cr-t:%02u",
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  54  		   queue_num == BTINTEL_PCIE_TXQ_NUM ? "TXQ" : "RXQ",
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  55  		   ia->tr_hia[queue_num], ia->tr_tia[queue_num],
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  56  		   ia->cr_hia[queue_num], ia->cr_tia[queue_num]);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  57  }
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  58  

:::::: The code at line 53 was first introduced by commit
:::::: c2b636b3f788d10486a6691ad6dd3ec4c93bd78e Bluetooth: btintel_pcie: Add support for PCIe transport

:::::: TO: Tedd Ho-Jeong An <tedd.an@intel.com>
:::::: CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
