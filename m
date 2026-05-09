Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76172836A6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778326469; cv=none; b=ry7bSwRbjyz+065xZe2M8ALGwOJrUVyY80KJ+HcxpX6HdK0xkfLuCAHEaEa919we0FQZZ+HtzenHWXNrUiVfEjbHKsrpyg80V/mfX3MRjnndqx3VpIPefuaYnQ04PBShVRnXMhfO/F7LosYPJdifbK/kTn649BnqWQzG08CTATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778326469; c=relaxed/simple;
	bh=zwOPmV7/kHvzCyNZphkqSxA06KvXNZOo3Zb6PBL0rB8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mbBQAqSO1h3c8MnmFfK6cUuRYEWzTPegUl/QiZCCoyYavrb+O5xOiOc+HeZ7H247onj/rLCSKD4Ps8ggAEWzHC6/AzIALMFaKiIVNs+oLGqOpXp9mbrvEsVz0RWc0k0CcguSNiGREnsiJ039ca4rxIeviXLMe82lEIU/Tcteoq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzL+/Cvb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzL+/Cvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778326468; x=1809862468;
  h=date:from:to:cc:subject:message-id;
  bh=zwOPmV7/kHvzCyNZphkqSxA06KvXNZOo3Zb6PBL0rB8=;
  b=XzL+/CvbDVNCdiIFKx44DPE9UqkINeuXX7z9/TcT1RJOa6lzrQ0oNlfI
   3zoOcj0MIpplsBGuINODqUMHCog8JW7h4tp6fEIhv1DvF3iXlWysYeuy6
   ScIthdwq28uG6NCZbFB1eHMvDOVDdkM0hiuNFjMvK0kfBhqhZ2jTFRQrS
   9pL/lXw4TgFzyd2UxwH94rlApdD5cOcR8nkijZ34sQfszgOBUF4NG2l/i
   m82f1GjcFndKEFbIjKJkSjEpqkVszvs270zugadaXz+UxjMLWRmuoN4SK
   ck549wGXd2raU2/be+9gdjsZbkBuvuBiv341Hu0/mkz5h/bspdxPGb0jM
   g==;
X-CSE-ConnectionGUID: sj9ZcaSeRjSkF2mken3yBQ==
X-CSE-MsgGUID: v2Xkv9ZsQO6Bq9vPYmtE8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90392539"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="90392539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 04:34:25 -0700
X-CSE-ConnectionGUID: u1TJ1ouKRXiLTDsGDvNRFw==
X-CSE-MsgGUID: ZSQfsOV4Se2Vr7Jw9XETNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241952851"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 May 2026 04:34:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLfws-000000007PT-1IJF;
	Sat, 09 May 2026 11:34:22 +0000
Date: Sat, 09 May 2026 13:33:24 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 9/117] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605091319.Tji77C8m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   77fd67cbdd2c257e4b49061f3cbb15fd82d31c29
commit: b1a6287c96d3e8a7bb68e9d6f60459a5a380b900 [9/117] arm64: dts: apple: j31[46]: Add keyboard nodes
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091319.Tji77C8m-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:188:
+		 * best guess is they are cumulative.
+		*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
