Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320934B42B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 08:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765872486; cv=none; b=icBkQYsy2uFQle08n7ZJoXZWQBSSPRdqS3nNFpDAeQNbsYZibCtAetPvY4oP9G0UH91sTTzXCu1DOeXnmLbvDqrLbLTnXRZE2ti/Ljjbg+N2e1dL1XpQ5ZM0o9NJrUH9gS/M4kgI6CXkWVdZLNkdJgV+j2lrJvHlSaxwd77GE30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765872486; c=relaxed/simple;
	bh=7ya8M9nKw1DttSbzGdH88QyhTyenkyVNYWjg62SeJME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SaLJ32t8Z3wDOKNA+X40xO913p+JxaDv1iW/SSTzdGLhP4rwtLfFBtx1Ua5dNCB08rNe2kjROGPYO//C2ShWBdxLNSftOeCK6bvASBEmwystWmbDsz854M/Urcqo8/1taN95OJvo1NkNXB8G0I4faRfUu87NAwV0fNdvlZjrzy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zn9JKik/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zn9JKik/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765872483; x=1797408483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ya8M9nKw1DttSbzGdH88QyhTyenkyVNYWjg62SeJME=;
  b=Zn9JKik/MEC+9VtgAMogRKoOt3mej8AUkQjSQ3ex4rk98+gKETAnr/2r
   cxbLFoleToQtHD9FSIeg0o3gYV0Unen9yjv4t9uqiCjpr2OOlLWiSrjZq
   u6+AJwyx8NSFqkXq1QlHG+3wiDnLe/dRb9XJgtsEUkurXfsAMzKnap86q
   bHrvEyw1wni7GsKqaqTU0es6QWJHO5pI710lwmaprigE3/PqIZ9YSBqIH
   lMzVcpTPjNuV9C+kMElUgQocmDQDgPIQVg8IWQ1ZtHnQdQw4vSQgAjhSw
   TEAyaBQ4B/62Ag0Sy/XYDwI9MOgctcZ1sqyg/n2/cwRjqo9tVVbz44zEW
   Q==;
X-CSE-ConnectionGUID: R8YXPWpXR6KANJ3OMJt15g==
X-CSE-MsgGUID: gS+xsJ0VRxSqtASGynNplw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71638339"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="71638339"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:07:56 -0800
X-CSE-ConnectionGUID: X2clB673RmOuffU0Xoy/ZQ==
X-CSE-MsgGUID: fyd5hP8cR1iH2gkhdT5CgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202864556"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Dec 2025 00:07:55 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQ65-000000001LQ-1A4X;
	Tue, 16 Dec 2025 08:07:53 +0000
Date: Tue, 16 Dec 2025 16:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [rafael-pm:acpi-queue 25/29] drivers/acpi/scan.c:2753:34-35:
 Unneeded semicolon
Message-ID: <202512161613.2xk2GzgN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-queue
head:   e88d169a6053918f230dfc78ee0eff2c2a2ca9bf
commit: 685f8a959d00a36e01207e4ea2051259afb226ec [25/29] ACPI: EC: Convert the driver to a platform one
config: i386-randconfig-053-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161613.2xk2GzgN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161613.2xk2GzgN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/scan.c:2753:34-35: Unneeded semicolon

vim +2753 drivers/acpi/scan.c

  2743	
  2744	int acpi_bus_register_early_device(int type)
  2745	{
  2746		struct acpi_device *device = NULL;
  2747		int result;
  2748	
  2749		result = acpi_add_single_object(&device, NULL, type, false);
  2750		if (result)
  2751			return result;
  2752	
> 2753		acpi_default_enumeration(device);;
  2754		return 0;
  2755	}
  2756	EXPORT_SYMBOL_GPL(acpi_bus_register_early_device);
  2757	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
