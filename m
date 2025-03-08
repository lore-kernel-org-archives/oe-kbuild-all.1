Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2443374FF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741466827; cv=none; b=IBRqRBi7hzoB9bj2K98gcEtSSNOkCVe1oNTV6V1WRAma47s0lhef22xhW3Wp3iq/f0ES92BBkQ+P0CTZgDg2BfSUwfj5ApLglBxUekEvjiQNvptEyOupHJBcxfm/dSX5twWCZFziXRQ9svcYoz5Xi8MiSk80uFc7LSSEIm09Q4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741466827; c=relaxed/simple;
	bh=X10cUkFQl8DS84INYb7TZkx5vRBzE1my/4hRSNN3L0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUn92GC2uENbbfpFzdIFhVlTx8RmBnbvEM/drAPrxeukOAi4AdVoUIeHQWozg4vxJzudbUORGW8WCzo/4o0wsvQlnw2zGTrz6NXJ37Tpwjx5jIWo+5v50bHGmE3CEknRYqeudaT9oeYyDZdbWU6XBIUc9w22K7hXRX6heXYTUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5IR71Sg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5IR71Sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741466825; x=1773002825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X10cUkFQl8DS84INYb7TZkx5vRBzE1my/4hRSNN3L0U=;
  b=J5IR71SgqmvA0pKtZVXzbLk8Ry6H0yFkHFkRLPKeRNwf5bil/agS3mfy
   SIMxZl50DDnQezAknnTsFHktG+JjWlOxpoEcZXwMP/LNU5gzv+w8wvkb7
   cepT/k+ILdkOBtEFS0/nswp0brP1diVcl7eqUW6jVk4HjJEO0+ebw5tPu
   BmgTEc1Zd3wtt0lEPsiRI0aDJdAQDpjNFdP9ALVcQ6SYnH+HNVwPbhLER
   hrA6VfdYgN8xRekzUKwYBhjPgxV1in06ptZOpNxgc/Xd6vwuyaJBSXded
   6+gu0MyJtc88Ak9wLsOSvtqLZI8bufZNxMeVaxmFPLegTH70l3q7Q3vyi
   w==;
X-CSE-ConnectionGUID: pOyEJaKtSwGCWE03pBFUmw==
X-CSE-MsgGUID: EqfoBCVwQc2oHxaz+gEg9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42348018"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42348018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 12:47:04 -0800
X-CSE-ConnectionGUID: 9yyevqBIQDmdCrQ4/z5/yA==
X-CSE-MsgGUID: kzn/rZ5YSBuTcUEr+EGAaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="150415908"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Mar 2025 12:47:04 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr14X-0002IA-0z;
	Sat, 08 Mar 2025 20:47:01 +0000
Date: Sun, 9 Mar 2025 04:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [linux-next:master 7915/9634] drivers/acpi/button.c:456:2-3:
 Unneeded semicolon
Message-ID: <202503090406.aRfaZUA0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 39bc24ceb09df1bd4c333a19bec0b021567cb03c [7915/9634] ACPI: button: Install notifier for system events as well
config: loongarch-randconfig-r052-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090406.aRfaZUA0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090406.aRfaZUA0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/button.c:456:2-3: Unneeded semicolon

vim +456 drivers/acpi/button.c

   439	
   440	static void acpi_button_notify(acpi_handle handle, u32 event, void *data)
   441	{
   442		struct acpi_device *device = data;
   443		struct acpi_button *button;
   444		struct input_dev *input;
   445		int keycode;
   446	
   447		switch (event) {
   448		case ACPI_BUTTON_NOTIFY_STATUS:
   449			break;
   450		case ACPI_BUTTON_NOTIFY_WAKE:
   451			break;
   452		default:
   453			acpi_handle_debug(device->handle, "Unsupported event [0x%x]\n",
   454					  event);
   455			return;
 > 456		};
   457	
   458		acpi_pm_wakeup_event(&device->dev);
   459	
   460		button = acpi_driver_data(device);
   461		if (button->suspended)
   462			return;
   463	
   464		input = button->input;
   465		keycode = test_bit(KEY_SLEEP, input->keybit) ? KEY_SLEEP : KEY_POWER;
   466	
   467		input_report_key(input, keycode, 1);
   468		input_sync(input);
   469		input_report_key(input, keycode, 0);
   470		input_sync(input);
   471	
   472		acpi_bus_generate_netlink_event(device->pnp.device_class,
   473						dev_name(&device->dev),
   474						event, ++button->pushed);
   475	}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
