Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F35351C5D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 23:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706569762; cv=none; b=Q9tdwoVMC7HvPbOP8MfBM0ZzfRqZj6+oueadASWIC+ZMlqsugQZkMGzSesQRu2Q3KmoZLHNtvmtAp1uIvX3n66t1OVeQGlnUKcpG0Q0+5GhMPtnIK9HDJaQQtoLwYb3GX2UYxvTiJ38yFuWWT+TC/kLCbKPJj7DvozL6SMMDStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706569762; c=relaxed/simple;
	bh=Urs2z6rIaPQh2WdjT8v/8zP6AbLj0q+Wni6lOC1zb3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/c0sQCiQKIiVnU7atP8BjGgK9vhTKQG3RHRj+tjeZZsLu+gcWiML7GyJNbkg394j16kBiAfMar58AVUZ6hrhF5gHtN72IvyjVRm8KGhgWc8pL0a0CXcvcJ6+W6MGMwS8csGwGYZEUk3XyGXUVBY0VoQ9Nx+dKsj80Y8SvHraJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDHVTqil; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDHVTqil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706569759; x=1738105759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Urs2z6rIaPQh2WdjT8v/8zP6AbLj0q+Wni6lOC1zb3A=;
  b=oDHVTqiliPbubjFZ12aTNE7Om1REfAQepEBnxEt6mN+n8NAmDnp9fGDk
   dPcan1YmzU7XFdcF/gSSf4EIKf+LYSxPNoIaSsPvpmyTdAyFhcCZZEYVM
   vXR0LHBepli3jiSu1LUZgJ/KekFZidMRTHKvNyMYRUAKLf3H9g4j0JHIN
   cbhXEyt2hfzs39kAW9n2agsgClXB0AAJBCqiURektJUkkUOzo3rXLdG79
   7iPfeZ/pgz/0KjBB/u66G5Jr3Gc8BNmHKmFD+chptB53A5sJWmiNWASJz
   XZ5nvDYkMNxDD0EPfpEXI624ZRFg5k+o2swQik+9lT4iHIZPCCCfleMg7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393546104"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="393546104"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 15:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="878240226"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="878240226"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2024 15:09:17 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUakd-0004hU-0Z;
	Mon, 29 Jan 2024 23:09:15 +0000
Date: Tue, 30 Jan 2024 07:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v4_1 9/38] drivers/pci/xen-pcifront.c:106:17: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202401300709.oHsr19T5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v4_1
head:   62f39b708197a098b1dcaa0a295801a2cdcbdf26
commit: 4652b9e47a8f0639cd078c201094588e3833c828 [9/38] dyndbg: move flags field to a new structure
config: x86_64-randconfig-122-20240129 (https://download.01.org/0day-ci/archive/20240130/202401300709.oHsr19T5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300709.oHsr19T5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300709.oHsr19T5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/xen-pcifront.c:624:18: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/xen-pcifront.c:634:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] err @@     got restricted pci_ers_result_t @@
   drivers/pci/xen-pcifront.c:634:35: sparse:     expected signed int [usertype] err
   drivers/pci/xen-pcifront.c:634:35: sparse:     got restricted pci_ers_result_t
>> drivers/pci/xen-pcifront.c:106:17: sparse: sparse: Initializer entry defined twice
   drivers/pci/xen-pcifront.c:106:17: sparse:   also defined here
>> drivers/pci/xen-pcifront.c:106:17: sparse: sparse: Initializer entry defined twice
   drivers/pci/xen-pcifront.c:106:17: sparse:   also defined here
--
   drivers/accel/ivpu/ivpu_mmu.c: note: in included file:
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
--
>> drivers/accel/ivpu/ivpu_gem.c:28:17: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_gem.c:28:17: sparse:   also defined here
   drivers/accel/ivpu/ivpu_gem.c:32:17: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_gem.c:32:17: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_gem.c:28:17: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_gem.c:28:17: sparse:   also defined here
   drivers/accel/ivpu/ivpu_gem.c:32:17: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_gem.c:32:17: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_gem.c:28:17: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_gem.c:28:17: sparse:   also defined here
   drivers/accel/ivpu/ivpu_gem.c:32:17: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_gem.c:32:17: sparse:   also defined here
--
   drivers/accel/ivpu/ivpu_hw_37xx.c: note: in included file:
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:92:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:92:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:92:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:92:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
--
   drivers/accel/ivpu/ivpu_hw_40xx.c: note: in included file:
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:108:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:100:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here
>> drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse: sparse: Initializer entry defined twice
   drivers/accel/ivpu/ivpu_hw_reg_io.h:82:9: sparse:   also defined here

vim +106 drivers/pci/xen-pcifront.c

956a9202cd1220 Ryan Wilson 2010-08-02  101  
956a9202cd1220 Ryan Wilson 2010-08-02  102  static inline void schedule_pcifront_aer_op(struct pcifront_device *pdev)
956a9202cd1220 Ryan Wilson 2010-08-02  103  {
956a9202cd1220 Ryan Wilson 2010-08-02  104  	if (test_bit(_XEN_PCIB_active, (unsigned long *)&pdev->sh_info->flags)
956a9202cd1220 Ryan Wilson 2010-08-02  105  		&& !test_and_set_bit(_PDEVB_op_active, &pdev->flags)) {
956a9202cd1220 Ryan Wilson 2010-08-02 @106  		dev_dbg(&pdev->xdev->dev, "schedule aer frontend job\n");
956a9202cd1220 Ryan Wilson 2010-08-02  107  		schedule_work(&pdev->op_work);
956a9202cd1220 Ryan Wilson 2010-08-02  108  	}
956a9202cd1220 Ryan Wilson 2010-08-02  109  }
956a9202cd1220 Ryan Wilson 2010-08-02  110  

:::::: The code at line 106 was first introduced by commit
:::::: 956a9202cd1220397933a07beda9f96b3df1fa24 xen-pcifront: Xen PCI frontend driver.

:::::: TO: Ryan Wilson <hap9@epoch.ncsc.mil>
:::::: CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
