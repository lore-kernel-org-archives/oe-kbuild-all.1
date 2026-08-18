Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6C368D50
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 04:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787027794; cv=none; b=gERAK9d5bFeeeLrFNcrfF5v8/ryCJjbxy7VOJUPNOeD464crzRthCq6PLrn2Dv1D/ACho0RNvbsTEeQc28Em4dRoFbD2gwn4PZlyBGtDIxF+PPmVUyFUKHincFscSp/zWNkJlQEHmx3Rnh98F4L5JWFfJQrucgd5SJuPjURNpPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787027794; c=relaxed/simple;
	bh=ZlZpCUJ58opITrgY0AIXafCOF2bFo+2om6794VnHivM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ggp7FU23iCxLganBFtWB4Up84Nz+y3kdKzoDSrmwdXQMEHV0c3h2td6Vic9XgN5kAUiZySnIL9gfqIrJrSWC6YvCENdD4YIlGvdpNJG1UffJ4Szl29l16UWhsHto3idoNI86Fljzw1hMbLFZs64oW7k/AGDStoxKgBpmpYM2wq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQ0jxHRj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQ0jxHRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787027793; x=1818563793;
  h=date:from:to:cc:subject:message-id;
  bh=ZlZpCUJ58opITrgY0AIXafCOF2bFo+2om6794VnHivM=;
  b=AQ0jxHRj4/Kxa8H7yBT/RInW2GEES1mipwYQ62Tcc1nHpS4qSoFuc4s3
   FItB3lWIwh1xCtbRqU92dP/QXfNWg3Bf8QHlemjy41rAjZSg3CFS7GmXG
   NeD8ZlCI6wSnXVPsK89UZ9mCmm6DPLYynmsuTPGE/YE9is06/Al95zF9E
   EOBrxN4d+Elr+AtCx7q6A7k2vq0YwHaSy5HIT6VMFd+74hYo+3tuRxi8V
   nmfL/lsJfSrJnYpRMXCRWmawI8QP9kDmJxKQ4UyvDTnqpPLNJ0H2ccYRu
   xAq19RDvdNyl7tFqMtY3G0xZQMjdAUWhDrRTY+pZ8ymJftkFPGnTuxd5t
   Q==;
X-CSE-ConnectionGUID: wL8GrMydTgW26JDZTLjTRQ==
X-CSE-MsgGUID: qiUOtV52TlyuR/RJsMexsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="113050751"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="113050751"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:36:32 -0700
X-CSE-ConnectionGUID: 6NZJFRRDQc+0SNuDXBl7UA==
X-CSE-MsgGUID: Uj3R93YhR/25oLOOxX1o7Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Aug 2026 21:36:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwBYq-00000000e78-3K0E;
	Tue, 18 Aug 2026 04:36:28 +0000
Date: Tue, 18 Aug 2026 12:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1202 2/2] ERROR: modpost:
 "bch2_printbuf_exit" [fs/bcachefs/fs/dirent_test.ko] undefined!
Message-ID: <202608181256.kfMpc3Tn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1202
head:   eec052396d194c305016be4e47173a4e935cafac
commit: eec052396d194c305016be4e47173a4e935cafac [2/2] bcachefs: add kunit tests for dirent to_text
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608181256.kfMpc3Tn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181256.kfMpc3Tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181256.kfMpc3Tn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x1ac (section: .text) -> is_static_object (section: .init.text)
>> ERROR: modpost: "bch2_printbuf_exit" [fs/bcachefs/fs/dirent_test.ko] undefined!
>> ERROR: modpost: "bch2_dirent_to_text" [fs/bcachefs/fs/dirent_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
