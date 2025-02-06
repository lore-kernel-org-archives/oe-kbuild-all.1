Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B522B9BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 03:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738813823; cv=none; b=QiWvCrCrhdosSciFOAu5/elHrTQnFWlfSKRFTsg44elyVRGq9MyTjDCt4vgc2nM+n21xPWqsZEINpax+StltVN90iiikH1vRH3/zLP8vs/KAgqrseKmXSs4pEXwsmFE8VMs7hTjqBoHvwDWCvHxHYcxylqGBSo4jvwQYDP8smIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738813823; c=relaxed/simple;
	bh=jtQd2Z9m6gB73soABldWM4uoWmGStFRyV0UQnnj0CyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2gU4QOC+eSobn7bcvlvidiDKGh6OlDRVv8nWnLiqqKUndbhFKHmS1B/PKrppfnb+PEZ4RoUdmN690f51uOo+kO85aD93/T8c7dgAIfp5Vn4XUDIc23W2VwWPklEq3nLxYnqwGdu6ufbLwvhrC3aWRI6ZbnXfmj2eaDfpN4gs9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4Af0FrT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4Af0FrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738813822; x=1770349822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtQd2Z9m6gB73soABldWM4uoWmGStFRyV0UQnnj0CyU=;
  b=O4Af0FrTTwz0rwKrZwLRWx+5p0tmeGds9hK952T8x5yfBfVoK+UAbxMv
   zM1M7lCpxdlmApFzwnZ49n0Y+z29MxdW2HdEMLdYSXm5bpE8cpYrP0aL/
   FbiEFKj1yxLxxwtBLUVTFGH/TMy03IovI6PK+eeXAA54niByXf4SFRPqz
   2wSkabpE7HGoF8+O1tatSAer6A/zNb5jPEZo8lMN5TzBtvWd86uC3tMda
   7HZ0zEZbpjevN9PTPoGyEJ5RpcUwH1NRuj8GuG3hd+yk1HuuHfyD6iKQg
   ZtT2wnM2YwO8xqV5bj1CeyCftmWFPpdaA63CzGR0QhTFi/RwgM3uxYJvq
   Q==;
X-CSE-ConnectionGUID: JV6xd/JiTGW3rGoaB6Tw6g==
X-CSE-MsgGUID: PS4Pzf9cRHeNgD6wzLLNmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39280142"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="39280142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 19:50:22 -0800
X-CSE-ConnectionGUID: 4EEWg7qnRf6R9iWRh2D6yQ==
X-CSE-MsgGUID: cZvgHhB8TvGFMf0byz1PRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="111061535"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 19:50:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfsuA-000wQJ-0y;
	Thu, 06 Feb 2025 03:50:18 +0000
Date: Thu, 6 Feb 2025 11:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 16/16] x86-stub.c:undefined reference to
 `sev_get_status'
Message-ID: <202502061102.2C7zU6nk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   2188b98e5155277ba2ece786951ce14d05ed1c45
commit: 0fc856178fc34590cbe698bcfa1c40cda8994da3 [16/16] efi zboot for x86
config: x86_64-randconfig-072-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061102.2C7zU6nk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061102.2C7zU6nk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061102.2C7zU6nk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/firmware/efi/libstub/x86-stub.stub.o: in function `efi_stub_entry':
>> x86-stub.c:(.text+0x3aa): undefined reference to `sev_get_status'
>> ld: x86-stub.c:(.text+0x3b2): undefined reference to `snp_get_unsupported_features'
>> ld: x86-stub.c:(.text+0xc42): undefined reference to `sev_enable'
   ld: drivers/firmware/efi/libstub/x86-stub.stub.o: in function `arch_accept_memory':
>> x86-stub.c:(.text+0xd89): undefined reference to `sev_snp_enabled'
>> ld: x86-stub.c:(.text+0xda0): undefined reference to `snp_accept_memory'
   ld: arch/x86/zboot/vmlinuz.efi.elf: hidden symbol `sev_enable' isn't defined
   ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
