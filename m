Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374D32E36F6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 00:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754266707; cv=none; b=GReHNqngdn8lcgNNblhTn0HHGaH62PerdhxAK0fANXMyaETtqATJBK1jflTzVc0OydlpGrP3P9VkYIZlcNCsTzZMBWtE0yyCdT5z76ONytNxo7NK7fPN5B64z+Z1itgD4Jl8281caUD9nPlZCLJKP3pM5bJpd2k/WQ1DWuxM47Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754266707; c=relaxed/simple;
	bh=ObMZ4c1RMWIWfPCThk2wEKhCEgpRPt8uTLDOWeVFoCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQrM3WP3YWzRC77+kUtvoArU10ru1g5OlXXAENnIJuIZvGEkOQEB6OS3Sbk+IYQ8FnVPrGb0ZlhGU1Ulczb952YtGKDjwkesopt0lgNVj5OiNr26IB3bWFuOADTguWnEnfkmVdKednxn1pl4x5thWs/4ULlKexfotRP3r5w2i0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHrH8grN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHrH8grN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754266706; x=1785802706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ObMZ4c1RMWIWfPCThk2wEKhCEgpRPt8uTLDOWeVFoCk=;
  b=JHrH8grNTZdNhwdd/TAkctl4dXJCJh8+mwJHLl6kC8BBAjlhkTJGcSut
   45TwGk2j+RsrVxarC8kvFm05CRt/kg4ErjIqCtewGyeHecTtSexfeskxn
   7mhuhIwA22izxUtLpJH7q02fez6H61MQYM284PV6MTFfI3cf7GCHMEYbV
   M8N1MTq9mDmpwlfJYj5o8pCF1upQ8caTXEQftc/teHZnIgHVPwfTmOC2s
   io5zQvtd7TzoHKKnO6Q9hKsEVGP6CTexLMosqaD+cX0lenQAWVV3gP6er
   GIodysXdovDo2IoBOvHwxoyHUJGaEWvZ4AaJLeVb7ohOZedkmdDnOIMR6
   g==;
X-CSE-ConnectionGUID: ZPa7sAq+ReC22hzqtabCog==
X-CSE-MsgGUID: dTJrzkSXR7e856l+yOc6NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="44109725"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44109725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 17:18:26 -0700
X-CSE-ConnectionGUID: YDKM1msLRpehJiO/Y+7CMw==
X-CSE-MsgGUID: oAYoc+kQSDOWfwneJHnKjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="201195162"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 03 Aug 2025 17:18:25 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiiuE-0001hz-0w;
	Mon, 04 Aug 2025 00:18:22 +0000
Date: Mon, 4 Aug 2025 02:17:23 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 59/85] 14 | use crate::error::to_result;
Message-ID: <202508040207.T8zwKh7X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: b8387350530fcbed7c4d7d7840a789fd09501b68 [59/85] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040207.T8zwKh7X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040207.T8zwKh7X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040207.T8zwKh7X-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:14:5
   |
>> 14 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
