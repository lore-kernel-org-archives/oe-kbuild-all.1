Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17A118A6B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734032650; cv=none; b=i8LY/Y6M8oxT7RyKATBxU7XzqF3UaRrP5mM9sNgTvcozjCDKr2cZV0c4HKXKDiUGLEoYCb0361OFROG7M4OvteHPDoADfbjYJceorqPB0B8sYJFl9S3YJNfJ3MUTQGqPcpLJ+lLyyiHepjP++/KVRAUkeNh87Tlb0MRZ3g2mrGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734032650; c=relaxed/simple;
	bh=VcJ5fR+YlqobFHA3Ze3yetOc6jYNkU/7STE8R5j3Gdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQdAeyzndcWXg0iTroYGk5Qh20KJmc/pvRVeKB582U2guONWLQnzFJ3E8f2+eYGJKYxi5+xe+lJ3eYaXXw+3GQ+GeHZeL3vj1I6AWLj9LDaHrn44oXpNItF2RNY8crrxBNqGa+t9btasPuaivwmK+jGoAI9FT8ofjx1Ur6qrGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mP5/y/M2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mP5/y/M2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734032649; x=1765568649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VcJ5fR+YlqobFHA3Ze3yetOc6jYNkU/7STE8R5j3Gdo=;
  b=mP5/y/M28seuBRtjumPviEpzUq0IbR1aAYS9femANTf5u8HL5hXd5fid
   d7lqQ6/6TIstzVnDUDVAvTCILg1CNeeTzaXTCSRoJEpmej74jrWJGule2
   bkt8uWNP3cJNUpeNRt40ytn+v/fTBBK4/8D78nD35POgdNeUegxiDnAxw
   tD+NPGAl93ySc4jgQV0Yfw70T8zpsuYzZ3aqASMvqXkwlvK7NBVMCPcHj
   SKhii+6kTx5dYc/zerjGy1iBCzwq5qllL1M1HxhvAxYsRNyd96lETZi7X
   +g9YdPj/yzIjvpk8IlZ6m2EiSywSWcGkJy40Rq5PwwyU143Ef3hnX8Eof
   w==;
X-CSE-ConnectionGUID: 8ic6kSzkQly9+Moa+DUjOg==
X-CSE-MsgGUID: tfRhWXcCTe6ecyEpk6uEaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="33798048"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="33798048"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:44:08 -0800
X-CSE-ConnectionGUID: tCey96smRue63ncHrG1UyQ==
X-CSE-MsgGUID: 96OHQb6IReCphXjoKCozpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101420480"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2024 11:44:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLp6T-000BGI-0t;
	Thu, 12 Dec 2024 19:44:05 +0000
Date: Fri, 13 Dec 2024 03:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 61/224] fs/bcachefs/btree_update.o:
 warning: objtool: bch2_btree_path_traverse+0x68: return with modified stack
 frame
Message-ID: <202412130315.A5HhUnhq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   eca7ef626e78dbadda2a05e45ce24e3074ba1588
commit: e398d6fb0f5aace9f5d181fab0b9dfb7c1025938 [61/224] bcachefs: bch2_trans_verify_not_unlocked_or_in_restart()
config: loongarch-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241213/202412130315.A5HhUnhq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130315.A5HhUnhq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130315.A5HhUnhq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_update.o: warning: objtool: bch2_btree_path_traverse+0x68: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
