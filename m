Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88BB4DF4D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352602; cv=none; b=bEnsrRGUmh1fAJIxPdGBTBI9WdSIpw+ZmE/H2qE3eV5sVvyPsAuTFtEBMWLOeGkesTUX9/x6r/Qi/w0D/C5DxNG7m7qUGq3JJIkimakh5vAKqiHRUa7Iwti4+8Jzijf/dPkknJ5let2P/IkAAvSakJhzuXajgdmZtqX/LCkBI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352602; c=relaxed/simple;
	bh=DT1bAHlmvJKGXF5jRNpxaG8VzstRFoRP8KpoU/9KKgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=azLfLXhiegRqSdKAhp084UpUyTjRAku1GFhFmTnxtDgtsmt8LgTVNR5TVOpmd2y1Y4pkyxW4mfkVR4i8Vpk8gUR5FsE3HA7/dksEjBkhz98oda4AuQ7/Me96ec9ROWvNr1VVII9m8aaqjdy+0MfHnv9xQjSVhCz3ukvqOE24LLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYPcE/V3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYPcE/V3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790352598; x=1821888598;
  h=date:from:to:cc:subject:message-id;
  bh=DT1bAHlmvJKGXF5jRNpxaG8VzstRFoRP8KpoU/9KKgE=;
  b=JYPcE/V3OdBYK22qdLDnu8LkxUJ1G0MC9aRWrLMVNrl2A6SjyaTwSSJM
   V3MGkUJKhN552LMgHk89tZi1BaSlFzn0kRdyttXDPITHtVBtKGKbH013v
   iWfhghczQdmauAloypzJ33vbt6Fpj8dJ/qFpUms5/tPqftA7ChPsKpiX5
   QSZnleKKZ275M4UnHS6R3oJltNYUj8vsXRu/kfEsvPo/VNsi2SUNazBRy
   8/+enXvk0Q8lzo/XPK/W5GVAXUhsMSYL96sriSrnsSE7kKJqg3/OYnAp5
   d3rvbAe5PK6vdflCWQgG6xekpZv2c8G/6arzIIWOWwZkXGqSfRNsPqYzU
   w==;
X-CSE-ConnectionGUID: 2ZSKoFG2Q7mOM0Ab8hRzvw==
X-CSE-MsgGUID: ibPc4v+tSD6iWw/IRpvuuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102503667"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102503667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:09:55 -0700
X-CSE-ConnectionGUID: feiM3FCsRtmb1Z2PlakzKg==
X-CSE-MsgGUID: bo2hLYw+Sjq6qUMsVyo2AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="302311969"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 09:09:53 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA8Uh-000000000og-1gFW;
	Fri, 25 Sep 2026 16:09:51 +0000
Date: Fri, 25 Sep 2026 18:09:27 +0200
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>,
 David Disseldorp <ddiss@suse.de>, SeongJae Park <sj@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 strcpy.isra.0+0x18 (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <202609251820.2UzxY51q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: 3fb2d124b64716f16355b9b722b2f062c0702f24 init: do_mounts: use kmalloc() for allocations of temporary buffers
date:   4 months ago
config: xtensa-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251820.2UzxY51q-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251820.2UzxY51q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3fb2d124b647 ("init: do_mounts: use kmalloc() for allocations of temporary buffers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251820.2UzxY51q-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x18 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
