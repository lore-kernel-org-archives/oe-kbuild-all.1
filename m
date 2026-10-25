Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792925395;
	b=a5fA45bLpBglBhsW5kKGhl9BwF5aUInAHZtK3c849LXyx0EVEkZqiv0OaQgJ/sqR5xst
	 gmIaVH1skuLR/UP6KDHUnxkfz9qp5JjSI/opvG7ruYAmRs0KWmCc3pbvBZWP3ZoY71GNa
	 JuJp/KoxAvFhN6lnVPNVL6No8Ycf8tQpWyRy28su/XaOiCj/OtI46D/x9ijvmN2m9jIsf
	 /GUejk6BF2zelJR/3GzLd64/VTqkh5R/Srs/p90DP9dHMFTdUs7XZ94Md8XV5BkPEmequ
	 6y7T1xLAoGGQ/ZMwk9UBnF1qucAqdBlBYdSTnj0+ZYUSN/alN15CeddaEf/JghH0xFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925395;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7JSyZw8IlAUawccxS8oDgVXImKxbTAY0ZCG5l352BOA=;
	b=wzZavVAf7on1ckJYxXY7A/d2h2bfZv6XPeC+NJJOLZ4qon0vSBcA9K1oUSOE15w2yopx
	 9d8r9+tWbGrlYGe7hHNWEH/M+/XJHvlql0CqnBkfoQoOr7h2DzvzzTPV/oKES+gKZ1AFm
	 w/8ozHOWUzqGjYueKZXE+6nnDQDZEH8ctBOK6rOAzzvJYORDRwNw9+Mip6Pq5N2LvQ5yO
	 79HJwlFH1yrwIPNhkFfYu+WcMh93M1L2PpusYwMKPb5QnuRGBpKznIl2vVezsToaSJXXy
	 Y8Q4aixWq6aj3tae71sYnOpyB5ru+UNyELeeulpcUWapjxqEXCBp2cpQWH4zb9Ai8Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="ft8/267K";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D51606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 10:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ft8/267K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792925394; x=1824461394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rt5BEY7DwxcNCG/AAfpdZnZc2Khftj/I/zbWxZry5XY=;
  b=ft8/267KabzBwRNH1iLUrT7DKqfUPTM0zm6oBudj+uoU/29XpNzws9R/
   RiuHY8t9Xrrr+5HMhGPhNAe/1ZaHBBqNWBd75hk4uKDg+/7Pvq0a6ihoT
   CYF0ImVdakUBi/OLz48to9ev1QAy2l3XgGs6m3vFQHehlBtYZM3eJenaQ
   EozcrkWzit94MZ2IdXS2yBQbfv45tY11+2I5cMEGH7hnzIhuVpUEOOxXS
   9Vok7LF2ghn3LJrFH4Vzhjf/gn3ZMQtxUtdCZ2Zzs+4x3TEYv4WKBBvy6
   ugEmbz98MvMM3AVWsdVQIHmox9mMv1WqfXQiW26TNxWDVZLbtOOxD0o7F
   A==;
X-CSE-ConnectionGUID: h9zZlwfiTM+9T5hsZS9whw==
X-CSE-MsgGUID: RVdXDwtRSiCBlG/I8qe/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1501277"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1501277"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 03:49:53 -0700
X-CSE-ConnectionGUID: JYgqJlDmQu+LqbHMhBjFnA==
X-CSE-MsgGUID: URc1XrjISym5V9UmBj1B9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4005441"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2026 03:49:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKvnQ-00000000UjS-1aE7;
	Sun, 25 Oct 2026 10:49:48 +0000
Date: Sun, 25 Oct 2026 18:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: Tristan Madani <tristmd@gmail.com>, Even Xu <even.xu@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Xinpeng Sun <xinpeng.sun@intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH] HID: intel-thc-hid: validate ACPI buffer length before
 use
Message-ID: <202610251809.9IHSydrI-lkp@intel.com>
References: <20261024205850.4051206-1-tristmd@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024205850.4051206-1-tristmd@gmail.com>

Hi Tristan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v7.3 next-20261023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tristan-Madani/HID-intel-thc-hid-validate-ACPI-buffer-length-before-use/20261024-205850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20261024205850.4051206-1-tristmd%40gmail.com
patch subject: [PATCH] HID: intel-thc-hid: validate ACPI buffer length before use
config: x86_64-randconfig-1003-20261025 (https://download.01.org/0day-ci/archive/20261025/202610251809.9IHSydrI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251809.9IHSydrI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251809.9IHSydrI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:66 function parameter 'buf_size' not described in 'quicki2c_acpi_get_dsm_property'
>> Warning: drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:109 function parameter 'buf_size' not described in 'quicki2c_acpi_get_dsd_property'
>> Warning: drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:66 function parameter 'buf_size' not described in 'quicki2c_acpi_get_dsm_property'
>> Warning: drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:109 function parameter 'buf_size' not described in 'quicki2c_acpi_get_dsd_property'
--
>> Warning: drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:85 function parameter 'buf_size' not described in 'thc_acpi_get_property'
>> Warning: drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:85 function parameter 'buf_size' not described in 'thc_acpi_get_property'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
