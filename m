Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B426376490
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227015; cv=none; b=El/kK/AeExevWkd8HoizLh4AhSxypSRj0mQuieeg5wxa1WzemynLA/o+7sh2HIg/zg1UqnQHr5v0URKq4fTJMzwv02Ke+r5c5qSCdvx6vMEr4CIYZg/qcbRnS/zIlT1Sei3/GEHbtqgZXtr8Hx50zFcYJdmQZTufUXysA+435UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227015; c=relaxed/simple;
	bh=zDsKj6fLe/TcmBcJ70GgKI4uOPBik5ZkPDancq8mqDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j4xAQFUZzuuU4KeotUiz2lgW8SDW7f7x1uw9qHJsA9pKF90+Dcmw9L4PTD2UVAffOtjm9og3H32/5upxelJIBcKS5ZhndjEaUqeL2hM+w306gMK2XYlvP+Fa7X4gxB29kIPHJgPiMD4LmJXb1xOP4lEhBv04mZ0NiYE1riYYcfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAguoJUL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAguoJUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778227014; x=1809763014;
  h=date:from:to:cc:subject:message-id;
  bh=zDsKj6fLe/TcmBcJ70GgKI4uOPBik5ZkPDancq8mqDY=;
  b=CAguoJUL+owCY6a1X1EKHLFsKY9NP/tMhTfH1Czx+KqFprdek+DtSszV
   me2jt90Sytd35CGVjSgqdboYsNBisx5Ruv5NpaYj4IIWKXT5b0/w4qU6V
   +6221gkQffhVi+PT7HP5CnjLNgqVm/HeP/APcycuhXUMeDv+PQPKFikkh
   IOhTo8Z4JC4ubs00LtF1LO30ekduKd4LSoDh39aOI8rBwlSLNrJMaeg/L
   aMyyOzxumsUki18E2qck0GlRRjdoty3XQzXG425jAJi/xB9Ij2VWhbtvY
   2YH4jzfg1kDKsf5N+FUenxSIXaAibXU0oSxulbvFIvhI3PAXBoZQjuK+n
   A==;
X-CSE-ConnectionGUID: 00eqwRFwRy2dOfA4tVZoVw==
X-CSE-MsgGUID: VATAuFhBSAavNfKXRQmO0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="81755602"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="81755602"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:56:53 -0700
X-CSE-ConnectionGUID: I0GKfJ/5Tp6C9AHFa8b4/w==
X-CSE-MsgGUID: XqvNisVVREOmKNvgjXGXdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="235869543"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2026 00:56:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLG4o-0000000077Z-0tez;
	Fri, 08 May 2026 07:56:50 +0000
Date: Fri, 08 May 2026 09:56:42 +0200
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kvms390:sae 47/55] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <202605080924.qJpKIfWU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae
head:   23885833f845ad11c99c4f458692250fc75908c5
commit: 6e6efd17a9438c898c407a5121532de316092567 [47/55] KVM: arm64: Share sys-reg handling
reproduce: (https://download.01.org/0day-ci/archive/20260508/202605080924.qJpKIfWU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2515: FILE: include/kvm/arm64/sys_regs.h:429:
+ /*
+ * Since reset() callback and field val are not used for idregs, they will be

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2547: FILE: include/kvm/arm64/sys_regs.h:461:
+ /*
+ * 32bit ID regs are fully writable when the guest is 32bit

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2567: FILE: include/kvm/arm64/sys_regs.h:481:
+ /*
+ * sys_reg_desc initialiser for architecturally unallocated cpufeature ID

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2585: FILE: include/kvm/arm64/sys_regs.h:499:
+ /*
+ * sys_reg_desc initialiser for known ID registers that we hide from guests.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
