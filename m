Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066621F16B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 05:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789794246; cv=none; b=HKz+yD11IczKu/6Q5MZU/MrM1kYZQHyk9Byk7Mw8wzURj7HX6BMVNfy4On/AAFNfBnhP4zsoZQzrGFLVHip/GQSs154lYaaUpyo0VqXTNBfQTb22fEdnNBLhWa61m2M1TTFNlu/wwAkoIdBEd8NzdomINJebPDXfg6qdwP4cGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789794246; c=relaxed/simple;
	bh=8w8AyG8+YE+BtCqkdRl/qTjQB7hqC31xPdv4iSnyav4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KdWvZmbX2N+avyHmsC7zGoPTqYVdxWlRYCQ8H8WNEbmn90dPcEuY9f6HubtcAdxJRr7eIF8qykpi1k+q9s46v22skGBUzqDgLAgGbyrHvMp4x/zWgnMfOzqZuVg70yTLOUekpqL+FscZ/mUhhgKk7uqIa6TtxupM/c2NrQ0xYOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URlC31YB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URlC31YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789794245; x=1821330245;
  h=date:from:to:cc:subject:message-id;
  bh=8w8AyG8+YE+BtCqkdRl/qTjQB7hqC31xPdv4iSnyav4=;
  b=URlC31YBMjNmNmyZQs2bJ+F4Upbbcl9Uf02ibmeHaomxgbLHrzADF6Cx
   mhSUu6HYKIaNnTQ/GZzMsGwCzJQ6iXMlse3lWeQ5wjzWBQU5W+zUJyZeN
   +3NLZrvi+kRH00oMD/pFQBBH0Kj3NX0iWNAXUFpem3bNu1yoR99xpxfBS
   O/yKDWGv8UcoEL7jgCCJTgBoKFyAG2ocmNV0oMZ6SNIA3T2DgQvqESyOi
   rz53WGng+nIqHes6/DNml+8ozNqoTwdKGjNeoXpUT3WAjJ8J8fN9TFnE9
   adEpaVP4YHmJC/SrjMsYtCUwvSKacOxpQRDj+22ou2rw73ZW73EG1prhq
   Q==;
X-CSE-ConnectionGUID: PLS95dJmRAu23e8hhF0UPw==
X-CSE-MsgGUID: e+aboYVXTAev5f6fdhgWIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89258729"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89258729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 22:04:04 -0700
X-CSE-ConnectionGUID: q3BbLWr2Qyifk+QzJfHnuw==
X-CSE-MsgGUID: nLyNIHZiTWWQvjPvpQeUOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="279923630"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Sep 2026 22:04:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7nF2-00000000Aez-3caB;
	Sat, 19 Sep 2026 05:04:00 +0000
Date: Sat, 19 Sep 2026 13:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1215 1571/2006] Warning:
 fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in
 'bch2_journal_flush_seq_async'
Message-ID: <202609191225.qCjPF4D8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs pr/1215
head:   5a3716223aca377eaf52cc146385ec3b0b49e1fc
commit: a0168a474528cc64bf290cf20399e714161f4538 [1571/2006] bcachefs: Pass BCH_WATERMARK_reclaim when discards require journal flush
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260919/202609191225.qCjPF4D8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191225.qCjPF4D8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191225.qCjPF4D8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in 'bch2_journal_flush_seq_async'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
