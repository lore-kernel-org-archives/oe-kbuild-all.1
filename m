Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA67E7E792
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284984; cv=none; b=mhfeMG5bgdCX426TIWmMWaHs0HouaIHGACbO8f4oxqVxDykX70aXGcvK5KGEMXGNvcSFbUJMoixlIPkx+4gZB2Fbx0UqJAcc/l0zqV9CXyXmWYY9oDIeo2EgTU4H2GxmzYqPoERalr9BmFwpNRGScFTl1qg8/beS+Xa4h+l6uZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284984; c=relaxed/simple;
	bh=qsgQ7ndnjU+mBN+uxTxgfxB+dj2BJ4iLm15t8qqORKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GR3yWf11S6oCQXRaFs0TglKy+ZJnI37AxrSRlO+K3PuzdfH8Q6A928/9wHUCs+iO+MdNt9xwlywNiYerrdnhW7DfJTFa4WwbBv79l6b6c5JIusjV/FwZ7fJbgImaNELNIBS8te9KB4fersbjbAtNSmxMzjb7PPTNM3jOH/4hEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAb73V4z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAb73V4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786284982; x=1817820982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsgQ7ndnjU+mBN+uxTxgfxB+dj2BJ4iLm15t8qqORKE=;
  b=RAb73V4zfUDV8LrX5+85yyJ1G3dmCSDroZRdl6Y2x0ltfqdp7j/nUHEh
   AqOrA4VBX/jxW6Ot0E72Gb28MFIIn3SFMzqt7vGqt/2N9XuIS5fZ62BWm
   kqiOHahbt8FBueOSefs7QrprPK2HytojJvFRqvBXMpf6rMPXnHV8f1I2X
   HlbBbArp4giComkniFGK9Es2L/w9+MndysvEP7+VEgApFO9K7nVsVCJd3
   v4Nagcwzjb9M8RjXpksAFJk3lMBp/KTgHtipCVicolYnFyqiTqHjVd2Mi
   6Gu6Yeoc1rNF8/QysO/qX6Zm3ch+SETt2CGz1S/koUwFleNsDUXKMHbD/
   g==;
X-CSE-ConnectionGUID: aNMwkK5nRUuZjILd+kEtzA==
X-CSE-MsgGUID: OG1ya1hORjydNFQl3I8Dvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86577964"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="86577964"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 07:16:21 -0700
X-CSE-ConnectionGUID: fhP5AdB8TQWHpGFYZ7c6Pw==
X-CSE-MsgGUID: WP92+5bIT/6u6TrCy1CiTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="256591652"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Aug 2026 07:16:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt4K1-00000000LvH-2aT4;
	Sun, 09 Aug 2026 14:16:17 +0000
Date: Sun, 09 Aug 2026 22:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Jos=C3=A9?= Bollo" <jose.bollo@iot.bzh>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cschaufler-smack-next:pr/2 2/2] WARNING: modpost: vmlinux:
 section mismatch in reference: smk_access+0x3c (section: .text) -> sanitizing
 (section: .init.data)
Message-ID: <202608092106.VvFGhBhr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/cschaufler/smack-next pr/2
head:   ecd4785c2969ce0994fd9752ceeade2181b8ef34
commit: ecd4785c2969ce0994fd9752ceeade2181b8ef34 [2/2] Smack: Add SECURITY_SMACK_SANITIZE config
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260809/202608092106.VvFGhBhr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608092106.VvFGhBhr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608092106.VvFGhBhr-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: smk_access+0x3c (section: .text) -> sanitizing (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: smk_tskacc+0x93 (section: .text) -> sanitizing (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: smk_tskacc+0xee (section: .text) -> sanitizing (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: smk_tskacc+0x11a (section: .text) -> sanitizing (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: smk_tskacc+0x133 (section: .text) -> sanitizing (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
