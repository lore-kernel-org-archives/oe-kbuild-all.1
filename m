Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935431F0984
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755370193; cv=none; b=bnRRV+skQEDB+XM94rqm6vw8hGY5RNnygLzElXMLhgGMtNJx/lU/wkGMPgg0q2ak96PfQgiWqev0sBfcIOTFkORUO2w4blUzeVtsa4+dZpIl2ZSVDDJtLoXmwwaEycv4q+eBcp7s7jBkooEUkHKgjGN0LZdbNqYoxbAuNLAMwg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755370193; c=relaxed/simple;
	bh=hPGOSiy5VaA6sw6ig+zifieht40yqFv7QuqRPUm4kSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZNqB0hIJLArq28yIuiSrspU9HrluicERHfchs5AdBypkGzpN4N/qIlsi9pJslQbaWr9kKWxlVUE69U6VYFsyZ3m9LKYPofpGLECzTCb4Dzwkb5MjyPDO1Ahrwh3gAyLmGRTaXtmIX0NQ0s3kXFRfjJdpETX4xRq0YfDH16KAWLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egeFL9w7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egeFL9w7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755370191; x=1786906191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPGOSiy5VaA6sw6ig+zifieht40yqFv7QuqRPUm4kSg=;
  b=egeFL9w7t5tUcQB3brxS62OAALpeS5hS6yWFyqvkRR7vhP0NQVogenNo
   ZGkrmPLdV9vFgKbwr8qD9MCWbI0kt/IiX7zuRnZoDRo5NHQ/iuHaCKyCV
   J6azCfTjQ+ED7Mhg4Gecp4O5EXGyJEtBa8uxISILYqIj+v5v/CgyuoNjx
   dKYFdRZC1IwjfWXH/nkhqnKch9s/CyheIo8RChADtn3kzWBAgjzyyUi2V
   R2xLDnnVjZPDiiGsMHMDBNho98sGAZxzPLq2E3TnTgDkp42HFq93PmgOU
   Qq4DjuoLt7R+ET5fHLAk3kxWSCvzQIEUgRgrLmtnVGR6Om7oRYwLspBBl
   g==;
X-CSE-ConnectionGUID: U+Q1kvnRSyidC4SDNzY0og==
X-CSE-MsgGUID: BcgP8Zn2QmCnPOizeY6Ybw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57725872"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57725872"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 11:49:51 -0700
X-CSE-ConnectionGUID: 8PfjiROJS5GalNwAwVNbkg==
X-CSE-MsgGUID: 2g+aGsFIQDWErXPVh1be6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167601170"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 16 Aug 2025 11:49:50 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unLyN-0000ml-2Q;
	Sat, 16 Aug 2025 18:49:47 +0000
Date: Sat, 16 Aug 2025 20:49:29 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1757/1757]
 drivers/md/dm-verity-verify-sig.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202508162041.dMvzlX9R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bb7bded3da5e82ce40450cdb7a128c41403bf330
commit: 193a981127632c7d4c26a0674881dea0c208640c [1757/1757] dm verity: add root hash pkcs#7 signature verification
config: x86_64-buildonly-randconfig-2001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508162041.dMvzlX9R-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508162041.dMvzlX9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508162041.dMvzlX9R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-verity-verify-sig.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
