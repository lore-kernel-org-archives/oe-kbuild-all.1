Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7389188717
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733773682; cv=none; b=hW61dcsn08N2nt4fsWfd55RGUN2i1q02fzqJ/+5PJe1Qf9/Hx/nHPJdtu3R2KKbfrVwHoa7srnEszqdstDdm6flN18MgyP0my2WZad3XXiGetW4EJbBLAe5LmcqAdnVIJGvuRKy2Qk3Ztmy7ooysmGhb5EBC/EEgHNxPJyUIVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733773682; c=relaxed/simple;
	bh=RgYVfI/or8BjMoR2PHPFlFBGz5PEpPPmJrARRckpp1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDplwDrejeZM7K1dtPvQ5s7YOKvphcvj/PhjwYKLxO09qZ0CnjND+xd2uXl63ZHIDU2xwjmnr7Ab+9RFkOxtbFSBcTdrU3C8K3p6URiMMJJZmLCvhDXOnfDusPqtM11yXtFiFIv/+MIrrurJdOh+O5u/yqBCVw4eQE701fKQFrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=al6B/wx+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="al6B/wx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733773681; x=1765309681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RgYVfI/or8BjMoR2PHPFlFBGz5PEpPPmJrARRckpp1g=;
  b=al6B/wx+RUEhuvlpbTSYiGoYjCVUoN8WQUva1W22lCUNYA19L2foHZ0T
   d6SjM6cVTKrXNHNbfCTPKM6Zh0wm99SstShexxucKnUmBtU0GJ61y7Pkt
   n3oY6CjMTIqawTqJChDRyv8HFhCKxj1PHzidA9PgG5TeTMc6ZdGFqxgLM
   zzITMKyyys0rXCbNFrsk6SzRri6V7l0OGjssoFf+kzGPa+hAd/gWC4YHM
   1O/aRxGR0RDA8BqDOpnnHvt3pdgLCgAVHMA2CXMWxPHzNveK4B+aObK2u
   l7IhPb6RSZDLfja64NaVsST5AVRG211S0Fs27brwncrDB1KI9TLrOMYoz
   Q==;
X-CSE-ConnectionGUID: ndG8Ks/vTYClIOF2Tf3lkg==
X-CSE-MsgGUID: 3Qx3WwNYROSPjpAlmNhfUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34002928"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34002928"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 11:48:00 -0800
X-CSE-ConnectionGUID: AT3sIUtCSp6KTwATX3IP+A==
X-CSE-MsgGUID: l0kfTkf7TM6PTf2pQqHNwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="126065347"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 11:47:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKjjZ-0004ln-0F;
	Mon, 09 Dec 2024 19:47:57 +0000
Date: Tue, 10 Dec 2024 03:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1321/1321]
 drivers/md/dm-verity-verify-sig.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202412100348.mRc9n69R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   faa52e40c08916893e09ba030e616f92e4fc020b
commit: 193a981127632c7d4c26a0674881dea0c208640c [1321/1321] dm verity: add root hash pkcs#7 signature verification
config: x86_64-buildonly-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241210/202412100348.mRc9n69R-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100348.mRc9n69R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100348.mRc9n69R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm-verity-verify-sig.c:8:
   In file included from include/linux/device-mapper.h:12:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/md/dm-verity-verify-sig.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
