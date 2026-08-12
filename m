Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB3535E943
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 01:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496957; cv=none; b=bSjkLmwpfVVd0Z7V614hQltLnfp1fvO3+1m8V933tl33cyHXVCNdMupKAoOoAwXzb7PRxKmC3PR5RzhXeviYG7sGtvHX/QncnNJestzpVSx7tYCKBkqWuHAw36u7xGrLtlB1I4MQosZWmKbohljPeQMtKMcM6kF6EcMqDevyZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496957; c=relaxed/simple;
	bh=CigP+irU4U5k7v9Vh4kWTSnlBuvijk81SMu9Q3FaJtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GlHZncg32dhqNlpZpnqC2rzN8u8jqA+JB0j/v4Gkb16lJErr1T0ToB/wxq6PhRP88w+HXA5ZUHEYjreL0Eo1JFHdLbTMq+R1YXV4SwT/QYm5n+3+oB5XLdGzdMAki15i3CIHFIJ/NZwF21FcPo2O7g0GwfqAHr4XtaolZAVbIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqnzNEeT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqnzNEeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786496955; x=1818032955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CigP+irU4U5k7v9Vh4kWTSnlBuvijk81SMu9Q3FaJtI=;
  b=RqnzNEeTGLn++/4Pirdvv/Ec351TGxYlvVpRyPWVzm/fDuMfCQGknjXn
   UryCBN9AQ0q11tr/d/tVdrBvTc2h0R7OifNU9SQUQPBY0i9YKqwu9aHG0
   jp2LWbpR+II58h189RpFZq44zldMTR6eNs7v881gCTTtpt6oLj7pgH3n2
   AX0VpG0C91EnQW16m3+m4qUPro7QvVsEdrq17OjhsGHf6oQfBNGS9iwQG
   W+B5hynvKIY6Moh5q35p8PQvsDyLNWrEc5upNp6MEBBowZXsuoUNK3+Oa
   B2bsVet7+ajJ2lQLhOkK7RUlEg4cRaPIb5IqlPNgD7ZJm205DdWbko4iQ
   w==;
X-CSE-ConnectionGUID: uz4O36sxShW2RyqN8PJUig==
X-CSE-MsgGUID: xlh9kWnPSuetP6o5LFkstQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86162880"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="86162880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 18:09:13 -0700
X-CSE-ConnectionGUID: Atfj8IkOQM+gOqVDc0GF5A==
X-CSE-MsgGUID: hOa5NuDlQTarmC8u9cmieA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="262994352"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2026 18:09:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtxSw-00000000PYE-1FSh;
	Wed, 12 Aug 2026 01:09:10 +0000
Date: Wed, 12 Aug 2026 09:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Jos=C3=A9?= Bollo" <jose.bollo@iot.bzh>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cschaufler-smack-next:pr/3 2/2] WARNING: modpost: vmlinux:
 section mismatch in reference: smk_access+0x6c (section: .text) ->
 development (section: .init.data)
Message-ID: <202608120748.CRM8Uzqv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/cschaufler/smack-next pr/3
head:   114d79a78c01f62e84fe30569bda81c22e29d2e6
commit: 114d79a78c01f62e84fe30569bda81c22e29d2e6 [2/2] Smack: Add Smack Develop Mode
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260812/202608120748.CRM8Uzqv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120748.CRM8Uzqv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608120748.CRM8Uzqv-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>> WARNING: modpost: vmlinux: section mismatch in reference: smk_access+0x6c (section: .text) -> development (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: smk_access+0x78 (section: .text) -> development (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: smk_tskacc+0x178 (section: .text) -> development (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: smk_tskacc+0x180 (section: .text) -> development (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: smk_write_develop+0xb4 (section: .text) -> development (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: smk_read_develop+0x8 (section: .text) -> development (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
