Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB5D28E0F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778326467; cv=none; b=Z37LhHWDLpvXoTeoATIhFep9ekAHvA7OUdr7JWySQlOlagDcNMTIwyqUToaMpSK1uIId30/m0dds3ZiafhqdYBgzJCfbOdpKS62FqAUiugHLrmcmE2rBjWPFzJseThb/58KxT3PMQ4UnUj4BCobLf5dR+4mRlUr3wuXw5UpIMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778326467; c=relaxed/simple;
	bh=PKRvEPntRkpQLORpkHKbP/rtD6w8oyxbplf/wN6ZVew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qmNEL3bkI2g+ZYCMxO6Q0SZgml4s+mKdWqwE/Se58QEXd9jeuw72qTSLTPmUnSusWcM7KgfY+yvv1/1R1pxjzHrabQPkfxibRttxqa5NJgaV7GL0sWY1TPg3CPK/g/3/AcX5YrcqwsnrT42jG0Kj8SFlp6q9OZcyxuKJfi0hED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwDYewho; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwDYewho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778326466; x=1809862466;
  h=date:from:to:cc:subject:message-id;
  bh=PKRvEPntRkpQLORpkHKbP/rtD6w8oyxbplf/wN6ZVew=;
  b=NwDYewhoLAYqh9Z0tn0d1hfmG5OwvPeDIvvD+cJdA20ylnCjXltjUEFj
   EbrmT4/Qvg7fsUVkLuEJgMjzDdJhFDHkAMDngBZad0KItzOld4NB+77q8
   dbEHCojCsrgg5gZNDkXy1aBokLQ54z6OG1ZdKL4wTR2K9FZD/jWrUmY80
   0vHJyMWnt6+2an/lAOi+rPVaxcbrx+yFhjwA4NVeYDL/ixpub54ctv/5g
   /8ECDP7QhWcDZyTfqRA5dD9Ok/DPPu/7FQouUGbGXNpByAF66jcrWoeBF
   uKIQy+1jQOw6H6rwfV2dLjkmArlSV9d7Pvr8JXFUxs9Q5YfJVqYjChm63
   Q==;
X-CSE-ConnectionGUID: BjpP4teXQrmrbaLAXfg8nQ==
X-CSE-MsgGUID: NwEu1SNUQCyqaXMDfhFYvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90392537"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="90392537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 04:34:25 -0700
X-CSE-ConnectionGUID: 73k0qQxuTGSG3fDMQKuXKA==
X-CSE-MsgGUID: D4Sl7kZwS3OaA0FWMpkbHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241952849"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 May 2026 04:34:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLfws-000000007PR-174W;
	Sat, 09 May 2026 11:34:22 +0000
Date: Sat, 09 May 2026 13:33:23 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 1/117] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605091354.j1aTwUfc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   77fd67cbdd2c257e4b49061f3cbb15fd82d31c29
commit: 6a9d24ffd63e1cc4a564c95b44ae532cef1c87c7 [1/117] arm64: dts: apple: t6022-j180d: Add audio nodes
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091354.j1aTwUfc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#69: FILE: arch/arm64/boot/dts/apple/t6022-j180d.dts:572:
+			/*
+			* DANGER ZONE: You can blow your speakers!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
