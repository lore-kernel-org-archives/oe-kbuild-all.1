Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F98152181
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721737173; cv=none; b=tY2R0v/nO2NKJtPFvNV1lQmUMqh0jILQeFbaKP7SU4UdyFRsgGGN+sxM97YdzAIjaOe9uaUqG7lLxSavGoaCgNHbm7yt7CzA6JaNVH5HCbx5/07h4VZ/Udq0kI5SX73YFU7eR7D52puPLTUA+aDc/iRPgDrBe3PVa5Zd1pgKiLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721737173; c=relaxed/simple;
	bh=oHKavDRGl20ArrD29u+B5MDpQfqBDUTou7PlWd51Rc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bssiqfIL+XF0SITgnq77aJ2O/a3tDQ+wqFBiTTZq6FX8I4OkHATRZSBuy+H9Jc54qTQaO12UtwF5GG4Oql1zjM4eIylTTzuRdRXQkKKnrCtEYv41Gm0SSGzcnnTUqTaU0F16wgfq2r6pDK4eUs+/E5RI6cbDZ2TG0A/oeebUeCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AN0TBFsz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AN0TBFsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721737172; x=1753273172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oHKavDRGl20ArrD29u+B5MDpQfqBDUTou7PlWd51Rc0=;
  b=AN0TBFszKcnfYEhALT665R2yawmnDceeGQALBpNWRiqDnxdEe/QkeHg8
   eXa8Ehp6df3n+CG2fr+oD1tq2FJHcenCHcE/6iNSMLNl4Z4dGEHPLm6zW
   FkOQgbEirjnrCWRoM69ae+7D2J2lKLo7XSnDU19osYb+CzL11QMXH2vPI
   ZklJYwq/+3989jfgBUz+EcKUQzTgrgNQaidpbnLWo1guaO7YWq2guVlon
   7iaLV5gTIZc7/LCNQPMnhnoi9ZCC0QBTV21AW0k32RRXSVvoiyyhqgu8X
   Z2ZM64rXi/vCkk+ac3kd2Ie9TrlJJT8A/X1U8VtUZXiBxvlUMjq2MLtj2
   g==;
X-CSE-ConnectionGUID: 3mJnAxlNQumv/InOkepljA==
X-CSE-MsgGUID: nR9UEYOGT+m7pKfc2gev5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30508593"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="30508593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 05:19:31 -0700
X-CSE-ConnectionGUID: nNlKQ5HiQfOVeBE8+drRuw==
X-CSE-MsgGUID: /QKvzrozQgCUFUah+3K+yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="52157465"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2024 05:19:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWEUK-000lw0-1A;
	Tue, 23 Jul 2024 12:19:28 +0000
Date: Tue, 23 Jul 2024 20:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>
Subject: fs/btrfs/lzo.o: warning: objtool: lzo_compress_folios+0xb0:
 unreachable instruction
Message-ID: <202407232006.7Gelsbv4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66ebbdfdeb093e097399b1883390079cd4c3022b
commit: 400b172b8cdcff87038697169fe9e4222120dd9a btrfs: compression: migrate compression/decompression paths to folios
date:   3 months ago
config: loongarch-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240723/202407232006.7Gelsbv4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407232006.7Gelsbv4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407232006.7Gelsbv4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/lzo.o: warning: objtool: lzo_compress_folios+0xb0: unreachable instruction
   fs/btrfs/lzo.o: warning: objtool: lzo_decompress_bio+0x140: unreachable instruction


objdump-func vmlinux.o lzo_compress_folios:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
