Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A882D2398
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989120; cv=none; b=NPDhs92+xCF3/0AlL3pnp+D+gVuyrSzivADZT0ur6+3wsEDbIgnvBfUaLEemfPu82/E87Z1MV0epbPR5nYDZrkMy9eiluttYXQV2NJJRa/mzWwwbnAfXr0YsTmcXllfgEAe5yi+bWocBTlUd7lUPw/tUrCJoT6LXk9tu6fpiIWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989120; c=relaxed/simple;
	bh=hJ9gBLTfeY8ZctcL1nJqqBML4vDUi8aFtfLDr1tbkl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+97T/8xnvigFyi4xUNqNwIAYZ7yPA8U6X/A+8mUlTqwignlq5mMjPC/bG7UgfH5QUlQdBvKSo5uFbZzaNc9ctQVwbC78NwiXdmJVf4L6ePqyUjGAlI9b64t6F8b7bF1iqgLHFI4guWuoQjTL6mmcH+D+jGKSIo/qIAfzf7CbfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghNj22CQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghNj22CQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765989120; x=1797525120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hJ9gBLTfeY8ZctcL1nJqqBML4vDUi8aFtfLDr1tbkl4=;
  b=ghNj22CQaCaZzrmJtOi1HnvzgO0Y4jrXwffC3zWQWVovwUnXPhHYeclB
   z7GWjZ0w2bauQcNZDiphVcoH055uKylQ9TwNS+ivM8QGBHxm7r3uPd49r
   c1t3cPzqZcxgq8r4vs3gP8E4W50wXTrQarZmP72Q2a8tKM6E00kDEAERN
   iYLV5vOfK+eERbPxtjJNoWdxO2R0/vv9xtnsgs5PPNlkFw7ca7xrKEl+7
   xQA/hYLKwdH/kOoYDqp14RVMo52UapnMU1UrMZSPXAaj7l8r9SctTQqlX
   Tu/hUEFGqlMb5kO6PkIVmZ3W3PrbhCCD6us2CVXA+U9i4xzt/4czUXunh
   A==;
X-CSE-ConnectionGUID: u85Rnv25T+a9p1k/wZ+hGw==
X-CSE-MsgGUID: y93S0DEhQsiVkNB6ZRXXnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67870560"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67870560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 08:31:59 -0800
X-CSE-ConnectionGUID: 0btkTPW+QA2PdMe1XQ6CXA==
X-CSE-MsgGUID: 0lfxruULR3GC7la3c9fY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198825966"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2025 08:31:57 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVuRP-000000000vZ-147C;
	Wed, 17 Dec 2025 16:31:55 +0000
Date: Thu, 18 Dec 2025 00:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/bluetooth/hci_qca.c:1891:37: warning: unused variable
 'qca_soc_data_wcn6855'
Message-ID: <202512180050.EqFJSSh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 9609476b3a16c15395c6b805fb751458eb9bd002 [0/2] Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6855
config: i386-randconfig-015-20251216 (https://download.01.org/0day-ci/archive/20251218/202512180050.EqFJSSh5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180050.EqFJSSh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180050.EqFJSSh5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/hci_qca.c:1834:37: warning: unused variable 'qca_soc_data_wcn3990' [-Wunused-const-variable]
    1834 | static const struct qca_device_data qca_soc_data_wcn3990 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1845:37: warning: unused variable 'qca_soc_data_wcn3991' [-Wunused-const-variable]
    1845 | static const struct qca_device_data qca_soc_data_wcn3991 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1857:37: warning: unused variable 'qca_soc_data_wcn3998' [-Wunused-const-variable]
    1857 | static const struct qca_device_data qca_soc_data_wcn3998 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1874:37: warning: unused variable 'qca_soc_data_wcn6750' [-Wunused-const-variable]
    1874 | static const struct qca_device_data qca_soc_data_wcn6750 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/hci_qca.c:1891:37: warning: unused variable 'qca_soc_data_wcn6855' [-Wunused-const-variable]
    1891 | static const struct qca_device_data qca_soc_data_wcn6855 = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/qca_soc_data_wcn6855 +1891 drivers/bluetooth/hci_qca.c

  1890	
> 1891	static const struct qca_device_data qca_soc_data_wcn6855 = {
  1892		.soc_type = QCA_WCN6855,
  1893		.vregs = (struct qca_vreg []) {
  1894			{ "vddio", 5000 },
  1895			{ "vddbtcxmx", 126000 },
  1896			{ "vddrfacmn", 12500 },
  1897			{ "vddrfa0p8", 102000 },
  1898			{ "vddrfa1p7", 302000 },
  1899			{ "vddrfa1p2", 257000 },
  1900		},
  1901		.num_vregs = 6,
  1902		.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
  1903	};
  1904	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
