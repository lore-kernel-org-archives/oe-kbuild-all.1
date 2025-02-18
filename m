Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F401822B5A4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867404; cv=none; b=iBgmOFPmNA4XI9Y2VavX1NRHOiTGwwhGStV8rOm/RzB245WN+2x3bzn1mHNGZ12Gxyti9x4GPAyNcs8XRK5jBR1ydFAAIQ2SMl+wdmsgGnrRvx+8mSExW6sHOX3FpU02HCcY/Na09IHZIleh/FiIdQzJ3sVAoExc4KAZAcXHZ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867404; c=relaxed/simple;
	bh=tqCKUzpcWLrjqI6Gf/4NJfNbRrPZvjoC6YWziCNar+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eLzu3/TU1p+T/UHVUdXeZp0sJ/sdqlAXOqIkqscQLNKyJutMhbESgilT1DNKPk39UcaDj448PjxCGU0bEPRMyXjFpt6zbmPDc/sxeNm3P2WB3n0soG62J1klYPP/PNtCIPUcN6z1BrjLdpo9t0Lxa43C6HmCmjzzzxrB3OTXBhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRlo5uSm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRlo5uSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739867403; x=1771403403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqCKUzpcWLrjqI6Gf/4NJfNbRrPZvjoC6YWziCNar+o=;
  b=HRlo5uSm892+SX1p1X311HDhQ5Ir4dZMy6oMrF1ObyEE4Jhd2CsF7epS
   tja7Nx2fsb54YOdT4TR9QaDzNiDLxmOS10eEXgEjDBHGrRK85rD5GV6oO
   /T0pYlAahZUqihtrNFiPBUiMvN7NU8g8/BokVfPosdPDcT1b/ldkadV/k
   gmoYTRzqSEFKOm/do+zgpp9PqvLwL2ur7Xjq6IwAj0ZhSSW8QEhXcZO61
   GExck9kjOHfj1CG4Ba2Z+05lX/seuMVhXA+en6O+8gfla3fYMZTzM1XcW
   8EYJbxv+phXEzQegCShNK4+xzL2sXPOVobBm0ORX/mn9dot4lKaJoNFLT
   g==;
X-CSE-ConnectionGUID: UnAtoS6sQuSRYJVKcjdLtw==
X-CSE-MsgGUID: bpUCQ+R2Q+WS7v6zVvROuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40473629"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40473629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:30:02 -0800
X-CSE-ConnectionGUID: Q4q/EyceQK2uNvngaOQ89Q==
X-CSE-MsgGUID: MmA5GOt+TdWqGsnoSeYhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="114841253"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Feb 2025 00:30:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkIzB-0000J9-21;
	Tue, 18 Feb 2025 08:29:52 +0000
Date: Tue, 18 Feb 2025 16:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 27/29] ld.lld: error: undefined symbol:
 crypto_krb5_calc_PRFplus
Message-ID: <202502181652.jEFqVwxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   afabaf1e4ceed3b74470f34b349c516241f969e9
commit: 9c489828113201cfac84b1c81a9d7bcbc0ed1c49 [27/29] rxrpc: rxgk: Provide infrastructure and key derivation
config: riscv-randconfig-r073-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181652.jEFqVwxf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181652.jEFqVwxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181652.jEFqVwxf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: crypto_krb5_calc_PRFplus
   >>> referenced by rxgk_kdf.c:34 (net/rxrpc/rxgk_kdf.c:34)
   >>>               net/rxrpc/rxgk_kdf.o:(rxgk_generate_transport_key) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crypto_krb5_prepare_checksum
   >>> referenced by rxgk_kdf.c:36 (net/rxrpc/rxgk_kdf.c:36)
   >>>               net/rxrpc/rxgk_kdf.o:(rxgk_generate_transport_key) in archive vmlinux.a
   >>> referenced by rxgk_kdf.c:36 (net/rxrpc/rxgk_kdf.c:36)
   >>>               net/rxrpc/rxgk_kdf.o:(rxgk_generate_transport_key) in archive vmlinux.a
   >>> referenced by rxgk_kdf.c:36 (net/rxrpc/rxgk_kdf.c:36)
   >>>               net/rxrpc/rxgk_kdf.o:(rxgk_generate_transport_key) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
