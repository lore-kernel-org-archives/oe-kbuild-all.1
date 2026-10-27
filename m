Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072774;
	b=D86Viti2Q24xRQAAe1VAjFZL5dDoGqILKRnjF/RgxMBEEZ+WZuFTIAWqcvZ3/zFqCO/r
	 flXhvW4GwrozapWPa5vjoSFhpE4953x2gD0Jnade3LXwyvlvQzTYaSzPPD1qcAKIKvntM
	 iHw8kP5PA9foth1O0TMZYp0Ip0cmEq3c6OTZ9LqYiQS/FohI9EX0Fqs33fT1GFz5KGwZd
	 hfi/6ynEt9lCGlyots4jT4RffwImdE2Dr68YvbC3ilQwAuuM/siNit97/jf/mGbavFlVY
	 iZ63/4C6JmaUSAug/EOvGvmU54FsqX4i0Dcq0kpb4FDry4zEMGOudnbFNoRYkWJC1Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072774;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2DOLhzXduWF072tiBfvudeCJtjM9IIe12I6QMdxUzJ4=;
	b=oDJoGqh+RKnZhzPK3VQWbFsuX0a6fJjy9gtVVCodneqzVYqvkY6uoAWC4TtVDsCSbIwz
	 z1lBYLFQf1HoZw18vLGKcXIGHzZf2xxvQQQUroFS6IyvAG5ynAm/FUqCFltvnADDbbATe
	 CFsL1IoG3FpIslr+k13SkrcTBTro8Qs1dzyeIBycULnHQvqg99otTj+lFIM3KiL84dhw7
	 hYMW8QxWC721Qeika1priLzk7rOoU3rfcT1pskQcY/53PaIJvERT0lxWVxuXbE4j9vhey
	 51KpBpWoHgG1SdMUiuRNDa0JXXjwMrpg/9O0JsJ7m6F2ZtiODb3WhOOyOWF82JvHmcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CmrK9eQW;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB7606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 03:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CmrK9eQW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793072773; x=1824608773;
  h=date:from:to:cc:subject:message-id;
  bh=A0UV5lZKCDut9M6+j/efZofQqe55/RI6Ei2bkxSOzSw=;
  b=CmrK9eQW3QpJmcIipkKzfNxIAHOfDVCeuGa4exaogDMt25LC/P0lsj7w
   NlkVPl01X+gTptktFVbbZdixTS9OaNHcHEgAt39ruMVldavAFzLCmjtfx
   esM3OI72uw/SFIqVzxQpzV7Cjh0Qwf8pI8aT5orUISpexfImUcUW4Nxg/
   TlgRROOmC/5+x8X0Y+Bi5GK5zseFVpJmjCaHUH36CBwUaVm9ZhjzYx9VE
   T19Z3ozm7Yb1sFuwCBoEdxUwZA9SJ5ja3ZHJoEIr2za76LVzFpnzIE/ug
   YAUA/51wfWn3WTzNihSmMa3vyZMEVzsGdUhfb2lapijlJ/sshTsxl2xrO
   w==;
X-CSE-ConnectionGUID: dUWnjZ7ETY2DbqAIoC0OHw==
X-CSE-MsgGUID: GzrnZFGWS0yL4mMrgS0TTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1653207"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1653207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:46:12 -0700
X-CSE-ConnectionGUID: 4DG1g6YaSCaWJ5UiTT6J8g==
X-CSE-MsgGUID: 54Hg4qITR/+dWUkWhWONvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4521362"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2026 20:46:11 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLY8X-000000004NP-0HlY;
	Tue, 27 Oct 2026 03:46:09 +0000
Date: Tue, 27 Oct 2026 04:45:52 +0100
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:for-next/scmi/fixes 24/24]
 drivers/firmware/arm_scmi/driver.c:3110:23: error: implicit declaration of
 function 'acpi_device_hid'; did you mean 'acpi_device_handle'?
Message-ID: <202610270456.VaMPNPCF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/scmi/fixes
head:   7f73b4cb4b3afff60577e5ddc532fd026b55d4e5
commit: 7f73b4cb4b3afff60577e5ddc532fd026b55d4e5 [24/24] firmware: arm_scmi: Drop redundant ACPI configuration guard
config: csky-randconfig-r2201-20261027 (https://download.01.org/0day-ci/archive/20261027/202610270456.VaMPNPCF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270456.VaMPNPCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270456.VaMPNPCF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/arm_scmi/driver.c: In function 'scmi_acpi_device_hid':
>> drivers/firmware/arm_scmi/driver.c:3110:23: error: implicit declaration of function 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
    3110 |         return adev ? acpi_device_hid(adev) : "unknown";
         |                       ^~~~~~~~~~~~~~~
         |                       acpi_device_handle
>> drivers/firmware/arm_scmi/driver.c:3110:45: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
    3110 |         return adev ? acpi_device_hid(adev) : "unknown";
         |                                             ^


vim +3110 drivers/firmware/arm_scmi/driver.c

c3d4aed763ce4a Cristian Marussi 2023-01-18  3107  
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15  3108  static const char *scmi_acpi_device_hid(struct acpi_device *adev)
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15  3109  {
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15 @3110  	return adev ? acpi_device_hid(adev) : "unknown";
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15  3111  }
17b3cdaa7ab4e9 Sudeep Holla     2026-09-15  3112  

:::::: The code at line 3110 was first introduced by commit
:::::: 17b3cdaa7ab4e9c4fc9b1b6816e80d9ade153272 firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent

:::::: TO: Sudeep Holla <sudeep.holla@kernel.org>
:::::: CC: Sudeep Holla <sudeep.holla@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
