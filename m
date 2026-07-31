Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4EA414A34
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508107; cv=none; b=BnMLan95jAgNcqQpXxDJX7Iz45BiB0tlYDDKSznJi5RIsKOZi7SFIGozrEniJMMC9YCwo8XiTWEWwVMEj2/6cXfxvD+9cvf/RdnpZDoJsM0ddXBDkzccOxNab3ROr6mIpPXGSQ/myA+tjFTHJOARhCxb3q82igUR9WxfsVQhYaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508107; c=relaxed/simple;
	bh=M7Z2odYEJK1/qlXOz4HkiiBkzUjN9SA6y342wFhmNY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dWZC/jZwFaQQ2bDLLjSGM0o3KerQTWqwpfCbJn+KTWK/ilP1pUvu7KyYuVatZ/RtxTxOaCi54cWxjWc56mpkSZ1F9fkTWNUlTfbofVaODIiuQIxGwhLZwHWuNFugv03Qyx4K6aTGTm0/nNv82xxwVOju6ONI2GbsprCN0rCXhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TotThs1A; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TotThs1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785508104; x=1817044104;
  h=date:from:to:cc:subject:message-id;
  bh=M7Z2odYEJK1/qlXOz4HkiiBkzUjN9SA6y342wFhmNY4=;
  b=TotThs1A4UVSwQm1xdfJW5GlGJ4WWmtBMUZgW1PgzU1Aq+H396UZd4QV
   Kf9oB9/A1x3SyzhGr20GFrXBJaLcA8zMa79Yjjq5OjNbBOkWbhxLXLZNp
   Pjg9GKUwiF0sZK/o93UGISxxuzRa25Isxu8yVb9ZH367nBYGIShEeYE0/
   x3rPCtsJzGMuvSTdYyT+8UMeLBlpQ5EYg3e44j8mjHGWSRr/ffXPAGvza
   71S43S/Dja2J7p1t0xY60LWSgxdu/WznwBZJUBVZvAY8/MUxQkxnuvler
   sKTJlBeRx4Gc1o0KZGFjmjgutzPKl2DUehCwRG9wbqZuK9yHak8EniNlj
   A==;
X-CSE-ConnectionGUID: 7xOVIqJaRNK5kGdMboBHrA==
X-CSE-MsgGUID: ZOKRaHR8R+C7lSzRaJZTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86085045"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86085045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:28:24 -0700
X-CSE-ConnectionGUID: r82W+/F7TVSccC+rsDbFtg==
X-CSE-MsgGUID: h8sWQwzQTpGqq8XpJ10Rmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="264858963"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Jul 2026 07:28:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpoDk-000000001Eh-2u2C;
	Fri, 31 Jul 2026 14:28:20 +0000
Date: Fri, 31 Jul 2026 22:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [i3c:i3c/next 83/92] drivers/i3c/master.c:2710:28: error:
 'struct acpi_resource_i2c_serialbus' has no member named 'lvr'
Message-ID: <202607312240.9wXswUSm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
head:   279a9de1bb1b9e0cb1a8f68c00740c7ad5d07479
commit: c5cc24aebe83528e160724e6d2bcda8e839f0bd0 [83/92] i3c: master: Support ACPI enumeration of child devices
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607312240.9wXswUSm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312240.9wXswUSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312240.9wXswUSm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master.c: In function 'i3c_acpi_get_i2c_resource':
>> drivers/i3c/master.c:2710:28: error: 'struct acpi_resource_i2c_serialbus' has no member named 'lvr'
    2710 |         boardinfo->lvr = sb->lvr;
         |                            ^~


vim +2710 drivers/i3c/master.c

  2696	
  2697	#ifdef CONFIG_ACPI
  2698	static int i3c_acpi_get_i2c_resource(struct acpi_resource *ares, void *data)
  2699	{
  2700		struct i2c_dev_boardinfo *boardinfo = data;
  2701		struct acpi_resource_i2c_serialbus *sb;
  2702	
  2703		if (boardinfo->base.addr || !i2c_acpi_get_i2c_resource(ares, &sb))
  2704			return 1;
  2705	
  2706		boardinfo->base.addr = sb->slave_address;
  2707		if (sb->access_mode == ACPI_I2C_10BIT_MODE)
  2708			boardinfo->base.flags |= I2C_CLIENT_TEN;
  2709	
> 2710		boardinfo->lvr = sb->lvr;
  2711	
  2712		return 1;
  2713	}
  2714	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
